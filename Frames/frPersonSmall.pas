unit frPersonSmall;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frameBase, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxDropDownEdit,
  cxDBEdit, cxMaskEdit, cxCalendar, cxTextEdit, Vcl.StdCtrls, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBUpdateSQL, Vcl.ExtCtrls, RzPanel,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TFramePersonSmall = class(TDbFrameBase)
    RzPanel1: TRzPanel;
    Label11: TLabel;
    Label10: TLabel;
    Label9: TLabel;
    Label8: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    edtCitizen: TcxDBTextEdit;
    cmbDateBirth: TcxDBDateEdit;
    edtSurName: TcxDBTextEdit;
    edtName: TcxDBTextEdit;
    edtFamily: TcxDBTextEdit;
    cmbSex: TcxDBComboBox;
    Label4: TLabel;
    cmbProf: TcxDBLookupComboBox;
  private
    function GetFullName: string;
    function GetShortName: string;
    procedure FillNameParts(var f, i, o: string);
  public
    property FullName: string read GetFullName;
    property ShortName: string read GetShortName;
  end;


implementation

{$R *.dfm}
uses
  DM_Main, System.StrUtils;

{ TFramePersonSmall }

procedure TFramePersonSmall.FillNameParts(var f, i, o: string);
begin
  if DS.DataSet.FindField('Family') <> nil then
    f := DS.DataSet.FieldByName('Family').AsString;
  if DS.DataSet.FindField('name') <> nil then
    i := DS.DataSet.FieldByName('name').AsString;
  if DS.DataSet.FindField('surname') <> nil then
    o := DS.DataSet.FieldByName('surname').AsString;
end;

function TFramePersonSmall.GetFullName: string;
var
  f, i, o: string;
begin
  FillNameParts(f, i, o);

  Result := f;

  if (Result <> '') and (i <> '') then
  begin
    Result  := Result + ' ' + i;
    if o <> '' then
    begin
      Result  := Result + ' ' + o;
    end;
  end;
end;

function TFramePersonSmall.GetShortName: string;
var
  fio, f, i, o: string;
begin
  FillNameParts(f, i, o);

  fio := f; result := f;

  if (fio <> '') and (i <> '') then
  begin
    fio  := fio + ' ' + i;
    result := result + ' ' + LeftStr(i, 1) + '. ';
    if o <> '' then
    begin
      fio  := fio + ' ' + o;
      result := result + ' ' + LeftStr(o, 1) + '. ';
    end;
  end;
end;

end.
