object frmRecordPlay: TfrmRecordPlay
  Left = 0
  Top = 0
  BorderIcons = []
  ClientHeight = 21
  ClientWidth = 116
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 2
    Top = 2
    Width = 16
    Height = 16
    Hint = #1042#1086#1089#1087#1088#1086#1080#1079#1074#1077#1089#1090#1080
    AutoSize = True
    Picture.Data = {
      0D546478536D617274496D61676589504E470D0A1A0A0000000D494844520000
      00100000001008060000001FF3FF61000000017352474200AECE1CE900000004
      67414D410000B18F0BFC61050000001974455874536F6674776172650041646F
      626520496D616765526561647971C9653C0000001B744558745469746C65004E
      6578743B506C61793B4172726F773B526967687416E40EAE0000005F49444154
      384FC5D34B0A00200804500FE6D9824E6E1914685F75D16296F3324A20228824
      54E683B70022A61AD0D1D39E005A215660423C8040BCC040224043BE0279F5E1
      6ECFC8637372FF0F9E2B8C3223564094ADC0543601AF1B1ADEC602F2C67EB924
      2DC3970000000049454E44AE426082}
    OnClick = Image1Click
  end
  object MediaPlayer: TMediaPlayer
    Left = 24
    Top = 2
    Width = 253
    Height = 24
    Visible = False
    TabOrder = 0
  end
  object FtpClient: TIdFTP
    IPVersion = Id_IPv4
    Host = 'ftp.telphin.ru'
    Passive = True
    NATKeepAlive.UseKeepAlive = False
    NATKeepAlive.IdleTimeMS = 0
    NATKeepAlive.IntervalMS = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 40
  end
end