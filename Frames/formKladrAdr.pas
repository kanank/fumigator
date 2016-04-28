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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKladrAdr: TfrmKladrAdr;

implementation

{$R *.dfm}


end.
