unit frItemKLADR;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frameBase, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, RzButton,
  cxTextEdit, cxMemo, cxDBEdit, Vcl.StdCtrls, Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery, IBX.IBUpdateSQL, IBX.IBDatabase;

const
  SearchStr =  '''%:searchstr%''';

type TTypeItemKladr = (tikRegion, tikArea, tikCity, tikSite, tikStreet,
  tikDom);

type
  TFrameItemKLADR = class(TDbFrameBase)
    lblName: TLabel;
    btnEdit: TRzBitBtn;
    edtName: TcxTextEdit;
    edtSocr: TcxTextEdit;
    QuerySearch: TIBQuery;
    procedure btnEditClick(Sender: TObject);
    procedure QueryBeforeOpen(DataSet: TDataSet);
    procedure QuerySearchBeforeOpen(DataSet: TDataSet);
  private
    fTypeItem: TTypeItemKladr;
    fCode: string; // код КЛАДР
    fRegion: Integer;
    fArea:   Integer;
    fCity:   Integer;
    fSite:   Integer;
    fStreet: Integer;
    fDom:    Integer;
    fActive: Integer;

    fChildFrame: TFrameItemKLADR; //зависимый фрейм

  protected
    procedure SetCode(AValue: string);
    procedure SetEdtText(AQuery: TIBQuery);
    procedure SetQueryParam(AQuery: TIBQuery);
    procedure SetTransaction(AValue: TIBTransaction);override;
  public
    property Code: string read fCode write SetCode;
    property Region: Integer read fRegion;
    property Area:   Integer read fArea;
    property City:   Integer read fCity;
    property Site:   Integer read fSite;
    property Street: Integer read fStreet;
    property Dom:    Integer read fDom;
    property ActiveKLADR: Integer read fActive;

    property TypeItem: TTypeItemKladr read fTypeItem write fTypeItem;
    property ChildFrame: TFrameItemKLADR read fChildFrame write fChildFrame;

    function OpenData(Aid: integer = 0): Boolean; override;
    function SaveData: Boolean; override;

    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}
uses
  System.StrUtils, formKLADRList, DM_Main;

{ TFrameItemKLADR }

procedure TFrameItemKLADR.btnEditClick(Sender: TObject);
var
  frm: TfrmKLADRList;
begin
  if QuerySearch.Active then
    QuerySearch.Close;

    QuerySearch.Open;
    QuerySearch.FetchAll;

  try
    frm := TfrmKLADRList.Create(self);
    frm.DS.DataSet := QuerySearch;
    frm.ShowModal;
    if frm.ModalResult = mrOk then
    begin
      if QuerySearch.RecordCount > 0 then
      begin
        Code := QuerySearch.FieldByName('CODE').AsString;
        SetEdtText(QuerySearch);
      end;
    end;
  finally
    FreeAndNil(frm);
  end;


end;

constructor TFrameItemKLADR.Create(AOwner: TComponent);
begin
  inherited;
  fAutoAppend := False;
  fRegion := 0;
  fArea := 0;
  fCity := 0;
  fSite := 0;
  fStreet := 0;
  fDom := 0;
  fActive := 0;
end;

function TFrameItemKLADR.OpenData(Aid: integer): Boolean;
begin
  //result := inherited OpenData(aid);
  try
    if Query.Active then
       Query.Close;
    SetQueryParam(Query);
    Query.Open;
    DS.DataSet := Query;
    result := true;
  except
    result := false;
  end;
  SetEdtText(Query);
end;

procedure TFrameItemKLADR.QueryBeforeOpen(DataSet: TDataSet);
begin
  SetQueryParam(TIBQuery(DataSet));
end;

procedure TFrameItemKLADR.QuerySearchBeforeOpen(DataSet: TDataSet);
begin
  SetQueryParam(TIBQuery(DataSet));
end;

function TFrameItemKLADR.SaveData: Boolean;
begin
  result := true;
  fCode := Query.FieldByName('CODE').AsString;
end;

procedure TFrameItemKLADR.SetCode(AValue: string);
begin
  if (fCode = Avalue) or (AValue = '') then
    Exit;

  fCode := AValue;

  fRegion := StrToInt(LeftStr(fCode, 2));
  fArea := StrToInt(Copy(fCode, 3, 3));
  fCity := StrToInt(Copy(fCode, 6, 3));
  fSite := StrToInt(Copy(fCode, 8, 3));
  if Length(fCode) > 13 then
    fStreet := StrToInt(Copy(fCode, 12, 4));
  if Length(fCode) > 17 then
    fDom := StrToInt(Copy(fCode, 16, 4));
  if Length(fCode) < 18 then
    fActive := StrToInt(RightStr(fCode, 2));

  if Assigned(ChildFrame) then
    if (ChildFrame.Region <> Region) or
       (ChildFrame.Area <> Area) or
       (ChildFrame.City <> City) or
       (ChildFrame.Site <> Site) or
       (ChildFrame.Street <> Street) then
      ChildFrame.Code := Code;

  if (region > 0) and ((TypeItem = tikArea) or
                       (TypeItem = tikCity) or
                       (TypeItem = tikSite) or
                       (TypeItem = tikStreet)) then
    self.Enabled := true;
 end;

procedure TFrameItemKLADR.SetEdtText(AQuery: TIBQuery);
begin
  if AQuery.RecordCount > 0 then
  begin
    edtName.Text := Trim(AQuery.FieldByName('NAME').AsString);
    edtSocr.Text := Trim(AQuery.FieldByName('SOCR').AsString);
  end;
  if Assigned(fChildFrame) then
    if AQuery.RecordCount > 0 then
      fChildFrame.Enabled := true;
end;

procedure TFrameItemKLADR.SetQueryParam(AQuery: TIBQuery);
var
  prm: TParam;
begin
//  AQuery.Params.ParseSQL(AQuery.SQL.text, true);
//  AQuery.ParamCheck := True;

  prm := AQuery.Params.FindParam('REGION_ID'); // регион
  if prm <> nil then
    prm.AsInteger := fRegion;

  prm := AQuery.Params.FindParam('AREA_ID'); //район
  if prm <> nil then
    prm.AsInteger := fArea;

  prm := AQuery.Params.FindParam('CITY_ID'); //город
  if prm <> nil then
    prm.AsInteger := fCity;

  prm := AQuery.Params.FindParam('SITE_ID'); //нас. пункт
  if prm <> nil then
    prm.AsInteger := fSite;

  prm := AQuery.Params.FindParam('Street_ID'); // улица
  if prm <> nil then
    prm.AsInteger := fStreet;

  prm := AQuery.Params.FindParam('Dom_ID'); // дом
  if prm <> nil then
    prm.AsInteger := fDom;


  if AQuery.Params.FindParam('searchstr') <> nil then
    AQuery.ParamByName('searchstr').AsString :=
      '%' + Trim(edtName.Text) + '%';

  //prm := AQuery.ParamByName('search'); // дом
  //if prm <> nil then
  //  prm.AsString := edtName.text;
end;

procedure TFrameItemKLADR.SetTransaction(AValue: TIBTransaction);
begin
  inherited;
  QuerySearch.Transaction := AValue;
end;

end.
