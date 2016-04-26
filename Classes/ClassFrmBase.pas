unit ClassFrmBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxGDIPlusClasses, Vcl.ExtCtrls,
  CommonTypes, Data.DB;

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
    class function ValidateData(ADataSource: TDataSource; AComponent: TComponent = nil): Boolean; //проверка заполненности необходимых полей
  published
    property Title: string read fTitle write SetCaption;
  end;


implementation

{$R *.dfm}
uses
  System.TypInfo, IBX.IBQuery, cxDBEdit, cxDBLookupComboBox, frameBase;

constructor TBaseForm.Create(AOwner: TComponent; ATitle: string=''; AParam: PFrmCreateParam=nil);
begin
  inherited Create(AOwner);
  if ATitle = '' then
    ATitle := Caption;
  if Aparam <> nil then
    fFrmParam := AParam^;

  Title := ATitle;
end;

procedure TBaseForm.SetCaption(AValue: string);
begin
  fTitle := AValue;
  Caption := AppCaption + '. ' + AValue;
end;

class function TBaseForm.ValidateData(ADataSource: TDataSource; AComponent: TComponent = nil): Boolean;

  function SetRequiredBorder(AComponent: TComponent; AField: TField): boolean;
  var
    c: TComponent;
    i: integer;
    res: Boolean;
  begin
    Result := not AField.IsNull;
    res := True;

    for i := 0 to AComponent.ComponentCount - 1 do
    begin
      c := AComponent.Components[i];
      if c.ComponentCount > 0 then
      begin
        SetRequiredBorder(C, AField);
        if (C is TDbFrameBase) and not TDbFrameBase(C).ReadOnly then
          if not TDbFrameBase(C).ValidateData then
            res := False;
      end;

      if ((C is TcxDBTextEdit) or (C is TcxDBLookupComboBox)) and
           (TcxDBTextEdit(C).DataBinding.Field = AField) then
        if AField.IsNull then
        begin
          TcxDBTextEdit(C).Style.Color := clSkyBlue;
          TcxDBTextEdit(C).Style.TransparentBorder := False;
        end
        else
        begin
          TcxDBTextEdit(C).Style.Color := clWindow;
          TcxDBTextEdit(C).Style.TransparentBorder := true;
        end;
    end;
    Result := Result and res;
  end;

var
  i: Integer;
  res, resAll: Boolean;
begin
  if AComponent = nil then
    AComponent := ADataSource.Owner;

  resAll := True;
  if Assigned(ADataSource.DataSet) then
    for i  := 0 to ADataSource.DataSet.FieldCount - 1 do
      if ADataSource.DataSet.Fields[i].Required and
        (TIBQuery(ADataSource.DataSet).GeneratorField.Field <>
          ADataSource.DataSet.Fields[i].FieldName) then //поля генератора исключаем из проверки
      begin
        res := SetRequiredBorder(AComponent, ADataSource.DataSet.Fields[i]);
        if not res then
          resAll := False;
      end;
  Result := resAll;
end;


end.
