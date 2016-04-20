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
    FramePersonSmall: TFramePersonSmallFoto;
    FramePersonFull: TFramePersonFullFoto;
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
  System.StrUtils, CommonTypes, IBX.IBQuery;


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

        Title := Title + ' [новая запись]';
        if (DS.DataSet <> nil) and DS.DataSet.Active then
        begin
          DS.DataSet.Append;
          DS.DataSet.FieldByName('USER_BLOCKED').AsInteger := 0;
          DS.DataSet.FieldByName('IS_DELETED').AsInteger := 0;
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

  if fFrmParam.action <> asCreate then
  begin
    FramePersonSmall.Transaction := TIBQuery(fFrmParam.Dataset).Transaction;
    FramePersonSmall.AddParam('CLIENT_ID', DS.DataSet.FindField('ID'));
    FramePersonSmall.AddParam('PERSON_ID', DS.DataSet.FindField('PERSON_ID'));
    FramePersonSmall.OpenData;
  end;

  FramePersonFull.Transaction := TIBQuery(fFrmParam.Dataset).Transaction;
  FramePersonFull.AddParam('CLIENT_ID', DS.DataSet.FindField('ID'));
  FramePersonFull.AddParam('PERSON_ID', DS.DataSet.FindField('PERSON_ID'));
  FramePersonFull.OpenData;
end;


end;


procedure TfrmWorker.FullForm_btnClick(Sender: TObject);
begin
  self.Constraints.MaxHeight := 363 ;
  self.Constraints.MaxWidth  := 788 ;
  self.Constraints.MinHeight := 363 ;
  self.Constraints.MinWidth  := 788 ;

  RzPageControl1.ActivePage := Full_Tab;
  Short_Tab.TabVisible := False;
  Full_Tab.TabVisible  := True;
  FullForm_btn.Visible := False;
end;


procedure TfrmWorker.Save_btnClick(Sender: TObject);
var
  res: Boolean;
begin
  res := False;
  try
    try
      if not TIBQuery(DS.DataSet).Transaction.Active then
        TIBQuery(DS.DataSet).Transaction.StartTransaction;
      //сохраняем полное имя
      DS.DataSet.FieldByName('full_name').AsString :=
        DM.GetPersonFullName(FramePersonFull.Query.FieldByName('FAMILY').AsString,
          FramePersonFull.Query.FieldByName('NAME').AsString,
          FramePersonFull.Query.FieldByName('SURNAME').AsString);
      DS.DataSet.FieldByName('full_name').AsString :=
        //сохраняем короткое имя
        DM.GetPersonShortName(FramePersonFull.Query.FieldByName('FAMILY').AsString,
          FramePersonFull.Query.FieldByName('NAME').AsString,
          FramePersonFull.Query.FieldByName('SURNAME').AsString);
      //сохраняем ссылки
      res := FramePersonFull.SaveData;
      if not res then
        Exit;


      // PERSON_ID
      if DS.DataSet.FieldByName('PERSON_ID').AsInteger <> FramePersonFull.Id then
        DS.DataSet.FieldByName('PERSON_ID').AsInteger := FramePersonFull.Id;

      DS.DataSet.Post;
      TIBQuery(DS.DataSet).ApplyUpdates;

      //услуги
      //res := FrameUslugi.SaveData;
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

end.
