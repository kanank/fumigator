unit formClientResult;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassFrmBase, Vcl.ExtCtrls, RzPanel,
  dxGDIPlusClasses;

type
  TfrmClientResult = class(TBaseForm)
    pnlForm: TRzPanel;
    pnlResult: TRzPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClientResult: TfrmClientResult;

implementation

{$R *.dfm}

end.
