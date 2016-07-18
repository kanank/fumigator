unit frWorkerRegions;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frameBase, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, RzButton,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, Vcl.ExtCtrls, RzPanel,
  IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBUpdateSQL,
  ClassFormEditData, cxDBLookupComboBox, frListBase;

type
  TFrameWorkerRegions = class(TFrameListBase)
  private

  public
    worker_id: SmallInt;
    constructor Create(AOwner: TComponent); override;
    function SaveData: Boolean; override;
  end;

implementation

{$R *.dfm}
uses
  formEditRegion, DM_Main;

{ TFrameWorkerRegions }

constructor TFrameWorkerRegions.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  EditFormClass := TfrmEditRegion;
end;

function TFrameWorkerRegions.SaveData: Boolean;
var
  client_id, ind: Integer;
begin
  ind := QueryParams.IndexOf('worker_ID');
  if ind > -1 then
    client_id := TField(QueryParams.Objects[ind]).AsInteger;

  Query.First;
  while not Query.Eof do
  begin
    if Query.FieldByName('worker_id').AsInteger <> client_id then
    begin
      if Query.State = dsBrowse then
        Query.Edit;
      Query.FieldByName('worker_id').AsInteger := client_id;
    end;

    if Query.Modified then
      Query.post;

    Query.Next;
  end;

  Result := inherited SaveData;
end;

end.
