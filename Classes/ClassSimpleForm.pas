unit ClassSimpleForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassFrmBase, RzButton, Vcl.ExtCtrls,
  RzPanel, dxGDIPlusClasses;

type
  TSimpleForm = class(TBaseForm)
    RzPanel1: TRzPanel;
    Exit_bnt: TRzButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SimpleForm: TSimpleForm;

implementation

{$R *.dfm}

end.
