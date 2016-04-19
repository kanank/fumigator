unit frFoto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frameBase, RzButton, Vcl.ExtCtrls,
  RzPanel, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBUpdateSQL,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, cxImage, cxDBEdit;

type
  TFrameFoto = class(TDbFrameBase)
    RzPanel4: TRzPanel;
    btnLoad: TRzBitBtn;
    btnClear: TRzBitBtn;
    imgFoto: TcxDBImage;
    procedure btnLoadClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrameFoto: TFrameFoto;

implementation

{$R *.dfm}

procedure TFrameFoto.btnLoadClick(Sender: TObject);
begin
  imgFoto.LoadFromFile;
end;

end.
