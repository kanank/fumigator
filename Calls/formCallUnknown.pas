unit formCallUnknown;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassSimpleForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, RzLabel,
  cxTextEdit, cxMaskEdit, cxDBEdit, Vcl.StdCtrls, RzButton, Vcl.ExtCtrls,
  RzPanel, dxGDIPlusClasses, Data.DB;

type
  TfrmCallUnknown = class(TSimpleForm)
    Label11: TLabel;
    edtPhone: TcxDBMaskEdit;
    RzLabel1: TRzLabel;
    btnNewFizCli: TRzButton;
    btnNewUrCli: TRzButton;
    DS: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCallUnknown: TfrmCallUnknown;

implementation

{$R *.dfm}

uses
  DM_Main, formClientFiz, formClientUr, CommonTypes;


end.
