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
    procedure btnEditClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}
uses
  formAddress;

procedure TFrameKLADR.btnEditClick(Sender: TObject);
var
  frm: TFrmAddress;
begin
  frm := TFrmAddress.Create(self);
  frm.ShowModal;
  FreeAndNil(frm);
end;

end.
