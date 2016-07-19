unit formIncomeCallsUr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formIncomeCalls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxDBLookupComboBox, cxLabel, cxDBLabel, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, frameBase, frPersonSmall,
  RzPanel, cxTextEdit, cxMaskEdit, cxDBEdit, RzButton, Vcl.ExtCtrls,
  Vcl.StdCtrls, dxGDIPlusClasses;

type
  TfrmIncomeCallUr = class(TfrmIncomeCall)
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtPersonName: TcxDBTextEdit;
    Label8: TLabel;
    cmbForma: TcxLookupComboBox;
    edtINN: TcxTextEdit;
    edtName: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure Exit_bntClick(Sender: TObject);
    procedure btnTransferClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIncomeCallUr: TfrmIncomeCallUr;

implementation

{$R *.dfm}
uses
  DM_Main;


procedure TfrmIncomeCallUr.btnTransferClick(Sender: TObject);
begin
  CanClose := True;
end;

procedure TfrmIncomeCallUr.Exit_bntClick(Sender: TObject);
begin
  CanClose := True;
end;

procedure TfrmIncomeCallUr.FormCreate(Sender: TObject);
begin
  inherited;
    CanClose := false;
end;

end.
