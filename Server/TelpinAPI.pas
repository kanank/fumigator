unit TelpinAPI;

interface

uses
  Vcl.ExtCtrls, System.Classes, IdHTTP, IdSSLOpenSSL, System.JSON,
  System.SysUtils, System.DateUtils;

type
  TTelphinToken = class;

  TTelphinApiBaseElement = class
  protected
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
    fResponse: string;
    function GetTokenObject: TTelphinToken;
  public
    property TokenObject: TTelphinToken read GetTokenObject write FTokenObject;
    property HttpResponse: string read fResponse;
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
    function GetActiveToken: string;
  public
    property ClientKey: string read fClientKey write fClientKey;
    property SecretKey: string read fSecretKey write fSecretKey;
    property Token: string read GetActiveToken;
    property AutoReGet: Boolean read fAutoReGet write SetAutoReGet;
    property TimeExpires: TDateTime read fTimeExpires;
    property TokenIsActive: Boolean read CheckToken;

    constructor Create; overload;
    destructor Destroy; overload;
    function GetToken: Boolean;
  end;

  TPhoneCalls = class (TTelphinAPIElement)
  private
    fOnAfterCall: TNotifyEvent;
    fOnCallFinish: TNotifyEvent;
    fOnAfterChange: TNotifyEvent; // после изменения звонка
    fCallId: string;
    fExtension: string;
    function GetStatusCall: Integer;
  public
    property OnAfterCall: TNotifyEvent read fOnAfterCall write fOnAfterCall;
    property OnAfterChange: TNotifyEvent read fOnAfterChange write fOnAfterChange;
    property OnCallFinish: TNotifyEvent read fOnCallFinish write fOnCallFinish;

    property CallId: string read fCallId;
    property StatusCall: Integer read GetStatusCall;
    property Extension: string read fExtension;
    function SimpleCall(ANumberSrc, ANumberDest, AExtNumber: string): boolean;
    function TransferCall(Callid, APhone: string): Boolean;
    function PickUpCall(Callid, APhone: string): Boolean;
    function DeleteCall(Callid: string): Boolean;
    function GetRecordInfo(ACallApiId: string; AExt: string): string;
  end;

  TCallListener = class (TTelphinAPIElement)
  private
    fOnCallFinish: TNotifyEvent; // событие после окончания звонка
    fCallId: string;
    fExtension: string;
    fStatusCall: Integer;
    fTimer: TTimer;
    fTimerInterval: Integer;
    function GetStatusCall: Integer;
    procedure TimerProc(Sender: TObject);
  public
    property OnCallFinish: TNotifyEvent read fOnCallFinish write fOnCallFinish;
    property CallId: string read fCallId write fCallId;
    property TimerInterval: Integer read fTimerInterval write fTimerInterval;

    property Extension: string read fExtension write fExtension;
    constructor Create(ATokenObject: TTelphinToken; ACallId, AExtension: string; AOnCallFinish: TNotifyEvent); overload;
    destructor Destroy; overload;
  end;

implementation

{ TTelphinToken }

function TTelphinToken.CheckToken: Boolean;
begin
  Result := Assigned(Self) and ((fToken = '') or (Now < fTimeExpires));
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

function TTelphinToken.GetActiveToken: string;
begin
  if not CheckToken then
    GetToken;
  Result := fToken;
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


function TTelphinAPIElement.GetTokenObject: TTelphinToken;
begin
  if not Assigned(FTokenObject) then
    FTokenObject := TTelphinToken.Create;
  Result := FTokenObject;
end;

{ TPhoneCalls }

function TPhoneCalls.DeleteCall(Callid: string): Boolean;
var
  sStream: TStringStream;
  sResponse: string;
  url: string;
