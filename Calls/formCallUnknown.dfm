inherited frmCallUnknown: TfrmCallUnknown
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1042#1093#1086#1076#1103#1097#1080#1081' '#1079#1074#1086#1085#1086#1082'. '#1050#1083#1080#1077#1085#1090' '#1085#1077' '#1085#1072#1081#1076#1077#1085
  ClientHeight = 237
  ClientWidth = 460
  FormStyle = fsStayOnTop
  Position = poDesktopCenter
  ExplicitWidth = 466
  ExplicitHeight = 265
  PixelsPerInch = 96
  TextHeight = 13
  inherited img1: TImage
    Left = 443
    Top = -185
    Visible = False
    ExplicitLeft = 624
    ExplicitTop = -64
  end
  object Label11: TLabel [1]
    Left = 8
    Top = 14
    Width = 99
    Height = 16
    Caption = #1053#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object RzLabel1: TRzLabel [2]
    Left = 133
    Top = 51
    Width = 182
    Height = 23
    Caption = #1050#1083#1080#1077#1085#1090' '#1085#1077' '#1085#1072#1081#1076#1077#1085'!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 1000
    BlinkIntervalOn = 1000
  end
  inherited RzPanel1: TRzPanel
    Top = 193
    Width = 460
    ExplicitTop = 193
    ExplicitWidth = 460
    inherited Image2: TImage
      Left = 26
      ExplicitLeft = 4
    end
    inherited Exit_bnt: TRzButton
      Left = 327
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      Font.Height = -13
      ExplicitLeft = 327
    end
  end
  object btnNewFizCli: TRzButton
    Left = 8
    Top = 92
    Width = 169
    Height = 40
    ModalResult = 1
    Caption = #1053#1086#1074#1099#1081' '#1082#1083#1080#1077#1085#1090'. '#1060#1080#1079#1080#1095#1077#1089#1082#1086#1077' '#1083#1080#1094#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    HotTrack = True
    HotTrackColor = 16625984
    ParentFont = False
    TabOrder = 1
    ThemeAware = False
  end
  object btnNewUrCli: TRzButton
    Left = 8
    Top = 138
    Width = 169
    Height = 40
    ModalResult = 6
    Caption = #1053#1086#1074#1099#1081' '#1082#1083#1080#1077#1085#1090'. '#1070#1088#1080#1076#1080#1095#1077#1089#1082#1086#1077' '#1083#1080#1094#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    HotTrack = True
    HotTrackColor = 16625984
    ParentFont = False
    TabOrder = 2
    ThemeAware = False
  end
  object edtPhone: TcxMaskEdit
    Left = 117
    Top = 11
    AutoSize = False
    ParentFont = False
    Properties.AlwaysShowBlanksAndLiterals = True
    Properties.EditMask = '\(999\)000\-00\-00;0;'#9618
    Properties.ReadOnly = True
    Properties.ValidationOptions = [evoShowErrorIcon, evoAllowLoseFocus]
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 3
    Text = '          '
    Height = 21
    Width = 148
  end
  object RzButton1: TRzButton
    Left = 268
    Top = 6
    Width = 182
    Height = 30
    ModalResult = 6
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082' '#1089#1091#1097#1077#1089#1090#1074#1091#1102#1097#1077#1084#1091
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    HotTrack = True
    HotTrackColor = 16625984
    ParentFont = False
    TabOrder = 4
    ThemeAware = False
  end
  object btnContacts: TRzMenuButton
    Left = 268
    Top = 92
    Width = 173
    Height = 40
    ModalResult = 12
    Caption = #1053#1086#1074#1099#1081' '#1082#1086#1085#1090#1072#1082#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    HotTrack = True
    HotTrackColor = 16625984
    ParentFont = False
    TabOrder = 5
    ThemeAware = False
    DropDownMenu = DataModuleMain.mContactTypes
    ShowArrow = False
  end
  object DS: TDataSource
    Left = 40
    Top = 32
  end
end
