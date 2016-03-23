unit frmWorker;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxDBEdit, Vcl.StdCtrls,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxGroupBox, DM_Main,
  RzButton, Vcl.ExtCtrls, RzPanel, RzTabs, cxMemo, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxCurrencyEdit, cxCheckBox, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxListBox, cxImage, ClassSimpleForm,
  dxGDIPlusClasses;

type
  TfrmWorker = class(TSimpleForm)
    RzPageControl1: TRzPageControl;
    Short_Tab: TRzTabSheet;
    Mail_pln: TcxGroupBox;
    Label5: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    BirthDate_dp: TcxDBDateEdit;
    SurName_edt: TcxDBTextEdit;
    Name_edt: TcxDBTextEdit;
    Family_Edt: TcxDBTextEdit;
    WorkerFoto_pnl: TRzPanel;
    Foto_img: TImage;
    Phone_edt: TcxDBTextEdit;
    Email_edt: TcxDBTextEdit;
    cxDBImage1: TcxDBImage;
    Full_Tab: TRzTabSheet;
    RzPanel3: TRzPanel;
    Save_btn: TRzButton;
    Cancel_btn: TRzButton;
    cxGroupBox1: TcxGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label3: TLabel;
    Label15: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label28: TLabel;
    F_BirthDate_dp: TcxDBDateEdit;
    F_SurName_edt: TcxDBTextEdit;
    F_Name_edt: TcxDBTextEdit;
    F_Family_edt: TcxDBTextEdit;
    RzPanel4: TRzPanel;
    F_Foto_img: TImage;
    RzBitBtn2: TRzBitBtn;
    RzBitBtn3: TRzBitBtn;
    F_ShortName_edt: TcxDBTextEdit;
    F_Phone_Work_edt: TcxDBTextEdit;
    F_Email_Work_edt: TcxDBTextEdit;
    F_Phone_Priv_edt: TcxDBTextEdit;
    F_Email_Priv_edt: TcxDBTextEdit;
    RzGroupBox1: TRzGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    PassOrg_memo: TcxDBMemo;
    PassCode_edt: TcxDBTextEdit;
    PassDate_DP: TcxDBDateEdit;
    PassNum_medt: TcxDBMaskEdit;
    Tabel_edt: TcxDBTextEdit;
    Status_LCB: TcxDBLookupComboBox;
    Comments_memo: TcxDBMemo;
    Job_LCB: TcxDBLookupComboBox;
    Oklad_cedt: TcxDBCurrencyEdit;
    ATSNUM_edt: TcxDBTextEdit;
    ID_edt: TcxDBTextEdit;
    RzPanel5: TRzPanel;
    UserParams_pnl: TcxGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    User_Login_edt: TcxDBTextEdit;
    User_Pass_edt: TcxDBTextEdit;
    User_Role_edt: TcxDBLookupComboBox;
    User_Blocked_cb: TcxDBCheckBox;
    cxGroupBox2: TcxGroupBox;
    RzPanel6: TRzPanel;
    DelFile_btn: TRzButton;
    AddFile_btn: TRzButton;
    cxListBox1: TcxListBox;
    imgFoto: TcxDBImage;
    FullForm_btn: TRzButton;
    procedure FullForm_btnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formWorker: TfrmWorker;

implementation

{$R *.dfm}

uses
  System.StrUtils;

procedure TfrmWorker.FormCreate(Sender: TObject);
begin
  inherited;

  self.Constraints.MaxHeight := 354 ;
  self.Constraints.MaxWidth  := 459 ;
  self.Constraints.MinHeight := 354 ;
  self.Constraints.MinWidth  := 459 ;
  // права
  Full_Tab.TabVisible := false;
end;

procedure TfrmWorker.FullForm_btnClick(Sender: TObject);
begin
  self.Constraints.MaxHeight := 660 ;
  self.Constraints.MaxWidth  := 715 ;
  self.Constraints.MinHeight := 660 ;
  self.Constraints.MinWidth  := 715 ;

  RzPageControl1.ActivePage := Full_Tab;
  Short_Tab.TabVisible := false;
  Full_Tab.TabVisible := true;
  FullForm_btn.Visible := False;
end;


end.