begin
  Result := False;

  sStream := TStringStream.Create('');
  try
    fHttp.Request.Method := 'DELETE';
    fHttp.Request.ContentType := 'application/json';
    fhttp.Request.CustomHeaders.Clear;
    fhttp.Request.CustomHeaders.Add('Authorization: Bearer '+ TokenObject.Token);

    url := fBaseUrl + '/uapi/phoneCalls/@me/@self/' + CallId;
    try
      fHttp.Delete(url, sStream);
    except

    end;

    Result := (fHttp.ResponseCode = 200);
  finally
    sStream.Free;
  end;
end;

function TPhoneCalls.GetRecordInfo(ACallApiId, AExt: string): string;
var
  sStream: TStringStream;
  url: string;
  json: TJSONObject;
  json1: TJSONArray;
begin
  sStream := TStringStream.Create;
  try
    fHttp.Request.Method := 'GET';
    //fHttp.Request.ContentType := 'application/json';
    fhttp.Request.CustomHeaders.Clear;
    fhttp.Request.CustomHeaders.Add('Authorization: Bearer '+ TokenObject.Token);

    url := Format(fBaseUrl + '/uapiext/getrecordinfo/?extension=%s&id=%s', [AExt, ACallApiId]);
    try
      fHttp.Get(url, sStream);
      json := TJSONObject.Create;
      json.Parse(BytesOf(sStream.DataString), 0);
      //json1 := TJSONObject.Create;
      json1 := TJSONObject.ParseJSONValue(json.GetValue('entry').ToString) as TJSONArray;
      json   := TJSONObject.ParseJSONValue(json1.Items[0].ToString) as TJSONObject;
      Result := json.GetValue('filename').Value;
      Result := AnsiDequotedStr(Result, '"');
    except
      Result := '#error';
    end;

  finally
    sStream.Free;
    json.Free;
    json1.Free;
  end;

end;

function TPhoneCalls.GetStatusCall: Integer;
var
  sStream: TStringStream;
  url: string;
begin
  sStream := TStringStream.Create;
  fHttp.Request.Method := 'GET';
  //fHttp.Request.ContentType := 'application/json';
  fhttp.Request.CustomHeaders.Clear;
  fhttp.Request.CustomHeaders.Add('Authorization: Bearer '+ TokenObject.Token);

  url := fBaseUrl + '/uapi/phoneCalls/@owner/@self/' + CallId; //&accessRequestToken=' + FTokenObject.Token;
  try
    fHttp.Get(url, sStream);
  except

  end;

  sStream.Free;

end;

function TPhoneCalls.PickUpCall(Callid, APhone: string): Boolean;
var
  sStream: TStringStream;
  url: string;
