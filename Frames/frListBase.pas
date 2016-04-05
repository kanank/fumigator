unit frListBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frameBase, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, RzButton,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, Vcl.ExtCtrls, RzPanel,
  IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBUpdateSQL;

type
  TFrameListBase = class(TDbFrameBase)
    grpPhone: TRzGroupBox;
    grdPhoneDBTableView1: TcxGridDBTableView;
    grdPhoneLevel1: TcxGridLevel;
    grdPhone: TcxGrid;
    grdPhoneDBTableView1Column1: TcxGridDBColumn;
    grdPhoneDBTableView1Column2: TcxGridDBColumn;
    RzPanel2: TRzPanel;
    btnAdd: TRzBitBtn;
    btnEdit: TRzBitBtn;
    btnDel: TRzBitBtn;
  private
    FEditClass: TComponentClass;
  public
    constructor Create(AOwner: TComponent); override;
    property EditClass: TComponentClass read FEditClass write FEditClass;
  end;

var
  FrameListBase: TFrameListBase;

implementation

{$R *.dfm}

{ TFrameListBase }

constructor TFrameListBase.Create(AOwner: TComponent);
begin
  inherited;
  fAutoAppend := False; //для списков выключаем
end;

end.
