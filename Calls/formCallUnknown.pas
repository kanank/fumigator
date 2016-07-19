unit formCallUnknown;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassSimpleForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, RzLabel,
  cxTextEdit, cxMaskEdit, cxDBEdit, Vcl.StdCtrls, RzButton, Vcl.ExtCtrls,
  RzPanel, dxGDIPlusClasses, Data.DB, Vcl.Menus;

type
  TfrmCallUnknown = class(TSimpleForm)
    Label11: TLabel;
    RzLabel1: TRzLabel;
    btnNewFizCli: TRzButton;
    btnNewUrCli: TRzButton;
    DS: TDataSource;
    edtPhone: TcxMaskEdit;
    RzButton1: TRzButton;
    btnContacts: TRzMenuButton;
    procedure FormCreate(Sender: TObject);
    procedure btnNewFizCliClick(Sender: TObject);
    procedure btnNewUrCliClick(Sender: TObject);
    procedure btnContactsClick(Sender: TObject);
    procedure RzButton1Click(Sender: TObject);
    procedure Exit_bntClick(Sender: TObject);
  private
    fOutcomeCall: Boolean;
    procedure SetOutcomeCall(AValue: boolean);
  public
    ContactType: integer;
    property OutcomeCall: Boolean read fOutcomeCall write SetOutcomeCall;
  end;

var
  frmCallUnknown: TfrmCallUnknown;

implementation

{$R *.dfm}

uses
  DM_Main, formClientFiz, formClientUr, CommonTypes, frmMain;




{ TfrmCallUnknown }

procedure TfrmCallUnknown.btnContactsClick(Sender: TObject);
begin
  CanClose := True;
end;

procedure TfrmCallUnknown.btnNewFizCliClick(Sender: TObject);
begin
  CanClose := True;
end;

procedure TfrmCallUnknown.btnNewUrCliClick(Sender: TObject);
begin
  CanClose := True;
end;

procedure TfrmCallUnknown.Exit_bntClick(Sender: TObject);
begin
  CanClose := True;
end;

procedure TfrmCallUnknown.FormCreate(Sender: TObject);
begin
  inherited;
  CanClose := false;
end;

procedure TfrmCallUnknown.RzButton1Click(Sender: TObject);
begin
  CanClose := True;
end;

procedure TfrmCallUnknown.SetOutcomeCall(AValue: boolean);
begin
  fOutcomeCall := AValue;

  if AValue then
    Caption := 'Исходящий звонок. Клиент не найден';

end;

end.
