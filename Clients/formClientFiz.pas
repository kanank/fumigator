unit formClientFiz;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassSimpleForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxDBEdit,
  cxDropDownEdit, cxMemo, cxCalendar, cxTextEdit, cxMaskEdit, Vcl.StdCtrls,
  RzButton, Vcl.ExtCtrls, RzPanel, dxGDIPlusClasses, Data.DB, frameBase,
  frPersonSmall, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, frPhones,
  frPasport, frAddress, frListBase, frPersonFull, frUslugi,
  frAddressRegion, frKLADR;

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
    FrameAddress: TFrameKLADRAdrRegion;
    FrameUslugi1: TFrameUslugi;
    butOK: TRzButton;
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
      DS.DataSet.Post;
      TIBQuery(DS.DataSet).ApplyUpdates;

      res := FramePersonFull.SaveData;
    except
      res := False;
      ShowMessage('ѕроизошла ошибка сохранени€ данных!' + #13#10 +
      Exception(ExceptObject).Message);
    end;
  finally
    if Res then
    begin
      if  TIBQuery(DS.DataSet).Transaction.InTransaction then
         TIBQuery(DS.DataSet).Transaction.CommitRetaining;
    end
    else
      if  TIBQuery(DS.DataSet).Transaction.InTransaction then
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
        Title := '[нова€ запись]';
        if (DS.DataSet <> nil) and DS.DataSet.Active then
        begin
          DS.DataSet.Append;
          DS.DataSet.FieldByName('TYPE_CLI').AsInteger := 0;
        end;
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

  FramePerson.Transaction := TIBQuery(fFrmParam.Dataset).Transaction;
  FramePerson.AddParam('CLIENT_ID', DS.DataSet.FindField('ID'));
  FramePerson.AddParam('PERSON_ID', DS.DataSet.FindField('PERSON_ID'));
  FramePerson.OpenData;
end;

end.
