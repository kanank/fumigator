unit formSmallClientFiz;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassFormSmallCard, RzButton,
  Vcl.ExtCtrls, RzPanel, dxGDIPlusClasses, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxMemo, cxDBEdit, frameBase, frListBase, frUslugi,
  cxMaskEdit, cxTextEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, Vcl.StdCtrls;

type
  TfrmSmallCardFiz = class(TfrmSmallCard)
    Label10: TLabel;
    Label11: TLabel;
    edtName: TcxDBTextEdit;
    edtFamily: TcxDBTextEdit;
    procedure RzBitBtn1Click(Sender: TObject);
    procedure Exit_bntClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSmallCardFiz: TfrmSmallCardFiz;

implementation

{$R *.dfm}
uses
  formClientFiz;

procedure TfrmSmallCardFiz.Exit_bntClick(Sender: TObject);
begin
  frmClientFiz.butOK.Click;
  ModalResult := mrOk;
end;

procedure TfrmSmallCardFiz.RzBitBtn1Click(Sender: TObject);
begin
 try
   Self.Hide;
   //frmClientFiz.FormStyle := fsStayOnTop;
   frmClientFiz.ShowModal;
 finally
   Self.Show;
 end;
end;

end.
