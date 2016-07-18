unit formSessionResult;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassFrmBase, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  IBX.IBCustomDataSet, IBX.IBUpdateSQL, Data.DB, IBX.IBQuery, cxTextEdit,
  cxMemo, cxDBEdit, Vcl.StdCtrls, dxGDIPlusClasses, Vcl.ExtCtrls, RzButton,
  cxMaskEdit, cxDropDownEdit;

type
  TfrmSessionResult = class(TBaseForm)
    Label11: TLabel;
    edtResult: TcxDBMemo;
    Label1: TLabel;
    DS: TDataSource;
    Q: TIBQuery;
    Q_upd: TIBUpdateSQL;
    Cancel_btn: TRzButton;
    QApi: TIBQuery;
    cmbIshod: TcxDBComboBox;
    procedure QBeforeOpen(DataSet: TDataSet);
    procedure Cancel_btnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    CallResult: string;
    function CheckFields: Boolean;
  end;

var
  frmSessionResult: TfrmSessionResult;

implementation

{$R *.dfm}
uses
  DM_Main;


procedure TfrmSessionResult.Cancel_btnClick(Sender: TObject);
begin
  (*if (cmbIshod.Text = '') or (edtResult.Text = '')  then
  begin
    Application.MessageBox('Необходимо заполнить поля', 'Результат сессии', MB_ICONSTOP);
    Exit;
  end
  else*)
  if CheckFields then
    ModalResult := mrOk;
end;

function TfrmSessionResult.CheckFields: Boolean;
begin
  if (cmbIshod.Text = '') or (edtResult.Text = '')  then
  begin
    Application.MessageBox('Необходимо заполнить поля', 'Результат сессии', MB_ICONSTOP);
    Exit;
    Result := False;
  end
  else
    Result := true;
end;

procedure TfrmSessionResult.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if not CheckFields then
    CanClose := False;

end;

procedure TfrmSessionResult.QBeforeOpen(DataSet: TDataSet);
begin
  cmbIshod.Text  := '';
  edtResult.Text := '';
end;

end.
