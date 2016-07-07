unit formClientFiz;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassSimpleForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxDBEdit,
  cxDropDownEdit, cxMemo, cxCalendar, cxTextEdit, cxMaskEdit, Vcl.StdCtrls,
  RzButton, Vcl.ExtCtrls, RzPanel, dxGDIPlusClasses, Data.DB, frameBase,
  frPersonSmall, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, frPhones,
  frPasport, frListBase, frPersonFull, frUslugi, frKladrAll, FrKladrAdrFull,
  IBX.IBCustomDataSet, IBX.IBQuery;

type
  TfrmClientFiz = class(TSimpleForm)
    ID_edt: TcxDBTextEdit;
    Label14: TLabel;
    Comments_memo: TcxDBMemo;
    DS: TDataSource;
    FramePerson: TFramePersonFull;
    FrameUslugi: TFrameUslugi;
    butOK: TRzButton;
    FrameAddress: TFrameKladrAdrFull;
	FramePhones: TFramePhones;
    QCheck: TIBQuery;
    cmbWorker: TcxDBLookupComboBox;
    Label5: TLabel;
    RzPanel2: TRzPanel;
    Label2: TLabel;
    Label1: TLabel;
    cmbFormat: TcxDBLookupComboBox;
    cmbStatus: TcxDBLookupComboBox;
    Label3: TLabel;
    edtDogNum: TcxDBTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure butOKClick(Sender: TObject);
    procedure FramePersoncmbDateBirthPropertiesInitPopup(Sender: TObject);
    procedure FramePersonDSDataChange(Sender: TObject; Field: TField);
    procedure Exit_bntClick(Sender: TObject);
    procedure cmbWorkerPropertiesCloseUp(Sender: TObject);
    procedure cmbWorkerPropertiesPopup(Sender: TObject);
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
  DM_Main, CommonTypes, CommonVars, System.StrUtils, formIncomeCallRoot;

procedure TfrmClientFiz.butOKClick(Sender: TObject);
var
  res: Boolean;
begin
  //проверка
  res := False;
  if not (ValidateData(DS, self) and ValidateData(FramePerson.DS, FramePerson)) then
  begin
    Application.MessageBox('Не заполнены все необходимые поля!',
     'Внимание', MB_ICONWARNING + MB_OK);
    self.ModalResult := mrNone;
    Exit;
  end
  else
    self.ModalResult := mrOk;

  res := False;
  try
    try
      if not TIBQuery(DS.DataSet).Transaction.Active then
        TIBQuery(DS.DataSet).Transaction.StartTransaction;
      DS.DataSet.FieldByName('name').AsString :=
        //сохраняем имя
        DM.GetPersonFullName(FramePerson.Query.FieldByName('FAMILY').AsString,
          FramePerson.Query.FieldByName('NAME').AsString,
          FramePerson.Query.FieldByName('SURNAME').AsString);

      //сохраняем ссылки
      res := FramePerson.SaveData;
      if not res then
        Exit;

      res := FrameAddress.SaveData;
      if not res then
        Exit;

      // PERSON_ID
      if DS.DataSet.FieldByName('PERSON_ID').AsInteger <> FramePerson.Id then
        DS.DataSet.FieldByName('PERSON_ID').AsInteger := FramePerson.Id;

      if DS.DataSet.FieldByName('EMAIL').AsString <>
         FramePerson.DS.DataSet.FieldByName('EMAIL_WORK').AsString then
        DS.DataSet.FieldByName('EMAIL').AsString :=
         FramePerson.DS.DataSet.FieldByName('EMAIL_WORK').AsString;

      if DS.DataSet.FieldByName('ADRES_ID').AsInteger <> FrameAddress.Id then
        DS.DataSet.FieldByName('ADRES_ID').AsInteger := FrameAddress.Id;

      DS.DataSet.Post;
      TIBQuery(DS.DataSet).ApplyUpdates;

      //телефоны
      res := FramePhones.SaveData;
      if not res then
        Exit;

      //услуги
      res := FrameUslugi.SaveData;

    except
      res := False;
      ShowMessage('Произошла ошибка сохранения данных!' + #13#10 +
      Exception(ExceptObject).Message);
    end;
  finally
    if Res then
    begin
      if TIBQuery(DS.DataSet).Transaction.InTransaction then
           TIBQuery(DS.DataSet).Transaction.CommitRetaining;
      if Assigned(frmIncomeCallRoot) then
        frmIncomeCallRoot.ClientId := DS.DataSet.FieldByName('ID').AsInteger;
     end
    else
      if TIBQuery(DS.DataSet).Transaction.InTransaction then
           TIBQuery(DS.DataSet).Transaction.RollbackRetaining;
  end;
end;


procedure TfrmClientFiz.cmbWorkerPropertiesCloseUp(Sender: TObject);
var
  id: Integer;
begin
  id := TcxDBLookupComboBox(Sender).EditValue;
  DM.OffFilter(DM.Workers);
  TcxDBLookupComboBox(Sender).EditValue := id;
end;

