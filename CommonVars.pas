unit CommonVars;

interface
uses
  CommonTypes;

const
  CfgFileName :string ='Fumigator.cfg';
  TempFolder :string = 'Temp';
  PrintTempsFolder :string = 'Шаблоны';

  FormAlphaBlend :byte = 100;

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
   clType :TClientType;
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
  INN :string;
  clientContact :string;
  Author :string;
  ClientInfoParams :ClientInfoParams;
end;


implementation

end.
