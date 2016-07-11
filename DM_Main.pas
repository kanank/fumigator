unit DM_Main;

interface

uses
  System.SysUtils, System.Classes, System.UITypes, Vcl.Forms, Winapi.Windows,
  IBX.IBDatabase, Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery, IBX.IBUpdateSQL, Vcl.ImgList, Vcl.Controls, cxGraphics,
  CommonVars, CommonTypes, Vcl.ExtCtrls, dxmdaset;


type
  TDataModuleMain = class(TDataModule)
    DB: TIBDatabase;
    DefTr: TIBTransaction;
    DicUserTypes: TIBQuery;
    DSDicUserTypes: TDataSource;
    DicWorkerProfs: TIBQuery;
    DSDicWorkerProfs: TDataSource;
    Workers: TIBQuery;
    DSWorkers: TDataSource;
    Worker_upd: TIBUpdateSQL;
    Worker_Q: TIBQuery;
    worker_tr: TIBTransaction;
    DsWorker: TDataSource;
    ImgList: TcxImageList;
    DicServices: TIBQuery;
    DSDicServices: TDataSource;
    DSDicMaterials: TDataSource;
    DicMaterials0: TIBQuery;
    DicMaterials_upd: TIBUpdateSQL;
    DicServices_upd: TIBUpdateSQL;
    DicUserTypes_upd: TIBUpdateSQL;
    DicWorkerProfs_upd: TIBUpdateSQL;
    DicMaterialType: TIBQuery;
    DsDicMaterialType: TDataSource;
    DicMaterialType_upd: TIBUpdateSQL;
    DicMaterialSubTypes: TIBQuery;
    DsDicMaterialSubTypes: TDataSource;
    DicMaterialSubTypes_upd: TIBUpdateSQL;
    DicMaterials: TIBQuery;
    DicFormatsCli: TIBQuery;
    DsFormatsCli: TDataSource;
    Clients: TIBQuery;
    Clients_upd: TIBUpdateSQL;
    Clients_tr: TIBTransaction;
    DsClients: TDataSource;
    DicStatusCli: TIBQuery;
    DsDicStatusCli: TDataSource;
    DicUrForm: TIBQuery;
    DsDicUrForm: TDataSource;
    DicCliSfera: TIBQuery;
    DsDicCliSfera: TDataSource;
    DicRegions: TIBQuery;
    DsDicRegions: TDataSource;
    DicPhoneType: TIBQuery;
    DsDicPhoneType: TDataSource;
    DicCliProfs: TIBQuery;
    DsDicCliProfs: TDataSource;
    CallS_Q: TIBQuery;
    Calls_Tr: TIBTransaction;
    Calls_UpdQ: TIBUpdateSQL;
    Calls_Timer: TTimer;
    SocketTimer: TTimer;
    DicCallTypes: TdxMemData;
    DicCallTypesID: TIntegerField;
    DicCallTypesNAME: TStringField;
    DSDicCallTypes: TDataSource;
    WorkerTypeByDate: TIBQuery;
    DSWorkerTypeByDate: TDataSource;
    WorkerTypeByDate_upd: TIBUpdateSQL;
    QSession_Check: TIBQuery;
    QCall_Check: TIBQuery;
    QCallAcceptCheck: TIBQuery;
    QSessionCheckAct: TIBQuery;
    imgListTray: TcxImageList;
    QSession_CheckApi: TIBQuery;
    procedure DsWorkerDataChange(Sender: TObject; Field: TField);
    procedure Calls_TimerTimer(Sender: TObject);
    procedure SocketTimerTimer(Sender: TObject);
  private

  public
    Procedure MakeTopForm (Form :TForm); // сделать поверх всех окон.
    Procedure UnMakeTopForm (Form :TForm); // сделать обычное окно.

    function BeforeLogin: boolean;
    function AfterLogin: boolean;
    procedure AppMessage(var Msg: TMsg; var Handled: Boolean);

    //данные
    function CreateRWQuery: TIBQuery;
    function LoadSpr: boolean; // загрузка вспомогательных справочников

    function GetCurrentUser(id: integer): CurrentUserRec; //установка текущего пользователя
    function ShowWorkerForm(DS: TDataSource; Worker_ID: integer;
      ActionStr: TActionStr; ParentForm: TForm; ShowModal: Boolean=true): FormResult;
    function GetPersonShortName(f, i, o: string): string;
    function GetPersonFullName(f, i, o: string): string;

    function ShowClientFiz(AAction: TActionStr; AExtPrm: TClientParam): FormResult;
    function ShowClientUr(AAction: TActionStr; AExtPrm: TClientParam): FormResult;
    function ShowClientsForCall: FormResult;
    function SetReadedCall(id: integer): boolean;
    function ShowUnknownCallForm(APhone: string): FormResult;
    function ShowFizCallForm(CLP: ClientCallParams): FormResult;
    function ShowUrCallForm(CLP: ClientCallParams): FormResult;

    function Calling(ATSnumber, Aphone: string; client_id: integer): string;
    function CallingWithResult(ATSnumber, Aphone: string; client_id: integer): string;
    function ShowOutcomCall(ACallId, ACallApiId: string; APhone: string): string;
    function GetClientInfoForCall(Aid: integer): TdxMemData;

    function CheckCloseSession(callid: string; callapiid: string = ''): boolean; //проверка закрытия сессии
    function CheckCloseCall(callid: string): boolean; //проверка окончания непринятого звонка
    function CheckAcceptCall(callid: string): boolean; //проверка захвата звонка
    procedure CheckSession(callid: string; var finished, accepted: Boolean); //проверка сессии на окончание и приём

    function FinishSession(callid: string; client_id: integer; callapiid: string=''): string;

    function GetDataset(AQuery: TIBQuery): TIBQuery;
    function GetClientCallParams(TelNum: string): ClientCallParams;
    procedure SetFilterNonDelete(ADataset: TDataset);
    function OffFilter(ADataset: TDataset; AField: TField = nil): Variant; //сброс фильтра и установка на запись
    procedure FilterNonDelete(DataSet: TDataSet; var Accept: Boolean);
    //function CopyClientCallParams(ASource: ClientCallParams): ClientCallParams;
  var
    CurrentUserSets: CurrentUserRec;
    //FtpProp: FtpProps;
    //TrayView: TTrayView;
    MissCount: integer;
    DBFileName :string;
    inCalling: Boolean;
    incomeCalling: Boolean;
    incomeCallId: string;
    DateStart: TDateTime; //время запуска программы
  end;

  function SetFieldValue(AField: TField; AValue: Variant; DoPost: Boolean=True): Boolean;