procedure TfrmClientFiz.cmbWorkerPropertiesPopup(Sender: TObject);
begin
  DM.SetFilterNonDelete(DM.Workers);
end;

procedure TfrmClientFiz.Exit_bntClick(Sender: TObject);
begin
  DS.DataSet.Cancel;
  FramePerson.Cancel;
  FramePhones.Cancel;
  FrameUslugi.Cancel;
  FrameAddress.Cancel;
end;

procedure TfrmClientFiz.FormCreate(Sender: TObject);
var
  status_id: Integer;
begin
  inherited;
  if fFrmParam.Dataset <> nil then
    DS.DataSet := fFrmParam.Dataset;

  status_id := 1;
  if (fFrmParam.ExtParam <> nil) and (fFrmParam.ExtParam^.CallParam <> nil) and
  (TClientParam(fFrmParam.ExtParam^).CallParam^.Status_Id <> 0) then
    status_id := TClientParam(fFrmParam.ExtParam^).CallParam^.Status_Id;

  case fFrmParam.action of
    asCreate:
      begin
        Title := Title + ' [новая запись]';
        if (DS.DataSet <> nil) and DS.DataSet.Active then
        begin
          DS.DataSet.Append;
          DS.DataSet.FieldByName('TYPE_CLI').AsInteger  := 0;
          DS.DataSet.FieldByName('STATUS_ID').AsInteger := status_id;
          DS.DataSet.FieldByName('FORMAT_ID').AsInteger := 1;
          DS.DataSet.FieldByName('ACT').AsInteger := 1;
          DS.DataSet.FieldByName('WORKER_ID').AsInteger := DM.CurrentUserSets.ID;
        end;
      end;
    asEdit:
      begin
        Title := Title + ' [редактирование]';
        if (DS.DataSet <> nil) and DS.DataSet.Active then
          DS.DataSet.Edit;
      end;
    asShow:
      begin
        Title := Title + ' [просмотр]';
      end;
  end;

  FramePerson.Transaction := TIBQuery(fFrmParam.Dataset).Transaction;
  FramePerson.AddParam('CLIENT_ID', DS.DataSet.FindField('ID'));
  FramePerson.AddParam('PERSON_ID', DS.DataSet.FindField('PERSON_ID'));
  FramePerson.OpenData;

  FramePhones.Transaction := TIBQuery(fFrmParam.Dataset).Transaction;
  FramePhones.AddParam('CLIENT_ID', DS.DataSet.FindField('ID'));
  FramePhones.OpenData;

  if (fFrmParam.action = asCreate) and
     (fFrmParam.ExtParam <> nil) and (fFrmParam.ExtParam^.CallParam <> nil) and
     (TClientParam(fFrmParam.ExtParam^).CallParam.id_call <> 0) then
  begin
    FramePhones.DS.DataSet.Append;
    FramePhones.DS.DataSet.FieldByName('phone').AsString :=
      RightStr(TClientParam(fFrmParam.ExtParam^).CallParam.TelNum, 10);
    FramePhones.DS.DataSet.FieldByName('ismain').AsInteger := 1;
    FramePhones.DS.DataSet.FieldByName('phone_type_id').AsInteger := 1;
    FramePhones.DS.DataSet.Post;
  end;

  FrameUslugi.Transaction := TIBQuery(fFrmParam.Dataset).Transaction;
  FrameUslugi.AddParam('CLIENT_ID', DS.DataSet.FindField('ID'));
  FrameUslugi.OpenData;

  FrameAddress.Transaction := TIBQuery(fFrmParam.Dataset).Transaction;
  FrameAddress.AddParam('ID', DS.DataSet.FindField('ADRES_ID'));
  FrameAddress.OpenData;
  FrameAddress.Visible := true;
end;

procedure TfrmClientFiz.FramePersoncmbDateBirthPropertiesInitPopup(
  Sender: TObject);
begin
  inherited;
  if TcxDateEdit(Sender).EditValue = null then
    TcxDateEdit(Sender).EditValue := IncMonth(Now(), -(InitBirthYear*12));
end;

procedure TfrmClientFiz.FramePersonDSDataChange(Sender: TObject; Field: TField);
begin
  if Field = nil then
    Exit;

  if (Field.FieldName = 'FAMILY') or
     (Field.FieldName = 'NAME') or
     (Field.FieldName = 'SURNAME') then
  begin
    if (Field.DataSet.FieldByName('FAMILY').AsString = '') or
       (Field.DataSet.FieldByName('NAME').AsString = '') or
       (Field.DataSet.FieldByName('SURNAME').AsString = '') then
      Exit;

    QCheck.Close;
    QCheck.ParamByName('name').AsString := DM.GetPersonFullName(FramePerson.Query.FieldByName('FAMILY').AsString,
          FramePerson.Query.FieldByName('NAME').AsString,
          FramePerson.Query.FieldByName('SURNAME').AsString);
    QCheck.Open;
    if QCheck.RecordCount > 0 then
    begin
      Application.MessageBox('Клиент с таким именем уже существует', 'Проверка',
        MB_ICONWARNING);
      FramePerson.edtFamily.SetFocus;
    end;
  end;
end;

end.
