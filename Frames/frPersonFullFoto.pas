unit frPersonFullFoto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frPersonSmallFoto, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Data.DB, IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBUpdateSQL, IBX.IBDatabase, cxDropDownEdit,
  cxCalendar, cxDBEdit, frListBase, frPhones, frameBase, frFoto, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxMaskEdit, cxTextEdit, Vcl.StdCtrls,
  Vcl.ExtCtrls, RzPanel, frPasport;

type
  TFramePersonFullFoto = class(TFramePersonSmallFoto)
    Label3: TLabel;
    edtEmailPrivate: TcxDBTextEdit;
    Label6: TLabel;
    Label7: TLabel;
    FramePassport: TFramePassport;
  private

  protected
    procedure SetTransaction(AValue: TIBTransaction); override;
  public
    function OpenData(Aid: integer = 0): Boolean; override;
    function SaveData: Boolean; override;
  end;


implementation

{$R *.dfm}

function TFramePersonFullFoto.OpenData(Aid: integer): Boolean;
begin
  Result := inherited OpenData(Aid);
  if not result then
    Exit;

  if Query.State = dsInsert then
    Query.FieldByName('SEX').AsString := 'М';
  Result := False;
  try
    FramePassport.AddParam('ID', Query.FieldByName('PASS_ID'));
    FramePassport.OpenData;
    FramePhones.AddParam('CLIENT_ID', Query.FieldByName('ID'));
    FramePhones.TypePhone := 1;
    FramePhones.OpenData;
    FrameFoto.AddParam('ID', Query.FieldByName('PHOTO_ID'));
    FrameFoto.OpenData;
    Result := True;
  except
    Result := False;
  end;
end;

function TFramePersonFullFoto.SaveData: Boolean;
begin
  Result := false;

  try
    try
      //сохраняем справочники, получаем их id
      Result := FramePassport.SaveData;
      if not Result then
        Exit;

       Result := FrameFoto.SaveData;
      if not Result then
        Exit;

      if not (Query.State in [dsInsert, dsEdit]) then
        Query.Edit;

      if Query.FieldByName('PASS_ID').AsInteger <>
                                        FramePassport.Id then
        Query.FieldByName('PASS_ID').AsInteger :=
                                             FramePassport.Id;
      if Query.FieldByName('PHOTO_ID').AsInteger <>
                                        FrameFoto.Id then
        Query.FieldByName('PHOTO_ID').AsInteger :=
                                             FrameFoto.Id;

      //Query.Post;
      Result := inherited SaveData;

      if not result then
        Exit;

       //сохраняем телефоны
       Result := FramePhones.SaveData;

    except
      Result := false;
      fErr := 'SaveData error:'+ #13#10 + Exception(ExceptObject).Message;
    end;
  finally

  end;
end;

procedure TFramePersonFullFoto.SetTransaction(AValue: TIBTransaction);
begin
  inherited;
  FramePassport.Transaction := AValue;
  FramePhones.Transaction := AValue;
  FrameFoto.Transaction := AValue;
end;

end.
