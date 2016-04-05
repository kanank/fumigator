unit ClassFormEditData;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, RzButton, cxTextEdit, cxMaskEdit,
  cxDBEdit, Vcl.StdCtrls, Data.DB;



type
  TfrmEditData = class(TForm)
    DS: TDataSource;
    lblData: TLabel;
    edtData: TcxDBMaskEdit;
    btnOK: TRzButton;
    bntCancel: TRzButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  TfrmEditDataClass = class of TfrmEditData;

implementation

{$R *.dfm}

end.
