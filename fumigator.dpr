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
  formClientFiz in 'clients\formClientFiz.pas' {frmClientFiz},
  frameBase in 'Frames\frameBase.pas' {DbFrameBase: TFrame},
  frPasport in 'Frames\frPasport.pas' {FramePassport: TFrame},
  CommonVars in 'CommonVars.pas',
  CommonTypes in 'Classes\CommonTypes.pas',
  frListBase in 'Frames\frListBase.pas' {FrameListBase: TFrame},
  frPhones in 'Frames\frPhones.pas' {FramePhones: TFrame},
  frUslugi in 'Frames\frUslugi.pas' {FrameUslugi: TFrame},
  formEditPhone in 'Frames\formEditPhone.pas' {frmEditPhone},
  frBank in 'Frames\frBank.pas' {FrameRekvizits: TFrame},
  formSelService in 'Frames\formSelService.pas' {frmSelectService},
  formKLADRList in 'Frames\formKLADRList.pas' {frmKLADRList},
  frItemKLADR in 'Frames\frItemKLADR.pas' {FrameItemKLADR: TFrame},
  frKladrAll in 'Frames\frKladrAll.pas' {FrameKladrAll: TFrame},
  formKladrAdr in 'Frames\formKladrAdr.pas' {frmKladrAdr},
  FrKladrAdrFull in 'Frames\FrKladrAdrFull.pas' {FrameKladrAdrFull: TFrame},
  frPersonSmall in 'Frames\frPersonSmall.pas' {FramePersonSmall: TFrame},
  frPersonFull in 'Frames\frPersonFull.pas' {FramePersonFull: TFrame},
  frClientExtUr in 'Frames\frClientExtUr.pas' {FrameClientExtUr: TFrame},
  formClientUr in 'Clients\formClientUr.pas' {frmClientUr},
  ClassFormEditData in 'Classes\ClassFormEditData.pas' {frmEditData},
  frItemDomKLADR in 'Frames\frItemDomKLADR.pas' {FrameItemDomKLADR: TFrame},
  frPersonSmallFoto in 'Frames\frPersonSmallFoto.pas' {FramePersonSmallFoto: TFrame},
  frFoto in 'Frames\frFoto.pas' {FrameFoto: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
   Application.Title := 'Фумигатор';

  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmLogin, frmLogin);
  if frmLogin.ShowModal <> mrOk then
    Application.Terminate;

  DM.AfterLogin;

  //Application.CreateForm(TfrmMain, formMain);
  formMain := TfrmMain.Create(nil, ' ');
  formMain.Show;

  Application.Run;
end.
