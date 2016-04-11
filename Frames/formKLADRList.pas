unit formKLADRList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassFormEditData, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB,
  cxDBData, cxDBLookupComboBox, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  RzButton, cxTextEdit, cxMaskEdit, cxDBEdit, Vcl.StdCtrls;

type
  TfrmKLADRList = class(TfrmEditData)
    grid: TcxGrid;
    gridDBTableView1: TcxGridDBTableView;
    gridDBTableView1Column1: TcxGridDBColumn;
    gridLevel1: TcxGridLevel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKLADRList: TfrmKLADRList;

implementation

{$R *.dfm}

end.
