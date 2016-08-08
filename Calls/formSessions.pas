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
  cxDBLookupComboBox, dxmdaset, Vcl.Menus, dxSkinsCore, dxSkinBlack, dxSkinBlue,
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
  dxSkinscxPCPainter, cxCheckBox;

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
    GridPopup: TPopupMenu;
    N1: TMenuItem;
    miFilterAccepted: TMenuItem;
    miFilterDuration: TMenuItem;
    miFilterOff: TMenuItem;
    cmbFilter: TcxComboBox;
    chkWorkerClients: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure RzButton1Click(Sender: TObject);
    procedure GridViewCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure QFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure miFilterOffClick(Sender: TObject);
    procedure miFilterAcceptedClick(Sender: TObject);
    procedure miFilterDurationClick(Sender: TObject);
    procedure Edit_btnClick(Sender: TObject);
    procedure cmbFilterPropertiesChange(Sender: TObject);
    procedure chkWorkerClientsClick(Sender: TObject);
  private
    procedure CalcHeader;
    function MillesecondToDateTime(ms: int64): TDateTime;
    procedure SetFilter;
  public
    { Public declarations }
  end;

var
  frmSessions: TfrmSessions;

implementation

{$R *.dfm}
uses
  DM_Main, formSessionEdit, formSessionResult, formClientFiz, formClientUr,
  formClientResult, CommonTypes;

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


procedure TfrmSessions.chkWorkerClientsClick(Sender: TObject);
begin
  inherited;
  SetFilter;
end;

procedure TfrmSessions.cmbFilterPropertiesChange(Sender: TObject);
begin
  SetFilter;
end;

procedure TfrmSessions.Edit_btnClick(Sender: TObject);
var
  prm: TFrmCreateParam;
  mres: TModalResult;
  frm: TForm;
begin
  frmSessionEdit := TfrmSessionEdit.Create(self);

  try
  // результат
  frmSessionResult := TfrmSessionResult.Create(self);
  frmSessionResult.Cancel_btn.Visible := False;
  frmSessionResult.Height := frmSessionResult.Height -
    frmSessionResult.Cancel_btn.Height - 10;
  frmSessionResult.Parent := frmSessionEdit.pnlResult;
  frmSessionResult.Q.ParamByName('callid').AsString :=
    DS.DataSet.FieldByName('callid').AsString;
  frmSessionResult.Q.Open;
  frmSessionResult.Q.Edit;
  frmSessionResult.Position := poDefault;

  frmSessionResult.BorderIcons := [];
  frmSessionResult.BorderStyle := bsNone;

  //frmSessionEdit.pnlResult.Height := frmSessionResult.Height + 5;
  frmSessionResult.Show;

  //карточка клиента
  DM.GetDataset(DM.Clients);

  if DM.Clients.Locate('id', DS.DataSet.FieldByName('client_id').AsInteger, []) then
  begin

    prm := NewFrmCreateParam(asShow, DM.Clients);
    if DM.Clients.FieldByName('type_cli').AsInteger = 0 then
    begin
      frmClientFiz := TfrmClientFiz.Create(frmSessionEdit, '', @prm);
      frmClientFiz.RzPanel1.Visible := False;
      frmClientFiz.Height := frmClientFiz.Height - frmClientFiz.RzPanel1.Height;
      frm := frmClientFiz;
    end
    else
    begin
      frmClientUr := TfrmClientUr.Create(frmSessionEdit, '', @prm);
      frmClientUr.RzPanel1.Visible := False;
      frmClientUr.Height := frmClientUr.Height - frmClientUr.RzPanel1.Height;
      frm := frmClientUr;
    end;

    frm.BorderIcons := [];
    frm.BorderStyle := bsNone;
    frm.Parent      := frmSessionEdit.pnlClient;

    //frmSessionEdit.pnlClient.Height := frm.Height + 5;
    //frmSessionEdit.pnlClient.Width  := frm.Width;

    frm.Position := poDefault;

    if frm.Width > frmSessionEdit.Width then
      frmSessionEdit.Width := frm.Width;

    frm.Show;
    frmSessionEdit.ClientHeight := frmSessionResult.Height + 5 +
      frm.Height + 5 + frmSessionEdit.pnlCalls.Height +
       frmSessionEdit.RzPanel1.ClientHeight;

    frmSessionEdit.pnlClient.Height := frm.Height + 5;
  end
  else
  begin
    frmSessionEdit.pnlClient.Visible := False;
    frmSessionEdit.ClientHeight := frmSessionResult.Height + 5 +
       frmSessionEdit.pnlCalls.Height +
        frmSessionEdit.RzPanel1.ClientHeight;
  end;

    frmSessionEdit.pnlResult.Height := frmSessionResult.Height + 5;

    frmSessionEdit.frameClientCalls.AddParam('client_id', DS.DataSet.FieldByName('client_id'));
    frmSessionEdit.frameClientCalls.OpenData;

    frmSessionEdit.ShowModal;

    if frmSessionEdit.ModalResult = mrOk then
    begin
      if frmSessionResult.CheckFields then
      try
        frmSessionResult.Q.Post;
          if frmSessionResult.Q.Transaction.Active then
             frmSessionResult.Q.Transaction.CommitRetaining;
        except
           if frmSessionResult.Q.Transaction.Active then
             frmSessionResult.Q.Transaction.RollbackRetaining;
        end;

    end;

  finally
    FreeAndNil(frmSessionEdit);
    //FreeAndNil(frmSessionEdit);
    //FreeAndNil(frmSessionEdit);
  end;
