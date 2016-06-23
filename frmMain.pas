unit FrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassFrmBase, dxGDIPlusClasses,
  Vcl.ExtCtrls, RzButton, Vcl.Menus, Vcl.StdCtrls, System.Win.ScktComp, RzTray,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

const
  WM_SHOWMSG = WM_USER + 100;
  WM_SHOWINCOMECALL = WM_USER + 101;

type
  TAppOptions = class
    DbServer: string;
    DbName: string;
    ServerHost: string;
    ServerPort: integer;
  end;

type
  TfrmMain = class(TBaseForm)
    btnWorkers: TRzMenuButton;
    btnTune: TRzMenuButton;
    RzMenuButton1: TRzMenuButton;
    btnClients: TRzMenuButton;
    NewClientBtn_PUM: TPopupMenu;
    NewFizClnt_mi: TMenuItem;
    NewURClnt_mi: TMenuItem;
    Clients_PUM: TPopupMenu;
    UrClients_mi: TMenuItem;
    FizClients_mi: TMenuItem;
    RzMenuButton2: TRzMenuButton;
    ClientSocket: TClientSocket;
    lblSocket: TLabel;
    RzMenuButton3: TRzMenuButton;
    RzMenuButton4: TRzMenuButton;
    TrayIcon: TRzTrayIcon;
    TrayMenu: TPopupMenu;
    miShowMain: TMenuItem;
    miExit: TMenuItem;
    IdHTTP1: TIdHTTP;
    procedure btnWorkersClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnTuneClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure UrClients_miClick(Sender: TObject);
    procedure NewFizClnt_miClick(Sender: TObject);
    procedure NewURClnt_miClick(Sender: TObject);
    procedure btnClientsClick(Sender: TObject);
    procedure RzMenuButton2Click(Sender: TObject);
    procedure ClientSocketDisconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure ClientSocketConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure ClientSocketError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure ClientSocketRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure RzMenuButton3Click(Sender: TObject);
    procedure RzMenuButton4Click(Sender: TObject);
    procedure FizClients_miClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure miShowMainClick(Sender: TObject);
  private
    fCanClose: Boolean; // можно закрыть
    procedure WmShowMsg(var Msg: TMessage); message WM_SHOWMSG;
    procedure WmShowIncomeCall(var Msg: TMessage); message WM_SHOWINCOMECALL;
  public
    procedure DoSocketConnect;
  end;

procedure LoadOptions(AIniFile: string);
function CheckUpdates: boolean;
function FindParam(AParam: string): Boolean;  // проверка наличия параметра запуска

var
  formMain: TfrmMain;
  MainOptions: TAppOptions;
  msgText: string;
  TimeShift: Integer; //смещение с сервером в секундах

implementation

{$R *.dfm}

uses
  DM_Main, frmWorkers, formOptions, formClients, formClientFiz,
  formClientUr, CommonTypes, formLogo, formCalling, formSessions,
  formIncomeCallRoot, System.DateUtils, formClientResult,
  CommonVars, CommonFunc;

procedure TfrmMain.btnTuneClick(Sender: TObject);
begin
  frmOptions := TfrmOptions.Create(self);
  frmOptions.ShowModal;
  FreeAndNil(frmOptions);
end;

procedure TfrmMain.btnWorkersClick(Sender: TObject);
begin
  formWorkers := TfrmWorkers.Create(self);
  formWorkers.ShowModal;
  FreeAndNil(formWorkers);
end;

procedure TfrmMain.ClientSocketConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  inherited;
  DM.SocketTimer.Interval := 0;
  lblSocket.Caption := 'Соединение с сервером установлено';
  DM.DateStart := Now;
  ClientSocket.Socket.SendText('#setphone:' + DM.CurrentUserSets.ATS_Phone_Num); //посылаем номер телефона
end;

procedure TfrmMain.ClientSocketDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  inherited;
  lblSocket.Caption := 'Соединение с сервером разорвано';
  DM.SocketTimer.Interval := 20000;
end;

