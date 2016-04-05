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
    procedure Fiz_btnClick(Sender: TObject);
    procedure Ur_btnClick(Sender: TObject);
    procedure Edit_btnClick(Sender: TObject);
    procedure Add_btnClick(Sender: TObject);
  private
    FisUr: integer;
    procedure SetFilter;
    procedure SetIsUr(AValue: integer);
  public
    constructor Create(AOwner: TComponent; ADataSet: TDataset = nil; AisUr: Integer=0);
    property isUr: Integer read FisUr write SetIsUr;
  end;

var
  frmClients: TfrmClients;

implementation

{$R *.dfm}
uses
  DM_Main, frmMain, formClientFiz, formClientUr, CommonTypes;


procedure TfrmClients.Add_btnClick(Sender: TObject);
begin
  if FisUr = 1 then
    formMain.NewURClnt_mi.Click
  else
    formMain.NewFizClnt_mi.Click;

end;

constructor TfrmClients.Create(AOwner: TComponent; ADataSet: TDataset = nil; AisUr: Integer=0);
begin
  inherited Create(AOwner);
  if ADataSet = nil then
    DS.DataSet := DM.Clients;
  isUr := AisUr;
end;

procedure TfrmClients.Edit_btnClick(Sender: TObject);
var
  prm: TFrmCreateParam;
begin
  //if not DM.Clients.Active then
  //  DM.Clients.Open;
  DM.GetDataset(DM.Clients);

  prm := NewFrmCreateParam(asEdit, DM.Clients);
  if fIsUr = 0 then
  begin
    frmClientFiz := TfrmClientFiz.Create(self, '', @prm);
    frmClientFiz.ShowModal;
    FreeAndNil(frmClientFiz);
  end
  else
  begin
    frmClientUr := TfrmClientUr.Create(self, '', @prm);
    frmClientUr.ShowModal;
    FreeAndNil(frmClientUr);
  end
end;

procedure TfrmClients.Fiz_btnClick(Sender: TObject);
begin
  inherited;
  isUr := 0;
end;

procedure TfrmClients.SetFilter;
begin
  DS.DataSet.Filtered := false;
  DS.DataSet.Filter := Format('type_cli = %d', [isUr]);
  DS.DataSet.Filtered := True;
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
  end
  else
  begin
    Ur_btn.Down   := False;
    Fiz_btn.Down  := True;
    Ur_btn.Color  := $00E9F4F8;
    Fiz_btn.Color := $00FAECDE;  
  end;

end;

procedure TfrmClients.Ur_btnClick(Sender: TObject);
begin
  inherited;
  isUr := 1;
 end;

end.