end;

procedure TfrmSessions.FormCreate(Sender: TObject);
begin
  edtTimeStart.Date := Date;
  edtTimeEnd.Date   := edtTimeStart.Date;

  MemHeader.Open;
  MemHeader.Append;
  MemHeader.Post;
  cmbFilter.ItemIndex := 0;
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
 ColumnID := TcxGridDBTableView(Sender).GetColumnByFieldName('ISHOD').Index;
 Cellvalue := AViewInfo.GridRecord.Values[ColumnID];
 if not VarIsNull(Cellvalue) then
   ACanvas.Canvas.Font.Style := [fsBold]
 else
   ACanvas.Canvas.Font.Style := [];
end;

procedure TfrmSessions.miFilterAcceptedClick(Sender: TObject);
begin
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  SetFilter;
end;

procedure TfrmSessions.miFilterDurationClick(Sender: TObject);
begin
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  SetFilter;
end;

procedure TfrmSessions.miFilterOffClick(Sender: TObject);
begin
  miFilterAccepted.Checked := false;
  miFilterDuration.Checked := False;
  Q.Filtered := false;
end;

function TfrmSessions.MillesecondToDateTime(ms: int64): TDateTime;
const
  //Значение 1 миллисекунды в формате TDateTime.
  MsTime : TDateTime = 1 / (24 * 60 * 60 * 1000);
begin
  //Время в формате TDateTime.
  Result := Ms * MsTime;
end;

procedure TfrmSessions.QFilterRecord(DataSet: TDataSet; var Accept: Boolean);
var
  ff, f0, f1, f2: Boolean;
begin
  f1 := True; f2 := True;
  f0 := not chkWorkerClients.Checked  or
        (chkWorkerClients.Checked and
           DM.isWorkerClient(DataSet.FieldByName('Client_id').asInteger));
  if f0 then
  begin
    if miFilterAccepted.Checked then
      f1 := DataSet.FieldByName('ISHOD').AsString <> '';
    if miFilterDuration.Checked then
      f2 := DataSet.FieldByName('DURATION').AsInteger > 40000;

     case cmbFilter.ItemIndex of
       0: ff := DataSet.FieldByName('ID').AsInteger > 0;
       1: ff := (DataSet.FieldByName('CALLTYPE').AsInteger = 0) and
                (DataSet.FieldByName('ISHOD').AsString <> '');
       2: ff := DataSet.FieldByName('CALLTYPE').AsInteger = 1;
       3: ff := DataSet.FieldByName('ANSWER').AsInteger = 0;
     end;
  end;
  Accept := f0 and ff and f1 and f2;
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

procedure TfrmSessions.SetFilter;
begin
  Q.Filtered := False;
  Q.Filtered := True;
end;

end.
