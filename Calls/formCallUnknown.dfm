inherited frmCallUnknown: TfrmCallUnknown
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1042#1093#1086#1076#1103#1097#1080#1081' '#1079#1074#1086#1085#1086#1082'. '#1050#1083#1080#1077#1085#1090' '#1085#1077' '#1085#1072#1081#1076#1077#1085
  ClientHeight = 339
  ClientWidth = 383
  FormStyle = fsStayOnTop
  Position = poDesktopCenter
  OnCreate = FormCreate
  ExplicitWidth = 389
  ExplicitHeight = 367
  PixelsPerInch = 96
  TextHeight = 13
  inherited img1: TImage
    Left = 366
    Top = -83
    Visible = False
    ExplicitLeft = 624
    ExplicitTop = -64
  end
  object RzLabel1: TRzLabel [1]
    Left = 100
    Top = 8
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
    Top = 295
    Width = 383
    ExplicitTop = 295
    ExplicitWidth = 383
    inherited Image2: TImage
      Left = 4
      ExplicitLeft = 4
    end
    inherited Exit_bnt: TRzButton
      Left = 250
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      Font.Height = -13
      OnClick = Exit_bntClick
      ExplicitLeft = 250
    end
  end
  object btnPost: TRzButton
    Left = 4
    Top = 147
    Width = 376
    Height = 33
    ModalResult = 1
    Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
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
    OnClick = btnClick
  end
  object edtPhone: TcxMaskEdit
    Left = 4
    Top = 39
    AutoSize = False
    ParentFont = False
    Properties.AlwaysShowBlanksAndLiterals = True
    Properties.EditMask = '\(999\)000\-00\-00;0;'#9618
    Properties.ReadOnly = True
    Properties.ValidationOptions = [evoShowErrorIcon, evoAllowLoseFocus]
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -19
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 2
    Text = '          '
    Height = 32
    Width = 188
  end
  object btnLID: TRzMenuButton
    Left = 4
    Top = 99
    Width = 376
    Height = 33
    ModalResult = 1
    Caption = #1053#1086#1074#1099#1081' '#1051#1048#1044
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    HotTrack = True
    HotTrackColor = 16625984
    ParentFont = False
    TabOrder = 3
    ThemeAware = False
    DropDownMenu = pmNewClient
    ShowArrow = False
  end
  object btnCorporate: TRzButton
    Left = 4
    Top = 195
    Width = 376
    Height = 33
    ModalResult = 1
    Caption = #1050#1086#1087#1086#1088#1072#1090#1080#1074#1085#1099#1081' '#1085#1086#1084#1077#1088
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
    OnClick = btnClick
  end
  object btnErrorCall: TRzButton
    Left = 4
    Top = 244
    Width = 376
    Height = 33
    ModalResult = 1
    Caption = #1054#1096#1080#1073#1086#1095#1085#1099#1081' '#1074#1099#1079#1086#1074
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    HotTrack = True
    HotTrackColor = 16625984
    ParentFont = False
    TabOrder = 5
    ThemeAware = False
    OnClick = btnClick
  end
  object btnAddToExist: TRzMenuButton
    Left = 198
    Top = 39
    Width = 182
    Height = 32
    ModalResult = 1
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082' '#1089#1091#1097#1077#1089#1090#1074#1091#1102#1097#1077#1084#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    HotTrack = True
    HotTrackColor = 16625984
    ParentFont = False
    TabOrder = 6
    ThemeAware = False
    DropDownMenu = pmExistsClient
    ShowArrow = False
  end
  object DS: TDataSource
    Left = 40
    Top = 32
  end
  object pmNewClient: TPopupMenu
    Left = 336
    Top = 88
    object NewFizClnt_mi: TMenuItem
      Caption = #1060#1080#1079#1080#1095#1077#1089#1082#1086#1077' '#1083#1080#1094#1086
      OnClick = NewFizClnt_miClick
    end
    object NewURClnt_mi: TMenuItem
      Caption = #1070#1088#1080#1076#1080#1095#1077#1089#1082#1086#1077' '#1083#1080#1094#1086
      OnClick = NewURClnt_miClick
    end
  end
  object pmExistsClient: TPopupMenu
    Left = 312
    Top = 8
    object mExistsClient: TMenuItem
      Caption = #1050#1083#1080#1077#1085#1090#1091
      OnClick = mExistsClientClick
    end
    object mExistsContact: TMenuItem
      Caption = #1050#1086#1085#1090#1072#1082#1090#1091
      Enabled = False
    end
  end
end
