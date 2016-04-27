unit DM_Main;

interface

uses
  System.SysUtils, System.Classes, System.UITypes, Vcl.Forms, Winapi.Windows,
  IBX.IBDatabase, Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery, IBX.IBUpdateSQL, Vcl.ImgList, Vcl.Controls, cxGraphics,
  CommonVars, CommonTypes, Vcl.ExtCtrls;


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
    procedure DsWorkerDataChange(Sender: TObject; Field: TField);
    procedure Calls_TimerTimer(Sender: TObject);
  private
    function SetReadedCall(id: integer): boolean;
    function getClientCallParams(TelNum: string): ClientCallParams;
  public
    Procedure MakeTopForm (Form :TForm); // ������� ������ ���� ����.
    Procedure UnMakeTopForm (Form :TForm); // ������� ������� ����.

    function BeforeLogin: boolean;
    function AfterLogin: boolean;
    procedure AppMessage(var Msg: TMsg; var Handled: Boolean);

    //������
    function CreateRWQuery: TIBQuery;
    function LoadSpr: boolean; // �������� ��������������� ������������

    function GetCurrentUser(id: integer): CurrentUserRec; //��������� �������� ������������
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
    form.DS.DataSet := Worker_q;

    if ActionStr = asCreate then
    begin
      form.Caption := form.Caption + '.�����';
      //Worker_q.FieldByName('USER_BLOCKED').AsInteger := 0;
      Worker_q.FieldByName('IS_DELETED').AsInteger := 0;
    end
    else
      form.Caption := form.Caption + '.��������������';

    // not form.ListsLoaded then //��������� ������
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
    DicUrForm.Open;
    DicCliSfera.Open;
    DicCliProfs.Open;
    DicRegions.Open;
    DicPhoneType.Open;
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

  if not LoadSpr then //�������� ������������
  begin
    Application.MessageBox('������ �������� ������������','������', MB_ICONERROR);
    Application.Terminate;
    Exit;
  end;
  Result := true;


// ������������� ����������
  // ������������
  // CurrentUserSets := GetCurrentUser(1);
  //  CurrentUserSets.ATS_Phone_Num := debug_atsnum;

   //Session_timer.Interval := session_timer_interval * 1000;

   Application.OnMessage := AppMessage;

   //if CurrentUserSets.ATS_Phone_Num = '' then
   //   CurrentUserSets.ATS_Phone_Num := '112';

   (*CurrentUserSets.id := 1;
   CurrentUserSets.UserName := '������ �.�.';
   CurrentUserSets.UserType := 1;
   CurrentUserSets.userTypeName := '�������������';
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
         MF.TrayIcon.Hint := DM.ProgName + Format(' ������� ����������� ������(%d)!', [DM.MissCount]);
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
      answer := MessageBox(0, '������ ����������� � ���� ������. �������� ����?', '������ ���������� � ��', MB_ICONQUESTION + MB_YESNO);
      //Application.MessageBox('������ ����������� � ���� ������. ���������� � ������������','������', MB_ICONERROR);
      if answer = IdYes then
      begin
        dbPath := InputBox('���� � ��', '������ ���� � ��', dbPath);
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

procedure TDataModuleMain.Calls_TimerTimer(Sender: TObject);
var Q : TIBQuery;
    ClP :ClientCallParams;
    tel :string;
    id: integer;
begin

if Db.Connected = false then  Exit;

Calls_Timer.Enabled := false;
try
  with CallS_Q do
  begin
       Close;
       ParamByName('ATS_Num').AsString :=  CurrentUserSets.ATS_Phone_Num;
       Open;

       if FieldByName('ID').IsNull = false then
       begin //���� ������ ����.
          tel := FieldByName('CALL_NUM').AsString;
          id  := FieldByName('ID').AsInteger;
          //Delete;
          if Transaction.InTransaction then
             Transaction.Commit;
          //����� ������ � ���������
          if not SetReadedCall(id) then
          begin
            // ������
            exit;
          end;

          CLP := getClientCallParams(tel);
          CLP.id_call := id;

         if clp.Client_Type = '' then
         begin  // �������� ����������� ������.
           case dm.ShowUnknownCallForm(id, tel).ModalRes of
             1: dm.ShowClientFForm(0, asCreate, MF, tel);
             2: dm.ShowClientUrForm(0, asCreate, MF, tel);
           end;
         end
         else
         begin

          if ClP.Client_Type = 'F' then begin
               dm.ShowFizCallForm(clp);
          end;

          if ClP.Client_Type = 'U' then begin
             dm.ShowUrCallForm(clp);
          end;
         end;
       end;

        if Transaction.Active then
           Transaction.Commit;

  end;

//  with Miss_CallS_Count do
//  begin
//    Close;
//    ParamByName('ATS_Num').AsString :=  CurrentUserSets.ATS_Phone_Num;
//    Open;
//
//    MissCount := Fields[0].asInteger;
//
//    if MissCount > 0 then //���� ����������� ������
//      trayView := trayMissed;
//
//    if Transaction.InTransaction then
//      Transaction.Commit;
//  end;

finally

  calls_timer.enabled := true;
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
  TR.Params.Add('isc_tpb_no_rec_version');
  TR.Params.Add('isc_tpb_wait');

  // ������ ��� ������
  //TR.Params.Add('read');
  //TR.Params.Add('nowait');
  //TR.Params.Add('rec_version');
  //TR.Params.Add('read_committed');

  // ��� ������
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

    try
    Q := CreateRWQuery;
    Q.SQL.Text := 'SELECT * FROM FINDCLINT_BYTEL('+ QuotedStr(TelNum) +')';
    Q.open;

    if q.FieldByName('Client_ID').IsNull = false  then begin
       Result.Client_Type := q.FieldByName('CLIENT_TYPE').AsString;
       Result.Client_id := q.FieldByName('CLIENT_ID').Asinteger;
       Result.ClientName := q.FieldByName('FULL_NAME').AsString;
       Result.Author := q.FieldByName('AUTHOR').AsString;
       Result.TelNum := TelNum;
       Result.INN :=  q.FieldByName('INN').AsString;
       Result.clientContact := q.FieldByName('CONTACT_FIO').AsString;
       Result.ClientInfoParams.ClientInfo := q.FieldByName('CLIENTINFO').AsString;
       Result.ClientInfoParams.ClientComms := q.FieldByName('CLIENTCOMMS').AsString;

 //   CLIENT_ID, CLIENT_TYPE, FULL_NAME, CREATOR_ID, CONTACT_FIO, INN, AUTHOR

    end else
        result.Client_Type := '';

      if Q.Transaction.Active then
           Q.Transaction.Commit;
  finally
      Q.Transaction.Free;
      FreeAndNil(Q);
  end;

end;

end.
