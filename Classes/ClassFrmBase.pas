unit ClassFrmBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxGDIPlusClasses, Vcl.ExtCtrls,
  CommonTypes;

const
  AppCaption = 'Первая фумигационная компания';

type
  TBaseForm = class(TForm)
    img1: TImage;
  private
    procedure SetCaption(AValue: string);
  protected
    fTitle: string;
    fFrmParam: TFrmCreateParam;
  public
    constructor Create(AOwner: TComponent;  ATitle: string=''; AParam: PFrmCreateParam=nil); overload; virtual;
  published
    property Title: string read fTitle write SetCaption;
  end;


implementation

{$R *.dfm}

constructor TBaseForm.Create(AOwner: TComponent; ATitle: string=''; AParam: PFrmCreateParam=nil);
begin
  inherited Create(AOwner);
  if ATitle = '' then
    ATitle := Caption;
  fFrmParam := AParam^;

  Title := ATitle;
end;

procedure TBaseForm.SetCaption(AValue: string);
begin
  fTitle := AValue;
  Caption := AppCaption + '. ' + AValue;
end;

end.
