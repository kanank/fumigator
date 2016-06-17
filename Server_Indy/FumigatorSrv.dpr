program Fumigator_srv;

uses
  Vcl.Forms,
  Srr_MF in 'Srr_MF.pas' {MF},
  TelpinAPI in 'TelpinAPI.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMF, MF);
  Application.Run;
end.
