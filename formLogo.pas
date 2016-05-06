unit formLogo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, RzLabel, dxGDIPlusClasses,
  Vcl.ExtCtrls;

type
  TfrmLogo = class(TForm)
    img1: TImage;
    Info: TRzLabel;
    RzLabel1: TRzLabel;
    Shape1: TShape;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogo: TfrmLogo;

implementation

{$R *.dfm}



end.
