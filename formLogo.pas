unit formLogo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, RzLabel, dxGDIPlusClasses,
  Vcl.ExtCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxProgressBar, IdComponent, Vcl.XPMan;

type
  TfrmLogo = class(TForm)
    img1: TImage;
    Info: TRzLabel;
    Shape1: TShape;
    ProgressBar: TcxProgressBar;
    XPManifest1: TXPManifest;
  private
    procedure SetInfo(AValue: string);
    function GetInfo: string;
  public
    property InfoText: string read GetInfo write SetInfo;
    procedure RefreshForm;
    procedure HTTPWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
    procedure HTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Int64);
    procedure HTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
  end;

var
  frmLogo: TfrmLogo;

implementation

{$R *.dfm}



{ TfrmLogo }

function TfrmLogo.GetInfo: string;
begin
  Result := Info.Caption;
end;

procedure TfrmLogo.RefreshForm;
begin
  BringWindowToTop(self.Handle);
  self.Repaint;
end;

procedure TfrmLogo.SetInfo(AValue: string);
begin
  Self.info.Caption := AValue;
  Info.Alignment := taCenter;
  RefreshForm;
end;

procedure TfrmLogo.HTTPWork(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
   self.ProgressBar.Position := AWorkCount;
   self.RefreshForm;
end;

procedure TfrmLogo.HTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
  Self.Info.Caption := '�������� ����� ������';
  Self.ProgressBar.Properties.Max:= AWorkCountMax;
end;

procedure TfrmLogo.HTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  Self.ProgressBar.Visible := False;
  InfoText := '�������� ���������';
end;

end.
