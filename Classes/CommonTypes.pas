unit CommonTypes;

interface
uses
  System.UITypes, System.Classes, DB, System.SysUtils, Winapi.Messages,
  Vcl.Forms, Winapi.Windows, Vcl.ExtCtrls;

const
  WM_STARTCALL  = WM_USER + 200;
  WM_FINISHCALL = WM_USER + 201;

type TClientType = (clFiz, clUr);
type TTrayView =(trayNormal, trayMissed);

type TActionStr = (asCreate,asEdit,asShow);

type
  TCallInfo = class
  public
    CallFlow: string;
    CallId: string;
    CallApiId: string;
    Phone:  string;
    ClientId: Integer;
    ClientType: string;
    ClientSubType: string;
    CallResult: string;
    procedure Clear;
    procedure Assign(ASource: TCallInfo);
end;

type
  TCallProto = class
  private
    fCallInfo: TCallInfo;
    fOnStartCall: TNotifyEvent;
    fOnFinishCall: TNotifyEvent;
    fOnAcceptCall: TNotifyEvent;
    fOnCheckTimer: TNotifyEvent;
    fActive: Boolean; //идет звонок
    fReady: Boolean;  // готов к звонку
    fAccepted: Boolean; //принят звонок
    fTimer: TTimer;
    procedure SetActive(AValue: boolean);
    procedure SetReady(AValue: boolean);
    function GetAccepted: Boolean;
    procedure SetAccepted(AValue: boolean);
    function GetCanceled: Boolean;
    procedure OnTimerProc(Sender: TObject);
    procedure DoCheckCall;
  protected

  public
    property Active: Boolean read fActive write SetActive;
    property Ready: Boolean read fReady write SetReady;
    property Accepted: Boolean read GetAccepted write SetAccepted;
    property Cancelled: Boolean read GetCanceled;
    property CallInfo: TCallInfo read fCallInfo;
    property OnStartCall: TNotifyEvent read fOnStartCall write fOnStartCall;
    property OnFinishCall: TNotifyEvent read fOnFinishCall write fOnFinishCall;
    property OnAcceptCall: TNotifyEvent read fOnAcceptCall write fOnAcceptCall;
    property OnCheckTimer: TNotifyEvent read fOnCheckTimer write fOnCheckTimer;
    constructor Create; overload;
    destructor Destroy; overload;
    procedure StartCall(ACallFlow, ACallId, ACallApiId, APhone, AClientId, AClientType: string);overload;
    procedure StartCall(ACallInfo: TCallInfo); overload;

    procedure FinishCall(ACallResult: string);


end;

type
  CurrentUserRec = record
  ID: Integer;
  UserName :string;
  UserType :smallint;
  userTypeName :string;
  ATS_Phone_Num :string;
  session_id: integer;

  DebugMode : Boolean;
  HideOnClose :Boolean;
end;

type
  FtpProps = record  //настройки фтп
  Host:     string;
  Login:    string;
  Psw:      string;
  Passive:  boolean;
  Dir:      string;
end;


 type
   ClientInfoParams = record
   clType : TClientType;
   ClientName: string;
   ClientInfo :string;
   ClientComms :string;
end;

type
  PClientCallParams = ^ClientCallParams;
  ClientCallParams = record
  id_call: integer;
  Client_Type :string;
  Client_id :Integer;
  TelNum :string;
  ClientName :string;
  Format_Id: Integer;
  Status_Id: Integer;
  PERSON_ID: Integer;
  FORMA_ID: Integer;
  INN :string;
  clientContact :string;
  Author :string;
  ClientInfoParams :ClientInfoParams;
  public
    procedure Assign(ASource: ClientCallParams);
    procedure Setup;
end;

type
  FormResult = record
  New_Id: Integer;
  ModalRes: TModalResult;
  Comments: string;
end;

type
  PClientParam = ^TClientParam;
  TClientParam = record
  Status: Integer;
  ClientType: Integer;
  CallParam: PClientCallParams;
  public
    constructor Init(Astatus: integer; AClientType: Integer; ACallParam: PClientCallParams);
    procedure Setup;
end;

 type
 PFrmCreateParam = ^TFrmCreateParam;
 TFrmCreateParam = record
   action: TActionstr;
   Dataset: TDataset;
   ExtParam: PClientParam;
 public
   constructor Init(Aaction: TActionstr; ADataset: TDataset; AExtParam: PClientParam);
 end;

function NewFrmCreateParam(AAction: TActionstr; ADataSet: TDataSet=nil; AExtParam: PClientParam=nil): TFrmCreateParam;
procedure PostMessageToAll(AMsg: CArdinal);

 implementation

function NewFrmCreateParam(AAction: TActionstr; ADataSet: TDataSet=nil; AExtParam: PClientParam=nil): TFrmCreateParam;
begin
  Result.action := AAction;
  Result.Dataset := ADataSet;
  Result.ExtParam := AExtParam;
end;

procedure PostMessageToAll(AMsg: Cardinal);
var
  i: Integer;
begin
  for I := 0 to Screen.FormCount - 1 do
    PostMessage(Screen.Forms[i].Handle, AMsg, 0, 0);
end;

{ ClientCallParams }

