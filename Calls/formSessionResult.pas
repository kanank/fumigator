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
    Label1: TLabel;
    edtResult: TcxMemo;
    grpIshod: TcxGroupBox;
    btnConsult: TRzButton;
    btnNonConsult: TRzButton;
    btnOther: TRzButton;
    edtIshod: TcxMemo;
    btnCardNoCreated: TRzButton;
    btnBack: TRzButton;
    procedure QBeforeOpen(DataSet: TDataSet);
    procedure Cancel_btnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnConsultClick(Sender: TObject);
    procedure btnOtherClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
  private
    fBack: Boolean; //нажат возврат
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


procedure TfrmSessionResult.btnBackClick(Sender: TObject);
begin
  fBack := True;
end;

procedure TfrmSessionResult.btnConsultClick(Sender: TObject);
begin
  edtIshod.Text := TRzButton(Sender).Caption;
  edtIshod.Properties.ReadOnly := True;
  //TRzButton(Sender).Down := True;
end;

procedure TfrmSessionResult.btnOtherClick(Sender: TObject);
begin
  //if not edtIshod.Visible then
  //begin
    edtIshod.Text := '';
    edtIshod.Properties.ReadOnly := False;
    //btnOther.Caption := 'Отменить "другое"';
    //TRzButton(Sender).Down := True;
  //end
//  else
//  begin
//    edtIshod.Text := '';
//    edtIshod.Visible := false;
//    btnOther.Caption := 'Другое';
//    TRzButton(Sender).Down := False;
//  end;
end;

procedure TfrmSessionResult.Cancel_btnClick(Sender: TObject);
begin
  (*if (cmbIshod.Text = '') or (edtResult.Text = '')  then
  begin
    Application.MessageBox('Необходимо заполнить поля', 'Результат сессии', MB_ICONSTOP);
    Exit;
  end
  else*)
  if not Q.Active then
    Q.ParamByName('CALLID').AsString := CallObj.CallInfo.CallId;
    Q.Open;

  if Q.State <> dsEdit then
    Q.Edit;

  if CheckFields then
  begin
    Q.FieldByName('RESULT').AsString := edtResult.Text;
    Q.FieldByName('ISHOD').AsString  := edtIshod.Text;
    Q.Post;

    Self.ModalResult := mrOk;
  end;
end;

function TfrmSessionResult.CheckFields: Boolean;
begin
  Result := false;
  if (edtIshod.Text = '') or (Length(edtResult.Text) < 5)  then
  begin
    Application.MessageBox('Необходимо заполнить поля! (Комментарий - не менее 5 символов) ', 'Результат сессии', MB_ICONSTOP);
    Result := False;
  end
  else
    Result := True;
  CanClose := Result;
end;

destructor TfrmSessionResult.Destroy;
begin
  CallObj.Ready := True;
  inherited;
end;

procedure TfrmSessionResult.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if not fBack and not CheckFields then
    CanClose := False;
end;

procedure TfrmSessionResult.QBeforeOpen(DataSet: TDataSet);
begin
  //cmbIshod.Text  := '';
  //edtResult.Text := '';
end;

end.
