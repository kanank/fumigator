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
  frameBase in 'Frames\frameBase.pas' {DbFrameBase: TFrame},
  frPasport in 'Frames\frPasport.pas' {FramePassport: TFrame},
  CommonVars in 'CommonVars.pas',
  CommonTypes in 'Classes\CommonTypes.pas',
  frPersonSmall in 'Frames\frPersonSmall.pas' {FramePersonSmall: TFrame},
  frListBase in 'Frames\frListBase.pas' {FrameListBase: TFrame},
  frPhones in 'Frames\frPhones.pas' {FramePhones: TFrame},
  frKLADR in 'Frames\frKLADR.pas' {FrameKLADR: TFrame},
  frAddress in 'Frames\frAddress.pas' {FrameKLADRAdr: TFrame},
  frRegion in 'Frames\frRegion.pas' {FrameKLADRRegion: TFrame},
  frPersonFull in 'Frames\frPersonFull.pas' {FramePersonFull: TFrame},
  frAddressRegion in 'Frames\frAddressRegion.pas' {FrameKLADRAdrRegion: TFrame},
  frUslugi in 'Frames\frUslugi.pas' {FrameUslugi: TFrame};

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
