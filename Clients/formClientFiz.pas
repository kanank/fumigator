unit formClientFiz;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassSimpleForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxDBEdit,
  cxDropDownEdit, cxMemo, cxCalendar, cxTextEdit, cxMaskEdit, Vcl.StdCtrls,
  RzButton, Vcl.ExtCtrls, RzPanel, dxGDIPlusClasses, Data.DB, frameBase,
  frPersonSmall, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, frPhones,
  frPasport, frAddress, frListBase, frPersonFull, frKLADR, frUslugi,
  frAddressRegion;

type
  TfrmClientFiz = class(TSimpleForm)
    ID_edt: TcxDBTextEdit;
    Label14: TLabel;
    Comments_memo: TcxDBMemo;
    Label15: TLabel;
    Label18: TLabel;
    DS: TDataSource;
    cmbFormat: TcxDBLookupComboBox;
    cmbStatus: TcxDBLookupComboBox;
    FramePersonFull1: TFramePersonFull;
    FrameKLADRAdrRegion1: TFrameKLADRAdrRegion;
    FrameUslugi1: TFrameUslugi;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
   //constructor Create(AOwner: TComponent ); override;
  end;

var
  frmClientFiz: TfrmClientFiz;

implementation

{$R *.dfm}
uses
  DM_Main, CommonTypes;

procedure TfrmClientFiz.FormCreate(Sender: TObject);
begin
  inherited;
  if fFrmParam.Dataset <> nil then
    DS.DataSet := fFrmParam.Dataset;

  case fFrmParam.action of
    asCreate:
      begin
        Title := '[новая запись]';
        if (DS.DataSet <> nil) and DS.DataSet.Active then
          DS.DataSet.Append;
      end;
    asEdit:
      begin
        Title := '[редактирование]';
        if (DS.DataSet <> nil) and DS.DataSet.Active then
          DS.DataSet.Edit;
      end;
    asShow:
      begin
        Title := '[просмотр]';
      end;

  end;
end;

end.
