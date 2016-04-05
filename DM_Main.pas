unit DM_Main;

interface

uses
  System.SysUtils, System.Classes, System.UITypes, Vcl.Forms, Winapi.Windows,
  IBX.IBDatabase, Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery, IBX.IBUpdateSQL, Vcl.ImgList, Vcl.Controls, cxGraphics,
  CommonVars, CommonTypes;


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
    procedure DsWorkerDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
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

    function GetDataset(AQuery: TIBQuery): TIBQuery;
  var
    CurrentUserSets: CurrentUserRec;
    //FtpProp: FtpProps;
    //TrayView: TTrayView;
    MissCount: integer;
    DBFileName :string;
  end;

var
  DM: TDataModuleMain;


implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  frmWorker, System.StrUtils;

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

    if ActionStr = asCreate then
    begin
      form.Caption := form.Caption + '.Новый';
      Worker_q.FieldByName('USER_BLOCKED').AsInteger := 0;
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
   // DicWorkerStatus.Open;
    Workers.Open;
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

function TDataModuleMain.CreateRWQuery: TIBQuery;
var
  TR: TIBTransaction;
begin
  TR := TIBTransaction.Create(self);
  TR.DefaultDatabase := DB;
  TR.DefaultAction := TACommit;
  TR.AutoStopAction := saCommit;

  TR.Params.Add('isc_tpb_read_committed');
  TR.Params.Add('isc_tpb_no_rec_version');
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
var
  fio: string;
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

end.
