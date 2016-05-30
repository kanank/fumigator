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
end;

 type
 PFrmCreateParam = ^TFrmCreateParam;
 TFrmCreateParam = record
   action: TActionstr;
   Dataset: TDataset;
   ExtParam: Pointer;
 end;

type
  FormResult = record
  New_Id: Integer;
  ModalRes: TModalResult;
  Comments: string;
end;

type TClientParam = record
  Status: Integer;
  ClientType: Integer;
  CallParam: ClientCallParams;
end;

function NewFrmCreateParam(AAction: TActionstr; ADataSet: TDataSet=nil; AExtParam: Pointer=nil): TFrmCreateParam;

 implementation

function NewFrmCreateParam(AAction: TActionstr; ADataSet: TDataSet=nil; AExtParam: Pointer=nil): TFrmCreateParam;
begin
  Result.action := AAction;
  Result.Dataset := ADataSet;
  Result.ExtParam := AExtParam;
end;

end.
