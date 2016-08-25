unit TelpinRingMeAPI;

interface

uses
  Vcl.ExtCtrls, System.Classes, IdHTTP, IdSSLOpenSSL, System.JSON,
  System.SysUtils, System.DateUtils;

type
  TTelphinRingMeToken = class;

  TTelphinRingMeAPIBaseElement = class
  protected
    fBaseUrl: string;
    fApiUrl: string;
    fHttp: TIdHTTP;
    fHttpErr: string;
    fResponse: string;

    fSSL: TIdSSLIOHandlerSocketOpenSSL;
  public
    property BaseUrl: string read fBaseUrl write fBaseUrl;
    property ApiUrl: string read fApiUrl write fApiUrl;
    property HttpErr: string read fHttpErr;
    property HttpResponse: string read fResponse;

    function HttpGet(aUrl: string; aUseApiUrl: Boolean = true): string; virtual;
    constructor Create; overload;
    destructor Destroy; overload;
  end;

  TTelphinRingMeAPIElement = class(TTelphinRingMeAPIBaseElement)
  private
    FTokenObject: TTelphinRingMeToken;
    fUserId: string;

    function GetTokenObject: TTelphinRingMeToken;
  public
    property TokenObject: TTelphinRingMeToken read GetTokenObject write FTokenObject;

    function HttpGet(aUrl: string; aUseApiUrl: Boolean = true): string; override;
    constructor Create(ATokenObject: TTelphinRingMeToken=nil); overload;
  end;

  TTelphinRingMeToken = class(TTelphinRingMeAPIBaseElement)
  private
    fClientKey: string;
    fSecretKey: string;
    fToken: string;
    fTimer: TTimer;
    fAutoReGet: Boolean;
    fTimeExpires: TDateTime; //время истечения

    fExtList: string; //список extension

    procedure SetAutoReGet(AValue: boolean);
    procedure GetTokenProc(Sender: TObject);
    function CheckToken: Boolean;
    function GetActiveToken: string;

    function GetExtList: string;
  public
    property AppId: string read fClientKey write fClientKey;
    property AppSecret: string read fSecretKey write fSecretKey;
    property Token: string read GetActiveToken;
    property AutoReGet: Boolean read fAutoReGet write SetAutoReGet;
    property TimeExpires: TDateTime read fTimeExpires;
    property TokenIsActive: Boolean read CheckToken;

    property ExtensionList: string read GetExtList;

    function HttpGet(aUrl: string; aUseApiUrl: Boolean = true): string; override;
    constructor Create; overload;
    destructor Destroy; overload;
    function GetToken: Boolean;
  end;

  TTelphinRingMeTool = class (TTelphinRingMeAPIElement)
  private
    fClient_id: string;
    fClientJSON: string;
    fExtList: string;
    function GetClientInfo: string;
    function GetExtList:  string;
    function GeExtList: string;
  public
    property ClientId: string read GetClientInfo;
    property ExtensionList: string read GeExtList;
  end;

  TPhoneCalls = class (TTelphinRingMeAPIElement)
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
    function DeleteCall(ACallApiId: string; APhone: string): Boolean;
    function GetRecordInfo(ACallApiId: string; AExt: string): string;
  end;

  TThreadTimer = class(TThread)
  private
    fInterval: Integer;
    fProc: TNotifyEvent;
    fActive: Boolean;
    fStop: Boolean;
    fFirstJobOnStarting: Boolean;
    procedure DoJob;
    procedure SetActive(AValue: Boolean);
  public
    property Active: Boolean read fActive write SetActive; //перевод в активное состояние
    property Interval: Integer read fInterval write fInterval;
    property OnTimer: TNotifyEvent read fProc write fProc;
    property FirstJobOnStarting: Boolean read fFirstJobOnStarting write fFirstJobOnStarting;
    procedure Stop;
    procedure Execute; override;
    constructor Create(AActive: Boolean=False; AFirstJobOnStart: Boolean = false); overload;
  end;


implementation

{ TTelphinRingMeToken }

function TTelphinRingMeToken.CheckToken: Boolean;
begin
  Result := Assigned(Self) and ((fToken = '') or (Now < fTimeExpires));
end;

constructor TTelphinRingMeToken.Create;
begin
  inherited Create;
  fAutoReGet := True;

  //fTimer := TTimer.Create(nil);
  //fTimer.Interval := 0;
  //fTimer.OnTimer := GetTokenProc;
end;

destructor TTelphinRingMeToken.Destroy;
begin
  if Assigned(fTimer) then
   fTimer.Free;
end;

function TTelphinRingMeToken.GetToken: Boolean;
begin
  GetTokenProc(nil);
  GetExtList;
end;

function TTelphinRingMeToken.GetExtList: string;
begin
  Result := HttpGet('/client/@me/extension/');
end;

function TTelphinRingMeToken.GetActiveToken: string;
begin
  if not CheckToken then
    GetToken;
  Result := fToken;
end;

procedure TTelphinRingMeToken.GetTokenProc(Sender: TObject);
var
  sResponse: string;
  stream: TStringStream;
  json: TJSONObject;
  keep: Integer;
begin
  stream := TStringStream.Create('');
  stream.WriteString('grant_type=client_credentials&');
//  stream.WriteString('redirect_uri=urn:ietf:wg:oauth:2.0:oob&');
  stream.WriteString('client_id=' + fClientKey + '&');
  stream.WriteString('client_secret=' + fSecretKey) ;//; + '&');
 // stream.WriteString('state=0');


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

    json := TJSONObject.Create;
    try
      sResponse := fHttp.Post(fBaseUrl + '/oauth/token', stream);
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

