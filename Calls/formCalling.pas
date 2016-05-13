unit formCalling;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassFrmBase, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, dxGDIPlusClasses, Vcl.ExtCtrls;

type
  TfrmCalling = class(TBaseForm)
    Image1: TImage;
    edtPhone: TcxMaskEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCalling: TfrmCalling;

implementation

{$R *.dfm}

end.
