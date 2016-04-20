unit frmWorkers;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassSprForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, RzButton, Vcl.ExtCtrls, RzPanel, dxGDIPlusClasses,
  cxLocalization;

type
  TfrmWorkers = class(TSprForm)
    GridViewColumn1: TcxGridDBColumn;
    GridViewColumn2: TcxGridDBColumn;
    GridViewColumn3: TcxGridDBColumn;
    GridViewColumn4: TcxGridDBColumn;
    GridViewColumn5: TcxGridDBColumn;
    GridViewColumn6: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    procedure Add_btnClick(Sender: TObject);
    procedure Edit_btnClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formWorkers: TfrmWorkers;

implementation

{$R *.dfm}

 uses
   DM_Main, CommonVars, CommonTypes, frmWorker;

procedure TfrmWorkers.Add_btnClick(Sender: TObject);
(*begin
  if DM.Worker_Q.Active then
    DM.Worker_Q.Close;
  DM.Worker_Q.ParamByName('ID').AsInteger := 0;
  DM.Worker_Q.Open;
  DM.ShowWorkerForm (DM.DsWorker, 0, asCreate, self, True);*)
var
  prm: TFrmCreateParam;
begin
  if not DM.Workers.Active then
    DM.Workers.Open;

  prm := NewFrmCreateParam(asCreate, DM.Workers);
  formWorker := TfrmWorker.Create(self, '', @prm);
  formWorker.ShowModal;
  FreeAndNil(formWorker);
end;

procedure TfrmWorkers.Edit_btnClick(Sender: TObject);
(*var
  id: integer;
begin
  id := DM.Workers.FieldByName('ID').AsInteger;
  if DM.Worker_Q.Active then
    DM.Worker_Q.Close;
  DM.Worker_Q.ParamByName('ID').AsInteger := id;
  DM.Worker_Q.Open;
  DM.ShowWorkerForm (DM.DsWorker, id, asEdit, self, true);*)
var
  prm: TFrmCreateParam;
begin
  if not DM.Workers.Active then
    DM.Workers.Open;

  prm := NewFrmCreateParam(asEdit, DM.Workers);
  formWorker := TfrmWorker.Create(self, '', @prm);
  formWorker.ShowModal;
  FreeAndNil(formWorker);
end;


end.
