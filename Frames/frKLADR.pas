unit frKLADR;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frameBase, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, RzButton,
  cxTextEdit, cxMemo, cxDBEdit, Vcl.StdCtrls, Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery, IBX.IBUpdateSQL;

type
  TFrameKLADR = class(TDbFrameBase)
    Label8: TLabel;
    Adres_memo: TcxDBMemo;
    btnEdit: TRzBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrameKLADR: TFrameKLADR;

implementation

{$R *.dfm}

end.
