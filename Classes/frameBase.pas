unit frameBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBUpdateSQL;

type
  TDbFrameBase = class(TFrame)
    Query_upd: TIBUpdateSQL;
    Query: TIBQuery;
    DS: TDataSource;
  private
    FParams: TStringList;
    FFieldId: string;
    FId: Integer;
    fErr: string;
    function QuerySetParams: Boolean;
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
    Result := True;
    FId := Aid;
  except
    Result := false;
    fErr := 'OpenData error:'+ #13#10 + Exception(ExceptObject).Message;
  end;

end;

function TDbFrameBase.SaveData: Boolean;
begin
  Result := false;
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
  for I := 0 to Query.ParamCount - 1 do
  begin
    prm := Query.Params[i];
    ind := FParams.IndexOf(prm.Name);
    prm.Clear;
    if ind > - 1 then
      prm.Value := TField(FParams.Objects[i]).Value;
  end;
end;
end.



