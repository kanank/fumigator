unit TelpinAPI;

interface

uses
  Vcl.ExtCtrls;

type
  TTelphinAPIElement = class
  private
    fBaseUrl: string;
    fClientKey: string;
  public
    property BaseUrl: string read fBaseUrl write fBaseUrl;
    property ClientKey: string read fClientKey write fClientKey;
end;

type
  TTelphinToken = class(TTelphinAPIElement)
  private
    fToken: string;
    fTimer: TTimer;
    fAutoReGet: Boolean;
    fTimeExpires: TDateTime; //время истечения

    procedure SetAutoReGet(AValue: boolean);
  public
    property AccessToken: string read fToken;
    property AutoReGet: Boolean read fAutoReGet write SetAutoReGet;
    property TimeExpires: TDateTime read fTimeExpires;

    constructor Create; overload;
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
  fTuimer.OnTimer := GetToken;
end;

function TTelphinToken.GetToken: Boolean;
begin
  //if True then

end;

procedure TTelphinToken.SetAutoReGet(AValue: boolean);
begin
  if not AValue then
    fTimer.Interval := 0;
  fAutoReGet := AValue;
end;

end.
