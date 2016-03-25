program fumigator;

uses
  Vcl.Forms,
  System.UITypes,
  ClassFrmBase in 'classes\ClassFrmBase.pas' {BaseForm},
  ClassSprForm in 'classes\ClassSprForm.pas' {SprForm},
  DM_Main in 'DM_Main.pas' {DataModuleMain: TDataModule},
  frmMain in 'frmMain.pas' {frmMain},
  frmWorkers in 'frmWorkers.pas' {frmWorkers},
  ClassSimpleForm in 'Classes\ClassSimpleForm.pas' {SimpleForm},
  frmWorker in 'frmWorker.pas' {frmWorker},
  formOptions in 'formOptions.pas' {frmOptions},
  formLogin in 'formLogin.pas' {frmLogin},
  uLocalizeDevExpress in 'uLocalizeDevExpress.pas',
  formDictionaries in 'formDictionaries.pas' {frmDictionaries},
  ClassSimpleSprForm in 'Classes\ClassSimpleSprForm.pas' {frmSimpleSpr},
  ClassSimpleSprTypeForm in 'Classes\ClassSimpleSprTypeForm.pas' {frmSimpleSprType},
  ClassProc in 'Classes\ClassProc.pas',
  formClients in 'formClients.pas' {frmClients};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
   Application.Title := '���������';

  Application.CreateForm(TDataModuleMain, DM);
  Application.CreateForm(TfrmLogin, frmLogin);
  if frmLogin.ShowModal <> mrOk then
    Application.Terminate;

  DM.AfterLogin;

  //Application.CreateForm(TfrmMain, formMain);
  formMain := TfrmMain.Create(nil, ' ');
  formMain.Show;

  Application.Run;
end.
