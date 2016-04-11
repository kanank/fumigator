unit frItemKLADR;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frameBase, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, RzButton,
  cxTextEdit, cxMemo, cxDBEdit, Vcl.StdCtrls, Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery, IBX.IBUpdateSQL;

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
  protected
    procedure SetCode(AValue: string);
    procedure SetEdtText(AQuery: TIBQuery);
  public
    property Code: string read fCode write SetCode;
    property Region: Integer read fRegion;
    property Area:   Integer read fArea;
    property City:   Integer read fCity;
    property Site:   Integer read fSite;
    property Street: Integer read fStreet;
    property Dom:    Integer read fDom;

    function OpenData(Aid: integer = 0): Boolean; override;
    function SaveData: Boolean; override;

    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}
uses
  System.StrUtils, formKLADRList;

{ TFrameItemKLADR }

procedure TFrameItemKLADR.btnEditClick(Sender: TObject);
var
  frm: TfrmKLADRList;
begin
  if QuerySearch.Active then
    QuerySearch.Close;
  if edtName.Text <> '' then
    QuerySearch.ParamByName('search').AsString := edtName.Text
  else
    QuerySearch.ParamByName('search').AsString := '*';
  QuerySearch.Open;
  if QuerySearch.RecordCount = 0 then
  begin
    ShowMessage('Не найдено');
    Exit;
  end;
  try
    frm := TfrmKLADRList.Create(self);
    frm.DS.DataSet := QuerySearch;
    frm.ShowModal;
    if frm.ModalResult = mrOk then
    begin
      Code := QuerySearch.FieldByName('CODE').AsString;
      SetEdtText(QuerySearch);
    end;
  finally
     FreeAndNil(frm);
  end;


end;

constructor TFrameItemKLADR.Create(AOwner: TComponent);
begin
  inherited;
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
  if Query.Active then
     Query.Close;
  Query.Open;
  SetEdtText(Query);
end;

function TFrameItemKLADR.SaveData: Boolean;
begin
  fCode := Query.FieldByName('CODE').AsString;
end;

procedure TFrameItemKLADR.SetCode(AValue: string);
begin
  if fCode = Avalue then
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
end;

procedure TFrameItemKLADR.SetEdtText(AQuery: TIBQuery);
begin
  if AQuery.RecordCount > 0 then
  begin
    edtName.Text := AQuery.FieldByName('NAME').AsString;
    edtSocr.Text := AQuery.FieldByName('SOCR').AsString;
  end;
end;

end.
