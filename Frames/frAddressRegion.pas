unit frAddressRegion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frAddress, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBUpdateSQL, RzButton, cxTextEdit,
  cxMemo, cxDBEdit, Vcl.StdCtrls;

type
  TFrameKLADRAdrRegion = class(TFrameKLADRAdr)
    Label1: TLabel;
    cxDBMemo1: TcxDBMemo;
    Label2: TLabel;
    cxDBMemo2: TcxDBMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrameKLADRAdrRegion: TFrameKLADRAdrRegion;

implementation

{$R *.dfm}

end.
