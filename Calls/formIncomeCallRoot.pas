unit formIncomeCallRoot;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassFrmBase, dxGDIPlusClasses,
  Vcl.ExtCtrls;

type
  TfrmIncomeCallRoot = class(TBaseForm)
  private
    fCallId: string;
    fClientClose: boolean;
    fCallResult: string;
    fCanClose: boolean;
    function GetCallFinished: boolean;
    procedure SetClientClose(AValue: boolean);
    procedure SetCallResult(AValue: string);
  public
    property CallResult: string read fCallResult write SetCallResult;
    property CallId: string read fCallId write fCallId;
    property CallFinished: boolean read GetCallFinished;
    property CanClose: boolean read fCanClose;

    class function ShowIncomeCall: Boolean;
  end;

var
  frmIncomeCallRoot: TfrmIncomeCallRoot;

implementation

{$R *.dfm}

{ TfrmIncomeCallRoot }

function TfrmIncomeCallRoot.GetCallFinished: boolean;
begin
   result := (CallResult <> '');
end;


procedure TfrmIncomeCallRoot.SetCallResult(AValue: string);
begin
  if AValue <> fCallResult then
    fCallResult := AValue;

end;

procedure TfrmIncomeCallRoot.SetClientClose(AValue: boolean);
begin

end;

class function TfrmIncomeCallRoot.ShowIncomeCall: Boolean;
begin

end;

end.
