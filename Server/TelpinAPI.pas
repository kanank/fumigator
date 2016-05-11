unit TelpinAPI;

interface

uses
  Vcl.ExtCtrls, System.Classes, IdHTTP, IdSSLOpenSSL;

type
  TTelphinAPIElement = class
  private
    fBaseUrl: string;
    fClientKey: string;
    fSecretKey: string;
    fHttp: TIdHTTP;
    fSSL: TIdSSLIOHandlerSocketOpenSSL;
  public
    property BaseUrl: string read fBaseUrl write fBaseUrl;
    property ClientKey: string read fClientKey write fClientKey;
    property SecretKey: string read fSecretKey write fSecretKey;

    constructor Create; overload;
    destructor Destroy; overload;
end;

type
  TTelphinToken = class(TTelphinAPIElement)
  private
    fToken: string;
    fTimer: TTimer;
    fAutoReGet: Boolean;
    fTimeExpires: TDateTime; //время истечения

    procedure SetAutoReGet(AValue: boolean);
    procedure GetTokenProc(Sender: TObject);
  public
    property AccessToken: string read fToken;
    property AutoReGet: Boolean read fAutoReGet write SetAutoReGet;
    property TimeExpires: TDateTime read fTimeExpires;

    constructor Create; overload;
    destructor Destroy; overload;
    function GetToken: Boolean;
end;

implementation

{ TTelphinToken }

constructor TTelphinToken.Create;
begin
  inherited;
  fAutoReGet := True;
  fTimer := TTimer.Create(nil);
  fTimer.Interval := 0;
  fTimer.OnTimer := GetTokenProc;

//  fHttp.Request.URL := fBaseURL;
//  fHttp.Request.Method := 'POST';
//  fHttp.Request.ContentType := 'application/x-www-form-urlencoded';
  fSSL:=TIdSSLIOHandlerSocketOpenSSL.Create;
  fHttp.IOHandler := fSSL;
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
  aResponse: TIdHTTPResponse;
  param: TStringList;
  stream: TStringStream;
begin
  param := TStringList.Create;
  param.Add('grant_type=client_credentials');
  param.Add('redirect_uri=81.177.48.139');
  param.Add('client_id=' + ClientKey);
  param.Add('client_secret=' + SecretKey);
  param.Add('state=0');

  stream := TStringStream.Create('');
  stream.WriteString('grant_type=client_credentials&');
  stream.WriteString('redirect_uri=81.177.48.139&');
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
    fhttp.Request.UserAgent := 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.7 (KHTML, like Gecko) Chrome/16.0.912.77 Safari/535.7';
    fhttp.HandleRedirects := false;
    fhttp.HTTPOptions := [hoKeepOrigProtocol];

    fHttp.Post(fBaseUrl + '/oauth/token.php', stream);
  finally
    param.Free;
    stream.Free;
  end;
end;

procedure TTelphinToken.SetAutoReGet(AValue: boolean);
begin
  if not AValue then
    fTimer.Interval := 0;
  fAutoReGet := AValue;
end;

{ TTelphinAPIElement }

constructor TTelphinAPIElement.Create;
begin
  fHttp := TIdHTTP.Create(nil);
  fSSL:=TIdSSLIOHandlerSocketOpenSSL.Create;
  fHttp.IOHandler:=fSSL;
end;

destructor TTelphinAPIElement.Destroy;
begin
  if Assigned(fHttp) then
    fHttp.Free;
  if Assigned(fSSL) then
    fSSL.Free;
end;

end.
