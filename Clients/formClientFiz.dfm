inherited frmClientFiz: TfrmClientFiz
  Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1082#1083#1080#1077#1085#1090#1072'. '#1060#1080#1079'. '#1083#1080#1094#1086
  ClientHeight = 341
  ClientWidth = 717
  Position = poDesktopCenter
  OnCreate = FormCreate
  ExplicitWidth = 733
  ExplicitHeight = 379
  PixelsPerInch = 96
  TextHeight = 13
  inherited img1: TImage
    Left = 560
    Top = 238
    Width = 149
    Height = 57
    ExplicitLeft = 560
    ExplicitTop = 238
    ExplicitWidth = 149
    ExplicitHeight = 57
  end
  object Label6: TLabel [1]
    Left = 524
    Top = 37
    Width = 42
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = #1055#1072#1089#1087#1086#1088#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 2105376
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel [2]
    Left = 302
    Top = 85
    Width = 84
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel [3]
    Left = 8
    Top = 185
    Width = 98
    Height = 13
    Caption = #1040#1076#1088#1077#1089' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label14: TLabel [4]
    Left = 307
    Top = 265
    Width = 67
    Height = 13
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel [5]
    Left = 8
    Top = 224
    Width = 35
    Height = 13
    Caption = #1056#1077#1075#1080#1086#1085
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label16: TLabel [6]
    Left = 238
    Top = 224
    Width = 55
    Height = 13
    Caption = #1053#1072#1089'. '#1087#1091#1085#1082#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label17: TLabel [7]
    Left = 9
    Top = 265
    Width = 31
    Height = 13
    Caption = #1040#1076#1088#1077#1089
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label15: TLabel [8]
    Left = 297
    Top = 16
    Width = 36
    Height = 13
    Caption = #1057#1090#1072#1090#1091#1089
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label18: TLabel [9]
    Left = 410
    Top = 16
    Width = 38
    Height = 13
    Caption = #1060#1086#1088#1084#1072#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  inherited RzPanel1: TRzPanel
    Top = 297
    Width = 717
    ExplicitTop = 297
    ExplicitWidth = 717
    inherited Exit_bnt: TRzButton
      Left = 583
      ExplicitLeft = 583
    end
  end
  object Passp_pnl: TRzPanel
    AlignWithMargins = True
    Left = 437
    Top = 74
    Width = 277
    Height = 143
    BorderOuter = fsGroove
    TabOrder = 1
    object Label10: TLabel
      Left = 5
      Top = 11
      Width = 73
      Height = 13
      Caption = #1057#1077#1088#1080#1103' '#1080' '#1085#1086#1084#1077#1088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 6
      Top = 41
      Width = 67
      Height = 13
      Caption = #1050#1086#1075#1076#1072' '#1074#1099#1076#1072#1085
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 7
      Top = 68
      Width = 74
      Height = 13
      Caption = #1050#1086#1076' '#1087#1086#1076#1088#1072#1079#1076'.:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 5
      Top = 94
      Width = 55
      Height = 13
      Caption = #1050#1077#1084' '#1074#1099#1076#1072#1085
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object PassNum_medt: TcxDBMaskEdit
      Left = 87
      Top = 9
      DataBinding.DataField = 'PASS_NUM'
      Properties.MaskKind = emkRegExprEx
      Properties.EditMask = '\d\d\d\d '#39' '#39' \d\d\d\d\d\d'
      Properties.MaxLength = 0
      Properties.ValidationOptions = [evoShowErrorIcon]
      TabOrder = 0
      Width = 90
    end
    object PassDate_DP: TcxDBDateEdit
      Left = 87
      Top = 39
      DataBinding.DataField = 'PASS_DATE'
      TabOrder = 1
      Width = 90
    end
    object PassCode_edt: TcxDBTextEdit
      Left = 87
      Top = 66
      BeepOnEnter = False
      DataBinding.DataField = 'PASE_CODE'
      Properties.MaxLength = 16
      Properties.ValidationOptions = [evoShowErrorIcon]
      Style.HotTrack = False
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = True
      Style.TransparentBorder = True
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 2
      Width = 71
    end
    object PassOrg_memo: TcxDBMemo
      Left = 87
      Top = 94
      DataBinding.DataField = 'PASS_ORG'
      Properties.MaxLength = 128
      Properties.ValidationOptions = [evoShowErrorIcon]
      TabOrder = 3
      Height = 41
      Width = 186
    end
  end
  object Phone_edt: TcxDBTextEdit
    Left = 302
    Top = 104
    BeepOnEnter = False
    DataBinding.DataField = 'PHONE'
    ParentFont = False
    Properties.IncrementalSearch = False
    Properties.MaxLength = 0
    Properties.ValidationOptions = [evoShowErrorIcon]
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.HotTrack = False
    Style.LookAndFeel.Kind = lfFlat
    Style.LookAndFeel.NativeStyle = True
    Style.TransparentBorder = True
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 2
    Width = 135
  end
  object ID_edt: TcxDBTextEdit
    Left = 307
    Top = 149
    Anchors = [akLeft, akTop, akRight]
    BeepOnEnter = False
    DataBinding.DataField = 'ID'
    ParentFont = False
    Style.Color = 13421823
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.HotTrack = False
    Style.LookAndFeel.Kind = lfFlat
    Style.LookAndFeel.NativeStyle = True
    Style.TransparentBorder = True
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 3
    Visible = False
    Width = 43
  end
  object Adres_memo: TcxDBMemo
    Left = 116
    Top = 176
    DataBinding.DataField = 'ADRESS'
    Properties.MaxLength = 0
    Properties.ValidationOptions = [evoShowErrorIcon]
    TabOrder = 4
    Height = 22
    Width = 302
  end
  object Comments_memo: TcxDBMemo
    Left = 380
    Top = 248
    DataBinding.DataField = 'COMMENTS'
    Properties.MaxLength = 0
    Properties.ValidationOptions = [evoShowErrorIcon]
    TabOrder = 5
    Height = 31
    Width = 295
  end
  object InfoGer_CB: TcxDBComboBox
    Left = 49
    Top = 221
    DataBinding.DataField = 'INFOGET'
    Properties.Items.Strings = (
      #1088#1077#1082#1083#1072#1084#1072' TV'
      #1086#1090' '#1076#1088#1091#1079#1077#1081
      #1087#1086#1080#1089#1082' '#1074' '#1080#1085#1090#1077#1088#1085#1077#1090#1077' '#1074' '#1089#1080#1089#1090#1077#1084#1077' Yandex'
      #1087#1086#1080#1089#1082' '#1074' '#1080#1085#1090#1077#1088#1085#1077#1090#1077' '#1074' '#1089#1080#1089#1090#1077#1084#1077' Google')
    Properties.MaxLength = 0
    Properties.ValidationOptions = [evoShowErrorIcon]
    TabOrder = 6
    Width = 119
  end
  object cxDBComboBox1: TcxDBComboBox
    Left = 299
    Top = 221
    DataBinding.DataField = 'INFOGET'
    Properties.Items.Strings = (
      #1088#1077#1082#1083#1072#1084#1072' TV'
      #1086#1090' '#1076#1088#1091#1079#1077#1081
      #1087#1086#1080#1089#1082' '#1074' '#1080#1085#1090#1077#1088#1085#1077#1090#1077' '#1074' '#1089#1080#1089#1090#1077#1084#1077' Yandex'
      #1087#1086#1080#1089#1082' '#1074' '#1080#1085#1090#1077#1088#1085#1077#1090#1077' '#1074' '#1089#1080#1089#1090#1077#1084#1077' Google')
    Properties.MaxLength = 0
    Properties.ValidationOptions = [evoShowErrorIcon]
    TabOrder = 7
    Width = 119
  end
  object cxDBMemo1: TcxDBMemo
    Left = 46
    Top = 256
    DataBinding.DataField = 'ADRESS'
    Properties.MaxLength = 0
    Properties.ValidationOptions = [evoShowErrorIcon]
    TabOrder = 8
    Height = 22
    Width = 247
  end
  object cxDBComboBox2: TcxDBComboBox
    Left = 338
    Top = 13
    DataBinding.DataField = 'INFOGET'
    Properties.Items.Strings = (
      #1088#1077#1082#1083#1072#1084#1072' TV'
      #1086#1090' '#1076#1088#1091#1079#1077#1081
      #1087#1086#1080#1089#1082' '#1074' '#1080#1085#1090#1077#1088#1085#1077#1090#1077' '#1074' '#1089#1080#1089#1090#1077#1084#1077' Yandex'
      #1087#1086#1080#1089#1082' '#1074' '#1080#1085#1090#1077#1088#1085#1077#1090#1077' '#1074' '#1089#1080#1089#1090#1077#1084#1077' Google')
    Properties.MaxLength = 0
    Properties.ValidationOptions = [evoShowErrorIcon]
    TabOrder = 9
    Width = 67
  end
  object cxDBComboBox3: TcxDBComboBox
    Left = 451
    Top = 13
    DataBinding.DataField = 'INFOGET'
    Properties.Items.Strings = (
      #1088#1077#1082#1083#1072#1084#1072' TV'
      #1086#1090' '#1076#1088#1091#1079#1077#1081
      #1087#1086#1080#1089#1082' '#1074' '#1080#1085#1090#1077#1088#1085#1077#1090#1077' '#1074' '#1089#1080#1089#1090#1077#1084#1077' Yandex'
      #1087#1086#1080#1089#1082' '#1074' '#1080#1085#1090#1077#1088#1085#1077#1090#1077' '#1074' '#1089#1080#1089#1090#1077#1084#1077' Google')
    Properties.MaxLength = 0
    Properties.ValidationOptions = [evoShowErrorIcon]
    TabOrder = 10
    Width = 67
  end
  inline FramePersonSmall1: TFramePersonSmall
    Left = 6
    Top = 8
    Width = 290
    Height = 130
    TabOrder = 11
    ExplicitLeft = 6
    ExplicitTop = 8
    inherited cmbSex: TcxDBComboBox
      Top = 77
      ExplicitTop = 77
    end
  end
  object DS: TDataSource
    Left = 480
    Top = 311
  end
end
