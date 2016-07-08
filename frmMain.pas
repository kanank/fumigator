unit FrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassFrmBase, dxGDIPlusClasses,
  Vcl.ExtCtrls, RzButton, Vcl.Menus, Vcl.StdCtrls, System.Win.ScktComp, RzTray,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  IdSync, IdGlobal, Vcl.XPMan, IdAntiFreezeBase, Vcl.IdAntiFreeze;

const
  WM_SHOWMSG         = WM_USER + 100;
  WM_SHOWINCOMECALL  = WM_USER + 101;
  WM_SHOWOUTCOMECALL = WM_USER + 102;

type
  TAppOptions = class
    DbServer: string;
    DbName: string;
    ServerHost: string;
    ServerPort: integer;
  end;

  TReadingThread = class(TThread)
    protected
      FConn: TIdTCPConnection;
      procedure Execute; override;
    public
      constructor Create(AConn: TIdTCPConnection); reintroduce;
    end;

  TServerCmd = class(TIdSync)
    protected
      FMsg: String;
      procedure DoSynchronize; override;
    public
      constructor Create(const AMsg: String);
      class procedure DoCmd(const AMsg: String);
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
    AllCli_mi: TMenuItem;
    mOptions: TPopupMenu;
    miListCli: TMenuItem;
    N2: TMenuItem;
    miOptions: TMenuItem;
    TCPClient: TIdTCPClient;
    XPManifest1: TXPManifest;
    Timer1: TTimer;
    IdAntiFreeze: TIdAntiFreeze;
    mExceptList: TPopupMenu;

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
    procedure AllCli_miClick(Sender: TObject);
    procedure miListCliClick(Sender: TObject);
    procedure miOptionsClick(Sender: TObject);
    procedure TCPClientConnected(Sender: TObject);
    procedure TCPClientDisconnected(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    fCanClose: Boolean; // можно закрыть
    procedure WmShowMsg(var Msg: TMessage); message WM_SHOWMSG;
    procedure WmShowIncomeCall(var Msg: TMessage); message WM_SHOWINCOMECALL;
    procedure WmShowOutcomeCall(var Msg: TMessage); message WM_SHOWOUTCOMECALL;
  public
    ReadThread: TReadingThread;
    procedure DoSocketConnect;
    procedure AppException(Sender: TObject; E: Exception);
  end;

procedure LoadOptions(AIniFile: string);
function SaveLogin(AIniFile, Alogin: string): Boolean;
function ReadLogin(AIniFile: string): string;
function CheckUpdates: boolean;
function FindParam(AParam: string): Boolean;  // проверка наличи€ параметра запуска

var
  formMain: TfrmMain;
  MainOptions: TAppOptions;
  msgText: string;
  OutCallid: string; // callId из сообщени€ об исх. звонке
  OutCallApiId: string;
  OutPhone: string;  // телефон из сообщени€ об исх. звонке
  TimeShift: Integer; //смещение с сервером в секундах
  hMutex: THandle;

implementation

{$R *.dfm}

uses
  System.IniFiles,
  DM_Main, frmWorkers, formOptions, formClients, formClientFiz,
  formClientUr, CommonTypes, formLogo, formCalling, formSessions,
  formIncomeCallRoot, System.DateUtils, formClientResult,
  CommonVars, CommonFunc, formWorkerShedule;

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
  lblSocket.Caption := '—оединение с сервером установлено';
  DM.DateStart := Now;
  ClientSocket.Socket.SendText('#setphone:' + DM.CurrentUserSets.ATS_Phone_Num); //посылаем номер телефона
end;

procedure TfrmMain.ClientSocketDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  inherited;
  lblSocket.Caption := '—оединение с сервером разорвано';
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
  argList: TStringList;
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
    Application.ProcessMessages;
  end
  else

  if cmd = 'callid' then //создан исход€щий звонок с CallId
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
  if cmd = 'checkacceptcall' then //звонок прин€т
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

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TCPClient.Disconnect;

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
  Title := 'ѕользователь - ' + DM.CurrentUserSets.UserName +
    ' (' + DM.CurrentUserSets.UserTypeName + ')' + ' [вер.: ' + FileVersion(Application.ExeName) + ']';
  DoSocketConnect;
end;

procedure TfrmMain.miExitClick(Sender: TObject);
begin
  if Application.MessageBox('¬ы действительно хотите закрыть программу?',
    '¬ыход из программы', MB_YESNO + MB_ICONQUESTION) = mrYes then
    begin
      fCanClose := True;
      Self.Close;
    end;
end;

procedure TfrmMain.miListCliClick(Sender: TObject);
begin
  try
    DM.GetDataset(DM.Clients);
    frmWorkerShedule := TfrmWorkerShedule.Create(self);
    frmWorkerShedule.ShowModal;
  finally
    FreeAndNil(frmWorkerShedule);
  end;
end;

procedure TfrmMain.miOptionsClick(Sender: TObject);
begin
  frmOptions := TfrmOptions.Create(self);
  frmOptions.ShowModal;
  FreeAndNil(frmOptions);
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
 // n := InputBox('¬ход€щий звонок', 'Ќомер вызывающего', '+79104579648');
 // ClientSocket.Socket.SendText('#call:' + n + ',755,755');
  TCPClient.Socket.WriteLn (AnsiToUtf8('“ест'));
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

procedure TfrmMain.TCPClientConnected(Sender: TObject);
begin
  DM.SocketTimer.Interval := 0;
  ReadThread := TReadingThread.Create(TCPClient);

  lblSocket.Caption := '—оединение с сервером установлено';
  DM.DateStart := Now;
  TCPClient.IOHandler.DefStringEncoding := IndyTextEncoding_UTF8;
  TCPClient.Socket.WriteLn('#setphone:' + DM.CurrentUserSets.ATS_Phone_Num); //посылаем номер телефона
end;

procedure TfrmMain.TCPClientDisconnected(Sender: TObject);
begin
  if ReadThread <> nil then
  begin
    ReadThread.Terminate;
    ReadThread.WaitFor;
    FreeAndNil(ReadThread);
  end;
   lblSocket.Caption := '—оединение с сервером не установлено'
end;

procedure TfrmMain.DoSocketConnect;
begin
  TCPClient.Host := MainOptions.ServerHost;
  TCPClient.Port := MainOptions.ServerPort;
  try
    TCPClient.Connect;
  except
    DM.SocketTimer.Interval := 20000;
  end;
end;

procedure TfrmMain.AllCli_miClick(Sender: TObject);
begin
  if not DM.Clients.Active then
    DM.Clients.Open;

  frmClients := TfrmClients.Create(self, nil, -1);
  try
    frmClients.ShowModal;
  finally
    FreeAndNil(frmClients);
  end;
end;

procedure TfrmMain.AppException(Sender: TObject; E: Exception);
begin
  if E.ClassName = 'EIdNotConnected' then
    Exit;
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
  MessageBox(Handle, PChar(msgText), '—ообщение от сервера', MB_ICONINFORMATION);
end;

procedure TfrmMain.WmShowOutcomeCall(var Msg: TMessage);
begin
   DM.ShowOutcomCall(OutCallid, OutCallApiid, OutPhone);
end;

procedure LoadOptions(AIniFile: string);
begin
  MainOptions := TAppOptions.Create;

  MainOptions.ServerHost := ServerHost; //'81.177.48.139'; //'localhost';//
  MainOptions.ServerPort := ServerPort; //1025;
end;

function SaveLogin(AIniFile, ALogin: string): Boolean;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(AIniFile);
  try
    Ini.WriteString('LastLogin', 'Name', ALogin);
  finally
  Ini.Free;
  end;
end;

function ReadLogin(AIniFile: string): string;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(AIniFile);
  if Assigned(Ini) then
  try
    Result := Ini.ReadString('LastLogin', 'Name', '');
  finally
    Ini.Free;
  end;
end;

function CheckUpdates: boolean;
var
  HTTP: TIdHTTP;
  url: string;
  Stream: TStringStream;
  fStream: TMemoryStream;
  verServer, verLocal: string;
  fGet: boolean;
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
      frmLogo.ProgressBar.Visible := True;
      HTTP.OnWork      := frmLogo.HTTPWork;
      HTTP.OnWorkBegin := frmLogo.HTTPWorkBegin;
      HTTP.OnWorkEnd   := frmLogo.HTTPWorkEnd;

      fStream := TMemoryStream.Create;
      url := 'http://' + ServerHost + ':' + IntToStr(ServerHttpPort) + '/fumigator?action=getlastfile';
      try
        fGet := False;
        HTTP.Get(url, fStream);
        if HTTP.Response.ContentLength = fStream.Size then
          fGet := True;
      except
        fGet := false;
      end;
      if fGet and (HTTP.ResponseCode = 200) then
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

{ TServerCmd }

class procedure TServerCmd.DoCmd(const AMsg: String);
begin
  with Create(AMsg) do
  try
    Synchronize;
  finally
    Free;
  end;
end;

constructor TServerCmd.Create(const AMsg: String);
begin
  FMsg := AMsg;
  inherited Create;
end;

procedure TServerCmd.DoSynchronize;
var
  s: string;
  p: Integer;
  cmd, arg: string;
  argList: TStringList;
begin
  s := FMsg;

  if Copy(s, 1, 1) = '#' then
  begin
    p := Pos(':', s);
    cmd := Copy(s, 2, p - 2);
    arg := Copy(s, p + 1, Length(s));
  end;

  if cmd = 'msg' then
  begin
    msgText := arg;
    PostMessage(formMain.Handle, WM_SHOWMSG, 0,0);
    Application.ProcessMessages;
  end
  else

  if cmd = 'callid' then //создан исход€щий звонок с CallId
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
    PostMessage(formMain.Handle, WM_SHOWINCOMECALL, 0,0);
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
  if cmd = 'outcomecall' then //исход€щий звонок
  begin
    if Assigned(frmClientResult) then
      Exit;
    try
      argList := TStringList.Create;
      argList.Delimiter := ',';
      argList.DelimitedText := arg;
      OutCallId    := argList[0];
      OutCallApiId := argList[1];
      OutPhone     := argList[2];
      PostMessage(formMain.Handle, WM_SHOWOUTCOMECALL, 0,0);
      Application.ProcessMessages;
    finally
      FreeAndNil(argList);
    end;
  end
  
  else
  if cmd = 'checkacceptcall' then //звонок прин€т
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

{ TReadingThread }

constructor TReadingThread.Create(AConn: TIdTCPConnection);
begin
  FConn := AConn;
  inherited Create(False);
end;

procedure TReadingThread.Execute;
var
  s: string;
begin
  while not Terminated and FConn.Connected do
  begin
    try
      // refer to my earlier message for this code...
      if Terminated then
        Exit;

      if not FConn.IOHandler.Connected then
        Exit;

      s := FConn.IOHandler.ReadLn; // UTF8ToString(FConn.IOHandler.ReadLn);
      //s := URLDecode(s);
      if not Terminated and (s <> '') then
        TServerCmd.DoCmd(s);
        Sleep(200);
    except
      s := Exception(ExceptObject).Message;
    end;
  end;

end;

initialization
  hMutex := CreateMutex(nil, True,
    Pchar(ExtractFileName((Application.ExeName))));

finalization
  CloseHandle(hMutex);

end.
