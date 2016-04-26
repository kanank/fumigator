unit FrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassFrmBase, dxGDIPlusClasses,
  Vcl.ExtCtrls, RzButton, Vcl.Menus;

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
    procedure btnWorkersClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnTuneClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure UrClients_miClick(Sender: TObject);
    procedure NewFizClnt_miClick(Sender: TObject);
    procedure NewURClnt_miClick(Sender: TObject);
    procedure btnClientsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formMain: TfrmMain;

implementation

{$R *.dfm}

uses
  DM_Main, frmWorkers, formOptions, formClients, formClientFiz,
  formClientUr, CommonTypes;

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

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  Application.MainForm.Close;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  inherited;
  Title := 'Пользователь - ' + DM.CurrentUserSets.UserName +
    ' (' + DM.CurrentUserSets.UserTypeName + ')';
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

end.