var
  DM: TDataModuleMain;


implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  frmWorker, System.StrUtils, formCallUnknown, formClientFiz,
  formClientUr, formIncomeCalls, formIncomeCallsUr, formCalling,
  frmMain, formClientsForCall, formIncomeCallRoot, formSessionResult,
  formClientResult;

function SetFieldValue(AField: TField; AValue: Variant; DoPost: Boolean=True): Boolean;
var
  ds: TDataSet;
begin
  ds := nil;
  Result := False;
  try
    ds := AField.DataSet;
    if not(ds.State in [dsEdit, dsInsert]) then
      ds.Edit;
    AField.Value := AValue;
    if DoPost then
      ds.Post;
    Result := True;
  except
    ds.Cancel;
    Result := False;
  end;
end;

function TDataModuleMain.ShowClientFiz(AAction: TActionStr;
  AExtPrm: TClientParam): FormResult;
var
  prm: TFrmCreateParam;
begin
  if not DM.Clients.Active then
    DM.Clients.Open;

  prm :=  TFrmCreateParam.Init(AACtion, DM.Clients, @AExtPrm);  //NewFrmCreateParam(AACtion, DM.Clients, @AExtPrm);
  frmClientFiz := TfrmClientFiz.Create(nil, '', @prm);
  try
    if frmClientFiz.ShowModal = mrOk then
      DM.Clients.Refresh;
    Result.ModalRes := frmClientFiz.ModalResult;
  finally
    FreeAndNil(frmClientFiz);
  end;
end;

function TDataModuleMain.ShowClientsForCall: FormResult;
begin
  frmClientsForCall := TfrmClientsForCall.Create(nil);
  try
    frmClientsForCall.QWorkerShedule.ParamByName('worker_id').AsInteger := CurrentUserSets.ID;
    frmClientsForCall.QWorkerShedule.Open;
    frmClientsForCall.ShowModal;
  finally
    FreeAndNil(frmClientsForCall);
  end;
end;

function TDataModuleMain.ShowClientUr(AAction: TActionStr;
  AExtPrm: TClientParam): FormResult;
var
  prm: TFrmCreateParam;
begin
  if not DM.Clients.Active then
    DM.Clients.Open;

  prm := NewFrmCreateParam(AACtion, DM.Clients, @AExtPrm);
  frmClientUr := TfrmClientUr.Create(nil, '', @prm);
  try
    if frmClientUr.ShowModal = mrOk then
      DM.Clients.Refresh;
    Result.ModalRes := frmClientUr.ModalResult;
  finally
    FreeAndNil(frmClientUr);
  end;
end;

function TDataModuleMain.ShowFizCallForm(CLP: ClientCallParams): FormResult;
var
  prm: TClientParam;
begin
  frmIncomeCall := TfrmIncomeCall.Create(nil);
  try
    frmIncomeCall.edtPhone.Text := RightStr(CLP.TelNum, 10);
    frmIncomeCall.FramePerson.OpenData(CLP.PERSON_ID);
    frmIncomeCall.cmbFormat.EditValue := CLP.Format_Id;
    frmIncomeCall.cmbStatus.EditValue := CLP.Status_Id;
    frmIncomeCall.lblWorker.Caption   := CLP.Author;
    frmIncomeCall.ShowModal;
    if frmIncomeCall.ModalResult = mrOk then
    begin
      DM.GetDataset(DM.Clients);
      DM.Clients.Locate('ID', CLP.Client_id, []);
      ShowClientFiz(asEdit, prm);
    end;

    Result.ModalRes := frmIncomeCall.ModalResult;
  finally
    FreeAndNil(frmIncomeCall);
  end;
