unit frPersonFull;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frPersonSmall, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, frListBase,
  frPhones, frameBase, frPasport, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery,
  IBX.IBUpdateSQL, cxDropDownEdit, cxDBEdit, cxMaskEdit, cxCalendar, cxTextEdit,
  Vcl.StdCtrls, frKLADR, Vcl.ExtCtrls, RzPanel;

type
  TFramePersonFull = class(TFramePersonSmall)
    FramePassport1: TFramePassport;
    FramePhones1: TFramePhones;
    FrameAddress1: TFrameKLADR;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FramePersonFull: TFramePersonFull;

implementation

{$R *.dfm}

end.
