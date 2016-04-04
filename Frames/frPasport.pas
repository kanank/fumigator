unit frPasport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frameBase, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxDropDownEdit,
  cxDBEdit, cxMaskEdit, cxCalendar, cxTextEdit, Vcl.StdCtrls, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBUpdateSQL, cxMemo, Vcl.ExtCtrls,
  RzPanel;

type
  TFramePassport = class(TDbFrameBase)
    RzGroupBox1: TRzGroupBox;
    Label1: TLabel;
    cxDBMaskEdit1: TcxDBMaskEdit;
    Label2: TLabel;
    cxDBDateEdit1: TcxDBDateEdit;
    Label3: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    Label4: TLabel;
    cxDBMemo1: TcxDBMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FramePassport: TFramePassport;

implementation

{$R *.dfm}

end.
