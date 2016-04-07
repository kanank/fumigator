unit formSelService;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassFormEditData, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridCustomView, cxClasses, cxGridLevel, cxGrid, RzButton, cxTextEdit,
  cxMaskEdit, cxDBEdit, Vcl.StdCtrls, dxmdaset, cxCheckBox;

type
  TfrmSelectService = class(TfrmEditData)
    grdService: TcxGrid;
    grdServiceLevel1: TcxGridLevel;
    grdServiceDBTableView1: TcxGridDBTableView;
    MemServices: TdxMemData;
    grdServiceDBTableView1Column1: TcxGridDBColumn;
    grdServiceDBTableView1Column2: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    DsServiceCli: TDataSet;
  end;


implementation

{$R *.dfm}
uses
  DM_Main;

procedure TfrmSelectService.FormShow(Sender: TObject);
begin
  inherited;
  MemServices.LoadFromDataSet(DM.DicServices);

  DsServiceCli.First;
  while not DsServiceCli.Eof do
  begin
    if MemServices.Locate('id', DsServiceCli.FieldByName('service_id').AsInteger, []) then
    begin
      MemServices.Edit;
      MemServices.FieldByName('sel').AsInteger := 1;
      MemServices.Post;
    end;

    DsServiceCli.Next;
  end;

  DS.DataSet := MemServices;
end;

end.
