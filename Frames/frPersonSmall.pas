unit frPersonSmall;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frameBase, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxDropDownEdit,
  cxDBEdit, cxMaskEdit, cxCalendar, cxTextEdit, Vcl.StdCtrls, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBUpdateSQL;

type
  TFramePersonSmall = class(TDbFrameBase)
    Label11: TLabel;
    Label10: TLabel;
    Label9: TLabel;
    Label8: TLabel;
    Label2: TLabel;
    edtCitizen: TcxDBTextEdit;
    cmbDateBirth: TcxDBDateEdit;
    edtSurName: TcxDBTextEdit;
    edtName: TcxDBTextEdit;
    edtFamily: TcxDBTextEdit;
    Label1: TLabel;
    cmbSex: TcxDBComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FramePersonSmall: TFramePersonSmall;

implementation

{$R *.dfm}

end.
