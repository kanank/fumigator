inherited frmCallUnknown: TfrmCallUnknown
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1042#1093#1086#1076#1103#1097#1080#1081' '#1079#1074#1086#1085#1086#1082'. '#1050#1083#1080#1077#1085#1090' '#1085#1077' '#1085#1072#1081#1076#1077#1085
  ClientHeight = 193
  ClientWidth = 470
  Position = poDesktopCenter
  ExplicitWidth = 476
  ExplicitHeight = 221
  PixelsPerInch = 96
  TextHeight = 13
  inherited img1: TImage
    Left = 453
    Top = -229
    Visible = False
    ExplicitLeft = 624
    ExplicitTop = -64
  end
  object Label11: TLabel [1]
    Left = 233
    Top = 11
    Width = 88
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object RzLabel1: TRzLabel [2]
    Left = 133
    Top = 48
    Width = 182
    Height = 23
    Caption = #1050#1083#1080#1077#1085#1090' '#1085#1077' '#1085#1072#1081#1076#1077#1085'!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited RzPanel1: TRzPanel
    Top = 149
    Width = 470
    ExplicitTop = 149
    ExplicitWidth = 470
    inherited Image2: TImage
      Left = 36
      ExplicitLeft = 4
    end
    inherited Exit_bnt: TRzButton
      Left = 188
      Caption = #1054#1090#1084#1077#1085#1072
      ExplicitLeft = 188
    end
  end
  object btnNewFizCli: TRzButton
    Left = 8
    Top = 88
    Width = 192
    Height = 29
    ModalResult = 1
    Caption = #1053#1086#1074#1099#1081' '#1082#1083#1080#1077#1085#1090'. '#1060#1080#1079#1080#1095#1077#1089#1082#1086#1077' '#1083#1080#1094#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    HotTrack = True
    HotTrackColor = 16625984
    ParentFont = False
    TabOrder = 1
    ThemeAware = False
  end
  object btnNewUrCli: TRzButton
    Left = 268
    Top = 88
    Width = 192
    Height = 29
    ModalResult = 6
    Caption = #1053#1086#1074#1099#1081' '#1082#1083#1080#1077#1085#1090'. '#1070#1088#1080#1076#1080#1095#1077#1089#1082#1086#1077' '#1083#1080#1094#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    HotTrack = True
    HotTrackColor = 16625984
    ParentFont = False
    TabOrder = 2
    ThemeAware = False
  end
  object edtPhone: TcxMaskEdit
    Left = 331
    Top = 8
    ParentFont = False
    Properties.AlwaysShowBlanksAndLiterals = True
    Properties.EditMask = '\(999\)000\-00\-00;0;'#9618
    Properties.ReadOnly = True
    Properties.ValidationOptions = [evoShowErrorIcon, evoAllowLoseFocus]
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 3
    Text = '          '
    Width = 129
  end
  object DS: TDataSource
    Left = 8
    Top = 8
  end
end
