unit formSessionEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassSimpleForm, RzButton, Vcl.ExtCtrls,
  RzPanel, dxGDIPlusClasses, frameBase, frListBase, frClientCalls;

type
  TfrmSessionEdit = class(TSimpleForm)
    pnlResult: TRzPanel;
    pnlCalls: TRzPanel;
    pnlClient: TRzPanel;
    RzButton1: TRzButton;
    frameClientCalls: TframeClientCalls;
  private
    { Private declarations }
  public
  end;

var
  frmSessionEdit: TfrmSessionEdit;

implementation

{$R *.dfm}

end.
