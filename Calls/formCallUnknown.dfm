inherited frmCallUnknown: TfrmCallUnknown
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1042#1093#1086#1076#1103#1097#1080#1081' '#1079#1074#1086#1085#1086#1082'. '#1050#1083#1080#1077#1085#1090' '#1085#1077' '#1085#1072#1081#1076#1077#1085
  ClientHeight = 193
  ClientWidth = 440
  ExplicitWidth = 446
  ExplicitHeight = 221
  PixelsPerInch = 96
  TextHeight = 13
  inherited img1: TImage
    Left = 423
    Top = -229
    Visible = False
    ExplicitLeft = 624
    ExplicitTop = -64
  end
  object Label11: TLabel [1]
    Left = 207
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
    Width = 440
    inherited Image2: TImage
      ExplicitLeft = 4
    end
    inherited Exit_bnt: TRzButton
      Left = 158
      Caption = #1054#1090#1084#1077#1085#1072
      ExplicitLeft = 158
    end
  end
  object edtPhone: TcxDBMaskEdit
    Left = 301
    Top = 8
    DataBinding.DataField = 'PHONE'
    DataBinding.DataSource = DS
    Enabled = False
    Properties.EditMask = '\(999\)000-0000;0;_'
    Properties.ValidationOptions = [evoRaiseException, evoShowErrorIcon]
    StyleDisabled.BorderColor = clInfoText
    StyleDisabled.TextColor = clMenuText
    TabOrder = 1
    Width = 129
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
    TabOrder = 2
    ThemeAware = False
  end
  object btnNewUrCli: TRzButton
    Left = 238
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
    TabOrder = 3
    ThemeAware = False
  end
  object DS: TDataSource
    Left = 8
    Top = 8
  end
end
