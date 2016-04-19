unit frPhones;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frListBase, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBUpdateSQL, RzButton, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, Vcl.ExtCtrls, RzPanel, cxCheckBox,
  cxDBLookupComboBox;

type
  TFramePhones = class(TFrameListBase)
    grdPhoneDBTableView2: TcxGridDBTableView;
    grdPhoneDBTableView2Column1: TcxGridDBColumn;
	grdPhoneDBTableView2Column2: TcxGridDBColumn;
    grdPhoneDBTableView2Column3: TcxGridDBColumn;
    procedure QueryAfterPost(DataSet: TDataSet);
  private
    procedure SetMainPhone(id: integer);
  public
    typePhone: SmallInt; //0-clients
    constructor Create(AOwner: TComponent); override;
    function SaveData: Boolean; override;
  end;

implementation

{$R *.dfm}
uses
  formEditPhone, DM_Main;

{ TFramePhones }

constructor TFramePhones.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  EditFormClass := TfrmEditPhone;
  typePhone := 0;
end;

procedure TFramePhones.QueryAfterPost(DataSet: TDataSet);
begin
  if Query.FieldByName('ismain').AsInteger = 1 then
    SetMainPhone(Query.FieldByName('id').AsInteger);
end;

function TFramePhones.SaveData: Boolean;
var
  client_id, ind: Integer;
begin
  ind := QueryParams.IndexOf('CLIENT_ID');
  if ind > -1 then
    client_id := TField(QueryParams.Objects[ind]).AsInteger;

  Query.First;
  while not Query.Eof do
  begin
    if Query.FieldByName('Client_id').AsInteger <> client_id then
    begin
      if Query.State = dsBrowse then
        Query.Edit;
      Query.FieldByName('Client_id').AsInteger := client_id;
    end;
    if Query.FieldByName('type').AsInteger <> typePhone then
    begin
      if Query.State = dsBrowse then
        Query.Edit;
      Query.FieldByName('type').AsInteger := typePhone;
    end;
    if Query.Modified then
      Query.post;

    Query.Next;
  end;

  Result := inherited SaveData;
end;

procedure TFramePhones.SetMainPhone(id: integer);
var
  bm: TBookmark;
begin
  if Query.RecordCount > 1 then
  try
    bm := Query.GetBookmark;

    Query.First;
    while not Query.Eof do
    begin
      if Query.FieldByName(FieldId).AsInteger = id then
      begin
        if Query.FieldByName('ismain').AsInteger = 0 then
        begin
          Query.Edit;
          Query.FieldByName('ismain').AsInteger := 1;
          Query.Post;
        end
      end
      else //������ ������
      begin
        if Query.FieldByName('ismain').AsInteger = 1 then
          begin
            Query.Edit;
            Query.FieldByName('ismain').AsInteger := 0;
            Query.Post;
          end
      end;
      Query.Next;
    end;
  finally
    Query.GotoBookmark(bm);
    Query.FreeBookmark(bm);
  end;
end;

end.
