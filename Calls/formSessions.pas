unit formSessions;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassSprForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, RzButton, Vcl.ExtCtrls, RzPanel, dxGDIPlusClasses,
  cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, Vcl.StdCtrls, IBX.IBCustomDataSet, IBX.IBQuery,
  cxDBLookupComboBox, dxmdaset;

type
  TfrmSessions = class(TSprForm)
    Q: TIBQuery;
    DS: TDataSource;
    Label11: TLabel;
    edtTimeStart: TcxDateEdit;
    edtTimeEnd: TcxDateEdit;
    GridViewColumn1: TcxGridDBColumn;
    GridViewColumn2: TcxGridDBColumn;
    GridViewColumn3: TcxGridDBColumn;
    GridViewColumn4: TcxGridDBColumn;
    GridViewColumn5: TcxGridDBColumn;
    GridViewColumn6: TcxGridDBColumn;
    Label1: TLabel;
    GridViewColumn7: TcxGridDBColumn;
    GridViewColumn8: TcxGridDBColumn;
    GridViewColumn9: TcxGridDBColumn;
    GridViewColumn10: TcxGridDBColumn;
    RzButton1: TRzButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    RzPanel3: TRzPanel;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    MemHeader: TdxMemData;
    DsHeader: TDataSource;
    MemHeaderCNT_SESSION: TIntegerField;
    MemHeaderCNT_GOOD_SESSION: TIntegerField;
    MemHeaderEND_BY_CLIENT: TIntegerField;
    MemHeaderEND_BY_USER: TIntegerField;
    MemHeaderSUM_DURATION: TDateTimeField;
    MemHeaderAVG_DURATION: TDateTimeField;
    GridViewColumn11: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure RzButton1Click(Sender: TObject);
    procedure GridViewCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
  private
    procedure CalcHeader;
    function MillesecondToDateTime(ms: int64): TDateTime;
  public
    { Public declarations }
  end;

var
  frmSessions: TfrmSessions;

implementation

{$R *.dfm}
uses
  DM_Main;

procedure TfrmSessions.CalcHeader;
var
  SUM_DURATION, AVG_DURATION: integer;
  cnt_good, cnt, endByClient, endByUser: Integer;

begin
  SUM_DURATION := 0; AVG_DURATION := 0;
  cnt_good := 0; cnt := 0; endByClient := 0; endByUser := 0;
  cnt := Q.RecordCount;
  Q.First;
  while not Q.Eof do
  begin
    SUM_DURATION := SUM_DURATION + q.FieldByName('duration').AsInteger;
    if Q.FieldByName('callresult').AsString = 'ANSWER' then
      inc(cnt_good);
    Q.Next;
  end;


  with MemHeader do
  begin
    Edit;
    if cnt > 0 then
    begin
      AVG_DURATION := Trunc(SUM_DURATION/cnt);
      FieldByName('sum_duration').AsDateTime    := MillesecondToDateTime(SUM_DURATION);
      FieldByName('avg_duration').AsDateTime    := MillesecondToDateTime(AVG_DURATION);
      FieldByName('cnt_session').AsInteger      := cnt;
      FieldByName('cnt_good_session').AsInteger := cnt_good;
      FieldByName('END_BY_USER').AsInteger      := cnt;
      FieldByName('END_BY_CLIENT').AsInteger    := 0;
    end
    else
    begin
      FieldByName('sum_duration').Clear;
      FieldByName('avg_duration').Clear;
      FieldByName('cnt_session').Clear;
      FieldByName('cnt_good_session').Clear;
      FieldByName('END_BY_USER').Clear;
      FieldByName('END_BY_CLIENT').Clear;
    end;

    Post;
  end;

end;

procedure TfrmSessions.FormCreate(Sender: TObject);
begin
  edtTimeStart.Date := Date;
  edtTimeEnd.Date   := edtTimeStart.Date;

  MemHeader.Open;
  MemHeader.Append;
  MemHeader.Post;
end;


procedure TfrmSessions.GridViewCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
 var
  ColumnID: integer;
  Cellvalue : variant;
begin
 ColumnID := TcxGridDBTableView(Sender).GetColumnByFieldName('DURATION').Index;
 Cellvalue := AViewInfo.GridRecord.Values[ColumnID];
 if (Cellvalue > 40000) then
  begin
    ACanvas.Canvas.Brush.Color := clMoneyGreen; //$00F1A283;
  end;
end;

function TfrmSessions.MillesecondToDateTime(ms: int64): TDateTime;
const
  //Значение 1 миллисекунды в формате TDateTime.
  MsTime : TDateTime = 1 / (24 * 60 * 60 * 1000);
begin
  //Время в формате TDateTime.
  Result := Ms * MsTime;
end;

procedure TfrmSessions.RzButton1Click(Sender: TObject);
begin
  Q.Close;
  DM.GetDataset(DM.Clients);

  if Q.Transaction.Active then
    Q.Transaction.CommitRetaining;

  Q.ParamByName('date1').AsDateTime := edtTimeStart.Date;
  Q.ParamByName('date2').AsDateTime := edtTimeEnd.Date + 1;
  Q.Open;
  CalcHeader;
end;

end.
