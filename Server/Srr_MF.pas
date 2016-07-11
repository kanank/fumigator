unit Srr_MF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.Samples.Spin, IdBaseComponent, IdComponent, IdCustomTCPServer,
  IdCustomHTTPServer, IdHTTPServer, IdContext, Data.DB, IBX.IBDatabase,
  IBX.IBCustomDataSet, IBX.IBQuery, SyncObjs, System.Win.ScktComp,
  TelpinAPI, IBX.IBEvents, IdTCPServer, idSync, IdGlobal, IdAntiFreezeBase,
  Vcl.IdAntiFreeze;

type
  TMsgThread = class(TThread)
  protected
    FServer: TIdTCPServer;
    FMsgList: TStringList;
    FContList: TList;
    fAddMsg: Boolean;
    procedure Execute; override;
  public
    procedure AddMsg(Ato: string; AMsg: string);
    constructor Create(AServer: TIdTCPServer); overload;
    destructor Destroy; override;
    function SendMsg(const ANick: String; const AMsg: String) : Boolean;
    function BroadcastMsg(const bmsg: String): boolean;
  end;

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
    ServerSocket: TServerSocket;
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
    IdAntiFreeze1: TIdAntiFreeze;
    procedure Button1Click(Sender: TObject);
    procedure Tel_SRVCommandGet(AContext: TIdContext;
      ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
    procedure TestDb_btnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ServerSocketClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocketClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure btnPhoneClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure ServerSocketClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure IBEventsEventAlert(Sender: TObject; EventName: string;
      EventCount: Integer; var CancelAlerts: Boolean);
    procedure ServerSocketClientError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure Button6Click(Sender: TObject);
    procedure TCPServerConnect(AContext: TIdContext);
    procedure TCPServerDisconnect(AContext: TIdContext);
    procedure TCPServerExecute(AContext: TIdContext);
  private
    FActiveUsers: TStringList;
    procedure AddLog (Logstr :string; ALock: boolean);
    procedure AddLogMemo(Logstr :string);
    Function AddCallEvent(Params :TStrings) :Boolean;
    Function FumigatorCommand(ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo) :Boolean; //выполнение комманд от клиентов прокадо
    function SocketCommand(cmd, arg: string): Boolean;
    function CreateRWQuery :TIBQuery;

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
  end;

  const
       LogFile = 'Srv_Log.txt';

var
  MF: TMF;
  LogMutex: THandle;

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
        AddLog('#Ошибка захвата звонка: "' +E.Message + '". SQL: '+Q.SQL.Text+'.');
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
var Q :TIBQuery;
    Cf :Byte;
    Fld :string;
    userid, tel: string;
    p: Integer;
begin
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

  if userid = edtUserId.Text then //только нужную АТС отсекаем
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

      if (Cf = 1) and (Params.Values['CallStatus'] = 'CALLING') then //посылаем сообщение о звонке
      SendCommandToUser(tel, '#outcomecall:' + Params.Values['CallID'] +
          ',' + Params.Values['CallAPIID'] + ',' +
          Params.Values['CalledNumber'], False);
    Except
    on E : Exception
        do begin
        AddLog('#Ошибка записи Call_Events! Ошибка: "' +E.Message + '". SQL: '+Q.SQL.Text+'.');
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

  finally
      Q.Transaction.Free;
      FreeAndNil(Q);
  end;

end;

procedure TMF.AddLog(Logstr: string);
 var
  F : TextFile;
  LogStr2 :string;
  FileName : String;
begin
  LogStr2 :=  DateTimeToStr(Now) + ' - '+LogStr;

  FileName := ExtractFilePath(Application.ExeName) +   LogFile;
  try
    CSectionLog.Enter;
    AssignFile(F, FileName);
    if FileExists(FileName) then
      Append(F)
    else
      Rewrite(F);

   if LogStr[1] = '#' then
     WriteLn(F,  ' ');

    WriteLn(F,  LogStr2);

  finally
    try CloseFile(F); except end;
    CSectionLog.Leave;
  end;
  if DebugMode_cb.Checked then
  begin
     AddLogMemo(LogStr2);
     //if LogStr[1] = '#' then Log_memo.Lines.Add('');
     //Log_memo.Lines.Add(LogStr2);
  end;
end;


procedure TMF.AddLogMemo(Logstr: string; ALock: boolean);
var
  fLock: Boolean;
begin
  if ALock and LockMutex(LogMutex, 5000) then
  try
    if LogStr[1] = '#' then
      Log_memo.Lines.Add('');
    Log_memo.Lines.Add(Logstr);
  finally
    if ALock then
      UnLockMutex(LogMutex);
  end;
end;

procedure TMF.AfterOutcomCall(Sender: TObject);
begin
  SendCommandToUser(TPhoneCalls(Sender).Extension, '#callid:' + TPhoneCalls(Sender).CallId);
end;


procedure TMF.btnPhoneClick(Sender: TObject);
begin
  AccessToken.GetToken;
  AddLogMemo('Получен токен доступа');
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
        AddLog('Ошибка запуска службы Call_Events : "' +e.Message+'"');

          TelStatus_lbl.Caption := 'Не активен!';
          TelStatus_lbl.Font.Color := clMaroon;
     end;

  end;

  if Tel_SRV.Active = true then
  begin
  AddLog('#Служба Call_Events запущена на интерфейсе '
          + TelIP_edt.Text+':' + IntToStr(TelPort_spin.Value)+ TelURI_edt.Text);

          TelStatus_lbl.Caption := 'Работает';
          TelStatus_lbl.Font.Color := $00408000;
  end;
end;

procedure TMF.Button2Click(Sender: TObject);
var
  Caller: TPhoneCalls;
begin
  try
  (*ServerSocket.Close;
  ServerSocket.Port := edtSocketPort.Value;
  ServerSocket.Open;*)

  TCPServer.Active := False;
  TCPServer.DefaultPort := edtSocketPort.Value;
  TCPServer.Active := true;

  MsgThread := TMsgThread.Create(TCPServer);
  MsgThread.Start;

  AddLog('#Сервер сокетов запущен. Порт: ' + IntToStr(ServerSocket.Port));
  except
    Log_memo.Lines.Add('#Ошибка при запуске сервер сокетов: ' +
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
  FActiveUsers.Clear;
  //GetUserSocket('755');
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


procedure TMF.FormCreate(Sender: TObject);
begin
  CSection          := TCriticalSection.Create;
  CSectionFumigator := TCriticalSection.Create;
  CSectionSocket    := TCriticalSection.Create;
  CSectionCommand   := TCriticalSection.Create;
  CSectionLog       := TCriticalSection.Create;
  FActiveUsers      := TStringList.Create;

  AccessToken := TTelphinToken.Create;
  AccessToken.ClientKey := '1.5dVYsc31.XAW2KIdf~jpmzgUJY-VKt';
  AccessToken.SecretKey := 'R_39AzkxxI_7gWKgg96~Xt80PzxO~fd0';

  TCPServer.ContextClass := TMyContext;
end;

procedure TMF.FormDestroy(Sender: TObject);
begin
  MsgThread.Terminate;
  MsgThread.WaitFor;
  MsgThread.Free;

  FreeAndNil(FActiveUsers);
  CSection.Release;
  CSectionFumigator.Release;
  CSectionSocket.Release;
  CSectionCommand.Release;
  CSectionLog.Release;

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
  AddLogMemo('#IBEvent: ' + EventName);
  if Copy(EventName,1,11) = 'INCOME_CALL' then
  begin
    SendCommandToUser('*', '#checkcall:', false)
  end
  else

  if Copy(EventName,1,13) = 'SESSION_CLOSE' then
    SendCommandToUser('*', '#checksession:', false)
  else

  if Copy(EventName,1,12) = 'ACCEPT_PHONE' then
    SendCommandToUser('*', '#checkacceptcall:', false)
end;

function TMF.FumigatorCommand(ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo): Boolean;
var
  s: string;
  fumigatorFileName: string;
  Stream: TMemoryStream;
begin
  //обязательный параметр action
  if ARequestInfo.Params.IndexOfName('action') < 0 then
    exit;

  fumigatorFileName := ExtractFilePath(Application.ExeName) + 'fumigator.exe';
  // получить версию fumigator.exe
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
  // получить файл fumigator.exe
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
  MsgThread.AddMsg(atsnum, command);
  Exit;

  try
    if ALock then
     CSectionCommand.Enter;
    if atsnum <> '*' then
    begin
      p := Pos('*', atsnum);
      if p > 0 then
        atsnum := Copy(atsnum, p + 1, Length(atsnum));
      Log_memo.Lines.Add('#' + command +' atsnum = ' + atsnum);

      //Log_memo.Lines.Add('#Посылаем сообщение: ' + command);
      try
        if TCPServer.Contexts.Count > 0 then
          with TCPServer.Contexts.LockList do
          try
            TMyContext(Items[0]).SendMsg(atsnum, command);
          finally
            TCPServer.Contexts.UnlockList;
          end;
        //SendMsg(atsnum, command);
        //Application.ProcessMessages;
      except
        Log_memo.Lines.Add('#Ошибка сообщения: ' + command + #13#10 +
        Exception(ExceptObject).Message);
      end;

    end

    else   //всем
    begin
        Log_memo.Lines.Add('#Посылаем всем сообщение: ' + command);

        if TCPServer.Contexts.Count > 0 then
          with TCPServer.Contexts.LockList do
          try
            TMyContext(Items[0]).BroadcastMsg(command);
          finally
            TCPServer.Contexts.UnlockList;
          end;
                 (* if TCPServer.Contexts.Count > 0 then
          TMyContext(TCPServer.Contexts[0]).BroadcastMsg(command);
        //BroadcastMsg(command);
        // Application.ProcessMessages;
      except

      end; *)
    end;
  finally
    if ALock then
      CSectionCommand.Leave;
  end;
end;

procedure TMF.ServerSocketClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
   Log_memo.Lines.Add('#Присоединение клиента');
end;

procedure TMF.ServerSocketClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
var
  i: Integer;
begin
  try
    CSectionSocket.Enter;
    i := FActiveUsers.IndexOfObject(Socket);
    if i > -1 then
    begin
      FActiveUsers.Delete(i);
      Log_memo.Lines.Add('#Отсоединение клиента');
    end;
  finally
    CSectionSocket.Leave;
  end;
end;

procedure TMF.ServerSocketClientError(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  ErrorCode := 0;
end;

procedure TMF.ServerSocketClientRead(Sender: TObject; Socket: TCustomWinSocket);
var
  p: Integer;
  s, cmd, arg: string;
begin
  try
    try
      CSectionSocket.Enter;

      s := Socket.ReceiveText;
      Log_memo.Lines.Add('#Клиент прислал сообщение: ' + s);
      if Copy(s, 1, 1) = '#' then
      begin
        p := Pos(':', s);
        cmd := Copy(s, 2, p - 2);
        arg := Copy(s, p + 1, Length(s));

        if cmd = 'setphone' then
        begin
          FActiveUsers.AddObject(arg, Socket);
          Socket.SendText('#servertime:' + IntToStr(SecondOfTheDay(Now)));
          Application.ProcessMessages;
        end
        else
          SocketCommand(cmd, arg);

      end;
    except

    end;
  finally
    CSectionSocket.Leave;
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
    if cmd = 'callaccept' then  // взяли звонок
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
      IP := Connection.Socket.Binding.PeerIP;
    
    //Nick := Connection.IOHandler.ReadLn;
    //BroadcastMsg('addlist|' + Nick);
  end;
end;

procedure TMF.TCPServerDisconnect(AContext: TIdContext);
begin
//tmycontext(acontext).broadcastMsg('deletelist|' + tmycontext(acontext).Nick);
  AddLogMemo('#Отсоединение клиента: ' + TMyContext(AContext).Nick);
end;

procedure TMF.TCPServerExecute(AContext: TIdContext);
var
  p: Integer;
  s, cmd, arg: string;
begin
  try
    if not AContext.Connection.Connected then
      Exit;

    s := AContext.Connection.IOHandler.ReadLn;
    if s = '' then
      Exit;

    AddLogMemo('#Клиент прислал сообщение: ' + s, false);
    if Copy(s, 1, 1) = '#' then
    begin
      p := Pos(':', s);
      cmd := Copy(s, 2, p - 2);
      arg := Copy(s, p + 1, Length(s));

      if cmd = 'setphone' then
      begin
        TMyContext(AContext).Nick := arg;

        AContext.Connection.IOHandler.WriteLn(AnsiToUtf8('#servertime:' + IntToStr(SecondOfTheDay(Now))));
        //Application.ProcessMessages;
      end
      else
        SocketCommand(cmd, arg);

    end;
  except
    AddLogMemo('#Ошибка чтения: ' +Exception(ExceptObject).Message);
  end;

end;

procedure TMF.Tel_SRVCommandGet(AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
begin

  if ARequestInfo.URI = '/fumigator' then
  try
    CSectionFumigator.Enter;
    FumigatorCommand(ARequestInfo, AResponseInfo);
  finally
    CSectionFumigator.Leave;
  end;

// новое Вхождение
if ARequestInfo.URI = Trim(TelURI_edt.Text) then
  try
    CSection.Enter;

    Addlog('#Поступление события на службы Call_Events');
    AddLogMemo(ARequestInfo.URI);
    AddLogMemo(ARequestInfo.Params.Text);

    if (ARequestInfo.URI = Trim(TelURI_edt.Text)) then
    begin
      //if (ServerSocket.Socket.ActiveConnections > 0) then
        if AddCallEvent(ARequestInfo.Params) = true then
          AddLog('Событие Call Events с ID: '+ ARequestInfo.Params.Values['CallID']+ ' - '
             + ARequestInfo.Params.Values['CallStatus']);

    //Входящий с мобильного
    //CallID=1429413884.1298580
    //CallerIDNum=+79086638953
    //CallerIDName=79086638953
    //CalledDID=00057766
    //CalledExtension=11890*104
    //CallStatus=CALLING
    //CallFlow=in
    //CallerExtension=
    //CallAPIID=2gflhkjbozarrmnjp5go
    //
    ///Исходящий звонок.
    //CallID=1429368433.1280855
    //CallerIDNum=11890*104
    //CallerIDName=104
    //CalledDID=
    //CallStatus=CALLING
    //CallFlow=out
    //CallerExtension=11890*104
    //CalledNumber=000114509
    //CallAPIID=lfrsmzqx7c6tahkgcdvj

    end
    else
      Addlog('Запрос не содержит данных Call_Events, либо неверный URI.');
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
       AddLog('#Не удалось подключиться к БД. Проверьте настройки. Текст ошибки "'+E.Message+'"');

    DBStatus_lbl.Caption := 'Не установлено';
    DBStatus_lbl.Font.Color := clMaroon;
    end;
  end;

  if Db.Connected then  begin
    AddLog('#Соединение с БД установлено.');

    DBStatus_lbl.Caption := 'Установлено';
    DBStatus_lbl.Font.Color := $00408000;

    IBEvents.RegisterEvents;
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
        AddLog('#Ошибка обновления сессии: "' +E.Message + '". SQL: '+Q.SQL.Text+'.');
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
      if Context <> Self then
      try
        Context.Connection.IOHandler.WriteLn(bmsg);
      except
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
  try
    fAddMsg := True;
    FMsgList.BeginUpdate;
    FMsgList.Add(Ato + '=' + AMsg);
  finally
    FMsgList.EndUpdate;
    fAddMsg := false;
  end;
end;

function TMsgThread.BroadcastMsg(const bmsg: String): boolean;
var
  i: Integer;
  Context: TMyContext;
begin
   for I := 0 to FContList.Count-1 do
    begin
      Context := TMyContext(FContList[I]);
      TMF(FServer.Owner).Log_memo.Lines.Add('Посылаем сообщение для ' + Context.Nick + ': ' + bmsg);
      Context.Connection.IOHandler.WriteLn(bmsg);
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
begin
  while not Terminated do
  begin
    if not (Terminated or (FServer.Contexts.Count = 0) or
           (FMsgList.Count = 0) or fAddMsg) then

    if LockMutex(LogMutex, 5000) then
    try
      cnt := FMsgList.Count - 1;
      cur := 0; step := 0;

        FContList := FServer.Contexts.LockList;
        FMsgList.BeginUpdate;
        while step < cnt do
        begin
          f := False;
          if FMsgList.Names[cur] = '*' then
            f := BroadcastMsg(FMsgList.ValueFromIndex[cur])
          else
            f := SendMsg(FMsgList.Names[cur], FMsgList.ValueFromIndex[cur]);

          Inc(step);
          if f then
            FMsgList.Delete(cur)
          else
             Inc(cur);
        end;

      finally
        UnlockMutex(LogMutex);
        FServer.Contexts.UnLockList;
        FMsgList.EndUpdate;
      end;

      Sleep(200);
    end;

end;


function TMsgThread.SendMsg(const ANick, AMsg: String): Boolean;
var
  List: TList;
  Context: TMyContext;
  I: Integer;
begin
  Result := False;
    for I := 0 to FContList.Count-1 do
    begin
      Context := TMyContext(FContList[I]);
      if lowercase(Context.Nick) = lowercase(ANick) then
      begin
        try
          TMF(FServer.Owner).Log_memo.Lines.Add('Отправка сообщения для ' + ANick + ':' + AMsg);
          Context.Connection.IOHandler.WriteLn(AMsg);
          Result := True;
        except
        end;
      end;
    end;
end;

initialization
  LogMutex := CreateMutex(nil, True,
    Pchar(ExtractFileName((Application.ExeName))));

finalization
  CloseHandle(LogMutex);
end.
