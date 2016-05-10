unit formWorkerShedule;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassSimpleForm, RzButton, Vcl.ExtCtrls,
  RzPanel, dxGDIPlusClasses, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomView, cxClasses, cxGridLevel,
  cxGrid, cxContainer, dxmdaset, cxDropDownEdit, cxCalendar, cxDBEdit,
  Vcl.StdCtrls, cxTextEdit, cxMaskEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, IBX.IBCustomDataSet, IBX.IBUpdateSQL, IBX.IBQuery;

type
  TfrmWorkerShedule = class(TSimpleForm)
    GridCli: TcxGrid;
    GridCliLevel1: TcxGridLevel;
    GridCliUrView: TcxGridDBTableView;
    DS: TDataSource;
    GridCliUrViewColumn1: TcxGridDBColumn;
    GridCliUrViewColumn2: TcxGridDBColumn;
    GridCliUrViewColumn3: TcxGridDBColumn;
    GridCliUrViewColumn4: TcxGridDBColumn;
    Fiz_btn: TRzButton;
    Ur_btn: TRzButton;
    DsCli: TDataSource;
    GridShedule: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    butOk: TRzButton;
    btnAdd: TRzBitBtn;
    btnDel: TRzBitBtn;
    Label11: TLabel;
    Label1: TLabel;
    cxDBDateEdit1: TcxDBDateEdit;
    memData: TdxMemData;
    DsMem: TDataSource;
    cmbWorker: TcxDBLookupComboBox;
    QWorkerShedule: TIBQuery;
    QWorkerShedule_upd: TIBUpdateSQL;
    memDataWORKER_ID: TIntegerField;
    memDataDATESHEDULE: TDateField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Ur_btnClick(Sender: TObject);
    procedure Fiz_btnClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure butOkClick(Sender: TObject);
    procedure DsMemDataChange(Sender: TObject; Field: TField);
  private
    FisUr: integer;
    fStatus: Integer;
    procedure SetFilter;
    procedure SetIsUr(AValue: integer);
    procedure FilterRecord(DataSet: TDataSet; var Accept: Boolean);
  public
    property isUr: Integer read FisUr write SetIsUr;

    procedure ReOpenData;
  end;

var
  frmWorkerShedule: TfrmWorkerShedule;

implementation

{$R *.dfm}
uses
  DM_Main;



procedure TfrmWorkerShedule.btnAddClick(Sender: TObject);
begin
  QWorkerShedule.Append;
  QWorkerShedule.FieldByName('WORKER_ID').AsInteger :=
    MemData.FieldByName('WORKER_ID').AsInteger;
  QWorkerShedule.FieldByName('DATESHEDULE').AsDateTime :=
    MemData.FieldByName('DATESHEDULE').AsDateTime;
  QWorkerShedule.FieldByName('CLIENT_ID').AsInteger :=
    DsCli.DataSet.FieldByName('ID').AsInteger;
  QWorkerShedule.Post;
end;


procedure TfrmWorkerShedule.FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := (DataSet.FieldByName('act').AsInteger = 1) and
            (DataSet.FieldByName('type_cli').AsInteger = isUr);
end;

procedure TfrmWorkerShedule.Fiz_btnClick(Sender: TObject);
begin
  inherited;
  isUr := 0;
end;

procedure TfrmWorkerShedule.FormCreate(Sender: TObject);
begin
  inherited;
   isUr := 0;
   DSCli.DataSet.OnFilterRecord := Self.FilterRecord;
   memData.Open;
   memData.Append;
   memData.FieldByName('WORKER_ID').AsInteger := 0;
   memData.FieldByName('DATESHEDULE').AsDateTime := Now();
   memData.Post;
   DSMem.OnDataChange := DsMemDataChange;
end;

procedure TfrmWorkerShedule.FormDestroy(Sender: TObject);
begin
  DsCli.DataSet.OnFilterRecord := nil;
  DsCli.DataSet.Filtered := False;
  inherited;
end;

procedure TfrmWorkerShedule.FormShow(Sender: TObject);
begin
  inherited;
  SetFilter;
end;

procedure TfrmWorkerShedule.ReOpenData;
begin
  QWorkerShedule.Close;
  QWorkerShedule.ParamByName('WORKER_ID').AsInteger :=
    MemData.FieldByName('WORKER_ID').AsInteger;
  QWorkerShedule.ParamByName('DATESHEDULE').AsDateTime :=
    MemData.FieldByName('DATESHEDULE').AsDateTime;
  QWorkerShedule.Open;

  btnAdd.Enabled := (MemData.FieldByName('WORKER_ID').AsInteger > 0);
  btnDel.Enabled := (MemData.RecordCount > 0);

end;

procedure TfrmWorkerShedule.btnDelClick(Sender: TObject);
begin
  QWorkerShedule.Delete;
end;

procedure TfrmWorkerShedule.butOkClick(Sender: TObject);
begin
  if QWorkerShedule.Modified or QWorkerShedule.UpdatesPending then
  begin
    QWorkerShedule.ApplyUpdates;
    QWorkerShedule.Transaction.CommitRetaining;
  end;
end;

procedure TfrmWorkerShedule.DsMemDataChange(Sender: TObject; Field: TField);
begin
  if Field = nil then
    Exit;
  ReOpenData;
end;

procedure TfrmWorkerShedule.SetFilter;
begin
  DsCli.DataSet.Filtered := false;
  DsCli.DataSet.Filtered := True;
end;

procedure TfrmWorkerShedule.SetIsUr(AValue: integer);
begin
  if AValue <> fIsUr then
  begin
    fisUr := AValue;
    SetFilter;
  end;
  if AValue = 1 then
  begin
    Ur_btn.Down   := True;
    Fiz_btn.Down  := False;
    Ur_btn.Color  := $00FAECDE;
    Fiz_btn.Color := $00E9F4F8;
    Fiz_btn.Font.Style := Fiz_btn.Font.Style - [fsBold];
    Ur_btn.Font.Style  := Ur_btn.Font.Style + [fsBold];
  end
  else
  begin
    Ur_btn.Down   := False;
    Fiz_btn.Down  := True;
    Ur_btn.Color  := $00E9F4F8;
    Fiz_btn.Color := $00FAECDE;
    Fiz_btn.Font.Style := Fiz_btn.Font.Style + [fsBold];
    Ur_btn.Font.Style  := Ur_btn.Font.Style - [fsBold];
  end;
end;

procedure TfrmWorkerShedule.Ur_btnClick(Sender: TObject);
begin
  inherited;
  isUr := 1;
 end;

end.
