unit formClients;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassSprForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, RzButton, Vcl.ExtCtrls, RzPanel, dxGDIPlusClasses;

type
  TfrmClients = class(TSprForm)
    Fiz_btn: TRzButton;
    Ur_btn: TRzButton;
    GridViewColumn1: TcxGridDBColumn;
    GridViewColumn2: TcxGridDBColumn;
    GridViewColumn3: TcxGridDBColumn;
    GridViewColumn4: TcxGridDBColumn;
    GridViewColumn5: TcxGridDBColumn;
    GridViewColumn6: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    DS: TDataSource;
    btnCli: TRzButton;
    btnLid: TRzButton;
    procedure Fiz_btnClick(Sender: TObject);
    procedure Ur_btnClick(Sender: TObject);
    procedure Edit_btnClick(Sender: TObject);
    procedure Add_btnClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCliClick(Sender: TObject);
    procedure btnLidClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Del_btnClick(Sender: TObject);
  private
    FisUr: integer;
    fStatus: Integer;
    procedure SetFilter;
    procedure SetIsUr(AValue: integer);
    procedure SetStatus(AValue: integer);
    procedure FilterRecord(DataSet: TDataSet; var Accept: Boolean);
  public
    constructor Create(AOwner: TComponent; ADataSet: TDataset = nil; AisUr: Integer=0);
    property isUr: Integer read FisUr write SetIsUr;
    property status: Integer read fStatus write setStatus;
  end;

var
  frmClients: TfrmClients;

implementation

{$R *.dfm}
uses
  IBX.IBQuery,
  DM_Main, frmMain, formClientFiz, formClientUr, CommonTypes;


procedure TfrmClients.Add_btnClick(Sender: TObject);
var
  id: integer;
  extPrm: TClientParam;
begin
  try
    DS.DataSet.Filtered := false;

    extPrm.CallParam.Status_Id := status;

    if FisUr = 1 then
      //formMain.NewURClnt_mi.Click
      DM.ShowClientUr(asCreate, extPrm)
    else
      //formMain.NewFizClnt_mi.Click;
      DM.ShowClientFiz(asCreate, extPrm);

   id := DS.DataSet.FieldByName('id').AsInteger;
  finally
    DS.DataSet.Filtered := True;
    DS.DataSet.Locate('ID', id, []);
    Grid.SetFocus;
  end;
end;

procedure TfrmClients.btnCliClick(Sender: TObject);
begin
  inherited;
  Status := 1;
end;

procedure TfrmClients.btnLidClick(Sender: TObject);
begin
  inherited;
  status := 2;
end;

constructor TfrmClients.Create(AOwner: TComponent; ADataSet: TDataset = nil; AisUr: Integer=0);
begin
  inherited Create(AOwner);
  if ADataSet = nil then
    DS.DataSet := DM.Clients;
  isUr := AisUr;
  status := 1;
  DS.DataSet.OnFilterRecord := Self.FilterRecord;
end;

procedure TfrmClients.Del_btnClick(Sender: TObject);
var
  id: integer;
begin
  try
    id := DS.DataSet.FieldByName('id').AsInteger;
    DS.DataSet.Filtered := false;

    if not DS.DataSet.Locate('ID', id, []) then
      Exit;

    if not (DS.DataSet.State in [dsInsert, dsEdit]) then
      DS.DataSet.Edit;

    DS.DataSet.FieldByName('act').AsInteger := 0;
    DS.DataSet.Post;
    //DS.Dataset.Delete;
    TIBQuery(DS.DataSet).ApplyUpdates;
    TIBQuery(DS.DataSet).Transaction.CommitRetaining;
  finally
    DS.DataSet.Filtered := True;
  end;

end;

procedure TfrmClients.Edit_btnClick(Sender: TObject);
var
  prm: TFrmCreateParam;
  mres: TModalResult;
begin
  //if not DM.Clients.Active then
  //  DM.Clients.Open;
  DM.GetDataset(DM.Clients);

  prm := NewFrmCreateParam(asEdit, DM.Clients);
  if fIsUr = 0 then
  begin
    frmClientFiz := TfrmClientFiz.Create(self, '', @prm);
    mres := frmClientFiz.ShowModal;
    FreeAndNil(frmClientFiz);
  end
  else
  begin
    frmClientUr := TfrmClientUr.Create(self, '', @prm);
    mres := frmClientUr.ShowModal;
    FreeAndNil(frmClientUr);
  end;

  if mres <> mrCancel then
  begin
    //DM.Clients.Transaction.CommitRetaining;
    DM.Clients.Refresh;
  end;
end;

procedure TfrmClients.FilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  Accept := (DataSet.FieldByName('ACT').AsInteger = 1) and
            (DataSet.FieldByName('type_cli').AsInteger = isUr) and
            (DataSet.FieldByName('status_id').AsInteger = status);
end;

procedure TfrmClients.Fiz_btnClick(Sender: TObject);
begin
  inherited;
  isUr := 0;
end;

procedure TfrmClients.FormDestroy(Sender: TObject);
begin
  DS.DataSet.OnFilterRecord := nil;
  DS.DataSet.Filtered := False;
  inherited;
end;

procedure TfrmClients.FormShow(Sender: TObject);
begin
  inherited;
  SetFilter;
end;

procedure TfrmClients.SetFilter;
begin
  DS.DataSet.Filtered := false;
  //DS.DataSet.Filter := Format('type_cli = %d', [isUr]);
  DS.DataSet.Filtered := True;
  Grid.Refresh;
end;

procedure TfrmClients.SetIsUr(AValue: integer);
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

procedure TfrmClients.SetStatus(AValue: integer);
begin
 if AValue <> fStatus then
  begin
    fStatus := AValue;
    SetFilter;
  end;
  if AValue = 1 then
  begin
    btnCli.Down   := True;
    btnLid.Down  := False;
    btnCli.Color  := $00FAECDE;
    btnLid.Color := $00E9F4F8;
    btnCli.Font.Style := btnCli.Font.Style + [fsBold];
    btnLid.Font.Style  := btnLid.Font.Style - [fsBold];
  end
  else
  begin
    btnCli.Down   := False;
    btnLid.Down   := True;
    btnCli.Color  := $00E9F4F8;
    btnLid.Color  := $00FAECDE;
    btnCli.Font.Style := btnCli.Font.Style - [fsBold];
    btnLid.Font.Style  := btnLid.Font.Style + [fsBold];
  end;
end;

procedure TfrmClients.Ur_btnClick(Sender: TObject);
begin
  inherited;
  isUr := 1;
 end;

end.
