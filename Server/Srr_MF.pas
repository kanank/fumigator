unit Srr_MF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.Samples.Spin, IdBaseComponent, IdComponent, IdCustomTCPServer,
  IdCustomHTTPServer, IdHTTPServer, IdContext, Data.DB, IBX.IBDatabase,
  IBX.IBCustomDataSet, IBX.IBQuery, SyncObjs, System.Win.ScktComp,
  TelpinAPI, IBX.IBEvents;

type
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
    DebugMode_cb: TCheckBox;
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
  private
    FActiveUsers: TStringList;
    procedure AddLog (Logstr :string);
    Function AddCallEvent(Params :TStrings) :Boolean;
    Function ProkadoCommand(Params :TStrings) :Boolean; //выполнение комманд от клиентов прокадо
    function SocketCommand(cmd, arg: string): Boolean;
    function CreateRWQuery :TIBQuery;

    procedure AfterOutcomCall(Sender: TObject);
    procedure CallFinished(Sender: TObject);
    function SendCommandToUser(atsnum, command: string): Boolean;
    function UpdateSession(ACallId: string): Boolean;

 //  function CreateRWProc :TIBStoredProc;

  public
    CSection: TCriticalSection;
    CSectionProkado: TCriticalSection;
    CSectionSocket: TCriticalSection;

    AccessToken: TTelphinToken;
    Caller: TPhoneCalls;
  end;

  const
       LogFile = 'Srv_Log.txt';

var
  MF: TMF;


implementation

{$R *.dfm}

function TMF.AddCallEvent(Params: TStrings): Boolean;
var Q :TIBQuery;
    Cf :Byte;
    Fld :string;
    userid: string;
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
    userid := Copy(userid, 1, p - 1);

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

    Q.ParamByName('CALLFLOW').AsInteger :=  cf;
    Q.ParamByName('CALLID').AsString :=  Params.Values['CallID'];
    Q.ParamByName('CALLERIDNUM').AsString :=  Params.Values['CallerIDNum'];
    Q.ParamByName('CALLERIDNAME').AsString :=  Params.Values['CallerIDName'];
    Q.ParamByName('CALLEDDID').AsString :=  Params.Values['CalledDID'];
    Q.ParamByName('CALLEREXTENSION').AsString :=  Params.Values['CallerExtension'];
    Q.ParamByName('CALLSTATUS').AsString :=  Params.Values['CallStatus'];
    Q.ParamByName('CALLEDEXTENSION').AsString :=  Params.Values['CalledExtension'];
    Q.ParamByName('CALLEDNUMBER').AsString :=  Params.Values['CalledNumber'];
    Q.ParamByName('CALLAPIID').AsString :=  Params.Values['CallAPIID'];

    Try
    Q.ExecSQL;
    Result := true;
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
  AssignFile(F, FileName);
  if FileExists(FileName) then
    Append(F)
  else
    Rewrite(F);

 if LogStr[1] = '#'
 then  WriteLn(F,  ' ');

 WriteLn(F,  LogStr2);

 CloseFile(F);


  if DebugMode_cb.Checked then begin
     if LogStr[1] = '#' then Log_memo.Lines.Add('');
     Log_memo.Lines.Add(LogStr2);
  end;
end;


procedure TMF.AfterOutcomCall(Sender: TObject);
begin
  SendCommandToUser(Caller.Extension, '#callid:' + Caller.CallId);
end;

procedure TMF.btnPhoneClick(Sender: TObject);
begin
  AccessToken.GetToken;
  Log_memo.Lines.Add('Получен токен доступа');
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
  ServerSocket.Close;
  ServerSocket.Port := edtSocketPort.Value;
  ServerSocket.Open;
  Log_memo.Lines.Add('Сервер сокетов запущен. Порт: ' + IntToStr(ServerSocket.Port));

  //Caller := TPhoneCalls.Create(AccessToken);
  //Caller.SimpleCall('104', '+79104579648');
end;

procedure TMF.Button4Click(Sender: TObject);
var
  i: Integer;
