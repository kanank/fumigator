unit frameBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  IBX.IBCustomDataSet, IBX.IBDatabase, IBX.IBQuery, IBX.IBUpdateSQL;

type
  TDbFrameBase = class(TFrame)
    Query_upd: TIBUpdateSQL;
    Query: TIBQuery;
    DS: TDataSource;
  private
    FParams: TStringList;
    FFieldId: string;
    FId: Integer;
    fTransaction: TIBTransaction;
    function QuerySetParams: Boolean;
  protected
    fErr: string;
    fAutoAppend: Boolean;
    procedure SetTransaction(AValue: TIBTransaction); virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function OpenData(Aid: integer = 0): Boolean; virtual;
    function SaveData: Boolean;  virtual;
    function AddParam(Aname: string; Afield: TField): integer;
    property QueryParams:TStringList read FParams write FParams;
    property FieldId: string read FFieldId write FFieldId;
    property Id: Integer read FId write FId;
    property Err: string read fErr;
    property Transaction: TIBTransaction read fTransaction write SetTransaction;
    property AllowAutoAppend: Boolean read fAutoAppend write fAutoAppend;
  end;

implementation

{$R *.dfm}
uses
  DM_Main;

constructor TDbFrameBase.Create(AOwner: TComponent);
begin
  inherited;
  FParams := TStringList.Create;
  FFieldId := 'ID';
  fAutoAppend := True;
end;

destructor TDbFrameBase.Destroy;
begin
  FParams.Free;
  inherited;
end;

function TDbFrameBase.OpenData(Aid: integer): Boolean;
begin
  result:= False;
  Query.Close;
  try
    //Query.ParamByName('id').AsInteger := Aid;
    QuerySetParams;
    Query.Open;
    if (Query.RecordCount = 0) and fAutoAppend then
      Query.Append;
    DS.DataSet := Query;
    Result := True;
    FId := Query.FieldByName(FieldId).AsInteger;
  except
    Result := false;
    fErr := 'OpenData error:'+ #13#10 + Exception(ExceptObject).Message;
  end;

end;

function TDbFrameBase.SaveData: Boolean;
begin
  Result := false;
  if Query.Modified then
    Query.Post;

  if not (Query.Modified or Query.UpdatesPending) then
  begin
    Result := True;
    Exit;
  end;

  try
    Query.ApplyUpdates;
    Id := Query.FieldByName(FieldId).AsInteger;
    Result := True;
  except
    Result := false;
    fErr := 'SaveData error:'+ #13#10 + Exception(ExceptObject).Message;
  end;
end;

procedure TDbFrameBase.SetTransaction(AValue: TIBTransaction);
begin
  if fTransaction <> AValue then
  begin
    fTransaction := AValue;
    Query.Transaction := AValue;
  end
end;

function TDbFrameBase.AddParam(Aname: string; Afield: TField): integer;
begin
  Result := FParams.AddObject(Aname, AField);
end;

function TDbFrameBase.QuerySetParams: Boolean;
var
  i, ind: Integer;
  prm: TParam;
  fld: TField;
begin
  result := false;
  try
    for I := 0 to Query.ParamCount - 1 do
    begin
      prm := Query.Params[i];
      ind := FParams.IndexOf(prm.Name);
      prm.Clear;
      if ind > - 1 then
        prm.Value := TField(FParams.Objects[ind]).Value;
    end;
    Result := True;
  Except
    result := False;
  end;
end;
end.