begin
  Result := False;

  sStream := TStringStream.Create;
  sStream.WriteString('{' + #13#10);
  sStream.WriteString('"action":"PickUp",' + #13#10);
  sStream.WriteString('"sendCallTo":"' + APhone + '",' + #13#10);
  sStream.WriteString('"callerId:"Fumigator <' + APhone + '>",' + #13#10);
  sStream.WriteString('"waitForPickup":"20" ,' + #13#10);
  sStream.WriteString('"phoneCallViewId":"01"' + #13#10);
  sStream.WriteString('}' + #13#10);

  fHttp.Request.Method := 'PUT';
  fHttp.Request.ContentType := 'application/json';
  fhttp.Request.CustomHeaders.Clear;
  fhttp.Request.CustomHeaders.Add('Authorization: Bearer '+ TokenObject.Token);

  url := fBaseUrl + '/uapi/phoneCalls/@owner/@self/' + CallId; //&accessRequestToken=' + FTokenObject.Token;
  try
    fHttp.Put(url, sStream);
    Result := (fHttp.ResponseCode = 200);

    if Assigned(fOnAfterChange) then
      fOnAfterChange(Self);
  except

  end;
  sStream.Free;
end;

function TPhoneCalls.SimpleCall(ANumberSrc, ANumberDest, AExtNumber: string): boolean;
var
  sStream: TStringStream;
  sResponse: string;
  url: string;
  json: TJSONObject;
begin
  Result := False;

  sStream := TStringStream.Create('');
  try
    sStream.WriteString('{' + #13#10);
    sStream.WriteString('"extension": "' + AExtNumber + '",'+ #13#10);
    sStream.WriteString('"phoneCallView": ['+ #13#10);
    sStream.WriteString('{'+ #13#10);
    sStream.WriteString(' "source":  ["' + ANumberSrc + '" ],'+ #13#10);
    sStream.WriteString(' "destination": "' + ANumberDest + '",'+ #13#10);
    sStream.WriteString('     "callerId": "Fumigator <' + ANumberSrc + '>"'+ #13#10);
    sStream.WriteString('  }'+ #13#10);
    sStream.WriteString(']'+ #13#10);
    sStream.WriteString('}');

    fHttp.Request.Method := 'POST';
    fHttp.Request.ContentType := 'application/json';
    fhttp.Request.CustomHeaders.Clear;
    fhttp.Request.CustomHeaders.Add('Authorization: Bearer '+ TokenObject.Token);

    url := fBaseUrl + '/uapi/phoneCalls/@owner/simple?allowPublicTransfer=true' ; //&accessRequestToken=' + FTokenObject.Token;
    try
      fResponse := fHttp.Post(url, sStream);
    except

    end;

    if (fHttp.ResponseCode < 400) then
    begin
      if Copy(fResponse, 1, 1) = '[' then
      begin
        fResponse := Copy(fResponse, 2, Length(fResponse) - 2);
      end;
      json := TJSONObject.Create;
      json.Parse(BytesOf(fResponse), 0);
      fCallId    := AnsiDequotedStr(json.Values['id'].ToString, '"');
      fExtension := AnsiDequotedStr(json.Values['extension'].ToString, '"');

     // TCallListener.Create(fTokenObject, fCallId, fExtension, fOnCallFinish);

      if Assigned(fOnAfterCall) then
        fOnAfterCall(Self);
    end;

  finally
    sStream.Free;
  end;
end;

function TPhoneCalls.TransferCall(Callid, APhone: string): Boolean;
begin

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

{ TCallListener }

constructor TCallListener.Create(ATokenObject: TTelphinToken; ACallId,
  AExtension: string; AOnCallFinish: TNotifyEvent);
begin
  inherited Create(ATokenObject);
  fCallId         := ACallId;
  fExtension      := AExtension;
  fOnCallFinish   := AOnCallFinish;
  fTimer          := TTimer.Create(nil);
  fTimer.OnTimer  := TimerProc;
  fTimerInterval  := 1000;
  fTimer.Interval := fTimerInterval;
end;

destructor TCallListener.Destroy;
begin
  FreeAndNil(fTimer);
  inherited;
end;

function TCallListener.GetStatusCall: Integer;
var
  sStream: TStringStream;
  url: string;
  json: TJSONObject;
  cnt: Integer;
begin
  sStream := TStringStream.Create;
  try
    fTimer.Interval := 0;
    fHttp.Request.Method := 'GET';
    //fHttp.Request.ContentType := 'application/json';
    fhttp.Request.CustomHeaders.Clear;
    fhttp.Request.CustomHeaders.Add('Authorization: Bearer '+ TokenObject.Token);

    url := fBaseUrl + '/uapi/phoneCalls/@owner/' + fExtension +'/' + fCallId;
    fHttp.Get(url, sStream);
    json := TJSONObject.Create;
    json.Parse(BytesOf(sStream.DataString), 0);
    cnt := StrToInt(AnsiDequotedStr(json.Values['totalResults'].ToString, '"'));

  finally
    sStream.Free;
    json.Free;

    if cnt = 0 then
    begin
      if Assigned(fOnCallFinish) then
        fOnCallFinish(self);
      Destroy;
    end
    else
      fTimer.Interval := fTimerInterval;
  end;
end;

procedure TCallListener.TimerProc(Sender: TObject);
begin
  GetStatusCall;
end;

end.