end;

function TDataModuleMain.ShowOutcomCall(ACallId, ACallApiId: string; APhone: string): string;
var Q : TIBQuery;
    ClP :ClientCallParams;
    tel :string;
    id: integer;
    Prm: TFrmCreateParam;
    extParam: TClientParam;
    newFiz, newUr: Boolean;
    frm: TForm;
begin
  Application.ProcessMessages;

  if Db.Connected = false then  Exit;

  try
     //получаем параметры звонка
     CLP := getClientCallParams(APhone);
     //CLP.id_call := ACallid;
     ClP.TelNum  := APhone;

     extParam.Init(0, 0, @CLP);
     prm.action := asEdit;

     DM.GetDataset(DM.Clients);

    //if not DM.Clients.Locate('id', CLP.Client_id, []) then
    //  Exit;

    inCalling := True;

    if clp.Client_Type = '' then
      case ShowUnknownCallForm(Aphone).ModalRes of
        mrOk: newFiz := true;
        mrYes: NewUr := True;
      end
    else
    if not DM.Clients.Locate('id', CLP.Client_id, []) then
      Exit;

    frmClientResult := TfrmClientResult.Create(self);

    if newFiz or NewUr then
    begin
      prm := NewFrmCreateParam(asCreate, DM.Clients);
    end;

    Prm.ExtParam := @ExtParam;
    Prm.Dataset := DM.Clients;
    if not newUr and
      ((DM.Clients.FieldByName('type_cli').AsInteger = 0) or newFiz) then
    begin
      frmClientFiz := TfrmClientFiz.Create(frmClientResult, '', @prm);
      frmClientFiz.RzPanel1.Visible := False;
      frmClientFiz.Height := frmClientFiz.Height - frmClientFiz.RzPanel1.Height;
      frm := frmClientFiz;
    end
    else
    begin
      frmClientUr := TfrmClientUr.Create(frmClientResult, '', @prm);
      frmClientUr.RzPanel1.Visible := False;
      frmClientUr.Height := frmClientUr.Height - frmClientUr.RzPanel1.Height;
      frm := frmClientUr;
    end;

    frm.BorderIcons := [];
    frm.BorderStyle := bsNone;
    frm.Parent      := frmClientResult.pnlForm;
    frmClientResult.pnlForm.Height := frm.Height + 10;
    frmClientResult.pnlForm.Width  := frm.Width;
    frmClientResult.Height := frmClientResult.pnlForm.Height +
      frmClientResult.pnlResult.Height + frmClientResult.RzPanel1.Height;

    frm.Position := poDefault;
    frm.Show;

    frmClientResult.frmCli    := frm;
    frmClientResult.TypeCli   :=  DM.Clients.FieldByName('type_cli').AsInteger;
    frmClientResult.ClientId  := CLP.Client_id;
    frmClientResult.CallId    := ACallId;
    frmClientResult.CallApiId := ACallApiId;
    frmClientResult.ShowModal;
    Result := frmClientResult.CallResult;
    frmClientResult.Free;
  finally
    inCalling := False;
  end;

  //end;

end;

function TDataModuleMain.ShowUnknownCallForm(APhone: string): FormResult;
begin
  frmCallUnknown := TfrmCallUnknown.Create(nil);
  try
    frmCallUnknown.edtPhone.Text := RightStr(APhone, 10);
    frmCallUnknown.ShowModal;
    Result.ModalRes := frmCallUnknown.ModalResult;
  finally
    FreeAndNil(frmCallUnknown);
  end;
end;

function TDataModuleMain.ShowUrCallForm(CLP: ClientCallParams): FormResult;
var
  prm: TClientParam;
begin
  frmIncomeCallUr := TfrmIncomeCallUr.Create(nil);
  try
    frmIncomeCallUr.edtPhone.Text := RightStr(CLP.TelNum, 10);
    frmIncomeCallUr.FramePerson.OpenData(CLP.PERSON_ID);
    frmIncomeCallUr.cmbForma.EditValue  := CLP.FORMA_ID;
    frmIncomeCallUr.cmbFormat.EditValue := CLP.Format_Id;
    frmIncomeCallUr.cmbStatus.EditValue := CLP.Status_Id;
    frmIncomeCallUr.lblWorker.Caption   := CLP.Author;
    frmIncomeCallUr.edtINN.Text         := CLP.INN;
    frmIncomeCallUr.edtName.Text        := CLP.ClientName;
    frmIncomeCallUr.ShowModal;

    if frmIncomeCallUr.ModalResult = mrOk then
    begin
      //prm.CallParam := CLP;
      DM.GetDataset(DM.Clients);
      DM.Clients.Locate('ID', CLP.Client_id, []);
      ShowClientUr(asEdit, prm);
    end;

    Result.ModalRes := frmIncomeCallUr.ModalResult;
  finally
    FreeAndNil(frmIncomeCallUr);
  end;
