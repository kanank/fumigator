unit formClientCard;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassSimpleForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxDBLookupComboBox, cxDBEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  Vcl.StdCtrls, cxTextEdit, cxMemo, RzButton, Vcl.ExtCtrls, RzPanel,
  dxGDIPlusClasses, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  CommonTypes, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TfrmClientCard = class(TSimpleForm)
    edtClientInfo: TcxDBMemo;
    Label3: TLabel;
    Label2: TLabel;
    grdDog: TcxGrid;
    grdDogDBTableView1: TcxGridDBTableView;
    grdDogDBTableView1Column1: TcxGridDBColumn;
    grdDogDBTableView1Column2: TcxGridDBColumn;
    grdDogDBTableView1Column3: TcxGridDBColumn;
    grdDogDBTableView1Column4: TcxGridDBColumn;
    grdDogLevel1: TcxGridLevel;
    edtComment: TcxDBTextEdit;
    Label1: TLabel;
    RzButton1: TRzButton;
    RzButton2: TRzButton;
    DS: TDataSource;
    Label4: TLabel;
    Q: TIBQuery;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    procedure RzButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    class function ShowClientCard(AClient_id: integer): FormResult;
  end;

var
  frmClientCard: TfrmClientCard;

implementation

{$R *.dfm}

uses
  DM_Main;

{ TfrmClientCard }

procedure TfrmClientCard.FormShow(Sender: TObject);
begin
  if Q.FieldByName('cltype').AsString = 'FIZ' then
    Caption := Caption + '. ���������� ����'
  else
    Caption := Caption + '. ����������� ����'
end;

procedure TfrmClientCard.RzButton1Click(Sender: TObject);
var
  ExtPrm: TClientParam;
begin
  DM.GetDataset(DM.Clients);
  DM.Clients.Locate('id', Q.ParamByName('client_id').AsInteger, []);
  if Q.FieldByName('cltype').AsString = 'FIZ' then
    DM.ShowClientFiz(asEdit, ExtPrm)
  else
    DM.ShowClientUr(asEdit, ExtPrm);
end;

class function TfrmClientCard.ShowClientCard(AClient_id: integer): FormResult;
begin
  frmClientCard := TfrmClientCard.Create(nil);
  try
    frmClientCard.Q.ParamByName('client_id').AsInteger := AClient_id;
    frmClientCard.Q.Open;
    frmClientCard.ShowModal;
    Result.ModalRes := frmClientCard.ModalResult;
  finally
    FreeAndNil(frmClientCard);
  end;
end;

end.
