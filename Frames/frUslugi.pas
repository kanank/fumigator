unit frUslugi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frListBase, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBUpdateSQL, RzButton, RzPanel,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, Vcl.ExtCtrls;

type
  TFrameUslugi = class(TFrameListBase)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrameUslugi: TFrameUslugi;

implementation

{$R *.dfm}

end.
