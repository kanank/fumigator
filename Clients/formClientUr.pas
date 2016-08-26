unit formClientUr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassSimpleForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxMemo, cxDBEdit,
  frListBase, frPhones, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  Vcl.StdCtrls, frPersonSmall, RzPanel, frameBase, frClientExtUr, RzButton,
  Vcl.ExtCtrls, dxGDIPlusClasses, frUslugi, Data.DB, frKladrAll, FrKladrAdrFull,
  IBX.IBCustomDataSet, IBX.IBQuery, frGoods, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  frClientCalls, frBank;

type
  TfrmClientUr = class(TSimpleForm)
    RzGroupBox1: TRzGroupBox;
    FramePerson: TFramePersonSmall;
    RzPanel3: TRzPanel;
    Label3: TLabel;
    txtName: TcxDBTextEdit;
    RzPanel4: TRzPanel;
    cxDBTextEdit2: TcxDBTextEdit;
    Label4: TLabel;
    RzPanel5: TRzPanel;
    Label14: TLabel;
    Comments_memo: TcxDBMemo;
    butOK: TRzButton;
    FrameUslugi: TFrameUslugi;
    DS: TDataSource;
    FrameAddress: TFrameKladrAdrFull;
    QCheck: TIBQuery;
    FrameClientExtUr: TFrameClientExtUr;
    Label5: TLabel;
    cmbWorker: TcxDBLookupComboBox;
    RzPanel2: TRzPanel;
    Label2: TLabel;
    Label1: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    cmbFormat: TcxDBLookupComboBox;
    cmbStatus: TcxDBLookupComboBox;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBLookupComboBox2: TcxDBLookupComboBox;
    cxDBLookupComboBox3: TcxDBLookupComboBox;
    cxDBLookupComboBox4: TcxDBLookupComboBox;
    FramePhones: TFramePhones;
    Label6: TLabel;
    cxDBMemo1: TcxDBMemo;
    frameClientCalls: TframeClientCalls;
    btnHide: TRzButton;
    procedure FormCreate(Sender: TObject);
    procedure butOKClick(Sender: TObject);
    procedure DSDataChange(Sender: TObject; Field: TField);
    procedure Exit_bntClick(Sender: TObject);
    procedure cmbWorkerPropertiesPopup(Sender: TObject);
    procedure cmbWorkerPropertiesCloseUp(Sender: TObject);
    procedure btnHideClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClientUr: TfrmClientUr;

implementation

{$R *.dfm}
uses
  DM_Main, CommonTypes, System.StrUtils, formIncomeCallRoot;

procedure TfrmClientUr.btnHideClick(Sender: TObject);
begin
  Self.ModalResult := mrOk;
end;

procedure TfrmClientUr.butOKClick(Sender: TObject);
var
  res: Boolean;
  err: string;
begin
  if not (DS.DataSet.Modified or
          FramePerson.DS.DataSet.Modified or
          FramePhones.DS.DataSet.Modified or
          FrameUslugi.DS.DataSet.Modified or
          FrameAddress.DS.DataSet.Modified or
          FrameClientExtUr.DS.DataSet.Modified) then
  begin
    ModalResult := mrOk;
    Exit;
  end;

  //проверка
  res := False;
  if not (Self.Validate(DS) and
    ValidateData(FramePerson.DS, FramePerson) and
    FrameClientExtUr.ValidateData) then
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
      self.ModalResult := mrNone;
      CanClose := False;

      if not TIBQuery(DS.DataSet).Transaction.Active then
        TIBQuery(DS.DataSet).Transaction.StartTransaction;

      //сохраняем ссылки
      res := FramePerson.SaveData;
      err := FramePerson.Err;

      if res then
      begin
        res := FrameAddress.SaveData;
        err := FrameAddress.Err;
      end;

      if res then
      try
        // PERSON_ID
        if DS.DataSet.FieldByName('PERSON_ID').AsInteger <>
                                              FramePerson.Id then
          DS.DataSet.FieldByName('PERSON_ID').AsInteger :=
                                                   FramePerson.Id;

        if DS.DataSet.FieldByName('ADRES_ID').AsInteger <> FrameAddress.Id then
          DS.DataSet.FieldByName('ADRES_ID').AsInteger := FrameAddress.Id;

        DS.DataSet.Post;
        TIBQuery(DS.DataSet).ApplyUpdates;
        res := True;
      except
        res := False;
        err := Exception(ExceptObject).Message;
      end;

      // доп. данные
      if res then
      begin
        res := FrameClientExtUr.SaveData;
        err := FrameClientExtUr.Err;
      end;
      //телефоны
      if res then
      begin
        res := FramePhones.SaveData;
        err := FramePhones.Err;
      end;

        //услуги
      if res then
      begin
        res := FrameUslugi.SaveData;
        err := FrameUslugi.Err;
      end;

      if res then
      begin
        ModalResult := mrOk;
        CanClose := True;
      end
      else
        raise Exception.Create(err);
    except
      res := False;
      ShowMessage('Произошла ошибка сохранения данных!' + #13#10 +
      Exception(ExceptObject).Message);
      self.ModalResult := mrNone;
      fCanClose := False;
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
    begin
      if TIBQuery(DS.DataSet).Transaction.InTransaction then
           TIBQuery(DS.DataSet).Transaction.RollbackRetaining;
      TIBQuery(DS.DataSet).CancelUpdates;
    end
  end;
  if not fCanclose then
    ModalResult := mrNone;
