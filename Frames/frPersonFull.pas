unit frPersonFull;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frPersonSmall, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, frListBase,
  frPhones, frameBase, frPasport, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery,
  IBX.IBUpdateSQL, IBX.IBDatabase, cxDropDownEdit, cxDBEdit, cxMaskEdit, cxCalendar, cxTextEdit,
  Vcl.StdCtrls, Vcl.ExtCtrls, RzPanel, frAddress, frKLADR;

type
  TFramePersonFull = class(TFramePersonSmall)
    FramePassport: TFramePassport;
    FramePhones: TFramePhones;
    FramePersonAdr: TFrameKLADRAdr;
  private
    { Private declarations }
  protected
    procedure SetTransaction(AValue: TIBTransaction); override;
  public
    function OpenData(Aid: integer = 0): Boolean; override;
    function SaveData: Boolean; override;
  end;

var
  FramePersonFull: TFramePersonFull;

implementation

{$R *.dfm}

{ TFramePersonFull }

function TFramePersonFull.OpenData(Aid: integer): Boolean;
begin
  Result := inherited OpenData(Aid);
  if not result then
    Exit;

  if Query.State = dsInsert then
    Query.FieldByName('SEX').AsString := 'ћ';
  Result := False;
  try
    FramePassport.AddParam('ID', Query.FieldByName('PASS_ID'));
    FramePassport.OpenData;
    FramePhones.AddParam('CLIENT_ID', Query.FieldByName('ID'));
    FramePhones.OpenData;
    FramePersonAdr.AddParam('ID', Query.FieldByName('ADR_ID'));
    //FramePersonAdr.OpenData;
    Result := True;
  except
    Result := False;
  end;
end;

function TFramePersonFull.SaveData: Boolean;
begin
  Result := false;

  // если добавл€лс€ паспорт

  try
    try
      //сохран€ем справочники, получаем их id
      Result := FramePassport.SaveData;
      if not Result then
        Exit;

      if not (Query.State in [dsInsert, dsEdit]) then
        Query.Edit;

      if Query.FieldByName('PASS_ID').AsInteger = 0 then
        Query.FieldByName('PASS_ID').AsInteger :=
                                             FramePassport.Id;

      //Query.Post;
      Result := inherited SaveData;

      if not result then
        Exit;

       //сохран€ем телефоны
       Result := FramePhones.SaveData;

    except
      Result := false;
      fErr := 'SaveData error:'+ #13#10 + Exception(ExceptObject).Message;
    end;
  finally

  end;
end;

procedure TFramePersonFull.SetTransaction(AValue: TIBTransaction);
begin
  inherited;
  FramePassport.Transaction := AValue;
  FramePhones.Transaction := AValue;
  FramePersonAdr.Transaction := AValue;
end;

end.
