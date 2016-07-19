unit formIncomeCalls;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassSimpleForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, RzPanel, Data.DB,
  cxTextEdit, cxMaskEdit, cxDBEdit, Vcl.StdCtrls, RzButton, Vcl.ExtCtrls,
  dxGDIPlusClasses, frameBase, frPersonSmall, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, cxDBData, cxLabel, cxDBLabel, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid;

type
  TfrmIncomeCall = class(TSimpleForm)
    Label11: TLabel;
    DS: TDataSource;
    grpBox: TRzGroupBox;
    FramePerson: TFramePersonSmall;
    Label1: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    grdDog: TcxGrid;
    grdDogDBTableView1: TcxGridDBTableView;
    grdDogDBTableView1Column1: TcxGridDBColumn;
    grdDogLevel1: TcxGridLevel;
    grdDogDBTableView1Column2: TcxGridDBColumn;
    grdDogDBTableView1Column3: TcxGridDBColumn;
    grdDogDBTableView1Column4: TcxGridDBColumn;
    Label3: TLabel;
    btnTransfer: TRzButton;
    edtPhone: TcxMaskEdit;
    cmbFormat: TcxLookupComboBox;
    cmbStatus: TcxLookupComboBox;
    lblWorker: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure Exit_bntClick(Sender: TObject);
    procedure btnTransferClick(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  frmIncomeCall: TfrmIncomeCall;

implementation

{$R *.dfm}
uses
  DM_Main;


procedure TfrmIncomeCall.btnTransferClick(Sender: TObject);
begin
  CanClose := True;
end;

procedure TfrmIncomeCall.Exit_bntClick(Sender: TObject);
begin
  CanClose := True;
end;

procedure TfrmIncomeCall.FormCreate(Sender: TObject);
begin
  inherited;
  CanClose := False;
end;

end.
