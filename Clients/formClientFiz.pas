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
    Image1: TImage;
    FrameAddress: TFrameKladrAdrFull;
    procedure FormCreate(Sender: TObject);
    procedure butOKClick(Sender: TObject);
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
  DM_Main, CommonTypes, IBX.IBQuery;

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

      if DS.DataSet.FieldByName('ADRES_ID').AsInteger <> FrameAddress.Id then
        DS.DataSet.FieldByName('ADRES_ID').AsInteger := FrameAddress.Id;

      DS.DataSet.Post;
      TIBQuery(DS.DataSet).ApplyUpdates;

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
    end
    else
      if TIBQuery(DS.DataSet).Transaction.InTransaction then
           TIBQuery(DS.DataSet).Transaction.RollbackRetaining;
  end;
end;

procedure TfrmClientFiz.FormCreate(Sender: TObject);
begin
  inherited;
  if fFrmParam.Dataset <> nil then
    DS.DataSet := fFrmParam.Dataset;

  case fFrmParam.action of
    asCreate:
      begin
        Title := Title + ' [новая запись]';
        if (DS.DataSet <> nil) and DS.DataSet.Active then
        begin
          DS.DataSet.Append;
          DS.DataSet.FieldByName('TYPE_CLI').AsInteger := 0;
          DS.DataSet.FieldByName('STATUS_ID').AsInteger := 1;
          DS.DataSet.FieldByName('FORMAT_ID').AsInteger := 1;
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

  FrameUslugi.Transaction := TIBQuery(fFrmParam.Dataset).Transaction;
  FrameUslugi.AddParam('CLIENT_ID', DS.DataSet.FindField('ID'));
  FrameUslugi.OpenData;

  FrameAddress.Transaction := TIBQuery(fFrmParam.Dataset).Transaction;
  FrameAddress.AddParam('ID', DS.DataSet.FindField('ADRES_ID'));
  FrameAddress.OpenData;
  FrameAddress.Visible := true;
end;

end.
