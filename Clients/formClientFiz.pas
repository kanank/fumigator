unit formClientFiz;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassSimpleForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxDBEdit,
  cxDropDownEdit, cxMemo, cxCalendar, cxTextEdit, cxMaskEdit, Vcl.StdCtrls,
  RzButton, Vcl.ExtCtrls, RzPanel, dxGDIPlusClasses, Data.DB, frameBase,
  frPersonSmall, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, frPhones,
  frPasport, frListBase, frPersonFull, frUslugi, frKladrAll, FrKladrAdrFull;

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
    FramePerson: TFramePersonFull;
    FrameUslugi: TFrameUslugi;
    butOK: TRzButton;
    FrameAddress: TFrameKladrAdrFull;
	FramePhones: TFramePhones;
    procedure FormCreate(Sender: TObject);
    procedure butOKClick(Sender: TObject);
    procedure FramePersoncmbDateBirthPropertiesInitPopup(Sender: TObject);
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
  DM_Main, CommonTypes, IBX.IBQuery, CommonVars, System.StrUtils;

procedure TfrmClientFiz.butOKClick(Sender: TObject);
var
  res: Boolean;
begin
  res := False;
  try
    try
      if not TIBQuery(DS.DataSet).Transaction.Active then
        TIBQuery(DS.DataSet).Transaction.StartTransaction;
      DS.DataSet.FieldByName('name').AsString :=
        //сохран€ем им€
        DM.GetPersonFullName(FramePerson.Query.FieldByName('FAMILY').AsString,
          FramePerson.Query.FieldByName('NAME').AsString,
          FramePerson.Query.FieldByName('SURNAME').AsString);

      //сохран€ем ссылки
      res := FramePerson.SaveData;
      if not res then
        Exit;

      res := FrameAddress.SaveData;
      if not res then
        Exit;

      // PERSON_ID
      if DS.DataSet.FieldByName('PERSON_ID').AsInteger <> FramePerson.Id then
        DS.DataSet.FieldByName('PERSON_ID').AsInteger := FramePerson.Id;

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
      ShowMessage('ѕроизошла ошибка сохранени€ данных!' + #13#10 +
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

procedure TfrmClientFiz.FormCreate(Sender: TObject);
var
  status_id: Integer;
begin
  inherited;
  if fFrmParam.Dataset <> nil then
    DS.DataSet := fFrmParam.Dataset;

  status_id := 1;
  if (fFrmParam.ExtParam <> nil) and
  (TClientParam(fFrmParam.ExtParam^).CallParam.Status_Id <> 0) then
    status_id := TClientParam(fFrmParam.ExtParam^).CallParam.Status_Id;

  case fFrmParam.action of
    asCreate:
      begin
        Title := Title + ' [нова€ запись]';
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
     (fFrmParam.ExtParam <> nil) and
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

end.