end;

function TDataModuleMain.ShowWorkerForm(DS: TDataSource; Worker_ID: integer;
  ActionStr: TActionStr; ParentForm: TForm; ShowModal: Boolean): FormResult;
var
  Form :TfrmWorker;
begin
  Try
    if ActionStr = asCreate then
    begin
      DS.Dataset.Append;
    end;

    if ActionStr = asEdit then
      DS.Dataset.Edit;

    form := TfrmWorker.Create(self);
    form.DS.DataSet := Worker_q;

    if ActionStr = asCreate then
    begin
      form.Caption := form.Caption + '.Новый';
      //Worker_q.FieldByName('USER_BLOCKED').AsInteger := 0;
      Worker_q.FieldByName('IS_DELETED').AsInteger := 0;
    end
    else
      form.Caption := form.Caption + '.Редактирование';

    // not form.ListsLoaded then //загружаем списки
    //  form.LoadLists;

    if  ShowModal = true then
    begin
      ParentForm.AlphaBlendValue := FormAlphaBlend;
      ParentForm.AlphaBlend := True;
      try
        Result.ModalRes := form.ShowModal;
      except
        Result.ModalRes := mrNone;
      end;
    end;
  finally
    //if
    //  Result.New_Id := StrToInt(form.ID_edt.Text);
    ParentForm.AlphaBlend := false;
     if result.ModalRes = mrOk then
     begin
       DS.DataSet.Post;

       DS.DataSet.Refresh;
       Workers.Close;
       Workers.Open;
     end;

     if ShowModal then
     begin
        FreeAndNil(form);
        form.DisposeOf;
     end;
  end;
end;

procedure TDataModuleMain.SocketTimerTimer(Sender: TObject);
begin
  formMain.DoSocketConnect;
end;

function TDataModuleMain.LoadSpr: boolean;
begin
  Result := false;
  try
    //DicContrJobs.Open;
    //DicContrStates.Open;
    //DicContrStatuses.Open;
    //DicTaskStatuses.Open;
    //DicUserRight.Open;
    DicUserTypes.Open;
    DicWorkerProfs.Open;
    DicServices.Open;
    DicMaterialType.Open;
    DicMaterialSubTypes.Open;
    DicMaterials.Open;
    DicFormatsCli.Open;
    DicStatusCli.Open;
    DicUrForm.Open;
    DicCliSfera.Open;
    DicCliProfs.Open;
    DicRegions.Open;
    DicPhoneType.Open;
   // DicWorkerStatus.Open;
    Workers.Open;

    with DicCallTypes do
    begin
      Open;
      Append;
      FieldByName('ID').AsInteger := 0;
      FieldByName('NAME').AsString := 'Входящий';
      Post;
      Append;
      FieldByName('ID').AsInteger := 1;
      FieldByName('NAME').AsString := 'Исходящий';
      Post;
    end;


    Result := True;
  except
  end;
end;

function TDataModuleMain.AfterLogin: boolean;
begin
  Result := False;
  //TrayView := TrayNormal;

  if not LoadSpr then //загрузка справочников
  begin
    Application.MessageBox('Ошибка загрузки справочников','Ошибка', MB_ICONERROR);
    Application.Terminate;
    Exit;
  end;
  Result := true;


// Инициализация приложения
  // Пользователь
  // CurrentUserSets := GetCurrentUser(1);
  //  CurrentUserSets.ATS_Phone_Num := debug_atsnum;

   //Session_timer.Interval := session_timer_interval * 1000;

   Application.OnMessage := AppMessage;

   //if CurrentUserSets.ATS_Phone_Num = '' then
   //   CurrentUserSets.ATS_Phone_Num := '112';

   (*CurrentUserSets.id := 1;
   CurrentUserSets.UserName := 'Иванов И.И.';
   CurrentUserSets.UserType := 1;
   CurrentUserSets.userTypeName := 'Администратор';
   CurrentUserSets.DebugMode := true;
   CurrentUserSets.ATS_Phone_Num := '112'; *)
end;


procedure TDataModuleMain.AppMessage(var Msg: TMsg; var Handled: Boolean);
begin
 {if Assigned(MF) and Assigned(MF.TrayIcon) then
   case DM.TrayView of
     trayNormal:
       begin
         MF.TrayIcon.Animate := false;
         MF.TrayIcon.IconIndex := 0;
         MF.TrayIcon.Hint := DM.ProgName;
       end;
     trayMissed:
       begin
         MF.TrayIcon.Animate := true;
         MF.TrayIcon.Hint := DM.ProgName + Format(' Имеются пропущенные звонки(%d)!', [DM.MissCount]);
       end;
   end;}
end;

function TDataModuleMain.BeforeLogin: boolean;
var
  answer: integer;
  DBFileName0: string;
