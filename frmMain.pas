unit FrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassFrmBase, dxGDIPlusClasses,
  Vcl.ExtCtrls, RzButton, Vcl.Menus, Vcl.StdCtrls, System.Win.ScktComp;

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
    procedure btnWorkersClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnTuneClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure UrClients_miClick(Sender: TObject);
    procedure NewFizClnt_miClick(Sender: TObject);
    procedure NewURClnt_miClick(Sender: TObject);
    procedure btnClientsClick(Sender: TObject);
    procedure RzMenuButton2Click(Sender: TObject);
    procedure ClientSocketConnecting(Sender: TObject; Socket: TCustomWinSocket);
    procedure ClientSocketDisconnect(Sender: TObject; Socket: TCustomWinSocket);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure LoadOptions(AIniFile: string);

var
  formMain: TfrmMain;
  MainOptions: TAppOptions;

implementation

{$R *.dfm}

uses
  DM_Main, frmWorkers, formOptions, formClients, formClientFiz,
  formClientUr, CommonTypes, formLogo;

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

procedure TfrmMain.ClientSocketConnecting(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  inherited;
  lblSocket.Caption := 'Соединение с сервером установлено';
end;

procedure TfrmMain.ClientSocketDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  inherited;
  lblSocket.Caption := 'Соединение с сервером разорвано';
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
  ClientSocket.Host := MainOptions.ServerHost;
  ClientSocket.Port := MainOptions.ServerPort;
  //try ClientSocket.Open; except end;
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

procedure LoadOptions(AIniFile: string);
begin
  MainOptions := TAppOptions.Create;

  MainOptions.ServerHost := '81.177.48.139';
  MainOptions.ServerPort := 1025;
end;

end.
