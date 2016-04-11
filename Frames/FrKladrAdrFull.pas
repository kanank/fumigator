unit FrKladrAdrFull;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  RzButton,
  FrKladrAll, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit, Vcl.StdCtrls,
  Data.DB, IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBUpdateSQL,
  frameBase, frItemKLADR;

type
  TFrameKladrAdrFull = class(TFrameKladrAll)
    btnEdit: TRzBitBtn;
    Label8: TLabel;
    edtRegion: TcxTextEdit;
    Label1: TLabel;
    edtSite: TcxTextEdit;
    Label2: TLabel;
    edtAddress: TcxTextEdit;
    procedure btnEditClick(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure SetEdtText; virtual;
  public
    function OpenData(Aid: integer = 0): Boolean; override;
    function SaveData: Boolean; override;
  end;


implementation
{$R *.dfm}

uses
  formKladrAdr;

procedure TFrameKladrAdrFull.btnEditClick(Sender: TObject);
var
  frm: TFrmKladrAdr;
begin
  try
    frm := TFrmKladrAdr.Create(self);
    frm.ShowModal;
    if frm.ModalResult <> mrOk then
      Exit;
    SetEdtText;
  finally
    FreeAndNil(frm);
  end;
end;

function TFrameKladrAdrFull.OpenData(Aid: integer): Boolean;
begin
  Result := inherited OpenData(Aid);
  SetEdtText;
end;

function TFrameKladrAdrFull.SaveData: Boolean;
begin
  Result := inherited SaveData;
end;

procedure TFrameKladrAdrFull.SetEdtText;
begin
  edtRegion.Text := FrameRegion.edtSocr.Text + ' ' + FrameRegion.edtName.Text;
  edtSite.Text := FrameCity.edtSocr.Text + ' ' +
                    FrameCity.edtName.Text + ' ' +
                  FrameSite.edtSocr.Text + ' ' +
                    FrameSite.edtName.Text;
  edtAddress.Text := edtSite.Text + FrameStreet.edtSocr.Text +
                       FrameStreet.edtName.text + ' ' +
                     FrameDom.edtSocr.Text + FrameDom.edtName.Text;

end;

end.
