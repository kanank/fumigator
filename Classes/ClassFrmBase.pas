unit ClassFrmBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxGDIPlusClasses, Vcl.ExtCtrls;

const
  AppCaption = 'Первая фумигационная компания';

type
  TBaseForm = class(TForm)
    img1: TImage;
  private
    fTitle: string;
  procedure SetCaption(AValue: string);
  public
    constructor Create(AOwner: TComponent; ATitle: string=''); overload;
  published
    property Title: string read fTitle write SetCaption;
  end;


implementation

{$R *.dfm}

constructor TBaseForm.Create(AOwner: TComponent; ATitle: string);
begin
  inherited Create(AOwner);
  if ATitle = '' then
    ATitle := Caption;

  Title := ATitle;
end;

procedure TBaseForm.SetCaption(AValue: string);
begin
  fTitle := AValue;
  Caption := AppCaption + '. ' + AValue;
end;

end.
