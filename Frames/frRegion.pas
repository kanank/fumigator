unit frRegion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frKLADR, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBUpdateSQL, RzButton, cxTextEdit,
  cxMemo, cxDBEdit, Vcl.StdCtrls;

type
  TFrameKLADRRegion = class(TFrameKLADR)
    Label1: TLabel;
    cxDBMemo1: TcxDBMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrameKLADRRegion: TFrameKLADRRegion;

implementation

{$R *.dfm}

end.