procedure TfrmMain.ClientSocketError(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  if not ClientSocket.Active then
    DM.SocketTimer.Interval := 20000;
end;

procedure TfrmMain.ClientSocketRead(Sender: TObject; Socket: TCustomWinSocket);
var
  s: string;
  p: Integer;
  cmd, arg: string;
begin
  s := Socket.ReceiveText;

  if Copy(s, 1, 1) = '#' then
  begin
    p := Pos(':', s);
    cmd := Copy(s, 2, p - 2);
    arg := Copy(s, p + 1, Length(s));
  end;

  if cmd = 'msg' then
  begin
    msgText := arg;
    PostMessage(Self.Handle, WM_SHOWMSG, 0,0);
  end
  else

  if cmd = 'callid' then //создан исходящий звонок с CallId
  begin
    if Assigned(frmCalling) then
      frmCalling.CallId := arg;
    if Assigned(frmClientResult) then
      frmClientResult.CallId := arg;
  end
  else
  if cmd = 'callfinish' then  //в варианте c CallListener
  begin
    if Assigned(frmCalling) and (frmCalling.CallId = arg) then
      frmCalling.CallFinish;
    if Assigned(frmClientResult) and (frmClientResult.CallId = arg) then
      frmClientResult.CallFinish;
  end

  else

  if cmd = 'checkcall' then //поступил новый звонок
  begin
    PostMessage(Self.Handle, WM_SHOWINCOMECALL, 0,0);
    //DM.Calls_TimerTimer(DM.Calls_Timer);
  end

  else
  if cmd = 'checksession' then //завершен звонок
  begin
    if Assigned(frmCalling) then
      frmCalling.CheckSession
    else
    if Assigned(frmIncomeCallRoot) then
      frmIncomeCallRoot.CheckSession
    else
    if Assigned(frmClientResult) then
      frmClientResult.CheckSession;

  end

  else
  if cmd = 'checkacceptcall' then //звонок принят
  begin
    //if Assigned(frmIncomeCallRoot) then
    //  frmIncomeCallRoot.CheckSession; //.CheckAccept;
  end

  else
  if cmd = 'servertime' then
  begin
    TimeShift := StrToInt(arg) - SecondOfTheDay(DM.DateStart);
    DM.DateStart := IncSecond(DM.DateStart, TimeShift);
    DM.CallS_Q.ParamByName('date_start').AsDateTime := DM.DateStart;
  end;

end;

procedure TfrmMain.FizClients_miClick(Sender: TObject);
begin
  if not DM.Clients.Active then
    DM.Clients.Open;

  frmClients := TfrmClients.Create(self, nil, 0);
  try
    frmClients.ShowModal;
  finally
    FreeAndNil(frmClients);
  end;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  //inherited;
  //Application.MainForm.Close;
  CanClose := fCanClose;
  if not fCanClose then
    TrayIcon.MinimizeApp;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  inherited;
  Title := 'Пользователь - ' + DM.CurrentUserSets.UserName +
    ' (' + DM.CurrentUserSets.UserTypeName + ')' + ' [вер.: ' + FileVersion(Application.ExeName) + ']';
  DoSocketConnect;
end;

procedure TfrmMain.miExitClick(Sender: TObject);
begin
  if Application.MessageBox('Вы действительно хотите закрыть программу?',
    'Выход из программы', MB_YESNO + MB_ICONQUESTION) = mrYes then
    begin
      fCanClose := True;
      Self.Close;
    end;
end;

procedure TfrmMain.miShowMainClick(Sender: TObject);
begin
  TrayIcon.RestoreApp;
end;

procedure TfrmMain.NewFizClnt_miClick(Sender: TObject);
var
  prm: TFrmCreateParam;
begin
  if not DM.Clients.Active then
    DM.Clients.Open;

  prm := NewFrmCreateParam(asCreate, DM.Clients);
  frmClientFiz := TfrmClientFiz.Create(self, '', @prm);
  if frmClientFiz.ShowModal = mrOk then
    DM.Clients.Refresh;
  FreeAndNil(frmClientFiz);
end;

procedure TfrmMain.NewURClnt_miClick(Sender: TObject);
var
  prm: TFrmCreateParam;
begin
  DM.GetDataset(DM.Clients);

  prm := NewFrmCreateParam(asCreate, DM.Clients);
  frmClientUr := TfrmClientUr.Create(self, '', @prm);
  if frmClientUr.ShowModal = mrOk then
    DM.Clients.Refresh;
  FreeAndNil(frmClientUr);
end;

procedure TfrmMain.RzMenuButton2Click(Sender: TObject);
var
  n: string;
begin
  n := InputBox('Входящий звонок', 'Номер вызывающего', '+79104579648');
  ClientSocket.Socket.SendText('#call:' + n + ',755,755');
end;

procedure TfrmMain.RzMenuButton3Click(Sender: TObject);
begin
  inherited;
  DM.ShowClientsForCall;
end;

procedure TfrmMain.RzMenuButton4Click(Sender: TObject);
begin
  frmSessions := TfrmSessions.Create(self);
  frmSessions.ShowModal;
  FreeAndNil(frmSessions);
end;

procedure TfrmMain.DoSocketConnect;
begin
  ClientSocket.Host := MainOptions.ServerHost;
  ClientSocket.Port := MainOptions.ServerPort;
  try
    ClientSocket.Open;
  except
    DM.SocketTimer.Interval := 20000;
  end;
end;

procedure TfrmMain.btnClientsClick(Sender: TObject);
begin
  if not DM.Clients.Active then
    DM.Clients.Open;

  frmClients := TfrmClients.Create(self);
  frmClients.ShowModal;
  FreeAndNil(frmClients);
end;

procedure TfrmMain.UrClients_miClick(Sender: TObject);
begin
  if not DM.Clients.Active then
    DM.Clients.Open;

  frmClients := TfrmClients.Create(self, nil, 1);
  try
    frmClients.ShowModal;
  finally
    FreeAndNil(frmClients);
  end;
end;

procedure TfrmMain.WmShowIncomeCall(var Msg: TMessage);
begin
  if not DM.incomeCalling then
    TfrmIncomeCallRoot.ShowIncomeCall;
end;

procedure TfrmMain.WmShowMsg(var Msg: TMessage);
begin
  MessageBox(Handle, PChar(msgText), 'Сообщение от сервера', MB_ICONINFORMATION);
end;

procedure LoadOptions(AIniFile: string);
begin
  MainOptions := TAppOptions.Create;

  MainOptions.ServerHost := ServerHost; //'81.177.48.139'; //'localhost';//
  MainOptions.ServerPort := ServerPort; //1025;
end;

function CheckUpdates: boolean;
var
  HTTP: TIdHTTP;
  url: string;
  Stream: TStringStream;
  fStream: TMemoryStream;
  verServer, verLocal: string;
begin
  result := False;

  if FindParam('NOUPDATE') then // без проверки
    Exit;


  HTTP := TIdHTTP.Create(nil);
  try
    Stream := TStringStream.Create;
    url := 'http://' + ServerHost + ':' + IntToStr(ServerHttpPort) + '/fumigator?action=getlastversion';
    try HTTP.Get(url, Stream); except end;
//    if HTTP.ResponseCode = 200 then
    verServer := Stream.DataString;
    verLocal  := FileVersion(Application.ExeName);
    if (HTTP.ResponseCode = 200) and (verLocal <> verServer) then
    try
      fStream := TMemoryStream.Create;
      url := 'http://' + ServerHost + ':' + IntToStr(ServerHttpPort) + '/fumigator?action=getlastfile';
      try HTTP.Get(url, fStream); except end;
      if HTTP.ResponseCode = 200 then
      begin
        if FileExists(Application.ExeName + '_') then
          DeleteFile(Application.ExeName + '_');

        RenameFile(Application.ExeName, Application.ExeName + '_');
        fStream.SaveToFile(ExtractFilePath(Application.ExeName)+ 'fumigator.exe');
        Result := True;
      end;

    finally
      fStream.Free;
    end;
  finally
     Stream.Free;
     HTTP.Free;
  end;
end;

function FindParam(AParam: string): Boolean;
var
  i, cnt: Integer;
begin
  Result := False;
  cnt := ParamCount;
  if cnt = 0 then
    Exit;
  for I := 1 to cnt do
    if UpperCase(ParamStr(i)) = UpperCase(AParam) then
    begin
      Result := True;
      break;
    end;
end;

end.