begin
  {Result := false;

  DBFileName := ReadConfig('General', 'Database', DBFileName);
  DBFileName0 := DBFileName;
  DB.DatabaseName := DBFileName;

  answer := IdYes;
  while answer = IdYes do
    try
      DB.Open;
      answer := IdNo;
      Result := true;
      if DBFileName0 <> DBFileName then
        Writeconfig('General', 'Database', DB.DatabaseName);
    except
      answer := MessageBox(0, 'Ошибка подключения к базе данных. Изменить путь?', 'Ошибка соединения с БД', MB_ICONQUESTION + MB_YESNO);
      //Application.MessageBox('Ошибка подключения к базе данных. Обратитесь к разработчику','Ошибка', MB_ICONERROR);
      if answer = IdYes then
      begin
        dbPath := InputBox('Путь к БД', 'Ведите путь к БД', dbPath);
        if dbPath = '' then
          answer := IdNo
        else
          DB.DatabaseName := dbPath;
      end;

      if answer <> IdYes then
      begin
        Application.Terminate;
        Exit;
      end;
    end;}
end;

function TDataModuleMain.Calling(ATSnumber, Aphone: string; client_id: integer): string;
var
  CliInfo: TDataSet;
begin
  CliInfo := nil;
  try
    if not formMain.TCPClient.Connected then
    begin
      MessageBox(0, 'Нет соединения с сервером. Вызовы невозможны',
        'Исходящие вызовы', MB_ICONWARNING);
      exit;
    end;

    CliInfo := GetClientInfoForCall(client_id);

    //inCalling := True;
    //formMain.ClientSocket.Socket.SendText('#call:' + ATSnumber + ',' + Aphone);

    frmCalling := TfrmCalling.Create(nil);
    with frmCalling do
    begin
      DS.DataSet     := CliInfo;
      AtsPhone       := ATSnumber;
      Phone          := Aphone;
      edtPhone.Text  := Aphone;
      pnlFiz.Visible := (CliInfo.FieldByName('tip').AsInteger = 0);
      pnlUr.Visible  := not frmCalling.pnlFiz.Visible;
      ShowModal;
      Result := frmCalling.CallResult;
    end;

  finally
    CliInfo.Free;
    FreeAndNil(frmCalling);
  end;
end;

function TDataModuleMain.CallingWithResult(ATSnumber, Aphone: string; client_id: integer): string;
var
  prm: TFrmCreateParam;
  mres: TModalResult;
  frm: TForm;
begin
  try
    if not formMain.ClientSocket.Active then
    begin
      MessageBox(0, 'Нет соединения с сервером. Вызовы невозможны',
        'Исходящие вызовы', MB_ICONWARNING);
      exit;
    end;

    DM.GetDataset(DM.Clients);

    if not DM.Clients.Locate('id', client_id, []) then
      Exit;

    inCalling := True;
    formMain.ClientSocket.Socket.SendText('#call:' + AtsNumber + ',' + APhone + ',' + AtsNumber);

    frmClientResult := TfrmClientResult.Create(self);

    prm := NewFrmCreateParam(asEdit, DM.Clients);
    if DM.Clients.FieldByName('type_cli').AsInteger = 0 then
    begin
      frmClientFiz := TfrmClientFiz.Create(frmClientResult, '', @prm);
      frmClientFiz.RzPanel1.Visible := False;
      frmClientFiz.Height := frmClientFiz.Height - frmClientFiz.RzPanel1.Height;
      frm := frmClientFiz;
    end
    else
    begin
      frmClientUr := TfrmClientUr.Create(frmClientResult, '', @prm);
      frmClientUr.RzPanel1.Visible := False;
      frmClientUr.Height := frmClientUr.Height - frmClientUr.RzPanel1.Height;
      frm := frmClientUr;
    end;

    frm.BorderIcons := [];
    frm.BorderStyle := bsNone;
    frm.Parent      := frmClientResult.pnlForm;
    frmClientResult.pnlForm.Height := frm.Height + 10;
    frmClientResult.pnlForm.Width  := frm.Width;
    frmClientResult.Height := frmClientResult.pnlForm.Height +
      frmClientResult.pnlResult.Height + frmClientResult.RzPanel1.Height;

    frm.Position := poDefault;
    frm.Show;

    frmClientResult.frmCli := frm;
    frmClientResult.TypeCli := DM.Clients.FieldByName('type_cli').AsInteger;
    frmClientResult.ClientId := client_id;
    frmClientResult.ShowModal;
    Result := frmClientResult.CallResult;
    frmClientResult.Free;
  finally
    inCalling := False;
  end;
end;

procedure TDataModuleMain.Calls_TimerTimer(Sender: TObject);
var Q : TIBQuery;
    ClP :ClientCallParams;
    tel :string;
    id: integer;
    extPrm: TClientParam;
