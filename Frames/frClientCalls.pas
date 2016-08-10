unit frClientCalls;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frListBase, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBUpdateSQL, RzButton, RzPanel,
  cxClasses, cxGridLevel, cxGrid, Vcl.ExtCtrls, cxDBLookupComboBox, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxButtonEdit,
  formRecordPlay;

type
  TframeClientCalls = class(TFrameListBase)
    GridView: TcxGridDBTableView;
    ColumnRecord: TcxGridDBColumn;
    pnlForm: TPanel;
    GridViewColumn2: TcxGridDBColumn;
    GridViewColumn3: TcxGridDBColumn;
    procedure GridViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
  private
    fPlay: TfrmRecordPlay;
    fInQuery: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function OpenData(Aid: integer = 0): Boolean; override;
  end;

var
  frameClientCalls: TframeClientCalls;

implementation

{$R *.dfm}

{ TframeClientCalls }

constructor TframeClientCalls.Create(AOwner: TComponent);
begin
  inherited;
  fPlay := TfrmRecordPlay.Create(nil);
  fPlay.Parent := pnlForm;
  pnlForm.Visible := False;
end;

destructor TframeClientCalls.Destroy;
begin
  fPlay.Free;
  inherited;
end;

procedure TframeClientCalls.GridViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
var
  ColumnId: Integer;
  Cellvalue : variant;
begin
  if fInQuery or not GridView.Focused then
    Exit;
  pnlForm.Top  := GrdPhone.Top + ColumnRecord.FocusedCellViewInfo.RealBounds.Top + 1;
  pnlForm.Left := ColumnRecord.FocusedCellViewInfo.RealBounds.Left + 1;
  ColumnID     := GridView.GetColumnByFieldName('CALLAPIID').Index;
  Cellvalue    := ColumnRecord.FocusedCellViewInfo.GridRecord.Values[ColumnID];
  fPlay.CallApiId := ColumnRecord.FocusedCellViewInfo.GridRecord.Values[ColumnId];
  ColumnID     := GridView.GetColumnByFieldName('LOCALNUM').Index;
  fPlay.ext  := ColumnRecord.FocusedCellViewInfo.GridRecord.Values[ColumnId];
  fPlay.FileName  := '';
  fPlay.Width  := ColumnRecord.Width;
  fPlay.Height := ColumnRecord.FocusedCellViewInfo.Height-2;
  pnlForm.Width  := fPlay.Width;
  pnlForm.Height := fPlay.Height;
  fPlay.Top := 0;
  fPlay.Left := 0;
  fPlay.Visible := True;
  pnlForm.Visible := True;
  pnlForm.BringToFront;
  fPlay.BringToFront;
end;

function TframeClientCalls.OpenData(Aid: integer): Boolean;
begin
  fInQuery := True;
  try
    inherited OpenData(AId);
  finally
    fInQuery := False;
  end;
end;

end.
