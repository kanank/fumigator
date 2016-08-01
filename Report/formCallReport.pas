unit formCallReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formDbBase, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
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
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxDBLookupComboBox, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  RzButton, cxTextEdit, cxMaskEdit, cxCalendar, Vcl.StdCtrls, Vcl.ExtCtrls,
  RzPanel, IBX.IBCustomDataSet, IBX.IBQuery, dxGDIPlusClasses, cxTimeEdit,
  formRecordPlay;

type
  TfrmCallReport = class(TfrmDbBaseForm)
    Image1: TImage;
    RzPanel2: TRzPanel;
    Image2: TImage;
    Label11: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edtTimeStart: TcxDateEdit;
    RzButton1: TRzButton;
    edtTimeEnd: TcxDateEdit;
    cmbRegion: TcxLookupComboBox;
    Grid: TcxGrid;
    GridView: TcxGridDBTableView;
    GridViewColumn1: TcxGridDBColumn;
    GridViewColumn2: TcxGridDBColumn;
    GridViewColumn8: TcxGridDBColumn;
    GridViewColumn3: TcxGridDBColumn;
    GridViewColumn7: TcxGridDBColumn;
    GridViewColumn9: TcxGridDBColumn;
    GridViewColumn10: TcxGridDBColumn;
    GridViewColumn6: TcxGridDBColumn;
    GridViewColumn4: TcxGridDBColumn;
    GridViewColumn5: TcxGridDBColumn;
    GridViewColumn11: TcxGridDBColumn;
    GridLevel1: TcxGridLevel;
    procedure RzButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    frmPlay: TfrmRecordPlay;
  end;

var
  frmCallReport: TfrmCallReport;

implementation

{$R *.dfm}

uses
  DM_Main;

procedure TfrmCallReport.FormCreate(Sender: TObject);
begin
  inherited;
  frmPlay := TfrmRecordPlay.Create(nil);
end;

procedure TfrmCallReport.FormDestroy(Sender: TObject);
begin
  frmPlay.Free;
  inherited;

end;

procedure TfrmCallReport.RzButton1Click(Sender: TObject);
begin
  _Query.Close;
  DM.GetDataset(DM.Clients);

  if _Query.Transaction.Active then
    _Query.Transaction.CommitRetaining;

  _Query.ParamByName('date1').AsDateTime := edtTimeStart.Date;
  _Query.ParamByName('date2').AsDateTime := edtTimeEnd.Date + 1;
  _Query.Open;
end;

end.
