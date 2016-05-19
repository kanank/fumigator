unit formClientsForCall;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassSprForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, RzButton, Vcl.ExtCtrls, RzPanel, dxGDIPlusClasses,
  IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBUpdateSQL, cxDBLookupComboBox;

type
  TfrmClientsForCall = class(TSprForm)
    QWorkerShedule: TIBQuery;
    QWorkerShedule_upd: TIBUpdateSQL;
    GridViewColumn1: TcxGridDBColumn;
    DS: TDataSource;
    GridViewColumn2: TcxGridDBColumn;
    GridViewColumn3: TcxGridDBColumn;
    GridViewColumn4: TcxGridDBColumn;
    GridViewColumn5: TcxGridDBColumn;
    GridViewColumn6: TcxGridDBColumn;
    GridViewColumn7: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    procedure Add_btnClick(Sender: TObject);

  private
    fTimeStart: TDateTime;
    fTimeEnd: TDateTime;
    fDlitel: TDateTime;
    fSessionCount: Integer;
    fGoodSessionCount: Integer;
  public
    { Public declarations }
  end;

var
  frmClientsForCall: TfrmClientsForCall;

implementation

{$R *.dfm}
uses
  DM_Main, formEndCalling;

procedure TfrmClientsForCall.Add_btnClick(Sender: TObject);
begin
  fTimeStart := Now();
  fSessionCount     := 0;
  fGoodSessionCount := 0;

  while not QWorkerShedule.Eof do
  begin
    Inc(fSessionCount);
    DM.Calling(DM.CurrentUserSets.ATS_Phone_Num,
               QWorkerShedule.FieldByName('phone').AsString,
               QWorkerShedule.FieldByName('client_id').AsInteger) ;
    Inc(fGoodSessionCount);
    QWorkerShedule.Next;
  end;

  frmEndCalling := TfrmEndCalling.Create(self);
  try
    frmEndCalling.edtTimeStart.Date        := fTimeStart;
    frmEndCalling.edtTimeEnd.Date          := fTimeEnd;
    frmEndCalling.edtDlitelnost.Date       := fTimeEnd - fTimeStart;
    frmEndCalling.edtSessionCount.Text     := IntToStr(fSessionCount);
    frmEndCalling.edtGoodSessionCount.Text := IntToStr(fGoodSessionCount);
    frmEndCalling.ShowModal;
  finally
    FreeAndNil(frmEndCalling);
  end;

end;

end.
