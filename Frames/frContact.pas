unit frContact;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frameBase, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, frListBase,
  frPhones, cxDBEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, Vcl.StdCtrls, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBUpdateSQL, IBX.IBDatabase;

type
  TFrameContact = class(TDbFrameBase)
    Label1: TLabel;
    cmbType: TcxDBLookupComboBox;
    Label3: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    FramePhones: TFramePhones;
  private
    { Private declarations }
  protected
    procedure SetTransaction(AValue: TIBTransaction); override;
  public
    function OpenData(Aid: integer = 0): Boolean; override;
    function SaveData: Boolean; override;
  end;

var
  FrameContact: TFrameContact;

implementation

{$R *.dfm}
uses
  DM_Main;

{ TFrameContact }

function TFrameContact.OpenData(Aid: integer): Boolean;
begin
  Result := inherited OpenData(Aid);
  if not result then
    Exit;

  Result := False;
  try
    FramePhones.AddParam('CLIENT_ID', Query.FieldByName('ID'));
    FramePhones.typePhone := 3;
    FramePhones.OpenData;
    Result := True;
  except
    Result := False;
  end;
end;

function TFrameContact.SaveData: Boolean;
begin
 Result := false;


  try
    try
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

procedure TFrameContact.SetTransaction(AValue: TIBTransaction);
begin
  inherited;
  FramePhones.Transaction := AValue;
end;

end.
