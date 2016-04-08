unit formClientUr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassSimpleForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxMemo, cxDBEdit,
  frKLADR, frAddress, frAddressRegion, frListBase, frPhones, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  Vcl.StdCtrls, frPersonSmall, RzPanel, frameBase, frClientExtUr, RzButton,
  Vcl.ExtCtrls, dxGDIPlusClasses, frUslugi;

type
  TfrmClientUr = class(TSimpleForm)
    FrameClientExtUr1: TFrameClientExtUr;
    RzGroupBox1: TRzGroupBox;
    FramePersonSmall1: TFramePersonSmall;
    RzPanel2: TRzPanel;
    Label1: TLabel;
    cmbFormat: TcxDBLookupComboBox;
    Label2: TLabel;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    RzPanel3: TRzPanel;
    Label3: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    FramePhones1: TFramePhones;
    RzPanel4: TRzPanel;
    cxDBTextEdit2: TcxDBTextEdit;
    Label4: TLabel;
    FrameKLADRAdrRegion1: TFrameKLADRAdrRegion;
    RzPanel5: TRzPanel;
    Label14: TLabel;
    Comments_memo: TcxDBMemo;
    butOK: TRzButton;
    FrameUslugi1: TFrameUslugi;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClientUr: TfrmClientUr;

implementation

{$R *.dfm}

end.
