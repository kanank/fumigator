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
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  cxGroupBox;

type
  TfrmSessionResult = class(TBaseForm)
    DS: TDataSource;
    Q: TIBQuery;
    Q_upd: TIBUpdateSQL;
    Cancel_btn: TRzButton;
    QApi: TIBQuery;
    Label1: TLabel;
    edtResult: TcxMemo;
    grpIshod: TcxGroupBox;
    btnConsult: TRzButton;
    btnNonConsult: TRzButton;
    btnOther: TRzButton;
    edtIshod: TcxMemo;
    procedure QBeforeOpen(DataSet: TDataSet);
    procedure Cancel_btnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnConsultClick(Sender: TObject);
    procedure btnOtherClick(Sender: TObject);
  private
    { Private declarations }
  public
    CallResult: string;
    function CheckFields: Boolean;
    destructor Destroy; overload;
  end;

var
  frmSessionResult: TfrmSessionResult;

implementation

{$R *.dfm}
uses
  DM_Main, CommonVars;


procedure TfrmSessionResult.btnConsultClick(Sender: TObject);
begin
  edtIshod.Text := TRzButton(Sender).Caption;
end;

procedure TfrmSessionResult.btnOtherClick(Sender: TObject);
begin
  if not edtIshod.Visible then
  begin
    edtIshod.Text := '';
    edtIshod.Visible := True;
    btnOther.Caption := 'Отменить "другое"'
  end
  else
  begin
    edtIshod.Text := '';
    edtIshod.Visible := false;
    btnOther.Caption := 'Другое'
  end;
end;

procedure TfrmSessionResult.Cancel_btnClick(Sender: TObject);
begin
  (*if (cmbIshod.Text = '') or (edtResult.Text = '')  then
  begin
    Application.MessageBox('Необходимо заполнить поля', 'Результат сессии', MB_ICONSTOP);
    Exit;
  end
  else*)
  if CheckFields then
  begin
    Q.FieldByName('RESULT').AsString := edtResult.Text;
    Q.FieldByName('ISHOD').AsString  := edtIshod.Text;
    ModalResult := mrOk;
  end;
end;

function TfrmSessionResult.CheckFields: Boolean;
begin
  Result := false;
  if (edtIshod.Text = '') or (Length(edtResult.Text) < 5)  then
  begin
    Application.MessageBox('Необходимо заполнить поля! Комментарий - не менее 5 символов ', 'Результат сессии', MB_ICONSTOP);
    Result := False;
  end
  else
    Result := true;
end;

destructor TfrmSessionResult.Destroy;
begin
  CallObj.Ready := true;
  inherited;
end;

procedure TfrmSessionResult.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if not CheckFields then
    CanClose := False;

end;

procedure TfrmSessionResult.QBeforeOpen(DataSet: TDataSet);
begin
  //cmbIshod.Text  := '';
  //edtResult.Text := '';
end;

end.
