unit frClientCalls;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frListBase, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBUpdateSQL, RzButton, RzPanel,
  cxClasses, cxGridLevel, cxGrid, Vcl.ExtCtrls, cxDBLookupComboBox;

type
  TframeClientCalls = class(TFrameListBase)
    grdPhoneDBTableView1: TcxGridDBTableView;
    grdPhoneDBTableView1Column1: TcxGridDBColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frameClientCalls: TframeClientCalls;

implementation

{$R *.dfm}

end.
