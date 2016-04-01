unit formClientFiz;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassSimpleForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxDBEdit,
  cxDropDownEdit, cxMemo, cxCalendar, cxTextEdit, cxMaskEdit, Vcl.StdCtrls,
  RzButton, Vcl.ExtCtrls, RzPanel, dxGDIPlusClasses, Data.DB, frameBase,
  frPersonSmall;

type
  TfrmClientFiz = class(TSimpleForm)
    Label6: TLabel;
    Passp_pnl: TRzPanel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    PassNum_medt: TcxDBMaskEdit;
    PassDate_DP: TcxDBDateEdit;
    PassCode_edt: TcxDBTextEdit;
    PassOrg_memo: TcxDBMemo;
    Label3: TLabel;
    Phone_edt: TcxDBTextEdit;
    ID_edt: TcxDBTextEdit;
    Label8: TLabel;
    Adres_memo: TcxDBMemo;
    Label14: TLabel;
    Comments_memo: TcxDBMemo;
    Label9: TLabel;
    InfoGer_CB: TcxDBComboBox;
    Label16: TLabel;
    cxDBComboBox1: TcxDBComboBox;
    Label17: TLabel;
    cxDBMemo1: TcxDBMemo;
    cxDBComboBox2: TcxDBComboBox;
    Label15: TLabel;
    Label18: TLabel;
    cxDBComboBox3: TcxDBComboBox;
    DS: TDataSource;
    FramePersonSmall1: TFramePersonSmall;
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
