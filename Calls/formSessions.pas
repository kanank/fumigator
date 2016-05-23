unit formSessions;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassSprForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, RzButton, Vcl.ExtCtrls, RzPanel, dxGDIPlusClasses,
  cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, Vcl.StdCtrls, IBX.IBCustomDataSet, IBX.IBQuery,
  cxDBLookupComboBox;

type
  TfrmSessions = class(TSprForm)
    Q: TIBQuery;
    DS: TDataSource;
    Label11: TLabel;
    edtTimeStart: TcxDateEdit;
    edtTimeEnd: TcxDateEdit;
    GridViewColumn1: TcxGridDBColumn;
    GridViewColumn2: TcxGridDBColumn;
    GridViewColumn3: TcxGridDBColumn;
    GridViewColumn4: TcxGridDBColumn;
    GridViewColumn5: TcxGridDBColumn;
    GridViewColumn6: TcxGridDBColumn;
    Label1: TLabel;
    GridViewColumn7: TcxGridDBColumn;
    GridViewColumn8: TcxGridDBColumn;
    GridViewColumn9: TcxGridDBColumn;
    GridViewColumn10: TcxGridDBColumn;
    RzButton1: TRzButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    procedure FormCreate(Sender: TObject);
    procedure RzButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSessions: TfrmSessions;

implementation

{$R *.dfm}
uses
  DM_Main;

procedure TfrmSessions.FormCreate(Sender: TObject);
begin
  edtTimeStart.Date := Date;
  edtTimeEnd.Date   := edtTimeStart.Date;
end;

procedure TfrmSessions.RzButton1Click(Sender: TObject);
begin
  Q.Close;
  DM.GetDataset(DM.Clients);

  if Q.Transaction.Active then
    Q.Transaction.CommitRetaining;

  Q.ParamByName('date1').AsDateTime := edtTimeStart.Date;
  Q.ParamByName('date2').AsDateTime := edtTimeEnd.Date + 1;
  Q.Open;

end;

end.
