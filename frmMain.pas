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
    RzMenuButton2: TRzMenuButton;
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
  frmWorkers, formOptions, formClients, formClientFiz, formClientUr;

procedure TfrmMain.btnTuneClick(Sender: TObject);
begin
  frmOptions := TfrmOptions.Create(self);
  frmOptions.ShowModal;
  FreeAndNil(frmOptions);
end;

procedure TfrmMain.btnWorkersClick(Sender: TObject);
begin
  frmClients := TfrmClients.Create(self);
  frmClients.ShowModal;
  FreeAndNil(frmClients);
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  Application.MainForm.Close;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  inherited;
 // Title := Caption;
end;

procedure TfrmMain.NewFizClnt_miClick(Sender: TObject);
begin
  frmClientFiz := TfrmClientFiz.Create(self);
  frmClientFiz.ShowModal;
  FreeAndNil(frmClientFiz);
end;

procedure TfrmMain.NewURClnt_miClick(Sender: TObject);
begin
  frmClientUr := TfrmClientUr.Create(self);
  frmClientUr.ShowModal;
  FreeAndNil(frmClientUr);
end;

procedure TfrmMain.UrClients_miClick(Sender: TObject);
begin
  formWorkers := TfrmWorkers.Create(self);
  formWorkers.ShowModal;
  FreeAndNil(formWorkers);

end;

end.
