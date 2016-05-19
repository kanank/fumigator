unit FrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassFrmBase, dxGDIPlusClasses,
  Vcl.ExtCtrls, RzButton, Vcl.Menus, Vcl.StdCtrls, System.Win.ScktComp;

const
  WM_SHOWMSG = WM_USER + 100;

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
  private
    procedure WmShowMsg(var Msg: TMessage); message WM_SHOWMSG;
  public
    procedure DoSocketConnect;
  end;

procedure LoadOptions(AIniFile: string);

var
  formMain: TfrmMain;
  MainOptions: TAppOptions;
  msgText: string;

implementation

{$R *.dfm}

uses
  DM_Main, frmWorkers, formOptions, formClients, formClientFiz,
  formClientUr, CommonTypes, formLogo, formCalling;

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
  inherited;
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

  if cmd = 'callid' then
  begin
    if DM.inCalling then
      frmCalling.CallId := arg;
  end
  else

  if cmd = 'checkcall' then
  begin
    DM.Calls_TimerTimer(DM.Calls_Timer);
  end


end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  //Application.MainForm.Close;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  inherited;
  Title := 'Пользователь - ' + DM.CurrentUserSets.UserName +
    ' (' + DM.CurrentUserSets.UserTypeName + ')';
  DoSocketConnect;
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
begin
  DM.Calls_TimerTimer(DM.Calls_Timer);

end;

procedure TfrmMain.RzMenuButton3Click(Sender: TObject);
begin
  inherited;
  DM.ShowClientsForCall;
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
  formWorkers := TfrmWorkers.Create(self);
  formWorkers.ShowModal;
  FreeAndNil(formWorkers);

end;

procedure TfrmMain.WmShowMsg(var Msg: TMessage);
begin
  MessageBox(Handle, PChar(msgText), 'Сообщение от сервера', MB_ICONINFORMATION);
end;

procedure LoadOptions(AIniFile: string);
begin
  MainOptions := TAppOptions.Create;

  MainOptions.ServerHost := '81.177.48.139'; //'localhost';//
  MainOptions.ServerPort := 1025;
end;

end.
