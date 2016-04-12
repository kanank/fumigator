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

    frm.FrameKladrAll1.Transaction := Self.Transaction;
    frm.FrameKladrAll1.FrameRegion.Code         := FrameRegion.Code;
    frm.FrameKladrAll1.FrameRegion.edtSocr.text := FrameRegion.edtSocr.Text;
    frm.FrameKladrAll1.FrameRegion.edtName.text := FrameRegion.edtName.Text;

    frm.FrameKladrAll1.FrameArea.Code         := FrameArea.Code;
    frm.FrameKladrAll1.FrameArea.edtSocr.text := FrameArea.edtSocr.Text;
    frm.FrameKladrAll1.FrameArea.edtName.text := FrameArea.edtName.Text;

    frm.FrameKladrAll1.FrameCity.Code         := FrameCity.Code;
    frm.FrameKladrAll1.FrameCity.edtSocr.text := FrameCity.edtSocr.Text;
    frm.FrameKladrAll1.FrameCity.edtName.text := FrameCity.edtName.Text;

    frm.FrameKladrAll1.FrameSite.Code         := FrameSite.Code;
    frm.FrameKladrAll1.FrameSite.edtSocr.text := FrameSite.edtSocr.Text;
    frm.FrameKladrAll1.FrameSite.edtName.text := FrameSite.edtName.Text;

    frm.FrameKladrAll1.FrameStreet.Code         := FrameStreet.Code;
    frm.FrameKladrAll1.FrameStreet.edtSocr.text := FrameStreet.edtSocr.Text;
    frm.FrameKladrAll1.FrameStreet.edtName.text := FrameStreet.edtName.Text;

    frm.FrameKladrAll1.FrameDom.Code         := FrameDom.Code;
    frm.FrameKladrAll1.FrameDom.edtSocr.text := FrameDom.edtSocr.Text;
    frm.FrameKladrAll1.FrameDom.edtName.text := FrameDom.edtName.Text;

    frm.ShowModal;
    if frm.ModalResult <> mrOk then
      Exit;

    FrameRegion.Code := frm.FrameKladrAll1.FrameRegion.Code;
    FrameRegion.edtSocr.Text := frm.FrameKladrAll1.FrameRegion.edtSocr.text;
    FrameRegion.edtName.Text := frm.FrameKladrAll1.FrameRegion.edtName.text;

    FrameArea.Code := frm.FrameKladrAll1.FrameArea.Code;
    FrameArea.edtSocr.Text := frm.FrameKladrAll1.FrameArea.edtSocr.text;
    FrameArea.edtName.Text := frm.FrameKladrAll1.FrameArea.edtName.text;

    FrameCity.Code := frm.FrameKladrAll1.FrameCity.Code;
    FrameCity.edtSocr.Text := frm.FrameKladrAll1.FrameCity.edtSocr.text;
    FrameCity.edtName.Text := frm.FrameKladrAll1.FrameCity.edtName.text;

    FrameSite.Code := frm.FrameKladrAll1.FrameSite.Code;
    FrameSite.edtSocr.Text := frm.FrameKladrAll1.FrameSite.edtSocr.text;
    FrameSite.edtName.Text := frm.FrameKladrAll1.FrameSite.edtName.text;

    FrameStreet.Code := frm.FrameKladrAll1.FrameStreet.Code;
    FrameStreet.edtSocr.Text := frm.FrameKladrAll1.FrameStreet.edtSocr.text;
    FrameStreet.edtName.Text := frm.FrameKladrAll1.FrameStreet.edtName.text;

    FrameDom.Code := frm.FrameKladrAll1.FrameDom.Code;
    FrameDom.edtSocr.Text := frm.FrameKladrAll1.FrameDom.edtSocr.text;
    FrameDom.edtName.Text := frm.FrameKladrAll1.FrameDom.edtName.text;

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
