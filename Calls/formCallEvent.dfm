object frmCallEvent: TfrmCallEvent
  Left = 0
  Top = 0
  AlphaBlend = True
  AlphaBlendValue = 230
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 130
  ClientWidth = 378
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 0
    Top = 0
    Width = 378
    Height = 130
    Align = alClient
    Brush.Style = bsClear
    ExplicitTop = 4
    ExplicitWidth = 65
    ExplicitHeight = 65
  end
  object RzLabel1: TRzLabel
    Left = 4
    Top = 16
    Width = 371
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = #1042#1093#1086#1076#1103#1097#1080#1081' '#1079#1074#1086#1085#1086#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    BlinkIntervalOff = 1000
    BlinkIntervalOn = 1000
  end
  object btnAccept: TRzButton
    Left = 41
    Top = 75
    Width = 105
    Height = 36
    Default = True
    ModalResult = 1
    Caption = #1055#1088#1080#1085#1103#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object btnDecline: TRzButton
    Left = 229
    Top = 75
    Width = 105
    Height = 36
    Cancel = True
    ModalResult = 2
    Caption = #1054#1090#1082#1083#1086#1085#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
end