procedure ClientCallParams.Assign(ASource: ClientCallParams);
begin
  self.id_call       := ASource.id_call;
  self.Client_Type   := ASource.Client_Type;
  self.Client_id     := ASource.Client_id;
  self.TelNum        := ASource.TelNum;
  self.ClientName    := ASource.ClientName;
  self.Format_Id     := ASource.Format_Id;
  self.Status_Id     := ASource.Status_Id;
  self.PERSON_ID     := ASource.PERSON_ID;
  self.FORMA_ID      := ASource.FORMA_ID;
  self.Author        := ASource.Author;
  self.INN           := ASource.INN;
  self.clientContact := ASource.clientContact;
  self.ClientInfoParams.ClientInfo  := ASource.ClientInfoParams.ClientInfo;
  self.ClientInfoParams.ClientComms := ASource.ClientInfoParams.ClientComms;

end;

procedure ClientCallParams.Setup;
begin
  id_call := 0;
  Client_Type := '';
  Client_id := 0;
  TelNum := '';
  ClientName := '';
  Format_Id := 1;
  Status_Id := 1;
  PERSON_ID := 0;
  FORMA_ID := 1;
  INN := '';
  clientContact := '';
  Author := '';
end;

{ TClientParam }

constructor TClientParam.Init(AStatus: integer; AClientType: Integer; ACallParam: PClientCallParams);
begin
  Self.Status     := AStatus;
  Self.ClientType := AClientType;
  CallParam       := ACallParam;
end;

procedure TClientParam.Setup;
begin
  Status := 1;
  ClientType := 0;
  CallParam := nil;
end;

{ TFrmCreateParam }

constructor TFrmCreateParam.Init(Aaction: TActionstr; ADataset: TDataset;
  AExtParam: PClientParam);
begin
  Self.action   := Aaction;
  Self.Dataset  := ADataset;
  Self.ExtParam := AExtParam;
end;

{ TCallPcroto }
constructor TCallProto.Create;
begin
  inherited Create;
  fCallInfo := TCallInfo.Create;
  //fTimer := TTimer.Create;
  //fTimer.Enabled  := False;
  //fTimer.Interval := 1000;
  //fTimer.OnTimer  := onTimerProc;
  fReady := True;
end;

destructor TCallProto.Destroy;
begin
  fCallInfo.Free;
  //fTimer.Free;
  inherited;
end;

procedure TCallProto.DoCheckCall;
begin

end;

procedure TCallProto.FinishCall(ACallResult: string);
begin
  CallInfo.CallResult := ACallResult;
  fActive := false;

  if Assigned(fOnFinishCall) then
    fOnFinishCall(Self);

  PostMessageToAll(WM_FINISHCALL);
end;

function TCallProto.GetAccepted: Boolean;
begin
  Result := (CallInfo.CallFlow = 'in') and fAccepted;
    //(CallInfo.CallResult = 'ANSWER');
end;

function TCallProto.GetCanceled: Boolean;
begin
  Result := (CallInfo.CallResult = 'CANCEL');
end;

procedure TCallProto.OnTimerProc(Sender: TObject);
begin
  if Assigned(fOnCheckTimer) then
    fOnCheckTimer(self);
end;

procedure TCallProto.SetAccepted(AValue: boolean);
begin
  if AValue <> fAccepted then
    fAccepted := AValue;

  if AValue then
  begin
    if Assigned(fOnAcceptCall) then
      fOnAcceptCall(self);
    //fTimer.Enabled := false;
  end;

end;

procedure TCallProto.SetActive(AValue: boolean);
begin
  if AValue <> fActive then
  begin
    fActive := AValue;
    if not AValue then
      fCallInfo.Clear;
  end;
end;

procedure TCallProto.SetReady(AValue: boolean);
begin
  if AValue <> fReady then
  begin
    if AValue and not Active then
      fReady := AValue;
  end;
end;

procedure TCallProto.StartCall(ACallInfo: TCallInfo);
begin
  StartCall(ACallInfo.CallFlow, ACallInfo.CallId, ACallInfo.CallApiId,
    ACallInfo.Phone, IntToStr(ACallInfo.ClientId), ACallInfo.ClientType);
end;

procedure TCallProto.StartCall(ACallFlow, ACallId, ACallApiId, APhone, AClientId, AClientType: string);
begin
  with fCallInfo do
  begin
    CallId     := ACallId;
    CallApiId  := ACallApiId;
    CallFlow   := ACallFlow;
    Phone      := APhone;
    ClientId   := StrToInt(AClientId);
    ClientType := AClientType;
    CallResult :='';
    Accepted   := false;
  end;

  fActive := True;
  fReady  := False;

  //PostMessage()
  //ftimer.Enabled := true;

  if Assigned(fOnStartCall) then
    fOnStartCall(Self);

  PostMessageToAll(WM_FINISHCALL);
end;

{ TCallInfo }

procedure TCallInfo.Assign(ASource: TCallInfo);
begin
    CallId     := ASource.CallId;
    CallApiId  := ASource.CallApiId;
    CallFlow   := ASource.CallFlow;
    ClientId   := ASource.ClientId;
    ClientType := ASource.ClientType;
    ClientSubType := ASource.ClientSubType;
end;

procedure TCallInfo.Clear;
begin
  CallId := '';
  CallApiId := '';
  CallFlow := '';
  ClientId := -1;
  ClientType := '';
  ClientSubType := '';
end;

end.
