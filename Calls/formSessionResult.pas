unit formSessionResult;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassFrmBase, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  IBX.IBCustomDataSet, IBX.IBUpdateSQL, Data.DB, IBX.IBQuery, cxTextEdit,
  cxMemo, cxDBEdit, Vcl.StdCtrls, dxGDIPlusClasses, Vcl.ExtCtrls, RzButton;

type
  TfrmSessionResult = class(TBaseForm)
    Label11: TLabel;
    edtIshod: TcxDBMemo;
    edtResult: TcxDBMemo;
    Label1: TLabel;
    DS: TDataSource;
    Q: TIBQuery;
    Q_upd: TIBUpdateSQL;
    Cancel_btn: TRzButton;
    procedure QBeforeOpen(DataSet: TDataSet);
    procedure Cancel_btnClick(Sender: TObject);
  private
    { Private declarations }
  public
    CallResult: string;
  end;

var
  frmSessionResult: TfrmSessionResult;

implementation

{$R *.dfm}
uses
  DM_Main;


procedure TfrmSessionResult.Cancel_btnClick(Sender: TObject);
begin
  if (edtIshod.Text = '') or (edtResult.Text = '')  then
  begin
    Application.MessageBox('Необходимо заполнить поля', 'Результат сессии', MB_ICONSTOP);
    Exit;
  end
  else
    ModalResult := mrOk;
end;

procedure TfrmSessionResult.QBeforeOpen(DataSet: TDataSet);
begin
  edtIshod.Text  := '';
  edtResult.Text := '';
end;

end.
