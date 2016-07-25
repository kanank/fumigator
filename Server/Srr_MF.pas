unit Srr_MF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.Samples.Spin, IdBaseComponent, IdComponent, IdCustomTCPServer,
  IdCustomHTTPServer, IdHTTPServer, IdContext, Data.DB, IBX.IBDatabase,
  IBX.IBCustomDataSet, IBX.IBQuery, SyncObjs, System.Win.ScktComp,
  TelpinAPI, IBX.IBEvents, IdTCPServer, idSync, IdGlobal, IdAntiFreezeBase,
  Vcl.IdAntiFreeze, IBX.IBSQL;

type
  TDbWriter = class(TThread)
  protected
    fDb: TIBDatabase;
    fSql: string;
    fIBSQL: TIBSQL;
    fParams: TStringList;
    fMess: string;
    procedure Execute; override;
    procedure Log;
    function CreateIBSql(ADb: TIBDatabase): TIBSQL;
  public
    constructor Create(ADb: TIBDatabase; AParam: TStrings; ASql: string); overload;
    destructor Destroy; override;
  end;

  TMsgThread = class(TThread)
  protected
    FServer: TIdTCPServer;
    FMsgList: TStringList;
    FContList: TList;
    fAddMsg: Boolean;
    fExecute: Boolean;
    procedure Execute; override;
  public
    procedure AddMsg(Ato: string; AMsg: string);
    constructor Create(AServer: TIdTCPServer); overload;
    destructor Destroy; override;
    function SendMsg(const ANick: String; const AMsg: String) : Boolean;
    function BroadcastMsg(const bmsg: String): boolean;
  end;

  //TCallWriter = class(TThread)
   // protected
  //end;

  TMyContext = class(TIdServerContext)
    public
      IP: String;
      Nick: String;
      Con: TDateTime;
      function SendMsg(const ANick: String; const AMsg: String) : Boolean;
      procedure BroadcastMsg(const bmsg: String);
      procedure BroadcastMsgAll(const ANick: String; const bmsg: String);
      procedure SendNicks;
      procedure SendFile(const ANick,Fn:string);
  end;

  (*TLog = class(TIdSync)
    protected
        FMsg: String;
    public
        constructor Create(const AMsg: String);
        class procedure AddMsg(const AMsg: String);

    end;*)

  TMF = class(TForm)
    Panel1: TPanel;
    Log_memo: TMemo;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    TelPort_spin: TSpinEdit;
    TelIP_edt: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    TelURI_edt: TEdit;
    TelStatus_lbl: TLabel;
    Tel_SRV: TIdHTTPServer;
    DefTr: TIBTransaction;
    DB: TIBDatabase;
    GroupBox3: TGroupBox;
    TestDb_btn: TButton;
    DBPath_edt: TEdit;
    Label6: TLabel;
    DBUser_edt: TEdit;
    Label7: TLabel;
    DBPass_edt: TEdit;
    Label8: TLabel;
    DBStatus_lbl: TLabel;
    Label10: TLabel;
    Button3: TButton;
    CallEnent_Q: TIBQuery;
    Label9: TLabel;
    edtSocketPort: TSpinEdit;
    Edit1: TEdit;
    Button4: TButton;
    Label11: TLabel;
    edtUserId: TEdit;
    btnPhone: TButton;
    Button5: TButton;
    IBEvents: TIBEvents;
    Button6: TButton;
    DebugMode_cb: TCheckBox;
    TCPServer: TIdTCPServer;
    QPhones: TIBQuery;
    procedure Button1Click(Sender: TObject);
    procedure Tel_SRVCommandGet(AContext: TIdContext;
      ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
    procedure TestDb_btnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure btnPhoneClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure IBEventsEventAlert(Sender: TObject; EventName: string;
      EventCount: Integer; var CancelAlerts: Boolean);
    procedure Button6Click(Sender: TObject);
    procedure TCPServerConnect(AContext: TIdContext);
    procedure TCPServerDisconnect(AContext: TIdContext);
    procedure TCPServerExecute(AContext: TIdContext);
  private
    FActiveUsers: TStringList;
    procedure AddLog (Logstr :string; ALock: boolean=True);
    Function AddCallEvent(Params :TStrings) :Boolean;
    Function FumigatorCommand(ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo) :Boolean; //���������� ������� �� �������� �������
    function SocketCommand(cmd, arg: string): Boolean;
    function CreateRWQuery :TIBQuery;
    function CreateRWSql :TIBSQL;

    procedure AfterOutcomCall(Sender: TObject);
    procedure CallFinished(Sender: TObject);
    function SendCommandToUser(atsnum, command: string; ALock: Boolean=true): Boolean;
    function UpdateSession(ACallId: string): Boolean;
    function AcceptCall(ACallId, APhone: string): boolean;

    function GetUserSocket(ATelNum: string): TCustomWinSocket;
 //  function CreateRWProc :TIBStoredProc;

  public
    CSection: TCriticalSection;
    CSectionFumigator: TCriticalSection;
    CSectionSocket:  TCriticalSection;
    CSectionCommand: TCriticalSection;
    CSectionLog: TCriticalSection;

    AccessToken: TTelphinToken;
    Caller: TPhoneCalls;
    MsgThread: TMsgThread;

    procedure AddLogMemo(Logstr :string; ALock: Boolean=True);
    function SendMsg(const ANick: String; const AMsg: String) : Boolean;
    function BroadcastMsg(const bmsg: String): boolean;
  end;

  const
       LogFile = 'Srv_Log.txt';
       MutexDelay = 500;
var
  MF: TMF;
  LogMutex: THandle;
  MsgMutex: THandle;
  EventsMutex: THandle;
  CSectionMsg: TCriticalSection;

implementation

{$R *.dfm}
uses
  System.DateUtils, CommonFunc;

function TMF.AcceptCall(ACallId, APhone: string): boolean;
var Q :TIBQuery;
begin
  try
    if not DB.Connected then
      Exit;

    Q := CreateRWQuery;
    Q.SQL.Text := Format('update current_calls set accept_phone=''%s'' where callapiid=''%s'' and accept_phone is null', [APhone, ACallId]);
    AddLogMemo(Q.SQL.Text);
    Try
      Q.ExecSQL;
      Result := true;
    Except
      on E : Exception do
      begin
        AddLog('#������ ������� ������: "' +E.Message + '". SQL: '+Q.SQL.Text+'.');
        Result := false;
      end;

    End;

    if Q.Transaction.Active then
      Q.Transaction.Commit;

  finally
    Q.Transaction.Free;
    FreeAndNil(Q);
  end;
end;

function TMF.AddCallEvent(Params: TStrings): Boolean;
var
    //Q :TIBSQL;
    Cf :Byte;
    //Fld :string;
    userid, ats, tel, client_type: string;
    p, client_id: Integer;
begin
 try
   if Params.indexOfName('CALLFLOW') = -1 then
   begin
     Result := False;
     Exit;
   end;

  if Params.Values['CALLFLOW'] = 'in' then
  begin
    userid := Params.Values['CalledExtension'];
    tel    := Params.Values['CallerIdNum'];
  end
  else
  begin
    userid := Params.Values['CallerExtension'];
    tel    := Params.Values['CalledNumber'];
  end;
  p := Pos('*', userid);
  if p > 0 then
  begin
    ats := Copy(userid, p + 1, Length(userid));
    userid := Copy(userid, 1, p - 1);
  end;

  if userid = edtUserId.Text then //������ ������ ��� ��������
  try
    if not DB.Connected then
      Exit;

    with TDbWriter.Create(DB, Params, CallEnent_Q.SQL.Text) do
      Start;
//    Q := CreateRWSQL;
//    Q.Transaction.Active := True;
//    Q.SQL.Text := CallEnent_Q.SQL.Text;
//    //Q.Prepare;
//    if Params.Values['CALLFLOW'] = 'in' then
//      cf := 0
//    else
//      cf := 1;
//
//    Q.Transaction.Active := True;
//    Q.ParamByName('CALLFLOW').AsInteger       :=  cf;
//    Q.ParamByName('CALLID').AsString          :=  Params.Values['CallID'];
//    Q.ParamByName('CALLERIDNUM').AsString     :=  Params.Values['CallerIDNum'];
//    Q.ParamByName('CALLERIDNAME').AsString    :=  Params.Values['CallerIDName'];
//    Q.ParamByName('CALLEDDID').AsString       :=  Params.Values['CalledDID'];
//    Q.ParamByName('CALLEREXTENSION').AsString :=  Params.Values['CallerExtension'];
//    Q.ParamByName('CALLSTATUS').AsString      :=  Params.Values['CallStatus'];
//    Q.ParamByName('CALLEDEXTENSION').AsString :=  Params.Values['CalledExtension'];
//    Q.ParamByName('CALLEDNUMBER').AsString    :=  Params.Values['CalledNumber'];
//    Q.ParamByName('CALLAPIID').AsString       :=  Params.Values['CallAPIID'];
//
//    Try
//      Q.ExecQuery;
//      Result := true;
//
//    Except
//    on E : Exception
//        do begin
//        AddLog('#������ ������ Call_Events! ������: "' +E.Message + '". SQL: '+Q.SQL.Text+'.');
//        Result := false;
//        end;
//
//    End;
//
//    if Q.Transaction.Active then
//         Q.Transaction.Commit;

    //if Result then
    try
      if Params.Values['CallStatus'] = 'CALLING' then
      begin
        if Length(tel) > 4 then
         begin
           client_id := 0; client_type := '';
           if QPhones.Locate('phone', tel, []) then
           begin
             client_id   := QPhones.FieldByName('client_id').AsInteger;
             client_type := QPhones.FieldByName('type_cli').AsString;
           end;
           MF.SendCommandToUser(ats, '#startcall:' +
             Params.Values['CALLFLOW'] + ',' +
             Params.Values['CallID'] + ',' +
             Params.Values['CallAPIID'] + ',' +
             tel + ',' +
             IntToStr(client_id) + ',' +
             client_type,
             False)
         end;

      end
      else  //��������� ������
      begin
        MF.SendCommandToUser(ats, '#finishcall:' +
          Params.Values['CallID'] + ',' +
          Params.Values['CallAPIID'] + ',' +
          Params.Values['CallStatus'],
          False);
      end;

     except

    end;
  finally
      //Q.Transaction.Free;
      //FreeAndNil(Q);
  end;
 except

 end;
end;

(*function TMF.AddCallEvent(Params: TStrings): Boolean;
var
    Q :TIBQuery;
    Cf :Byte;
    Fld :string;
    userid, tel: string;
    p: Integer;
begin
 try
   if Params.indexOfName('CALLFLOW') = -1 then
   begin
     Result := False;
     Exit;
   end;

  if Params.Values['CALLFLOW'] = 'in' then
    userid := Params.Values['CalledExtension']
  else
    userid := Params.Values['CallerExtension'];
  p := Pos('*', userid);
  if p > 0 then
  begin
    tel := Copy(userid, p + 1, Length(userid));
    userid := Copy(userid, 1, p - 1);
  end;

  if userid = edtUserId.Text then //������ ������ ��� ��������
  try
    if not DB.Connected then
      Exit;

    Q := CreateRWQuery;
    Q.SQL.Text := CallEnent_Q.SQL.Text;
    Q.Prepare;
    if Params.Values['CALLFLOW'] = 'in' then
      cf := 0
    else
      cf := 1;

    Q.ParamByName('CALLFLOW').AsInteger       :=  cf;
    Q.ParamByName('CALLID').AsString          :=  Params.Values['CallID'];
    Q.ParamByName('CALLERIDNUM').AsString     :=  Params.Values['CallerIDNum'];
    Q.ParamByName('CALLERIDNAME').AsString    :=  Params.Values['CallerIDName'];
    Q.ParamByName('CALLEDDID').AsString       :=  Params.Values['CalledDID'];
    Q.ParamByName('CALLEREXTENSION').AsString :=  Params.Values['CallerExtension'];
    Q.ParamByName('CALLSTATUS').AsString      :=  Params.Values['CallStatus'];
    Q.ParamByName('CALLEDEXTENSION').AsString :=  Params.Values['CalledExtension'];
    Q.ParamByName('CALLEDNUMBER').AsString    :=  Params.Values['CalledNumber'];
    Q.ParamByName('CALLAPIID').AsString       :=  Params.Values['CallAPIID'];

    Try
      Q.ExecSQL;
      Result := true;

    Except
    on E : Exception
        do begin
        AddLog('#������ ������ Call_Events! ������: "' +E.Message + '". SQL: '+Q.SQL.Text+'.');
        Result := false;
        end;

    End;

//      INSERT INTO CALL_EVENTS
// (CALLFLOW, CALLID, CALLERIDNUM, CALLERIDNAME,
// CALLEDDID, CALLEDEXTENSION, CALLSTATUS, CALLEREXTENSION,
// CALLEDNUMBER, CALLAPIID)
// VALUES (:CALLFLOW, :CALLID, :CALLERIDNUM, :CALLERIDNAME,
// :CALLEDDID, :CALLEDEXTENSION, :CALLSTATUS, :CALLEREXTENSION,
// :CALLEDNUMBER, :CALLAPIID);

      if Q.Transaction.Active then
           Q.Transaction.Commit;

    if Result then
    try
      if (Cf = 1) and (Params.Values['CallStatus'] = 'CALLING') then //�������� ��������� � ������
        MF.SendCommandToUser(tel, '#outcomecall:' + Params.Values['CallID'] +
          ',' + Params.Values['CallAPIID'] + ',' +
          Params.Values['CalledNumber'], False)
      else
      if (Cf = 0) and (Params.Values['CallStatus'] = 'CALLING') then //�������� ��������� � ������
        MF.SendCommandToUser(tel, '#checkcall:' + Params.Values['CallID'] +
          ',' + Params.Values['CallAPIID'] + ',' +
          Params.Values['CallerIDNum'], False)
      else
        MF.SendCommandToUser('*', '#checksession:' + Params.Values['CallID'] +
          ',' + Params.Values['CallAPIID'] + ',' +
          Params.Values['CallerIDNum'], False);
    except

    end;
  finally
      Q.Transaction.Free;
      FreeAndNil(Q);
  end;
 except

 end;
end;*)

procedure TMF.AddLog(Logstr: string; ALock: Boolean=true);
 var
  F : TextFile;
  LogStr2 :string;
  FileName : String;
begin
  LogStr2 :=  DateTimeToStr(Now) + ' - '+LogStr;

  FileName := ExtractFilePath(Application.ExeName) +   LogFile;
  if (ALock and LockMutex(LogMutex, MutexDelay)) or not ALock then
  try
    //CSectionLog.Enter;
    AssignFile(F, FileName);
    if FileExists(FileName) then
      Append(F)
    else
      Rewrite(F);

   if LogStr[1] = '#' then
     WriteLn(F,  ' ');

    WriteLn(F,  LogStr2);


    try CloseFile(F); except end;
    //CSectionLog.Leave;

    if DebugMode_cb.Checked then
    begin
       AddLogMemo(LogStr2, false);
       //if LogStr[1] = '#' then Log_memo.Lines.Add('');
       //Log_memo.Lines.Add(LogStr2);
    end;
  finally
    if ALock then
      UnlockMutex(LogMutex);
  end;
end;


procedure TMF.AddLogMemo(Logstr: string; ALock: Boolean=true);
var
  fLock: Boolean;
begin
  if (ALock and LockMutex(LogMutex, MutexDelay)) or not ALock then
  try
    Log_memo.Lines.BeginUpdate;
    if LogStr[1] = '#' then
      Log_memo.Lines.Add('');
    Log_memo.Lines.Add(Logstr);
  finally
    Log_memo.Lines.EndUpdate;
    if ALock then
      UnLockMutex(LogMutex);
  end;
end;

procedure TMF.AfterOutcomCall(Sender: TObject);
begin
  SendCommandToUser(TPhoneCalls(Sender).Extension, '#callid:' + TPhoneCalls(Sender).CallId);
end;


function TMF.BroadcastMsg(const bmsg: String): boolean;
var
  i: Integer;
  Context: TMyContext;
  List: TList;
begin
  if not Assigned(TCPServer.Contexts) then
    Exit;
   try
   List := TCPServer.Contexts.LockList;
   for I := 0 to List.Count-1 do
    begin
      Context := TMyContext(List[I]);
      try
        Context.Connection.IOHandler.WriteLn(bmsg);
      except
         AddLogMemo('������ �������� ���������: ' +
          Context.Nick + ': ' + bmsg + #13#10 +
          Exception(ExceptObject).Message);
          Context.Connection.IOHandler.Close;
      end;
      AddLogMemo('������� ��������� ��� ' + Context.Nick + ': ' + bmsg);
    end;
   finally
     TCPServer.Contexts.UnLockList;
   end;
end;

procedure TMF.btnPhoneClick(Sender: TObject);
begin
  AccessToken.GetToken;
  AddLogMemo('������� ����� �������');
end;

procedure TMF.Button1Click(Sender: TObject);
begin
  Tel_SRV.Active := false;
  Tel_srv.Bindings.Clear;

  try
    Tel_SRV.Bindings.Add.IP                                  := TelIP_edt.Text;
    Tel_SRV.Bindings[Tel_SRV.Bindings.Count - 1].Port        := TelPort_spin.Value ;
    Tel_SRV.Bindings.DefaultPort := TelPort_spin.Value;
    Tel_SRV.Active := true;

  Except
     on  E: Exception do begin
        AddLog('������ ������� ������ Call_Events : "' +e.Message+'"');

          TelStatus_lbl.Caption := '�� �������!';
          TelStatus_lbl.Font.Color := clMaroon;
     end;

  end;

  if Tel_SRV.Active = true then
  begin
  AddLog('#������ Call_Events �������� �� ���������� '
          + TelIP_edt.Text+':' + IntToStr(TelPort_spin.Value)+ TelURI_edt.Text);

          TelStatus_lbl.Caption := '��������';
          TelStatus_lbl.Font.Color := $00408000;
  end;
end;

procedure TMF.Button2Click(Sender: TObject);
var
  Caller: TPhoneCalls;
begin
  try
  TCPServer.Active := False;
  TCPServer.DefaultPort := edtSocketPort.Value;
  TCPServer.Active := true;

  //MsgThread := TMsgThread.Create(TCPServer);
  //MsgThread.Start;

  AddLog('#������ ������� �������. ����: ' + IntToStr(TCPServer.DefaultPort));
  except
    AddLogMemo('#������ ��� ������� ������ �������: ' +
      Exception(ExceptObject).Message);
  end;

  //Caller := TPhoneCalls.Create(AccessToken);
  //Caller.SimpleCall('104', '+79104579648');
end;

procedure TMF.Button4Click(Sender: TObject);
var
  i: Integer;
begin
 //BroadcastMsg('#msg:' + Edit1.Text);
 SendCommandToUser('*', '#msg:' + Edit1.Text);
end;

procedure TMF.Button5Click(Sender: TObject);
var
  i: Integer;
begin
  if not Assigned(Caller) then
    Exit;
  i:= Caller.StatusCall;
  //  Caller := TPhoneCalls.Create(AccessToken);
  //Caller.SimpleCall('755', '+79104579648');
end;

procedure TMF.Button6Click(Sender: TObject);
begin
  SendCommand('*', Edi
end;

procedure TMF.CallFinished(Sender: TObject);
begin
  //UpdateSession(TCallListener(Sender).CallId);
  SendCommandToUser(TCallListener(Sender).Extension, '#callfinish:' + TCallListener(Sender).CallId);
end;

function TMF.CreateRWQuery: TIBQuery;
var TR :TIBTransaction;
begin
  TR := TIBTransaction.Create(self);
  TR.DefaultDatabase := DB;
  TR.DefaultAction := TACommit;
  TR.AutoStopAction := saCommit;

  TR.Params.Add('isc_tpb_read_committed');
  TR.Params.Add('isc_tpb_rec_version');
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

function TMF.CreateRWSQL: TIBSQL;
var TR :TIBTransaction;
begin
  TR := TIBTransaction.Create(self);
  TR.DefaultDatabase := DB;
  TR.DefaultAction := TACommit;
  TR.AutoStopAction := saCommit;

  TR.Params.Add('isc_tpb_read_committed');
  TR.Params.Add('isc_tpb_rec_version');
  TR.Params.Add('isc_tpb_wait');

  result := TIBSQL.Create(self);
  result.Database := DB;
  result.Transaction := TR;

end;

procedure TMF.FormCreate(Sender: TObject);
begin
  CSection          := TCriticalSection.Create;
  CSectionFumigator := TCriticalSection.Create;
  CSectionSocket    := TCriticalSection.Create;
  CSectionCommand   := TCriticalSection.Create;
  CSectionLog       := TCriticalSection.Create;
  CSectionMsg       := TCriticalSection.Create;
  FActiveUsers      := TStringList.Create;

  AccessToken := TTelphinToken.Create;
  AccessToken.ClientKey := '1.5dVYsc31.XAW2KIdf~jpmzgUJY-VKt';
  AccessToken.SecretKey := 'R_39AzkxxI_7gWKgg96~Xt80PzxO~fd0';

  TCPServer.ContextClass := TMyContext;

end;

procedure TMF.FormDestroy(Sender: TObject);
begin
  //MsgThread.Terminate;
  //MsgThread.WaitFor;
  //MsgThread.Free;

  FreeAndNil(FActiveUsers);
  CSection.Release;
  CSectionFumigator.Release;
  CSectionSocket.Release;
  CSectionCommand.Release;
  CSectionLog.Release;
  CSectionMsg.Release;

  FreeAndNil(AccessToken);
  FreeAndNil(Caller);
end;

function TMF.GetUserSocket(ATelNum: string): TCustomWinSocket;
var
  i: Integer;
  f: Boolean;
  o: TObject;
begin
  i := -2;
  Result := nil;
  if not Assigned(FActiveUsers) then
    Exit;

  while i <> -1 do
  begin
    Result := nil;
    i := FActiveUsers.IndexOf(ATelNum);
    if i = -1 then
      Break;

    o := FActiveUsers.Objects[i];
    if Assigned(o) then
    begin
      try
        Result := TCustomWinSocket(o);
        f := Assigned(Result) and Result.Connected;
      except
        f := False;
      end;

      if f then
        break
      else
        try
          Result := nil;
          FActiveUsers.Delete(i);
        except
          Result := nil;
        end;
    end;
  end;
end;

procedure TMF.IBEventsEventAlert(Sender: TObject; EventName: string;
  EventCount: Integer; var CancelAlerts: Boolean);
begin
  try
    //LockMutex(EventsMutex, MutexDelay);

    AddLogMemo('#IBEvent: ' + EventName);
    if Copy(EventName,1,11) = 'INCOME_CALL' then
    begin
      //SendCommandToUser('*', '#checkcall:', false);
    end
    else

    if Copy(EventName,1,13) = 'SESSION_CLOSE' then
      //SendCommandToUser('*', '#checksession:', false)
    else

    if Copy(EventName,1,12) = 'ACCEPT_PHONE' then
      SendCommandToUser('*', '#checkacceptcall:', false)
  finally
    //UnLockMutex(EventsMutex);
    //CancelAlerts := True;
  end;
end;

function TMF.FumigatorCommand(ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo): Boolean;
var
  s: string;
  fumigatorFileName: string;
  Stream: TMemoryStream;
begin
  //������������ �������� action
  if ARequestInfo.Params.IndexOfName('action') < 0 then
    exit;

  fumigatorFileName := ExtractFilePath(Application.ExeName) + 'fumigator.exe';
  // �������� ������ fumigator.exe
  if ARequestInfo.Params.Values['action'] = 'getlastversion' then
  begin
    if not FileExists(fumigatorFileName) then
    begin
      AResponseInfo.ResponseNo := 404;
      Exit;
    end;

    s := FileVersion(fumigatorFileName);
    AResponseInfo.ContentText := s;
    AResponseInfo.ResponseNo := 200;
  end

  else
  // �������� ���� fumigator.exe
  if ARequestInfo.Params.Values['action'] = 'getlastfile' then
  begin
    if not FileExists(fumigatorFileName) then
    begin
      AResponseInfo.ResponseNo := 404;
      Exit;
    end;

    Stream := TMemoryStream.Create;
    try
      Stream.LoadFromFile(fumigatorFileName);
      Stream.Position := 0;
      AResponseInfo.ContentStream := Stream;
      AResponseInfo.ContentLength := Stream.Size;
      AResponseInfo.ContentDisposition := 'attachment; filename=' + ExtractFileName(fumigatorFileName);
      AResponseInfo.ContentType   := 'application/octet-stream';
      AResponseInfo.ResponseNo    := 200;

      AResponseInfo.WriteHeader;
      AResponseInfo.WriteContent;
    finally
      //Stream.Free;
    end;
  end

end;

function TMF.SendCommandToUser(atsnum, command: string; ALock: Boolean=true): Boolean;
var
  i, p: Integer;
  List: TList;
  Context: TMyContext;
begin
  (*Result := False;
  if Assigned(MF.MsgThread) then
  begin
    MF.MsgThread.AddMsg(atsnum, command);
    Result := False;
  end;
  Exit;*)

  try
    if ALock then
     CSectionCommand.Enter;
    if atsnum <> '*' then
    begin
      p := Pos('*', atsnum);
      if p > 0 then
        atsnum := Copy(atsnum, p + 1, Length(atsnum));
      AddLogMemo('#' + command +' atsnum = ' + atsnum);

      //Log_memo.Lines.Add('#�������� ���������: ' + command);
      try
        (*if TCPServer.Contexts.Count > 0 then
          with TCPServer.Contexts.LockList do
          try
            TMyContext(Items[0]).SendMsg(atsnum, command);
          finally
            TCPServer.Contexts.UnlockList;
          end;*)

        SendMsg(atsnum, command);
        //Application.ProcessMessages;
      except
        AddLogMemo('#������ ���������: ' + command + #13#10 +
        Exception(ExceptObject).Message);
      end;

    end

    else   //����
    begin
        AddLogMemo('#�������� ���� ���������: ' + command);
        if TCPServer.Contexts.Count > 0 then
          (*with TCPServer.Contexts.LockList do
          try
            TMyContext(Items[0]).BroadcastMsg(command);
          finally
            TCPServer.Contexts.UnlockList;
          end; *)
          BroadcastMsg(command);
        //BroadcastMsg(command);
        // Application.ProcessMessages;
      (*except

      end; *)
    end;
  finally
    if ALock then
      CSectionCommand.Leave;
  end;
end;

function TMF.SendMsg(const ANick, AMsg: String): Boolean;
var
  List: TList;
  Context: TMyContext;
  I: Integer;
begin
  Result := False;
  //FContextList is inherited from TIdContext
  List := TCPServer.Contexts.LockList;
  try
    for I := 0 to List.Count-1 do
    begin
      Context := TMyContext(List[I]);
      if lowercase(Context.Nick) = lowercase(ANick) then
      begin
        try
          Context.Connection.IOHandler.WriteLn(AMsg);
          Result := True;
        except
          Context.Connection.IOHandler.Close;
           Exit;
        end;
      end;
    end;
  finally
    TCPServer.Contexts.UnlockList;
  end;
end;

function TMF.SocketCommand(cmd, arg: string): Boolean;
var
  p: Integer;
  argList: TStringList;
begin
  argList := TStringList.Create;
  try
     argList.DelimitedText := arg;
    if cmd = 'call' then
    begin
      if not Assigned(Caller) then
      begin
        Caller := TPhoneCalls.Create(AccessToken);
        Caller.OnAfterCall  := AfterOutcomCall;
        //Caller.OnCallFinish := CallFinished;
      end;
      Caller.SimpleCall(argList[0], argList[1], argList[2]);
    end

    else
    if cmd = 'calldelete' then
    begin
      if not Assigned(Caller) then
      begin
        Caller := TPhoneCalls.Create(AccessToken);
        Caller.OnAfterCall  := AfterOutcomCall;
       // Caller.OnCallFinish := CallFinished;
      end;
      Caller.DeleteCall(argList[0]);
    end

    else
    if cmd = 'callaccept' then  // ����� ������
    begin
      AddLogMemo('callaccept');
      AcceptCall(argList[0], argList[1]);

      if not Assigned(Caller) then
      begin
        Caller := TPhoneCalls.Create(AccessToken);
        Caller.OnAfterCall  := AfterOutcomCall;
       // Caller.OnCallFinish := CallFinished;
      end;
      Caller.PickUpCall(argList[0], argList[1]);
    end
  finally
    argList.Free;
  end;
end;

procedure TMF.TCPServerConnect(AContext: TIdContext);
begin
  AContext.Connection.IOHandler.DefStringEncoding := IndyTextEncoding_UTF8;
  with TMyContext(AContext) do
  begin
    Con := Now;
    if (Connection.Socket <> nil) then
    begin
      IP := Connection.Socket.Binding.PeerIP;
      MF.AddLogMemo('#������������� �������');
    end;
    //Nick := Connection.IOHandler.ReadLn;
    //BroadcastMsg('addlist|' + Nick);
  end;
end;

procedure TMF.TCPServerDisconnect(AContext: TIdContext);
begin
//tmycontext(acontext).broadcastMsg('deletelist|' + tmycontext(acontext).Nick);
  AddLogMemo('#������������ �������: ' + TMyContext(AContext).Nick);
end;

procedure TMF.TCPServerExecute(AContext: TIdContext);
var
  p: Integer;
  s, cmd, arg: string;
begin
  try
    if not AContext.Connection.Connected then
      Exit;

    try
      s := AContext.Connection.IOHandler.ReadLn;
    except
      AContext.Connection.IOHandler.Close;
    end;

    if s = '' then
      Exit;

    AddLogMemo('#������ ������� ���������: ' + s);
    if Copy(s, 1, 1) = '#' then
    begin
      p := Pos(':', s);
      cmd := Copy(s, 2, p - 2);
      arg := Copy(s, p + 1, Length(s));

      if cmd = 'setphone' then
      begin
        TMyContext(AContext).Nick := arg;
        try
          AContext.Connection.IOHandler.WriteLn('#servertime:' + IntToStr(SecondOfTheDay(Now)));
        except
          try AContext.Connection.IOHandler.Close; except end;
          AddLogMemo('#������ ������: ' +Exception(ExceptObject).Message);
        end;
      end
      else
        SocketCommand(cmd, arg);

    end;
  except

  end;

end;

procedure TMF.Tel_SRVCommandGet(AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
var
  LogList: TStringList;
begin
  if ARequestInfo.URI = '/fumigator' then
  try
    CSectionFumigator.Enter;
    FumigatorCommand(ARequestInfo, AResponseInfo);
  finally
    CSectionFumigator.Leave;
  end;

// ����� ���������
if ARequestInfo.URI = Trim(TelURI_edt.Text) then

    //Addlog('#����������� ������� �� ������ Call_Events');
    //AddLogMemo(ARequestInfo.URI);
    //AddLogMemo(ARequestInfo.Params.Text);
    try
      CSection.Enter;
    if (ARequestInfo.URI = Trim(TelURI_edt.Text)) then

      try
        LogList := TStringList.Create;
        LogList.Add('#����������� ������� �� ������ Call_Events');
        LogList.Add(ARequestInfo.URI);
        LogList.Add(ARequestInfo.Params.Text);
        AddLog(LogList.Text);
      finally
        LogList.Free;
        AddCallEvent(ARequestInfo.Params);
        //if (ServerSocket.Socket.ActiveConnections > 0) then
//          if AddCallEvent(ARequestInfo.Params) = true then
//            AddLog('������� Call Events � ID: '+ ARequestInfo.Params.Values['CallID']+ ' - '
//               + ARequestInfo.Params.Values['CallStatus']);
      end
    else
      Addlog('������ �� �������� ������ Call_Events, ���� �������� URI.');
  finally
    CSection.Leave;
  end;

end;

procedure TMF.TestDb_btnClick(Sender: TObject);
begin

  try
    DB.Close;
    DB.Params.Clear;
    DB.DatabaseName := DBPath_edt.Text;
    DB.Params.Add('USER_NAME='+DBUser_edt.Text );
    DB.Params.Add('PASSWORD=' + DBPass_edt.Text);
    DB.Open;
  except
    on E: Exception do begin
       AddLog('#�� ������� ������������ � ��. ��������� ���������. ����� ������ "'+E.Message+'"');

    DBStatus_lbl.Caption := '�� �����������';
    DBStatus_lbl.Font.Color := clMaroon;
    end;
  end;

  if Db.Connected then  begin
    AddLog('#���������� � �� �����������.');

    DBStatus_lbl.Caption := '�����������';
    DBStatus_lbl.Font.Color := $00408000;

    IBEvents.RegisterEvents;
    QPhones.Open;
  end;

end;

function TMF.UpdateSession(ACallId: string): Boolean;
var Q :TIBQuery;
begin
  try
    if not DB.Connected then
      Exit;

    Q := CreateRWQuery;
    Q.SQL.Text := Format('update sessions set endtime=current_timestamp(3) where callid=''%s''', [ACallId]);

    Try
      Q.ExecSQL;
      Result := true;
    Except
      on E : Exception do
      begin
        AddLog('#������ ���������� ������: "' +E.Message + '". SQL: '+Q.SQL.Text+'.');
        Result := false;
      end;

    End;

    if Q.Transaction.Active then
      Q.Transaction.Commit;

  finally
    Q.Transaction.Free;
    FreeAndNil(Q);
  end;
end;

Function TMyContext.SendMsg(const ANick: String; const AMsg:String) : Boolean;
var
  List: TList;
  Context: TMyContext;
  I: Integer;
begin
  Result := False;
  //FContextList is inherited from TIdContext
  List := FContextList.LockList;
  try
    for I := 0 to List.Count-1 do
    begin
      Context := TMyContext(List[I]);
      if lowercase(Context.Nick) = lowercase(ANick) then
      begin
        try
          Context.Connection.IOHandler.WriteLn(AMsg);
          Result := True;
        except
          Context.Connection.IOHandler.Close;
        end;
        Exit;
      end;
    end;
  finally
    FContextList.UnlockList;
  end;
end;

procedure TMyContext.SendFile(const ANick,Fn:string);
var
        List: TList;
        Context: TMyContext;
        I: Integer;
        FStream: TFileStream;
//IdStream : TIdStreamVCL;
begin
 (*  // FContextList is inherited from TIdContext
    List := FContextList.LockList;
    try
        for I := 0 to List.Count-1 do
        begin
            Context := TMyContext(List[I]);
            if Context.Nick = ANick then
            begin
                try
   // Context.Connection.IOHandler.WriteLn(AMsg+'@'+ANick+':'+fromNick );
   //Self.Connection.IOHandler.WriteLn('Msg sent to ' + ANick + '>>' + AMsg);
    //showmessage('Reach that bit');
    FStream := TFileStream.Create(fn, fmOpenRead or fmShareDenyWrite);
    //showmessage('FStream created');
    try
        //IdStream := TIdStreamVCL.Create(fstream);
       // showmessage('IDStream created');
        try

            Context.Connection.IOHandler.WriteLn('pic@'+fn+';Sending file...');
            Context.Connection.IOHandler.Write(IdStream, 0, True);
            Context.Connection.IOHandler.WriteLn('done!');
        finally
            IdStream.Free;
        end;
    finally
        FStream.Free;
    end;


   except
                end;
                Exit;
            end;
        end;
    finally
        FContextList.UnlockList;
    end;
    Self.Connection.IOHandler.WriteLn('msg from SendFile Procedure : The name you send the message to does not exist. Please click on ''Get list of Names on Chat'' button to get a full list of names.');*)
end;


//******broadcast procedures *******//
procedure TMycontext.BroadcastMsgAll(const ANick: String; const bmsg: String);
var
    List: TList;
    Context: TMyContext;
    I: Integer;
begin
    // FContextList is inherited from TIdContext
    List := FContextList.LockList;
    try
        for I := 0 to List.Count-1 do
        begin
            Context := TMyContext(List[I]);
            if Context <> Self  then try
                Context.Connection.IOHandler.WriteLn(ANick + '> ' + bmsg);

            except end;
        end;
    finally
        FContextList.UnlockList;
    end;
end;

procedure TMyContext.BroadcastMsg(const bmsg: String);
var
  List: TList;
  Context: TMyContext;
  I: Integer;
begin
  // FContextList is inherited from TIdContext
  List := FContextList.LockList;
  try
    for I := 0 to List.Count-1 do
    begin
      Context := TMyContext(List[I]);
      //if Context <> Self then
      try
        Context.Connection.IOHandler.WriteLn(bmsg);
      except
        Context.Connection.IOHandler.Close;
      end;
    end;
  finally
    FContextList.UnlockList;
  end;
end;

procedure TMyContext.SendNicks;
begin

end;
(*var
  List: TList;
  Context: TMyContext;
  I: Integer;
  ServerSettingsFile : TINIFile;
  strings : TStringlist;
begin
  List := FContextList.LockList;
  try
    Connection.IOHandler.WriteLn('list|clear');

    //gee lys terug
    if List.Count > 1 then
    begin
      for I := 0 to List.Count -1 do
      begin
        Context := TMyContext(List[I]);
        if Context <> Self then
          Connection.IOHandler.WriteLn('list|'+ Context.Nick);
      end;
    end;

    //groups
    ServerSettingsFile := TINIFile.Create(MainDir(True) + 'ServerSettings.ini');
    Strings := TStringlist.Create;
    ServerSettingsFile.ReadSection('groups', Strings);
    if Strings.Count <> 0 then
      for i := 0 to strings.Count -1 do
        Connection.IOHandler.WriteLn('list|' + Strings[i]);

  finally
    FContextList.UnlockList;
  end;
end;*)

{ TMsgThread }

procedure TMsgThread.AddMsg(Ato, AMsg: string);
begin
  if not Assigned(FServer.Contexts) or
    (Assigned(FServer.Contexts) and (FServer.Contexts.Count = 0)) then
    Exit;

  if LockMutex(MsgMutex, MutexDelay) then
  try

    try
      fAddMsg := True;
      FMsgList.BeginUpdate;
      FMsgList.Add(Ato + '=' + AMsg);
    finally
      FMsgList.EndUpdate;
      fAddMsg := false;
    end;
  finally
    //CSectionMsg.Leave;
    UnlockMutex(MsgMutex);
  end
  else
    MF.AddLogMemo('������ �������� AddMsg');
end;

function TMsgThread.BroadcastMsg(const bmsg: String): boolean;
var
  i: Integer;
  Context: TMyContext;
begin
  if not Assigned(FContList) then
    Exit;
   for I := 0 to FContList.Count-1 do
    begin
      Context := TMyContext(FContList[I]);

      //TMF(FServer.Owner).Log_memo.Lines.Add('�������� ��������� ��� ' + Context.Nick + ': ' + bmsg);
      try
        Context.Connection.IOHandler.WriteLn(bmsg);
      except
        TMF(FServer.Owner).AddLogMemo('������ �������� ���������: ' +
          Context.Nick + ': ' + bmsg + #13#10 +
          Exception(ExceptObject).Message);
          Context.Connection.IOHandler.Close;
      end;
      TMF(FServer.Owner).AddLogMemo('������� ��������� ��� ' + Context.Nick + ': ' + bmsg);
    end;
end;

constructor TMsgThread.Create(AServer: TIdTCPServer);
begin
  FServer := AServer;
  FMsgList := TStringList.Create;
  inherited Create(true);
end;

destructor TMsgThread.Destroy;
begin
  FMsgList.Free;
  inherited;
end;

procedure TMsgThread.Execute;
var
  List: TList;
  cnt, step, cur: Integer;
  f: Boolean;
  s: string;
  flock: Boolean;
  fList: TStringList;
begin
 try
   fList := TStringList.Create;

  while not Terminated do
  begin
    if not (Terminated or not Assigned(FServer.Contexts) or
      (Assigned(FServer.Contexts) and (FServer.Contexts.Count = 0)) or
           (FMsgList.Count = 0) or fAddMsg) then

    //if LockMutex(MsgMutex, 5000) then
    try
      try
        fExecute := True;
        fList.Assign(FMsgList);
        FMsgList.Clear;
      finally
        fExecute := False;
      end;
      cnt := fList.Count;

      cur := 0; step := 0;

        FContList := FServer.Contexts.LockList;
        fList.BeginUpdate;
        while (step < cnt) and Assigned(FContList) do
        begin
          f := False;
          if fList.Names[cur] = '*' then
            f := BroadcastMsg(fList.ValueFromIndex[cur])
          else
            f := SendMsg(fList.Names[cur], fList.ValueFromIndex[cur]);

          Inc(step);
          if f then
            fList.Delete(cur)
          else
             Inc(cur);
        end;

      finally
        fList.EndUpdate;
        FServer.Contexts.UnLockList;
        fExecute := False;
        //UnlockMutex(MsgMutex);
      end;
     // else
     //   MF.AddLogMemo('������ �������� Execute');

      Sleep(200);
    end;
 finally
    fList.Free;
 end;
end;


function TMsgThread.SendMsg(const ANick, AMsg: String): Boolean;
var
  List: TList;
  Context: TMyContext;
  I: Integer;
begin
  Result := False;
  if not Assigned(FContList) then
    Exit;

    for I := 0 to FContList.Count-1 do
    begin
      Context := TMyContext(FContList[I]);
      if lowercase(Context.Nick) = lowercase(ANick) then
      begin
        try
          Context.Connection.IOHandler.WriteLn(AMsg);
          MF.AddLogMemo('������� ��������� ��� ' + ANick + ':' + AMsg);
          Result := True;
        except
          Context.Connection.IOHandler.Close;
          Result := False;
          TMF(FServer.Owner).AddLogMemo('������ �������� ���������: ' +
          ANick + ': ' + AMsg + #13#10 +
          Exception(ExceptObject).Message);
        end;
      end;
    end;
end;

{ TDbWriter }

constructor TDbWriter.Create(ADb: TIBDatabase; AParam: TStrings;
  ASql: string);
begin
  inherited Create(true);
  fDb := ADb;
  fIBSQL := CreateIBSql(ADb);
  fIBSQL.SQL.Text := ASql;
  fParams := TStringList.Create;
  fParams.Assign(AParam);
  //self.FreeOnTerminate := True;
  //Resume;
end;

function TDbWriter.CreateIBSql(ADB: TIBDatabase): TIBSQL;
var
  TR :TIBTransaction;
begin
  TR := TIBTransaction.Create(nil);
  TR.DefaultDatabase := ADB;
  TR.DefaultAction := TACommit;
  TR.AutoStopAction := saCommit;

  TR.Params.Add('isc_tpb_read_committed');
  TR.Params.Add('isc_tpb_rec_version');
  TR.Params.Add('isc_tpb_wait');

  result := TIBSQL.Create(nil);
  result.Database := ADB;
  result.Transaction := TR;
end;

destructor TDbWriter.Destroy;
begin
  fParams.Free;
  if Assigned(fIBSQL) then
  begin
    fIBSQL.Transaction.Free;
    fIBSQL.Free;
  end;
  inherited;
end;

procedure TDbWriter.Execute;
var
  Cf :Byte;
  p: Integer;
begin
  try
    fIBSQL.Transaction.Active := True;
    //fIBSQL.SQL.Text := fSQL;
    if fParams.Values['CALLFLOW'] = 'in' then
      cf := 0
    else
      cf := 1;

    with fIBSQL do
    begin
      Transaction.Active := True;
      ParamByName('CALLFLOW').AsInteger       := cf;
      ParamByName('CALLID').AsString          := fParams.Values['CallID'];
      ParamByName('CALLERIDNUM').AsString     := fParams.Values['CallerIDNum'];
      ParamByName('CALLERIDNAME').AsString    := fParams.Values['CallerIDName'];
      ParamByName('CALLEDDID').AsString       := fParams.Values['CalledDID'];
      ParamByName('CALLEREXTENSION').AsString := fParams.Values['CallerExtension'];
      ParamByName('CALLSTATUS').AsString      := fParams.Values['CallStatus'];
      ParamByName('CALLEDEXTENSION').AsString := fParams.Values['CalledExtension'];
      ParamByName('CALLEDNUMBER').AsString    := fParams.Values['CalledNumber'];
      ParamByName('CALLAPIID').AsString       := fParams.Values['CallAPIID'];

      Try
        ExecQuery;
        fMess := '������� Call Events � ID: '+ fParams.Values['CallID']+ ' - '
             + fParams.Values['CallStatus'];
        Synchronize(Log);
      Except
        on E : Exception do
        begin
          if Transaction.Active then
             Transaction.Rollback;
          fMess := ('#������ ������ Call_Events! ������: "' +E.Message + '". SQL: '+ SQL.Text+'.');
          Synchronize(Log);
        end;
      End;

      if Transaction.Active then
        try
           CSectionMsg.Enter;
           Transaction.Commit;
        finally
           CSectionMsg.Leave;
        end;
    end;
  finally
    Self.Free;
  end;
end;

procedure TDbWriter.Log;
begin
  MF.AddLogMemo(fMess);
end;

initialization
  LogMutex := CreateMutex(nil, False,
    Pchar(ExtractFileName((Application.ExeName))));
  MsgMutex := CreateMutex(nil, False,
    Pchar(ExtractFileName((Application.ExeName)) + '_' + 'msg'));
  EventsMutex := CreateMutex(nil, False,
    Pchar(ExtractFileName((Application.ExeName)) + '_' + 'events'));

finalization
  CloseHandle(LogMutex);
  CloseHandle(MsgMutex);
  CloseHandle(EventsMutex);
end.
