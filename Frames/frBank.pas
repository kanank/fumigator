unit frBank;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frameBase, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxDBEdit,
  cxTextEdit, cxMaskEdit, Vcl.StdCtrls, Vcl.ExtCtrls, RzPanel, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBUpdateSQL;

type
  TFrameRekvizits = class(TDbFrameBase)
    RzGroupBox1: TRzGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    cxDBMaskEdit1: TcxDBMaskEdit;
    cxDBTextEdit1: TcxDBTextEdit;
    Label2: TLabel;
    cxDBMaskEdit2: TcxDBMaskEdit;
    Label4: TLabel;
    cxDBMaskEdit3: TcxDBMaskEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

end.
