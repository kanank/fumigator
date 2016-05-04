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
    cmbForma: TcxDBLookupComboBox;
    cxDBTextEdit1: TcxDBTextEdit;
    Label6: TLabel;
    Label7: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    Label8: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIncomeCallUr: TfrmIncomeCallUr;

implementation

{$R *.dfm}

end.
