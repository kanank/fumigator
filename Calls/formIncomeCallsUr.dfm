inherited frmIncomeCallUr: TfrmIncomeCallUr
  Caption = #1042#1093#1086#1076#1103#1097#1080#1081' '#1079#1074#1086#1085#1086#1082'. '#1070#1088#1080#1076#1080#1095#1077#1089#1082#1086#1077' '#1083#1080#1094#1086
  ClientHeight = 248
  ExplicitHeight = 286
  PixelsPerInch = 96
  TextHeight = 13
  inherited img1: TImage
    Top = -110
    ExplicitTop = -110
  end
  inherited Label11: TLabel
    Left = 400
    ExplicitLeft = 400
  end
  inherited RzPanel1: TRzPanel
    Top = 204
    ExplicitTop = 204
  end
  inherited grpBox: TRzGroupBox
    Height = 176
    ExplicitHeight = 176
    inherited Label4: TLabel [0]
      Left = 6
      Top = 101
      ExplicitLeft = 6
      ExplicitTop = 101
    end
    inherited Label2: TLabel [1]
      Left = 253
      Top = 63
      ExplicitLeft = 253
      ExplicitTop = 63
    end
    inherited Label3: TLabel [2]
      Left = 6
      Top = 135
      Width = 84
      Height = 26
      WordWrap = True
      ExplicitLeft = 6
      ExplicitTop = 135
      ExplicitWidth = 84
      ExplicitHeight = 26
    end
    inherited Label1: TLabel [3]
      Left = 6
      Top = 73
      ExplicitLeft = 6
      ExplicitTop = 73
    end
    object Label5: TLabel [4]
      Left = 6
      Top = 18
      Width = 84
      Height = 13
      Caption = #1055#1088#1072#1074#1086#1074#1072#1103' '#1092#1086#1088#1084#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel [5]
      Left = 6
      Top = 45
      Width = 21
      Height = 13
      Caption = #1048#1053#1053
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel [6]
      Left = 253
      Top = 18
      Width = 140
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel [7]
      Left = 253
      Top = 44
      Width = 88
      Height = 13
      Caption = #1050#1086#1085#1090#1072#1082#1090#1085#1086#1077' '#1083#1080#1094#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    inherited FramePerson: TFramePersonSmall
      Left = 9
      Top = 167
      TabOrder = 3
      ExplicitLeft = 9
      ExplicitTop = 167
      inherited RzPanel1: TRzPanel
        Left = -1
        Top = 98
        ExplicitLeft = -1
        ExplicitTop = 98
        inherited Label11: TLabel
          Left = 3
          ExplicitLeft = 3
        end
      end
    end
    inherited grdDog: TcxGrid
      Left = 253
      Top = 77
      TabOrder = 2
      ExplicitLeft = 253
      ExplicitTop = 77
    end
    inherited cmbFormat: TcxLookupComboBox
      Top = 70
      TabOrder = 0
      ExplicitTop = 70
    end
    inherited cmbStatus: TcxLookupComboBox
      Top = 98
      TabOrder = 1
      ExplicitTop = 98
    end
    inherited lblWorker: TcxLabel
      Left = 100
      Top = 133
      ExplicitLeft = 100
      ExplicitTop = 133
      ExplicitWidth = 128
      Width = 128
    end
    object cmbForma: TcxDBLookupComboBox
      Left = 100
      Top = 15
      DataBinding.DataField = 'STATUS_ID'
      DataBinding.DataSource = DS
      Properties.GridMode = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NAME'
        end>
      Properties.ListOptions.GridLines = glNone
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = DataModuleMain.DsDicStatusCli
      Properties.ReadOnly = False
      TabOrder = 5
      Width = 128
    end
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 100
      Top = 42
      Anchors = [akLeft, akTop, akRight]
      BeepOnEnter = False
      DataBinding.DataField = 'FAMILY'
      DataBinding.DataSource = FramePerson.DS
      Style.HotTrack = False
      Style.LookAndFeel.NativeStyle = True
      Style.TransparentBorder = True
      StyleDisabled.Color = clBtnFace
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 6
      Width = 128
    end
    object cxDBTextEdit2: TcxDBTextEdit
      Left = 399
      Top = 15
      Anchors = [akLeft, akTop, akRight]
      BeepOnEnter = False
      DataBinding.DataField = 'FAMILY'
      DataBinding.DataSource = FramePerson.DS
      Style.HotTrack = False
      Style.LookAndFeel.NativeStyle = True
      Style.TransparentBorder = True
      StyleDisabled.Color = clBtnFace
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 7
      Width = 219
    end
  end
  inherited edtPhone: TcxMaskEdit
    Left = 497
    Style.IsFontAssigned = True
    ExplicitLeft = 497
  end
  object cxDBTextEdit3: TcxDBTextEdit [5]
    Left = 407
    Top = 68
    Anchors = [akLeft, akTop, akRight]
    BeepOnEnter = False
    DataBinding.DataField = 'FAMILY'
    DataBinding.DataSource = FramePerson.DS
    Style.HotTrack = False
    Style.LookAndFeel.NativeStyle = True
    Style.TransparentBorder = True
    StyleDisabled.Color = clBtnFace
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 3
    Width = 219
  end
end
