unit frPersonSmallFoto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frPersonSmall, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBUpdateSQL, IBX.IBDatabase, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxDropDownEdit, cxDBEdit, cxMaskEdit,
  cxCalendar, cxTextEdit, Vcl.StdCtrls, Vcl.ExtCtrls, RzPanel, frameBase, frFoto,
  frListBase, frPhones;

type
  TFramePersonSmallFoto = class(TFramePersonSmall)
    FrameFoto: TFrameFoto;
    FramePhones: TFramePhones;
    Label5: TLabel;
    edtEmailWork: TcxDBTextEdit;
  private
    { Private declarations }
  protected
    procedure SetTransaction(AValue: TIBTransaction); override;
  public
    function OpenData(Aid: integer = 0): Boolean; override;
    function SaveData: Boolean; override;
  end;

implementation

{$R *.dfm}



function TFramePersonSmallFoto.OpenData(Aid: integer): Boolean;
begin
  Result := inherited OpenData(Aid);
  if not result then
    Exit;

  if Query.State = dsInsert then
    Query.FieldByName('SEX').AsString := '�';
  Result := False;
  try
    FramePhones.AddParam('CLIENT_ID', Query.FieldByName('ID'));
    FramePhones.typePhone := 1;
    FramePhones.OpenData;
    FrameFoto.AddParam('ID', Query.FieldByName('PHOTO_ID'));
    FrameFoto.OpenData;
    Result := True;
  except
    Result := False;
  end;
end;

function TFramePersonSmallFoto.SaveData: Boolean;
begin
  if self.ReadOnly then
  begin
    Result := true;
    exit;
  end
  else
    Result := inherited SaveData;
end;

procedure TFramePersonSmallFoto.SetTransaction(AValue: TIBTransaction);
begin
  inherited;
  FramePhones.Transaction := AValue;
  FrameFoto.Transaction := AValue;
end;

end.