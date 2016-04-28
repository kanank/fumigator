unit frItemDomKLADR;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frItemKLADR, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBUpdateSQL, cxTextEdit, RzButton,
  Vcl.StdCtrls, cxMaskEdit, cxDropDownEdit;

type
  TFrameItemDomKLADR = class(TFrameItemKLADR)
    cmbName: TcxComboBox;
    procedure btnEditClick(Sender: TObject);
  private
    function GetDomStr: string;
    procedure SetDomStr(AValue: string);
  protected
    fDomStr: string; //����� ���� ��������� �� ������
    procedure SetEdtText(AQuery: TIBQuery); override;
    procedure SetCode(AValue: string); override;
  public
    property DomStr: string read GetDomStr write SetDomStr;
  end;


implementation

{$R *.dfm}

{ TFrameItemDomKLADR }

procedure TFrameItemDomKLADR.btnEditClick(Sender: TObject);
begin
  inherited;
  if cmbName.Properties.Items.Count = 1 then
    DomStr := cmbName.Properties.Items[0]
  else
    cmbName.DroppedDown := True;
end;

function TFrameItemDomKLADR.GetDomStr: string;
begin
  result := EdtName.Text;
end;

procedure TFrameItemDomKLADR.SetCode(AValue: string);
begin
  if AValue <> Code then
    edtName.Properties.LookupItems.Clear;
    edtName.Text := '';
  inherited SetCode(AValue);
end;

procedure TFrameItemDomKLADR.SetDomStr(AValue: string);
begin
  if AValue = fDomStr then
    Exit;

  fDomStr := AValue;
  cmbName.Text := fDomStr;
end;

procedure TFrameItemDomKLADR.SetEdtText(AQuery: TIBQuery);
var
  lst: TStringList;
begin
  if AQuery.RecordCount > 0 then
  try
    lst := TStringList.Create;
    cmbName.Properties.Items.Clear;
    lst.Delimiter := ',';
    lst.DelimitedText := Trim(AQuery.FieldByName('NAME').AsString);
    cmbName.Properties.Items.AddStrings(lst);

    cmbName.Text := fDomStr;
    edtSocr.Text := Trim(AQuery.FieldByName('SOCR').AsString);
  finally
    FreeAndNil(lst);
  end;
  if Assigned(ChildFrame) then
    if AQuery.RecordCount > 0 then
      ChildFrame.Enabled := true;
end;

end.
