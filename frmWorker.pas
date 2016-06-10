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
  dxGDIPlusClasses, frameBase, frPersonSmall, frPersonSmallFoto,
  frPersonFullFoto;

type
  TfrmWorker = class(TSimpleForm)
    RzPageControl1: TRzPageControl;
    Short_Tab: TRzTabSheet;
    Full_Tab: TRzTabSheet;
    RzPanel3: TRzPanel;
    Save_btn: TRzButton;
    Cancel_btn: TRzButton;
    RzPanel5: TRzPanel;
    FullForm_btn: TRzButton;
    _FramePersonSmall: TFramePersonSmallFoto;
    _FramePersonFull: TFramePersonFullFoto;
    RzPanel4: TRzPanel;
    Label28: TLabel;
    ATSNUM_edt: TcxDBTextEdit;
    Label25: TLabel;
    Label26: TLabel;
    RzPanel6: TRzPanel;
    Label1: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    Label2: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    RzPanel2: TRzPanel;
    Label3: TLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    DS: TDataSource;
    procedure FullForm_btnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Save_btnClick(Sender: TObject);
    procedure Cancel_btnClick(Sender: TObject);
    procedure Exit_bntClick(Sender: TObject);
    procedure _FramePersonFullcmbDateBirthPropertiesInitPopup(Sender: TObject);
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
  System.StrUtils, CommonTypes, IBX.IBQuery, frPersonFull, CommonVars;


procedure TfrmWorker.Cancel_btnClick(Sender: TObject);
begin
  if DS.DataSet.Modified then
  begin
    DS.DataSet.Cancel;
    TIBQuery(DS.DataSet).CancelUpdates;
    TIBQuery(DS.DataSet).RevertRecord;
  end;
  _FramePersonFull.Cancel;
end;

procedure TfrmWorker.Exit_bntClick(Sender: TObject);
begin
  if DS.DataSet.Modified then
    if Application.MessageBox('������� ������������� ���������!' + #13#10 +
        '���������� ��� ����������?', '��������',
        MB_ICONWARNING + MB_YESNO) = IdNo then
      TButton(Sender).ModalResult := mrNone
    else
      Cancel_btn.Click;
end;

procedure TfrmWorker.FormCreate(Sender: TObject);
begin
  inherited;

begin
  inherited;
  if fFrmParam.Dataset <> nil then
    DS.DataSet := fFrmParam.Dataset;

  case fFrmParam.action of
    asCreate:
      begin
        FullForm_btn.Click;

        Title := Title + ' [����� ������]';
        if (DS.DataSet <> nil) and DS.DataSet.Active then
        begin
          DS.DataSet.Append;
          DS.DataSet.FieldByName('USER_BLOCKED').AsInteger := 0;
          DS.DataSet.FieldByName('IS_DELETED').AsInteger := 0;
        end;
      end;
    asEdit:
      begin
        Title := Title + ' [��������������]';
        if (DS.DataSet <> nil) and DS.DataSet.Active then
          DS.DataSet.Edit;
      end;
    asShow:
      begin
        Title := Title + ' [��������]';

        Short_tab.TabVisible := True;
        RzPageControl1.ActivePage := Short_Tab;
        FullForm_btn.Visible := True;
        self.Constraints.MaxHeight := _FramePersonSmall.Height + 20 + RzPanel1.Height;
        self.Constraints.MaxWidth  := _FramePersonSmall.Width + 10;
        self.Constraints.MinHeight := _FramePersonSmall.Height + 20 + RzPanel1.Height;
        self.Constraints.MinWidth  := _FramePersonSmall.Width + 10;
      end;
  end;

  if fFrmParam.action <> asCreate then
  begin
    _FramePersonSmall.Transaction := TIBQuery(fFrmParam.Dataset).Transaction;
    _FramePersonSmall.AddParam('CLIENT_ID', DS.DataSet.FindField('ID'));
    _FramePersonSmall.AddParam('PERSON_ID', DS.DataSet.FindField('PERSON_ID'));
    _FramePersonSmall.OpenData;
    _FramePersonSmall.ReadOnly := True;
  end;

  _FramePersonFull.Transaction := TIBQuery(fFrmParam.Dataset).Transaction;
  _FramePersonFull.AddParam('CLIENT_ID', DS.DataSet.FindField('ID'));
  _FramePersonFull.AddParam('PERSON_ID', DS.DataSet.FindField('PERSON_ID'));
  _FramePersonFull.OpenData;
end;


end;


procedure TfrmWorker.FullForm_btnClick(Sender: TObject);
begin
//  self.Constraints.MaxHeight := 363 ;
//  self.Constraints.MaxWidth  := 788 ;
//  self.Constraints.MinHeight := 363 ;
//  self.Constraints.MinWidth  := 788 ;

  self.Constraints.MaxHeight := RzPageControl1.Height + 40 + RzPanel1.Height;
  self.Constraints.MaxWidth  := RzPageControl1.Width + 10;
  self.Constraints.MinHeight := self.Constraints.MaxHeight;
  self.Constraints.MinWidth  := self.Constraints.MaxWidth;

  RzPageControl1.ActivePage := Full_Tab;
  Short_Tab.TabVisible := False;
  Full_Tab.TabVisible  := True;
  FullForm_btn.Visible := False;
end;


procedure TfrmWorker.Save_btnClick(Sender: TObject);
var
  res: Boolean;
begin

  //��������� ������ ���
  DS.DataSet.FieldByName('full_name').AsString :=
    _FramePersonFull.FullName;

  //��������� �������� ���
  DS.DataSet.FieldByName('short_name').AsString :=
    _FramePersonFull.ShortName;

  //��������
  res := False;
  if not ValidateData(DS, self) then
  begin
    Application.MessageBox('�� ��������� ��� ����������� ����!',
     '��������', MB_ICONWARNING + MB_OK);
    TRzButton(Sender).ModalResult := mrNone;
    Exit;
  end
  else
    TButton(Sender).ModalResult := mrOk;

  //������ ��������
  try
    try
      if not TIBQuery(DS.DataSet).Transaction.Active then
        TIBQuery(DS.DataSet).Transaction.StartTransaction;

      //��������� ������
      res := _FramePersonFull.SaveData;
      if not res then
        Exit;

      // PERSON_ID
      if DS.DataSet.FieldByName('PERSON_ID').AsInteger <> _FramePersonFull.Id then
        DS.DataSet.FieldByName('PERSON_ID').AsInteger := _FramePersonFull.Id;

      DS.DataSet.Post;
      TIBQuery(DS.DataSet).ApplyUpdates;
      TIBQuery(DS.DataSet).Transaction.CommitRetaining;
      TIBQuery(DS.DataSet).Refresh;

      //������
      //res := FrameUslugi.SaveData;
    except
      res := False;
      ShowMessage('��������� ������ ���������� ������!' + #13#10 +
      Exception(ExceptObject).Message);
    end;
  finally
    if Res then
    begin
      if TIBQuery(DS.DataSet).Transaction.InTransaction then
           TIBQuery(DS.DataSet).Transaction.CommitRetaining;
    end
    else
      if TIBQuery(DS.DataSet).Transaction.InTransaction then
           TIBQuery(DS.DataSet).Transaction.RollbackRetaining;
  end;
end;

procedure TfrmWorker._FramePersonFullcmbDateBirthPropertiesInitPopup(
  Sender: TObject);
begin
  inherited;
  if TcxDateEdit(Sender).EditValue = null then
    TcxDateEdit(Sender).EditValue := IncMonth(Now(), -(InitBirthYear*12));
end;

end.
