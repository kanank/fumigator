unit frPersonSmallFoto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frPersonSmall, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBUpdateSQL, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxDropDownEdit, cxDBEdit, cxMaskEdit,
  cxCalendar, cxTextEdit, Vcl.StdCtrls, Vcl.ExtCtrls, RzPanel, frameBase, frFoto;

type
  TFramePersonSmallFoto = class(TFramePersonSmall)
    FrameFoto1: TFrameFoto;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FramePersonSmallFoto: TFramePersonSmallFoto;

implementation

{$R *.dfm}

end.
