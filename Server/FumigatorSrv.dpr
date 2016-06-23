program Fumigator_srv;

uses
  Vcl.Forms,
  Srr_MF in 'Srr_MF.pas' {MF},
  TelpinAPI in 'TelpinAPI.pas',
  CommonFunc in 'CommonFunc.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMF, MF);
  Application.Run;
end.