begin
 for I := 0 to ServerSocket.Socket.ActiveConnections - 1 do
   try
     ServerSocket.Socket.Connections[i].SendText('#msg:' + Edit1.Text);
   except

   end;
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


procedure TMF.FormCreate(Sender: TObject);
begin
  CSection        := TCriticalSection.Create;
  CSectionProkado := TCriticalSection.Create;
  CSectionSocket  := TCriticalSection.Create;
  FActiveUsers    := TStringList.Create;

  AccessToken := TTelphinToken.Create;
  AccessToken.ClientKey := '1.5dVYsc31.XAW2KIdf~jpmzgUJY-VKt';
  AccessToken.SecretKey := 'R_39AzkxxI_7gWKgg96~Xt80PzxO~fd0';
end;

procedure TMF.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FActiveUsers);
  CSection.Release;
  CSectionProkado.Release;
  CSectionSocket.Release;

  FreeAndNil(AccessToken);
  FreeAndNil(Caller);
end;

procedure TMF.IBEventsEventAlert(Sender: TObject; EventName: string;
  EventCount: Integer; var CancelAlerts: Boolean);
begin
  Log_memo.Lines.Add('IBEvent: ' + EventName);
  if Copy(EventName,1,11) = 'INCOME_CALL' then
    SendCommandToUser('*', '#checkcall:')

  else

  if Copy(EventName,1,13) = 'SESSION_CLOSE' then
    SendCommandToUser('*', '#checksession:');
end;

function TMF.ProkadoCommand(Params: TStrings): Boolean;
begin
  //обязательный параметр action
  if Params.IndexOfName('action') < 0 then
    exit;

  // активность пользователя
  if Params.Values['action'] = 'user_set' then
  begin
   /// if FActiveUsers.IndexOfName(Params.Values['phone']) then

  end;

end;

function TMF.SendCommandToUser(atsnum, command: string): Boolean;
var
  i, p: Integer;
begin
  try
    CSectionSocket.Enter;
    if atsnum <> '*' then
    begin
      p := Pos('*', atsnum);
      if p > 0 then
        atsnum := Copy(atsnum, p + 1, Length(atsnum));
      i := FActiveUsers.IndexOf(atsnum);
      if i > -1 then
      begin
        Log_memo.Lines.Add('Посылаем сообщение: ' + command);
        try
          TCustomWinSocket(FActiveUsers.Objects[i]).SendText(command);
        except

        end;
      end;
    end
    else
    begin
      for I := 0 to ServerSocket.Socket.ActiveConnections - 1 do
        try
          ServerSocket.Socket.Connections[i].SendText(command);
        except

        end;
    end;
  finally
    CSectionSocket.Leave;
  end;
end;

procedure TMF.ServerSocketClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
   Log_memo.Lines.Add('Присоединение клиента');

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
      FActiveUsers.Delete(i);
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
    Log_memo.Lines.Add('Клиент прислал сообщение: ' + s);
    if Copy(s, 1, 1) = '#' then
    begin
      p := Pos(':', s);
      cmd := Copy(s, 2, p - 2);
      arg := Copy(s, p + 1, Length(s));

      if cmd = 'setphone' then
        FActiveUsers.AddObject(arg, Socket)
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
        Caller.OnCallFinish := CallFinished;
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
        Caller.OnCallFinish := CallFinished;
      end;
      Caller.DeleteCall(argList[0]);
    end;
  finally
    argList.Free;
  end;
end;

procedure TMF.Tel_SRVCommandGet(AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
begin

  if ARequestInfo.URI = 'prokado' then
  try
    CSectionProkado.Enter;
    ProkadoCommand(ARequestInfo.Params);

  finally
    CSectionProkado.Leave;
  end;

// новое Вхождение
if ARequestInfo.URI = Trim(TelURI_edt.Text) then
  try
    CSection.Enter;

    Addlog('#Поступление события на службы Call_Events');
    Log_memo.Lines.Add(ARequestInfo.URI);
    Log_memo.Lines.Add(ARequestInfo.Params.Text);

    if ARequestInfo.URI = Trim(TelURI_edt.Text) then
    begin
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
    on E : Exception
        do begin
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

end.
