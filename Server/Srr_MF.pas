unit Srr_MF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.Samples.Spin, IdBaseComponent, IdComponent, IdCustomTCPServer,
  IdCustomHTTPServer, IdHTTPServer, IdContext, Data.DB, IBX.IBDatabase,
  IBX.IBCustomDataSet, IBX.IBQuery, SyncObjs, System.Win.ScktComp;

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
  private
    FActiveUsers: TStringList;
    procedure AddLog (Logstr :string);
    Function AddCallEvent(Params :TStrings) :Boolean;
    Function ProkadoCommand(Params :TStrings) :Boolean; //���������� ������� �� �������� �������
    function CreateRWQuery :TIBQuery;
 //  function CreateRWProc :TIBStoredProc;

  public
    CSection: TCriticalSection;
    CSectionProkado: TCriticalSection;
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
begin

    try
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
begin
  ServerSocket.Close;
  ServerSocket.Port := edtSocketPort.Value;
  ServerSocket.Open;
  Log_memo.Lines.Add('������ ������� �������. ����: ' + IntToStr(ServerSocket.Port));
end;

procedure TMF.Button4Click(Sender: TObject);
var
  i: Integer;
begin
 for I := 0 to ServerSocket.Socket.ActiveConnections - 1 do
   ServerSocket.Socket.Connections[i].SendText(Edit1.Text);

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


procedure TMF.FormCreate(Sender: TObject);
begin
  CSection        := TCriticalSection.Create;
  CSectionProkado := TCriticalSection.Create;
  FActiveUsers    := TStringList.Create;
end;

procedure TMF.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FActiveUsers);
  CSection.Release;
  CSectionProkado.Release;
end;

function TMF.ProkadoCommand(Params: TStrings): Boolean;
begin
  //������������ �������� action
  if Params.IndexOfName('action') < 0 then
    exit;

  // ���������� ������������
  if Params.Values['action'] = 'user_set' then
  begin
   /// if FActiveUsers.IndexOfName(Params.Values['phone']) then

  end;

end;

procedure TMF.ServerSocketClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
   Log_memo.Lines.Add('������������� �������');

end;

procedure TMF.ServerSocketClientRead(Sender: TObject; Socket: TCustomWinSocket);
begin
  Log_memo.Lines.Add('������ ������� ���������: ' +Socket.ReceiveText);
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

// ����� ���������
if ARequestInfo.URI = Trim(TelURI_edt.Text) then
  try
    CSection.Enter;
    Addlog('#����������� ������� �� ������ Call_Events');
    Log_memo.Lines.Add(ARequestInfo.URI);
    Log_memo.Lines.Add(ARequestInfo.Params.Text);

    if ARequestInfo.URI = Trim(TelURI_edt.Text) then begin
      if AddCallEvent(ARequestInfo.Params) = true
      then AddLog('������� Call Events � ID: '+ ARequestInfo.Params.Values['CallID']+ ' - '
           + ARequestInfo.Params.Values['CallStatus']);

    //�������� � ����������
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
    ///��������� ������.
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


end;





end;

end.
