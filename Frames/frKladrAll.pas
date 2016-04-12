unit frKladrAll;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frameBase, frItemKLADR, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBUpdateSQL, IBX.IBDatabase;

type
  TFrameKladrAll = class(TDbFrameBase)
    FrameRegion: TFrameItemKLADR;
    FrameCity: TFrameItemKLADR;
    FrameSite: TFrameItemKLADR;
    FrameDom: TFrameItemKLADR;
    FrameStreet: TFrameItemKLADR;
    FrameArea: TFrameItemKLADR;

  private
    fCode: string; // êîä ÊËÀÄÐ
    fRegion: Integer;
    fArea:   Integer;
    fCity:   Integer;
    fSite:   Integer;
    fStreet: Integer;
    fDom:    Integer;
    fActive1: Integer;
    fActive2: Integer;
    procedure SetCode(AValue: string);
    function GetRegion: Integer;
    function GetArea: Integer;
    function GetCity: Integer;
    function GetSite: Integer;
    function GetStreet: Integer;
    function GetDom: Integer;
    procedure SetTransaction(AValue: TIBTransaction);override;
  public
    property Code: string read fCode write SetCode;
    property Region: Integer read GetRegion;
    property Area:   Integer read GetArea;
    property City:   Integer read GetCity;
    property Site:   Integer read GetSite;
    property Street: Integer read GetStreet;
    property Dom:    Integer read GetDom;

    constructor Create(AOwner: TComponent); override;
    function OpenData(Aid: integer = 0): Boolean; override;
    function SaveData: Boolean; override;
  end;


implementation

{$R *.dfm}

{ TFrameKladrAll }

constructor TFrameKladrAll.Create(AOwner: TComponent);
begin
  inherited;
  FrameRegion.TypeItem := tikRegion;
  FrameArea.TypeItem := tikArea;
  FrameCity.TypeItem := tikCity;
  FrameSite.TypeItem := tikSite;
  FrameStreet.TypeItem := tikStreet;
  FrameDom.TypeItem := tikDom;

  FrameRegion.ChildFrame := FrameArea;
  FrameArea.ChildFrame   := FrameCity;
  FrameCity.ChildFrame   := FrameSite;
  FrameSite.ChildFrame   := FrameStreet;
  FrameStreet.ChildFrame := FrameDom;
end;

function TFrameKladrAll.GetArea: Integer;
begin
  result := FrameArea.Area;
end;

function TFrameKladrAll.GetCity: Integer;
begin
  result := FrameCity.City;
end;

function TFrameKladrAll.GetDom: Integer;
begin
  result := FrameDom.Dom;
end;

function TFrameKladrAll.GetRegion: Integer;
begin
  result := FrameRegion.Region;
end;

function TFrameKladrAll.GetSite: Integer;
begin
  result := FrameSite.Site;
end;

function TFrameKladrAll.GetStreet: Integer;
begin
  result := FrameStreet.Street;
end;

function TFrameKladrAll.OpenData(Aid: integer): Boolean;
begin
  result := inherited OpenData;
  fCode := Query.FieldByName('code_kladr').AsString;
  if fCode = '' then
    Exit;

  FrameRegion.Code := fCode;
  FrameArea.Code := fCode;
  FrameCity.Code := fCode;
  FrameSite.Code := fCode;
  FrameStreet.Code := fCode;
  FrameDom.Code := fCode;

  result := FrameRegion.OpenData;
  result := FrameArea.OpenData;
  result := FrameCity.OpenData;
  result := FrameSite.OpenData;
  result := FrameStreet.OpenData;
  result := FrameDom.OpenData;
end;

function TFrameKladrAll.SaveData: Boolean;
begin
  if FrameRegion.Region > 0 then
    fCode := FrameRegion.Code;
  if FrameArea.Area > 0 then
    fCode := FrameArea.Code;
  if FrameCity.City > 0 then
    fCode := FrameCity.Code;
  if FrameSite.Site > 0 then
    fCode := FrameSite.Code;
  if FrameStreet.Street > 0 then
    fCode := FrameStreet.Code;
  if FrameDom.Dom > 0 then
    fCode := FrameDom.Code;

  if Query.FieldByName('code_kladr').AsString <> fCode then
  begin
    if not (Query.State in [dsEdit, dsInsert]) then
      Query.Edit;
    Query.FieldByName('code_kladr').AsString := fCode;
  end;
  result := inherited SaveData;
end;

procedure TFrameKladrAll.SetCode(AValue: string);
begin
  if Code = AValue then
    Exit;

  fCode := AValue;
  FrameRegion.Code := AValue;
  FrameArea.Code   := AValue;
  FrameCity.Code   := AValue;
  FrameSite.Code   := AValue;
  FrameStreet.Code := AValue;
  FrameDom.Code    := AValue;
end;

procedure TFrameKladrAll.SetTransaction(AValue: TIBTransaction);
begin
  inherited;
  FrameRegion.Transaction := AValue;
  FrameArea.Transaction   := AValue;
  FrameCity.Transaction   := AValue;
  FrameSite.Transaction   := AValue;
  FrameStreet.Transaction := AValue;
  FrameDom.Transaction    := AValue;
end;

end.
