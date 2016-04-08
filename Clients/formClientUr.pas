unit formClientUr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassSimpleForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxMemo, cxDBEdit,
  frKLADR, frAddress, frAddressRegion, frListBase, frPhones, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  Vcl.StdCtrls, frPersonSmall, RzPanel, frameBase, frClientExtUr, RzButton,
  Vcl.ExtCtrls, dxGDIPlusClasses, frUslugi, Data.DB;

type
  TfrmClientUr = class(TSimpleForm)
    FrameClientExtUr: TFrameClientExtUr;
    RzGroupBox1: TRzGroupBox;
    FramePerson: TFramePersonSmall;
    RzPanel2: TRzPanel;
    Label1: TLabel;
    cmbStatus: TcxDBLookupComboBox;
    Label2: TLabel;
    cmbFormat: TcxDBLookupComboBox;
    RzPanel3: TRzPanel;
    Label3: TLabel;
    txtName: TcxDBTextEdit;
    FramePhones: TFramePhones;
    RzPanel4: TRzPanel;
    cxDBTextEdit2: TcxDBTextEdit;
    Label4: TLabel;
    FrameAddress: TFrameKLADRAdrRegion;
    RzPanel5: TRzPanel;
    Label14: TLabel;
    Comments_memo: TcxDBMemo;
    butOK: TRzButton;
    FrameUslugi: TFrameUslugi;
    DS: TDataSource;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure butOKClick(Sender: TObject);
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
  DM_Main, IBX.IBQuery, CommonTypes;

procedure TfrmClientUr.butOKClick(Sender: TObject);
var
  res: Boolean;
begin
  res := False;
  try
    try
      if not TIBQuery(DS.DataSet).Transaction.Active then
        TIBQuery(DS.DataSet).Transaction.StartTransaction;

      //сохран€ем ссылки
      res := FramePerson.SaveData;
      if not res then
        Exit;

      // PERSON_ID
      if DS.DataSet.FieldByName('PERSON_ID').AsInteger <>
                                            FramePerson.Id then
        DS.DataSet.FieldByName('PERSON_ID').AsInteger :=
                                                 FramePerson.Id;

      DS.DataSet.Post;
      TIBQuery(DS.DataSet).ApplyUpdates;

      // доп. данные
      res := FrameClientExtUr.SaveData;
      if not res then
        Exit;

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
    begin
      if TIBQuery(DS.DataSet).Transaction.InTransaction then
           TIBQuery(DS.DataSet).Transaction.RollbackRetaining;
      TIBQuery(DS.DataSet).CancelUpdates;
    end
  end;
end;

procedure TfrmClientUr.FormCreate(Sender: TObject);
begin
  inherited;
  if fFrmParam.Dataset <> nil then
    DS.DataSet := fFrmParam.Dataset;

  case fFrmParam.action of
    asCreate:
      begin
        Title := Title + ' [нова€ запись]';
        if (DS.DataSet <> nil) and DS.DataSet.Active then
        begin
          DS.DataSet.Append;
          DS.DataSet.FieldByName('TYPE_CLI').AsInteger  := 1;
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

  FrameClientExtUr.Transaction := TIBQuery(fFrmParam.Dataset).Transaction;
  FrameClientExtUr.AddParam('CLIENT_ID', DS.DataSet.FindField('ID'));
  FrameClientExtUr.OpenData;

  FramePerson.Transaction := TIBQuery(fFrmParam.Dataset).Transaction;
  FramePerson.AddParam('PERSON_ID', DS.DataSet.FindField('PERSON_ID'));
  FramePerson.OpenData;

  FramePhones.Transaction := TIBQuery(fFrmParam.Dataset).Transaction;
  FramePhones.AddParam('CLIENT_ID', DS.DataSet.FindField('ID'));
  FramePhones.OpenData;

  FrameUslugi.Transaction := TIBQuery(fFrmParam.Dataset).Transaction;
  FrameUslugi.AddParam('CLIENT_ID', DS.DataSet.FindField('ID'));
  FrameUslugi.OpenData;
end;

end.
