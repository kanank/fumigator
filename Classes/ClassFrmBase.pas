unit ClassFrmBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxGDIPlusClasses, Vcl.ExtCtrls,
  CommonTypes, CommonVars, Data.DB;

const
  AppCaption = '������ ������������� ��������';

type
  TBooleanFunc = function(Sender: TObject): boolean;
type
  TBaseForm = class(TForm)
    img1: TImage;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    procedure SetCaption(AValue: string);
  protected
    fCloseOnCancelCall: boolean; //��������� ��� ������ ������
    fCanClose: Boolean;
    fHideOnClose: boolean; //�������� ��� ��������
    fOnCalcHideOnClose: TBooleanFunc; //�������
    fTitle: string;
    fFrmParam: TFrmCreateParam;
    fNonValidateList: TStringList;
    fValidateList: TStringList;  //��������� ���������� ���� ��� �������� Required
    procedure SetNonValidate(Alist: string);
    function Validate(ADataSource: TDataSource): Boolean;
    procedure WmStartCall(var Msg: TMessage); message WM_STARTCALL;
    procedure WmFinishCall(var Msg: TMessage); message WM_FINISHCALL;
    procedure WmAcceptCall(var Msg: TMessage); message WM_ACCEPTCALL;
    procedure DoStartCall; virtual;
    procedure DoFinishCall; virtual;
    procedure DoAcceptCall; virtual;

    function CalcHideOnClose: boolean; virtual;
  public
    property OnCalcHideOnClose: TBooleanFunc read fOnCalcHideOnClose write fOnCalcHideOnClose;

    constructor Create(AOwner: TComponent;  ATitle: string=''; AParam: PFrmCreateParam=nil); overload; virtual;
    class function ValidateData(ADataSource: TDataSource; AComponent: TComponent = nil; ANonValidList: TStringList=nil; AValidList: TStringList=nil): Boolean; //�������� ������������� ����������� �����
    destructor Destroy; overload;
    procedure SetValidateList(Alist: string);
    procedure CloseAbsolute; //�������, �� ������ CanClose
    procedure HideAbsolute; //������
    procedure PostMessageToAll(AMsg: TMessage);
  published
    property Title: string read fTitle write SetCaption;
    property CanClose: Boolean read fCanClose write fCanClose;
    property CloseOnCancelCall: Boolean read fCloseOnCancelCall write fCloseOnCancelCall;
    property HideOnClose: boolean read CalcHideOnClose;
  end;


implementation

{$R *.dfm}
uses
  System.TypInfo, IBX.IBQuery, cxDBEdit, cxDBLookupComboBox, frameBase;

function TBaseForm.CalcHideOnClose: boolean;
begin
  if Assigned(fOnCalcHideOnClose)then
    Result := fOnCalcHideOnClose(self)
  else
    Result := fHideOnClose;
end;

procedure TBaseForm.CloseAbsolute;
begin
  CanClose := True;
  if fsModal in FormState then
    ModalResult := mrCancel
  else
    Close;
end;

constructor TBaseForm.Create(AOwner: TComponent; ATitle: string=''; AParam: PFrmCreateParam=nil);
begin
  inherited Create(AOwner);
  if ATitle = '' then
    ATitle := Caption;
  if Aparam <> nil then
    fFrmParam := AParam^;

  Title := ATitle;
  fNonValidateList := TStringList.Create;
  fValidateList := TStringList.Create;
  fCanClose := True;
end;

destructor TBaseForm.Destroy;
begin
  fNonValidateList.Free;
  fValidateList.Free;
end;

procedure TBaseForm.DoAcceptCall;
begin

end;

procedure TBaseForm.DoFinishCall;
begin
  if fCloseOnCancelCall and CallObj.Cancelled then
    Self.CloseAbsolute;

end;

procedure TBaseForm.DoStartCall;
begin

end;

procedure TBaseForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := fCanClose;
  if not CanClose then
    Exit;

  CanClose := not HideOnClose;

  if HideOnClose then
    Hide;
end;

procedure TBaseForm.HideAbsolute;
begin
  Hide;
  if fsModal in FormState then
    ModalResult := mrCancel;
end;

procedure TBaseForm.PostMessageToAll(AMsg: TMessage);
var
  i: Integer;
begin
  for I := 0 to Screen.FormCount - 1 do
    PostMessage(Screen.Forms[i].Handle, AMsg.Msg, 0, 0);
end;

procedure TBaseForm.SetCaption(AValue: string);
begin
  fTitle := AValue;
  Caption := AppCaption + '. ' + AValue;
end;

procedure TBaseForm.SetNonValidate(Alist: string);
begin
  fNonValidateList.DelimitedText := Alist;
end;

procedure TBaseForm.SetValidateList(Alist: string);
begin
  fValidateList.DelimitedText := Alist;
end;

function TBaseForm.Validate(ADataSource: TDataSource): Boolean;
begin
  Result := ValidateData(ADataSource, self, fNonValidateList, fValidateList);
  fCanClose := Result;
end;

class function TBaseForm.ValidateData(ADataSource: TDataSource; AComponent: TComponent = nil; ANonValidList: TStringList=nil; AValidList: TStringList=nil): Boolean;

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
  fld: TField;
begin
  if AComponent = nil then
    AComponent := ADataSource.Owner;

  resAll := True;

  if Assigned(ADataSource.DataSet) and  ADataSource.DataSet.Modified then
    for i  := 0 to ADataSource.DataSet.FieldCount - 1 do
    begin
      fld := ADataSource.DataSet.Fields[i];
      if (fld.Required or
           (Assigned(AValidList) and
             (AValidList.IndexOf(fld.FieldName) > -1)))
         and
           (TIBQuery(ADataSource.DataSet).GeneratorField.Field <>
             fld.FieldName)
         and
          not(Assigned(ANonValidList) and
           (ANonValidList.IndexOf(ADataSource.DataSet.Fields[i].FieldName)> -1)) then //���� ���������� ��������� �� ��������
      begin
        res := SetRequiredBorder(AComponent, ADataSource.DataSet.Fields[i]);
        if not res then
          resAll := False;
      end;
    end;
  Result := resAll;
end;


procedure TBaseForm.WmAcceptCall(var Msg: TMessage);
begin
  DoAcceptCall;
end;

procedure TBaseForm.WmFinishCall(var Msg: TMessage);
begin
  DoFinishCall;
end;

procedure TBaseForm.WmStartCall(var Msg: TMessage);
begin
  DoStartCall;
end;

end.