begin

  if Db.Connected = false then  Exit;

  Calls_Timer.Enabled := false;
  try
    with CallS_Q do
    begin
         Close;
         if Transaction.InTransaction then
           Transaction.CommitRetaining;
         ParamByName('ATS_Num').AsString := CurrentUserSets.ATS_Phone_Num;
         Open;

         if FieldByName('ID').IsNull = false then
         begin //если звонок есть.
           tel := FieldByName('CALL_NUM').AsString;
           id  := FieldByName('ID').AsInteger;
           //Delete;
           if Transaction.InTransaction then
              Transaction.CommitRetaining;

           //получаем параметры звонка
           CLP := getClientCallParams(tel);
           CLP.id_call := id;
           ClP.TelNum  := tel;

           ExtPrm.CallParam := @CLP;

           //берем звонок в обработку
           if not SetReadedCall(id) then
           begin
             // ошибка
             exit;
           end;

           frmIncomeCallRoot := TfrmIncomeCallRoot.Create(nil);
           frmIncomeCallRoot.Show;

           incomeCalling := True;
           incomeCallId := FieldByName('CALLAPIID').AsString;

           if clp.Client_Type = '' then
           begin  // Вызываем неизвестный звонок.
             case ShowUnknownCallForm(tel).ModalRes of
               mrOk: ShowClientFiz(asCreate, ExtPrm);
               mrYes: ShowClientUr(asCreate, ExtPrm);
             end;
           end
           else
           begin
             if ClP.Client_Type = 'F' then
             begin
               ShowFizCallForm(clp);
             end;

             if ClP.Client_Type = 'U' then
             begin
               ShowUrCallForm(clp);
             end;
           end;
         end;

         if Transaction.Active then
           Transaction.CommitRetaining;

    end;

  //  with Miss_CallS_Count do
  //  begin
  //    Close;
  //    ParamByName('ATS_Num').AsString :=  CurrentUserSets.ATS_Phone_Num;
  //    Open;
  //
  //    MissCount := Fields[0].asInteger;
  //
  //    if MissCount > 0 then //есть пропущенные звонки
  //      trayView := trayMissed;
  //
  //    if Transaction.InTransaction then
  //      Transaction.Commit;
  //  end;

  finally
    incomeCalling := False;
   ////// calls_timer.enabled := true;
  end;
end;

function TDataModuleMain.CheckCloseSession(callid: string; callapiid: string = ''): boolean;
begin
  Result := false;
  if callapiid = '' then
  begin
    QSession_Check.Close;
    QSession_Check.ParamByName('callid').AsString := CallId;
    if QSession_Check.Transaction.Active then
      QSession_Check.Transaction.CommitRetaining;
    try
      QSession_Check.Open;
      Result := (QSession_Check.RecordCount > 0);
      if QSession_Check.Transaction.Active then
        QSession_Check.Transaction.CommitRetaining;
    except
      if QSession_Check.Transaction.Active then
       QSession_Check.Transaction.RollbackRetaining;
    end;
  end

  else //CALLAPIID
  begin
    QSession_CheckApi.Close;
    QSession_CheckApi.ParamByName('callapiid').AsString := CallapiId;
    if QSession_CheckApi.Transaction.Active then
      QSession_CheckApi.Transaction.CommitRetaining;
    try
      QSession_CheckApi.Open;
      Result := (QSession_CheckApi.RecordCount > 0);
      if QSession_CheckApi.Transaction.Active then
        QSession_CheckApi.Transaction.CommitRetaining;
    except
      if QSession_CheckApi.Transaction.Active then
       QSession_CheckApi.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TDataModuleMain.CheckSession(callid: string; var finished, accepted: Boolean);
begin
  QSessionCheckAct.Close;
  QSessionCheckAct.ParamByName('callid').AsString := CallId;
  if QSessionCheckAct.Transaction.Active then
    QSessionCheckAct.Transaction.CommitRetaining;
  try
    QSessionCheckAct.Open;
    if QSessionCheckAct.RecordCount > 0 then
    begin
      finished := (QSessionCheckAct.FieldByName('finished').AsInteger = 1);
      accepted := (QSessionCheckAct.FieldByName('accept').AsInteger = 1);
    end;
    if QSessionCheckAct.Transaction.Active then
      QSessionCheckAct.Transaction.CommitRetaining;
  except
    if QSessionCheckAct.Transaction.Active then
     QSessionCheckAct.Transaction.RollbackRetaining;
  end;
end;

function TDataModuleMain.CheckAcceptCall(callid: string): boolean;
begin
  Result := false;
  QCallAcceptCheck.Close;
  QCallAcceptCheck.ParamByName('callid').AsString := CallId;
  QCallAcceptCheck.ParamByName('phone').AsString := CurrentUserSets.ATS_Phone_Num;
  if QCallAcceptCheck.Transaction.Active then
    QCallAcceptCheck.Transaction.CommitRetaining;
  try
    QCallAcceptCheck.Open;
    Result := (QCallAcceptCheck.RecordCount > 0);
    if QCallAcceptCheck.Transaction.Active then
      QCallAcceptCheck.Transaction.CommitRetaining;
  except
    if QCallAcceptCheck.Transaction.Active then
     QCallAcceptCheck.Transaction.RollbackRetaining;
  end;
end;

