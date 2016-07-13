unit formContact;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassSimpleForm, frameBase, frContact,
  RzButton, Vcl.ExtCtrls, RzPanel, dxGDIPlusClasses, Data.DB;

type
  TfrmContact = class(TSimpleForm)
    FrameContact: TFrameContact;
    butOk: TRzButton;
    DS: TDataSource;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmContact: TfrmContact;

implementation

{$R *.dfm}

uses frPhones, CommonTypes, DM_Main;

procedure TfrmContact.FormCreate(Sender: TObject);
begin
  inherited;
  //if fFrmParam.Dataset <> nil then
  //  DS.DataSet := fFrmParam.Dataset;

   if (fFrmParam.ExtParam <> nil) and (fFrmParam.ExtParam^.CallParam <> nil) and
  (TClientParam(fFrmParam.ExtParam^).CallParam^.Status_Id <> 0) then
    //status_id := TClientParam(fFrmParam.ExtParam^).CallParam^.Status_Id;

  case fFrmParam.action of
    asCreate:
      begin
        Title := Title + ' [новая запись]';
        if (DS.DataSet <> nil) and DS.DataSet.Active then
        begin
          DS.DataSet.Append;
          DS.DataSet.FieldByName('TYPE_CLI').AsInteger  := 0;
          //DS.DataSet.FieldByName('STATUS_ID').AsInteger := status_id;
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

  (*FramePhones.Transaction := TIBQuery(fFrmParam.Dataset).Transaction;
  FramePhones.AddParam('CLIENT_ID', DS.DataSet.FindField('ID'));
  FramePhones.OpenData;

  if (fFrmParam.action = asCreate) and
     (fFrmParam.ExtParam <> nil) and (fFrmParam.ExtParam^.CallParam <> nil) then //and
     //(TClientParam(fFrmParam.ExtParam^).CallParam.id_call <> 0) then
  begin
    FramePhones.DS.DataSet.Append;
    FramePhones.DS.DataSet.FieldByName('phone').AsString :=
      RightStr(TClientParam(fFrmParam.ExtParam^).CallParam.TelNum, 10);
    FramePhones.DS.DataSet.FieldByName('ismain').AsInteger := 1;
    FramePhones.DS.DataSet.FieldByName('phone_type_id').AsInteger := 1;
    FramePhones.DS.DataSet.Post;
  end;*)

end;

end.
