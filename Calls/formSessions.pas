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
  cxDropDownEdit, cxCalendar, Vcl.StdCtrls, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TfrmSessions = class(TSprForm)
    Q: TIBQuery;
    DS: TDataSource;
    Label11: TLabel;
    edtTimeStart: TcxDateEdit;
    Label1: TLabel;
    cxDateEdit1: TcxDateEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSessions: TfrmSessions;

implementation

{$R *.dfm}

procedure TfrmSessions.FormCreate(Sender: TObject);
begin
  Q.Open;
end;

end.
