unit formKladrAdr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassFormEditData, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  frameBase, frKladrAll, Data.DB, RzButton, cxTextEdit, cxMaskEdit, cxDBEdit,
  Vcl.StdCtrls;

type
  TfrmKladrAdr = class(TfrmEditData)
    FrameKladrAll1: TFrameKladrAll;
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKladrAdr: TfrmKladrAdr;

implementation

{$R *.dfm}


procedure TfrmKladrAdr.btnOKClick(Sender: TObject);
begin
  if FrameKladrAll1.FrameRegion.notSelected then
    FrameKladrAll1.FrameRegion.edtName.Text := '';
  if FrameKladrAll1.FrameArea.notSelected then
    FrameKladrAll1.FrameArea.edtName.Text := '';
  if FrameKladrAll1.FrameCity.notSelected then
    FrameKladrAll1.FrameCity.edtName.Text := '';
  if FrameKladrAll1.FrameSite.notSelected then
    FrameKladrAll1.FrameSite.edtName.Text := '';
  if FrameKladrAll1.FrameStreet.notSelected then
    FrameKladrAll1.FrameStreet.edtName.Text := '';
end;

end.
