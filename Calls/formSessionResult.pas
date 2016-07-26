unit formSessionResult;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassFrmBase, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  IBX.IBCustomDataSet, IBX.IBUpdateSQL, Data.DB, IBX.IBQuery, cxTextEdit,
  cxMemo, cxDBEdit, Vcl.StdCtrls, dxGDIPlusClasses, Vcl.ExtCtrls, RzButton,
  cxMaskEdit, cxDropDownEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue;

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
  Result := false;
  if (cmbIshod.Text = '') or (Length(edtResult.Text) < 5)  then
  begin
    Application.MessageBox('Необходимо заполнить поля! Комментарий - не менее 5 символов ', 'Результат сессии', MB_ICONSTOP);
    Result := False;
  end
  else
    Result := true;
end;

procedure TfrmSessionResult.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  if not CheckFields then
    CanClose := False;

end;

procedure TfrmSessionResult.QBeforeOpen(DataSet: TDataSet);
begin
  cmbIshod.Text  := '';
  edtResult.Text := '';
end;

end.
