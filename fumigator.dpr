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
  formClients in 'clients\formClients.pas' {frmClients},
  formClientUr in 'clients\formClientUr.pas' {frmClientUr},
  formClientFiz in 'clients\formClientFiz.pas' {frmClientFiz},
  uFramePerson0 in 'uFramePerson0.pas' {FramePerson0: TFrame},
  frameBase in 'Classes\frameBase.pas' {DbFrameBase: TFrame},
  frPersonSmall in 'Frames\frPersonSmall.pas' {FramePersonSmall: TFrame},
  CommonVars in 'CommonVars.pas',
  CommonTypes in 'Classes\CommonTypes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
   Application.Title := 'Фумигатор';

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
