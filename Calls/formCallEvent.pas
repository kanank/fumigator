unit formCallEvent;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RzButton, Vcl.StdCtrls, RzLabel,
  Vcl.ExtCtrls;

type
  TfrmCallEvent = class(TForm)
    RzLabel1: TRzLabel;
    btnAccept: TRzButton;
    btnDecline: TRzButton;
    Shape1: TShape;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCallEvent: TfrmCallEvent;

implementation

{$R *.dfm}

uses
  formIncomeCallRoot, formIncomeCalls;

procedure TfrmCallEvent.FormShow(Sender: TObject);
begin
  RzLabel1.Blinking := True;
  RzLabel1.Alignment := taCenter;
end;

end.
