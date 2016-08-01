unit formRecordPlay;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, JvComponentBase, JvWavePlayer,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdFTP, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxGDIPlusClasses, cxImage, Vcl.MPlayer, RzButton, Vcl.ExtCtrls;

type
  TfrmRecordPlay = class(TForm)
    MediaPlayer: TMediaPlayer;
    Image1: TImage;
    FtpClient: TIdFTP;
    procedure Image1Click(Sender: TObject);
  private

  public
    CallApiId: string;
    ext: string;
    FileName: string;
    procedure GetFileName;
    function  GetFileFromFtp: Boolean;
  end;

var
  frmRecordPlay: TfrmRecordPlay;

implementation

{$R *.dfm}
uses
  frmMain, IdFTPCommon;


function TfrmRecordPlay.GetFileFromFtp: Boolean;
var
  dir: string;
  p: Integer;
  err0: WideString;
  err: string;
begin
  try
    dir := ext;
    p := Pos('*', dir);
    if p > 0 then
      dir := Copy(dir, p+1, Length(dir));

    if FileExists(ExtractFilePath(Application.ExeName) + FileName + '.wav') then
    begin
      Result := True;
      Exit;
    end;

    FtpClient.Username := 'NOE02497';
    FtpClient.Password := 'passuxah0xohBe';
    FtpClient.Connect;
    FtpClient.TransferType := ftASCII;
    FtpClient.ChangeDir(dir);
    FtpClient.TransferType := ftBinary;
    FtpClient.Get(FileName + '.WAV', ExtractFilePath(Application.ExeName) + FileName + '.WAV', True);
    Result := True;
  except
    err0 :=  (Exception(ExceptObject).Message);
    err := WideCharToString(PWideChar(err0));
    Result := false;
    if FtpClient.Connected then
      FtpClient.Disconnect;
  end;
end;

procedure TfrmRecordPlay.GetFileName;
var
  cnt: Integer;
begin
  formMain.TCPClient.IOHandler.WriteLn(Format('#getrecordinfo:%s,%s', [CallApiId, ext]));

  while (FileName = '') and (cnt < 50) do
  begin
    Sleep(200);
    Application.ProcessMessages;
    Inc(cnt);
  end;

  if cnt = 50 then
  begin
    FileName := '#no response';
    ShowMessage('Не удалось получить параметры звукового файла');
  end;

  if FileName = '#not found' then
    ShowMessage('Не найдена запись');
  if FileName = '#error' then
    ShowMessage('Ошибка получения записи');

end;

procedure TfrmRecordPlay.Image1Click(Sender: TObject);
begin
  if Assigned(Self.Parent) then
    TForm(Parent.Owner).Enabled := False;
  try
    GetFileName;

    if GetFileFromFtp then
    begin
      MediaPlayer.FileName := ExtractFilePath(Application.ExeName) + FileName + '.wav';
      MediaPlayer.Open;
      MediaPlayer.Play;
      MediaPlayer.Close;
    end
    else
    begin
      MessageBox(0, 'Произошла ошибка получения звукового файла', 'Фумигатор', MB_ICONERROR);
    end;

  finally
    if Assigned(Self.Parent) then
      TForm(Parent.Owner).Enabled := true;
  end;
end;

end.