end;

procedure TfrmClientUr.cmbWorkerPropertiesCloseUp(Sender: TObject);
var
  id: Integer;
begin
  id := TcxDBLookupComboBox(Sender).EditValue;
  DM.OffFilter(DM.Workers);
  TcxDBLookupComboBox(Sender).EditValue := id;
end;

procedure TfrmClientUr.cmbWorkerPropertiesPopup(Sender: TObject);
begin
  DM.SetFilterNonDelete(DM.Workers);
end;

procedure TfrmClientUr.DSDataChange(Sender: TObject; Field: TField);
begin
 if Field = nil then
   Exit;

  if (fFrmParam.action = asCreate) and (Field.FieldName = 'NAME') then
  begin
    QCheck.Close;
    QCheck.ParamByName('name').AsString := Field.AsString;
    QCheck.Open;
    if QCheck.RecordCount > 0 then
    begin
      Application.MessageBox('Клиент с таким именем уже существует', 'Проверка',
        MB_ICONWARNING);
      txtName.SetFocus;
    end;
  end;
end;

procedure TfrmClientUr.Exit_bntClick(Sender: TObject);
begin
  DS.DataSet.Cancel;
  FrameClientExtUr.Cancel;
  FramePerson.Cancel;
  FramePhones.Cancel;
  FrameUslugi.Cancel;
  FrameAddress.Cancel;
  fCanClose := True;
end;

procedure TfrmClientUr.FormCreate(Sender: TObject);
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
          DS.DataSet.FieldByName('TYPE_CLI').AsInteger  := 1;
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

  SetValidateList('NAME,FORMAT_ID,STATUS_ID');

  FrameClientExtUr.Transaction := TIBQuery(fFrmParam.Dataset).Transaction;
  FrameClientExtUr.AddParam('CLIENT_ID', DS.DataSet.FindField('ID'));
  FrameClientExtUr.OpenData;

  FramePerson.Transaction := TIBQuery(fFrmParam.Dataset).Transaction;
  FramePerson.AddParam('PERSON_ID', DS.DataSet.FindField('PERSON_ID'));
  FramePerson.OpenData;

  FramePhones.Transaction := TIBQuery(fFrmParam.Dataset).Transaction;
  FramePhones.AddParam('CLIENT_ID', DS.DataSet.FindField('ID'));
  FramePhones.typePhone := 0;
  FramePhones.OpenData;

  if (fFrmParam.action = asCreate) and
     (fFrmParam.ExtParam <> nil) and (fFrmParam.ExtParam^.CallParam <> nil) then // and
//     (TClientParam(fFrmParam.ExtParam^).CallParam.id_call <> 0) then
  begin
    FramePhones.DS.DataSet.Append;
    FramePhones.DS.DataSet.FieldByName('phone').AsString :=
      RightStr(TClientParam(fFrmParam.ExtParam^).CallParam.TelNum, 10);
    FramePhones.DS.DataSet.FieldByName('ismain').AsInteger := 1;
    FramePhones.DS.DataSet.FieldByName('phone_type_id').AsInteger := 1;
    FramePhones.DS.DataSet.Post;
  end;

  //добавление телефона в существующий
  if (fFrmParam.action = asEdit) and
     (fFrmParam.ExtParam <> nil) and (fFrmParam.ExtParam^.CallParam <> nil) and
      (fFrmParam.ExtParam^.CallParam.TelNum <> '') then
  begin
    if not FramePhones.DS.DataSet.Locate('phone',
       RightStr(TClientParam(fFrmParam.ExtParam^).CallParam.TelNum, 10), []) then
    begin
      FramePhones.DS.DataSet.Append;
      FramePhones.DS.DataSet.FieldByName('phone').AsString :=
        RightStr(TClientParam(fFrmParam.ExtParam^).CallParam.TelNum, 10);
      //FramePhones.DS.DataSet.FieldByName('ismain').AsInteger := 1;
      FramePhones.DS.DataSet.FieldByName('phone_type_id').AsInteger := 1;
      FramePhones.DS.DataSet.Post;
    end;
  end;

  FrameUslugi.Transaction := TIBQuery(fFrmParam.Dataset).Transaction;
  FrameUslugi.AddParam('CLIENT_ID', DS.DataSet.FindField('ID'));
  FrameUslugi.OpenData;

  FrameAddress.Transaction := TIBQuery(fFrmParam.Dataset).Transaction;
  FrameAddress.AddParam('ID', DS.DataSet.FindField('ADRES_ID'));
  FrameAddress.OpenData;
  FrameAddress.Visible := true;

  FrameClientCalls.Transaction := TIBQuery(fFrmParam.Dataset).Transaction;
  FrameClientCalls.AddParam('CLIENT_ID', DS.DataSet.FindField('ID'));
  FrameClientCalls.OpenData;
  FrameClientCalls.Visible := true;
end;


end.