function TDataModuleMain.CheckCloseCall(callid: string): boolean;
begin
  Result := false;
  QCall_Check.Close;
  QCall_Check.ParamByName('callid').AsString := CallId;
  if QCall_Check.Transaction.Active then
    QCall_Check.Transaction.CommitRetaining;
  try
    QCall_Check.Open;
    Result := (QCall_Check.RecordCount > 0);
    if QCall_Check.Transaction.Active then
      QCall_Check.Transaction.CommitRetaining;
  except
    if QCall_Check.Transaction.Active then
     QCall_Check.Transaction.RollbackRetaining;
  end;
end;

function TDataModuleMain.FinishSession(callid: string; client_id: integer; callapiid: string=''): string;
var
  _Q: TIBQuery;
begin
  frmSessionResult := TfrmSessionResult.Create(nil);
  with frmSessionResult do
  try
    if callapiid = '' then
      _Q := Q
    else
      _Q := QApi;
    _Q.UpdateObject := Q_upd;
    DS.DataSet := _Q;

    if _Q.Transaction.Active then
      _Q.Transaction.CommitRetaining;

    if callapiid = '' then
      _Q.ParamByName('callid').AsString := Callid
    else
      _Q.ParamByName('callid').AsString := callapiid;

    _Q.Open;
    _Q.Edit;
    _Q.FieldByName('worker_id').AsInteger := DM.CurrentUserSets.ID;
    _Q.FieldByName('client_id').AsInteger := client_id;
    if client_id = 0 then //клиент не был создан
      _Q.FieldByName('ishod').AsString := 'Карточка клиента не создана';

    Result := _Q.FieldByName('callresult').AsString;
    ShowModal;
    if _Q.Modified then
    try
      _Q.FieldByName('localnum').AsString := DM.CurrentUserSets.ATS_Phone_Num;
      _Q.Post;
      if _Q.Transaction.Active then
         _Q.Transaction.CommitRetaining;
    except
       if _Q.Transaction.Active then
         _Q.Transaction.RollbackRetaining;
    end;
  finally
    FreeAndNil(frmSessionResult);
  end;
end;

function TDataModuleMain.CreateRWQuery: TIBQuery;
var
  TR: TIBTransaction;
begin
  TR := TIBTransaction.Create(self);
  TR.DefaultDatabase := DB;
  TR.DefaultAction := TACommit;
  TR.AutoStopAction := saCommit;

  TR.Params.Add('isc_tpb_read_committed');
  //TR.Params.Add('isc_tpb_no_rec_version');
  TR.Params.Add('isc_tpb_rec_version');
  TR.Params.Add('isc_tpb_wait');

  // Только для чтения
  //TR.Params.Add('read');
  //TR.Params.Add('nowait');
  //TR.Params.Add('rec_version');
  //TR.Params.Add('read_committed');

  // Для записи
  //TR.AllowAutoStart := False;
  //TR.DefaultDatabase := DB;
  //TR.DefaultAction := TACommit;
  //TR.Params.Add('write');
  //TR.Params.Add('nowait');
  //TR.Params.Add('read_committed');
  //TR.Params.Add('rec_version');

  result := TIBQuery.Create(self);
  result.Database := DB;
  result.Transaction := TR;

end;

procedure TDataModuleMain.DsWorkerDataChange(Sender: TObject; Field: TField);
var
  ds: TDataset;
  f, i, o, fio, sfio: string;
begin
  if (Field <> nil) and
     ((Field.FieldName = 'W_FAMILY') or
      (Field.FieldName = 'W_NAME') or
      (Field.FieldName = 'W_OTCH')) then
  begin
    ds := Field.DataSet;
    f := ds.FieldByName('W_FAMILY').AsString;
    i := ds.FieldByName('W_NAME').AsString;
    o := ds.FieldByName('W_OTCH').AsString;
    fio := f; sfio := f;

    if (fio <> '') and (i <> '') then
    begin
      fio  := fio + ' ' + i;
      sfio := sfio + ' ' + LeftStr(i, 1) + '. ';
      if o <> '' then
      begin
        fio  := fio + ' ' + o;
        sfio := sfio + ' ' + LeftStr(o, 1) + '. ';
      end;
    end;

    if fio <> '' then
    begin
      ds.FieldByName('FULL_NAME').AsString  := fio;
      ds.FieldByName('SHORT_NAME').AsString := sfio;
    end;
  end
end;

function TDataModuleMain.GetClientInfoForCall(Aid: integer): TdxMemData;
var
  Q :TIBQuery;
begin
  try
    Q := CreateRWQuery;
    Q.SQL.Text := 'SELECT * FROM get_clientinfo_for_call('+ intToStr(AID) +')';
    Q.Open;

    Result := TdxMemData.Create(nil);
    Result.LoadFromDataSet(Q);

    if Q.Transaction.Active then
      Q.Transaction.Commit;
  finally
    Q.Transaction.Free;
    FreeAndNil(Q);
  end;
end;

function TDataModuleMain.GetCurrentUser(id: integer): CurrentUserRec;
var
  Q :TIBQuery;
