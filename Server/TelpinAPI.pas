unit TelpinAPI;

interface

uses
  Vcl.ExtCtrls, System.Classes, IdHTTP, IdSSLOpenSSL, System.JSON,
  System.SysUtils, System.DateUtils;

type
  TTelphinToken = class;

  TTelphinApiBaseElement = class
  private
    fBaseUrl: string;
    fHttp: TIdHTTP;
    fSSL: TIdSSLIOHandlerSocketOpenSSL;
  public
    property BaseUrl: string read fBaseUrl write fBaseUrl;
    constructor Create; overload;
    destructor Destroy; overload;
  end;

  TTelphinAPIElement = class(TTelphinApiBaseElement)
  private
    FTokenObject: TTelphinToken;
    fUserId: string;
  public
    property TokenObject: TTelphinToken read FTokenObject write FTokenObject;

    constructor Create(ATokenObject: TTelphinToken=nil); overload;
  end;

  TTelphinToken = class(TTelphinApiBaseElement)
  private
    fClientKey: string;
    fSecretKey: string;
    fToken: string;
    fTimer: TTimer;
    fAutoReGet: Boolean;
    fTimeExpires: TDateTime; //время истечения

    procedure SetAutoReGet(AValue: boolean);
    procedure GetTokenProc(Sender: TObject);
    function CheckToken: Boolean;
  public
    property ClientKey: string read fClientKey write fClientKey;
    property SecretKey: string read fSecretKey write fSecretKey;
    property Token: string read fToken;
    property AutoReGet: Boolean read fAutoReGet write SetAutoReGet;
    property TimeExpires: TDateTime read fTimeExpires;
    property TokenIsActive: Boolean read CheckToken;

    constructor Create; overload;
    destructor Destroy; overload;
    function GetToken: Boolean;
  end;

  TPhoneCalls = class (TTelphinAPIElement)
  public
    function SimpleCall(ANumberSrc, ANumberDest: string): boolean;
  end;

implementation

{ TTelphinToken }

function TTelphinToken.CheckToken: Boolean;
begin
  Result := (Now < TimeExpires);
end;

constructor TTelphinToken.Create;
begin
  inherited Create;
  fAutoReGet := True;
  fTimer := TTimer.Create(nil);
  fTimer.Interval := 0;
  fTimer.OnTimer := GetTokenProc;

end;

destructor TTelphinToken.Destroy;
begin
  if Assigned(fTimer) then
   fTimer.Free;
end;

function TTelphinToken.GetToken: Boolean;
begin
  GetTokenProc(nil);
end;

procedure TTelphinToken.GetTokenProc(Sender: TObject);
var
  sResponse: string;
  stream: TStringStream;
  json: TJSONObject;
  keep: Integer;
begin
  stream := TStringStream.Create('');
  stream.WriteString('grant_type=client_credentials&');
  stream.WriteString('redirect_uri=urn:ietf:wg:oauth:2.0:oob&');
  stream.WriteString('client_id=' + ClientKey + '&');
  stream.WriteString('client_secret=' + SecretKey + '&');
  stream.WriteString('state=0');


  try
//    fHttp.Request.URL := fBaseURL + '/oauth/token.php';
    fHttp.Request.Method := 'POST';
    fHttp.Request.ContentType := 'application/x-www-form-urlencoded';
    fhttp.Request.Accept := 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8';
    fhttp.Request.AcceptCharSet := 'windows-1251,utf-8;q=0.7,*;q=0.3';
    fhttp.Request.AcceptLanguage := 'ru-RU,ru;q=0.8,en-US;q=0.6,en;q=0.4';
    fhttp.Request.Connection := 'keep-alive';
    fhttp.Request.Host := fBaseUrl;
    fhttp.Request.Referer := fBaseUrl;
   // fhttp.Request.UserAgent := 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.7 (KHTML, like Gecko) Chrome/16.0.912.77 Safari/535.7';
    fhttp.HandleRedirects := false;
    fhttp.HTTPOptions := [hoKeepOrigProtocol];

    try
      sResponse := fHttp.Post(fBaseUrl + '/oauth/token.php', stream);
      json := TJSONObject.Create;
      json.Parse(BytesOf(sResponse), 0);
      fToken := json.Values['access_token'].ToString;
      fToken := AnsiDequotedStr(fToken, '"');
      keep   := StrToInt(json.Values['expires_in'].ToString);
      if keep > 0  then
        keep := keep - 15;
      fTimeExpires := IncSecond(Now, keep);
    except

    end;
  finally
    stream.Free;
    json.Free;
  end;
end;

procedure TTelphinToken.SetAutoReGet(AValue: boolean);
begin
  if not AValue then
    fTimer.Interval := 0;
  fAutoReGet := AValue;
end;

{ TTelphinAPIElement }

constructor TTelphinAPIElement.Create(ATokenObject: TTelphinToken=nil) ;
begin
  inherited Create;
  if ATokenObject <> nil then
    FTokenObject := ATokenObject;
end;


{ TPhoneCalls }

function TPhoneCalls.SimpleCall(ANumberSrc, ANumberDest: string): boolean;
var
  sStream: TStringStream;
  sResponse: string;
  url: string;
begin
  Result := False;
  //if FTokenObject = nil then
  //  Exit;

  sStream := TStringStream.Create('');
  try
    sStream.WriteString('{' + #13#10);
    //sStream.WriteString('"extension": "11890*' + ANumberSrc + '",'+ #13#10);
    sStream.WriteString('"phoneCallView": ['+ #13#10);
    sStream.WriteString('{'+ #13#10);
    sStream.WriteString(' "source":  [ "11890*' + ANumberSrc + '" ],'+ #13#10);
    sStream.WriteString(' "destination": [ "' + ANumberDest + '" ],'+ #13#10);
    sStream.WriteString('     "callerId": "Fumigator <000>"'+ #13#10);
    sStream.WriteString('  }'+ #13#10);
    sStream.WriteString(']'+ #13#10);
    sStream.WriteString('}');

    fHttp.Request.Method := 'POST';
    fHttp.Request.ContentType := 'application/json';
    fhttp.Request.Accept := 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8';
    fhttp.Request.AcceptCharSet := 'windows-1251,utf-8;q=0.7,*;q=0.3';
    fhttp.Request.AcceptLanguage := 'ru-RU,ru;q=0.8,en-US;q=0.6,en;q=0.4';
    fhttp.Request.Connection := 'keep-alive';
    fhttp.Request.CustomHeaders.Add('Authorization: Bearer '+ FTokenObject.Token);
    //fhttp.Request.Host    := fBaseUrl;
    fhttp.Request.Referer := fBaseUrl;

    url := fBaseUrl + '/uapi/phoneCalls/@owner/simple?allowPublicTransfer=true' ; //&accessRequestToken=' + FTokenObject.Token;
    sResponse := fHttp.Post(url, sStream);

  finally
    sStream.Free;
  end;
end;

{ TTelphinApiBaseElement }

constructor TTelphinApiBaseElement.Create;
begin
  fHttp := TIdHTTP.Create(nil);
  fSSL:=TIdSSLIOHandlerSocketOpenSSL.Create;
  fHttp.IOHandler:=fSSL;
  fBaseUrl := 'https://office.telphin.ru';
end;

destructor TTelphinApiBaseElement.Destroy;
begin
  if Assigned(fHttp) then
    fHttp.Free;
  if Assigned(fSSL) then
    fSSL.Free;
end;

end.
