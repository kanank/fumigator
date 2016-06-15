unit CommonTypes;

interface
uses
  System.UITypes, DB;

type TClientType = (clFiz, clUr);
type TTrayView =(trayNormal, trayMissed);

type TActionStr = (asCreate,asEdit,asShow);

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

 implementation

function NewFrmCreateParam(AAction: TActionstr; ADataSet: TDataSet=nil; AExtParam: PClientParam=nil): TFrmCreateParam;
begin
  Result.action := AAction;
  Result.Dataset := ADataSet;
  Result.ExtParam := AExtParam;
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

end.
