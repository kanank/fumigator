unit formEditRegion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassFormEditData, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Data.DB, RzButton, cxTextEdit, cxMaskEdit, cxDBEdit, Vcl.StdCtrls, cxCheckBox,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TfrmEditRegion = class(TfrmEditData)
    cmbPhoneType: TcxDBLookupComboBox;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  TfrmEditRegionClass = class of TfrmEditRegion;

implementation

{$R *.dfm}
uses
  DM_Main, frPhones, IBX.IBQuery;

procedure TfrmEditRegion.btnOKClick(Sender: TObject);
var
  Q: TIBQuery;
begin
  ModalResult := mrOk;
  inherited;

end;

procedure TfrmEditRegion.FormShow(Sender: TObject);
var
  rc: integer;
  fld: TField;
begin
  inherited;
  if DS.DataSet = nil then
    Exit;

end;

end.