begin
  try
    Q := CreateRWQuery;
    Q.SQL.Text := 'SELECT * FROM GET_USER_INFO('+ intToStr(ID) +')';
    Q.Open;

    Result.id            := Q.FieldByName('ID').AsInteger;
    Result.UserName      := Q.FieldByName('NAME').AsString;
    Result.UserType      := Q.FieldByName('USER_TYPE').AsInteger;
    Result.userTypeName  := Q.FieldByName('USERTYPENAME').AsString;
    Result.DebugMode     := true;
    Result.ATS_Phone_Num := Q.FieldByName('ATS_PHONE_NUM').AsString;

    if Q.Transaction.Active then
      Q.Transaction.Commit;
  finally
    Q.Transaction.Free;
    FreeAndNil(Q);
  end;
end;

function TDataModuleMain.GetDataset(AQuery: TIBQuery): TIBQuery;
begin
  result := AQuery;
  if not AQuery.Active then
  try
    AQuery.Open;
  except
    result := nil;
  end;
end;

function TDataModuleMain.GetPersonFullName(f, i, o: string): string;
begin
  Result := f;

  if (Result <> '') and (i <> '') then
  begin
    Result  := Result + ' ' + i;
    if o <> '' then
    begin
      Result  := Result + ' ' + o;
    end;
  end;
end;

function TDataModuleMain.GetPersonShortName(f, i, o: string): string;
var
  fio: string;
begin
  fio := f; result := f;

  if (fio <> '') and (i <> '') then
  begin
    fio  := fio + ' ' + i;
    result := result + ' ' + LeftStr(i, 1) + '. ';
    if o <> '' then
    begin
      fio  := fio + ' ' + o;
      result := result + ' ' + LeftStr(o, 1) + '. ';
    end;
  end;
end;

procedure TDataModuleMain.MakeTopForm(Form: TForm);
begin
with Form do
  SetWindowPos(Handle,
    HWND_TOPMOST,
    Left,
    Top,
    Width,
    Height,
    SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
end;

procedure TDataModuleMain.UnMakeTopForm(Form: TForm);
begin

with Form do
  SetWindowPos(Handle,
    HWND_NOTOPMOST,
    Left,
    Top,
    Width,
    Height,
    SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);

end;

procedure TDataModuleMain.SetFilterNonDelete(ADataset: TDataset);
begin
  ADataset.Filtered := False;
  ADataset.OnFilterRecord := FilterNonDelete;
  ADataset.Filtered := true;
end;

procedure TDataModuleMain.FilterNonDelete(DataSet: TDataSet; var Accept: Boolean);
begin
  Accept := (DataSet.FieldByName('is_deleted').AsInteger = 0);
end;

function TDataModuleMain.OffFilter(ADataset: TDataset; AField: TField = nil): Variant;
var
  val: Variant;
begin
  if not ADataset.Filtered then
    exit;

  if AField = nil then
    AField := ADataset.FindField('id');
  if AField <> nil then
    val := AField.AsVariant;
  ADataset.Filtered := False;

  ADataset.Locate(AField.FieldName, val, []);

  Result := AField.AsVariant;

end;

function TDataModuleMain.SetReadedCall(id: integer): boolean;
var Q :TIBQuery;
begin
    try
      Q := CreateRWQuery;
      Q.SQL.Text := Format('Update CURRENT_CALLS set readed = 1 where id = %d', [Id]);
      try
        Q.ExecSQL;
        if Q.Transaction.InTransaction then
          Q.Transaction.Commit;
        Result := true;
      except
        Result := false;
      end;
    finally
      FreeAndNil(Q);
    end;
end;

function TDataModuleMain.getClientCallParams(TelNum: string): ClientCallParams;
var Q :TIBQuery;
begin
  Result.Setup;

  try
    Q := CreateRWQuery;
    Q.SQL.Text := 'SELECT * FROM FINDCLIENT_BYTEL('+ QuotedStr(TelNum) +')';
    Q.open;

    Result.TelNum := TelNum;
    if q.FieldByName('Client_ID').IsNull = false  then
    begin
       Result.Client_Type   := q.FieldByName('CLIENT_TYPE').AsString;
       Result.Client_id     := q.FieldByName('CLIENT_ID').Asinteger;
       Result.ClientName    := q.FieldByName('FULL_NAME').AsString;
       Result.Format_Id     := q.FieldByName('FORMAT_ID').Asinteger;
       Result.Status_Id     := q.FieldByName('STATUS_ID').Asinteger;
       Result.PERSON_ID     := q.FieldByName('PERSON_ID').Asinteger;
       Result.FORMA_ID      := q.FieldByName('FORMA_ID').Asinteger;
       Result.Author        := q.FieldByName('AUTHOR').AsString;
       Result.INN           := q.FieldByName('INN').AsString;
       //Result.clientContact := q.FieldByName('CONTACT_FIO').AsString;
       Result.ClientInfoParams.ClientInfo := q.FieldByName('CLIENTINFO').AsString;
       Result.ClientInfoParams.ClientComms := q.FieldByName('CLIENTCOMMS').AsString;
    end
    else
      result.Client_Type := '';

    if Q.Transaction.Active then
         Q.Transaction.Commit;
  finally
      Q.Transaction.Free;
      FreeAndNil(Q);
  end;

end;


end.