function TTelphinRingMeToken.HttpGet(aUrl: string; aUseApiUrl: Boolean): string;
begin
  if fToken <> '' then
  begin
    fHttp.Request.CustomHeaders.Clear;
    fhttp.Request.CustomHeaders.Add('Authorization: Bearer '+ fToken);
  end;
  Result := inherited HttpGet(aUrl, aUseApiUrl);
end;

procedure TTelphinRingMeToken.SetAutoReGet(AValue: boolean);
begin
  if not AValue then
    fTimer.Interval := 0;
  fAutoReGet := AValue;
end;

{ TTelphinRingMeAPIElement }

constructor TTelphinRingMeAPIElement.Create(ATokenObject: TTelphinRingMeToken=nil) ;
begin
  inherited Create;
  if ATokenObject <> nil then
    FTokenObject := ATokenObject;
end;


function TTelphinRingMeAPIElement.GetTokenObject: TTelphinRingMeToken;
begin
  if not Assigned(FTokenObject) then
    FTokenObject := TTelphinRingMeToken.Create;
  Result := FTokenObject;
end;

function TTelphinRingMeAPIElement.HttpGet(aUrl: string;
  aUseApiUrl: Boolean): string;
begin
  fHttp.Request.CustomHeaders.Clear;
  fhttp.Request.CustomHeaders.Add('Authorization: Bearer '+ TokenObject.Token);
  Result := inherited HttpGet(aUrl, aUseApiUrl);
end;

{ TPhoneCalls }
function TPhoneCalls.DeleteCall(ACallApiId: string; APhone: string): Boolean;
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

    url := fBaseUrl + Format('/uapi/phoneCalls/@me/%s/%s', [APhone, ACallApiId]);
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
      if json.Values['totalResults'].ToString <> '0' then
      begin
        json1 := TJSONObject.ParseJSONValue(json.GetValue('entry').ToString) as TJSONArray;
        if json1 <> nil then
        begin
          json   := TJSONObject.ParseJSONValue(json1.Items[0].ToString) as TJSONObject;
          Result := json.GetValue('filename').Value;
          Result := AnsiDequotedStr(Result, '"');
        end;
      end;
      if Result = '' then
        Result := '#not found';
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

{ TTelphinRingMeAPIBaseElement }

constructor TTelphinRingMeAPIBaseElement.Create;
begin
  fHttp := TIdHTTP.Create(nil);
  fSSL:=TIdSSLIOHandlerSocketOpenSSL.Create;
  fHttp.IOHandler:=fSSL;
  fBaseUrl := 'https://apiproxy.telphin.ru';
  fApiUrl  := '/api/ver1.0';
end;

destructor TTelphinRingMeAPIBaseElement.Destroy;
begin
  if Assigned(fHttp) then
    fHttp.Free;
  if Assigned(fSSL) then
    fSSL.Free;
end;

function TTelphinRingMeAPIBaseElement.HttpGet(aUrl: string;
  aUseApiUrl: Boolean): string;
var
  sStream: TStringStream;
  url: string;
begin
  sStream := TStringStream.Create;
  fHttp.Request.Method := 'GET';
  //fhttp.Request.CustomHeaders.Clear;
  //fhttp.Request.CustomHeaders.Add('Authorization: Bearer '+ TokenObject.Token);

  fHttpErr := '';

  url := fBaseUrl;
  if aUseApiUrl then
    url := url + fApiUrl;
  url := Url + aUrl;

  try
    fHttp.Get(url, sStream);
    Result := sStream.DataString;
  except
   fHttpErr := Exception(ExceptObject).Message;
  end;
  sStream.Free;
end;

{ TThreadTimer }

constructor TThreadTimer.Create(AActive, AFirstJobOnStart: Boolean);
begin
  fFirstJobOnStarting := AFirstJobOnStart;
  FreeOnTerminate := True;
  inherited Create(not AActive);
end;

procedure TThreadTimer.DoJob;
begin
  if Assigned(fProc) then
   fProc(Self);
end;

procedure TThreadTimer.Execute;
begin
  fActive := True;
  if fFirstJobOnStarting then
    DoJob;

   while not Terminated or not fStop do
   begin
     Sleep(fInterval);
     DoJob;
   end;
end;

procedure TThreadTimer.SetActive(AValue: Boolean);
begin
  if AValue and not fActive then
    Start;
end;

procedure TThreadTimer.Stop;
begin
  fStop := True;
  fActive := False;
end;

{ TTelphinRingMeTool }

function TTelphinRingMeTool.GeExtList: string;
begin

end;

function TTelphinRingMeTool.GetClientInfo: string;
var
  sStream: TStringStream;
  url: string;
begin
  sStream := TStringStream.Create;
  fHttp.Request.Method := 'GET';
  fhttp.Request.CustomHeaders.Clear;
  fhttp.Request.CustomHeaders.Add('Authorization: Bearer '+ TokenObject.Token);

  url := fBaseUrl + fApiUrl + '/client/@me/client/';
  try
    fHttp.Get(url, sStream);
    fClientJSON := sStream.DataString;
  except

  end;
  sStream.Free;
end;

function TTelphinRingMeTool.GetExtList: string;
begin
  Result := HttpGet('/client/@me/extension/');
end;

end.
