unit formClientUr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassSimpleForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxDBEdit,
  cxDropDownEdit, cxMemo, cxCalendar, cxTextEdit, cxMaskEdit, Vcl.StdCtrls,
  RzButton, Vcl.ExtCtrls, RzPanel, dxGDIPlusClasses;

type
  TfrmClientUr = class(TSimpleForm)
    Label6: TLabel;
    Passp_pnl: TRzPanel;
    Label10: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label7: TLabel;
    Label13: TLabel;
    OGRN_edt: TcxDBMaskEdit;
    Bank_edt: TcxDBMaskEdit;
    INN_edt: TcxDBMaskEdit;
    KPP_edt: TcxDBMaskEdit;
    BIK_edt: TcxDBMaskEdit;
    RSchet_edt: TcxDBMaskEdit;
    KorrShet_edt: TcxDBMaskEdit;
    Forma_cb: TcxDBComboBox;
    Label8: TLabel;
    Label16: TLabel;
    cxDBComboBox2: TcxDBComboBox;
    Label18: TLabel;
    cxDBComboBox3: TcxDBComboBox;
    Label1: TLabel;
    OrgName_Edt: TcxDBTextEdit;
    Label3: TLabel;
    Phone_edt: TcxDBTextEdit;
    Label14: TLabel;
    Comments_memo: TcxDBMemo;
    ID_edt: TcxDBTextEdit;
    Label17: TLabel;
    cxDBComboBox1: TcxDBComboBox;
    RzGroupBox1: TRzGroupBox;
    cxDBTextEdit1: TcxDBTextEdit;
    Label19: TLabel;
    Label21: TLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    Label23: TLabel;
    cxDBTextEdit5: TcxDBTextEdit;
    Label4: TLabel;
    cxDBComboBox4: TcxDBComboBox;
    Label2: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    Label15: TLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    Label20: TLabel;
    InfoGer_CB: TcxDBComboBox;
    Label22: TLabel;
    cxDBComboBox5: TcxDBComboBox;
    Label24: TLabel;
    cxDBMemo1: TcxDBMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClientUr: TfrmClientUr;

implementation

{$R *.dfm}

end.
