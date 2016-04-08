unit frClientExtUr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frameBase, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxDBEdit, frBank,
  Vcl.StdCtrls, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery,
  IBX.IBUpdateSQL;

type
  TFrameClientExtUr = class(TDbFrameBase)
    cmbFormat: TcxDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    FrameBank1: TFrameBank;
    Label3: TLabel;
    cxDBMaskEdit1: TcxDBMaskEdit;
    Label5: TLabel;
    cxDBMaskEdit3: TcxDBMaskEdit;
    Label6: TLabel;
    cxDBMaskEdit4: TcxDBMaskEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrameClientExtUr: TFrameClientExtUr;

implementation

{$R *.dfm}
uses
  DM_Main;

end.
