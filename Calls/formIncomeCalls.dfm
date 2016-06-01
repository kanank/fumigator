inherited frmIncomeCall: TfrmIncomeCall
  BorderIcons = [biSystemMenu]
  Caption = #1042#1093#1086#1076#1103#1097#1080#1081' '#1079#1074#1086#1085#1086#1082'. '#1060#1080#1079#1080#1095#1077#1089#1082#1086#1077' '#1083#1080#1094#1086
  ClientHeight = 225
  Position = poDesktopCenter
  ExplicitWidth = 657
  ExplicitHeight = 263
  DesignSize = (
    641
    225)
  PixelsPerInch = 96
  TextHeight = 13
  inherited img1: TImage
    Left = 568
    Top = -133
    Width = 73
    Height = 25
    Visible = False
    ExplicitLeft = 568
    ExplicitTop = -133
    ExplicitWidth = 73
    ExplicitHeight = 25
  end
  object Label11: TLabel [1]
    Left = 410
    Top = 9
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
  inherited RzPanel1: TRzPanel
    Top = 181
    ExplicitTop = 181
    inherited Exit_bnt: TRzButton
      Left = 145
      Top = 6
      Height = 33
      ModalResult = 1
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1082#1072#1088#1090#1086#1095#1082#1091' '#1082#1083#1080#1077#1085#1090#1072
      ExplicitLeft = 145
      ExplicitTop = 6
      ExplicitHeight = 33
    end
    object btnTransfer: TRzButton
      Left = 509
      Top = 6
      Width = 124
      Height = 33
      ModalResult = 2
      Anchors = [akTop, akRight]
      Caption = #1055#1077#1088#1077#1074#1077#1089#1090#1080' '#1074#1099#1079#1086#1074
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 2960640
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      HotTrack = True
      HotTrackColor = 16625984
      ParentFont = False
      TabOrder = 1
      ThemeAware = False
    end
  end
  object grpBox: TRzGroupBox
    Left = 8
    Top = 27
    Width = 625
    Height = 150
    Caption = #1044#1072#1085#1085#1099#1077' '#1086' '#1082#1083#1080#1077#1085#1090#1077
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -11
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = [fsBold]
    TabOrder = 1
    object Label1: TLabel
      Left = 10
      Top = 100
      Width = 83
      Height = 13
      Caption = #1060#1086#1088#1084#1072#1090' '#1082#1083#1080#1077#1085#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 10
      Top = 124
      Width = 81
      Height = 13
      Caption = #1057#1090#1072#1090#1091#1089' '#1082#1083#1080#1077#1085#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 252
      Top = 8
      Width = 100
      Height = 13
      Caption = #1044#1086#1075#1086#1074#1086#1088#1099' '#1082#1083#1080#1077#1085#1090#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 294
      Top = 123
      Width = 138
      Height = 13
      Caption = #1054#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1081' '#1089#1086#1090#1088#1091#1076#1085#1080#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    inline FramePerson: TFramePersonSmall
      Left = 1
      Top = 15
      Width = 227
      Height = 82
      TabOrder = 0
      ExplicitLeft = 1
      ExplicitTop = 15
      ExplicitWidth = 227
      ExplicitHeight = 82
      inherited RzPanel1: TRzPanel
        Width = 349
        Height = 87
        ExplicitWidth = 349
        ExplicitHeight = 87
        inherited edtCitizen: TcxDBTextEdit
          ExplicitWidth = 212
          Width = 212
        end
        inherited cmbDateBirth: TcxDBDateEdit
          ExplicitWidth = 128
          Width = 128
        end
        inherited edtSurName: TcxDBTextEdit
          Left = 97
          ExplicitLeft = 97
          ExplicitWidth = 282
          Width = 282
        end
        inherited edtName: TcxDBTextEdit
          Left = 97
          ExplicitLeft = 97
          ExplicitWidth = 282
          Width = 282
        end
        inherited edtFamily: TcxDBTextEdit
          Left = 97
          ExplicitLeft = 97
          ExplicitWidth = 282
          Width = 282
        end
      end
    end
    object grdDog: TcxGrid
      Left = 252
      Top = 22
      Width = 365
      Height = 95
      TabOrder = 1
      object grdDogDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.IncSearch = True
        OptionsBehavior.IncSearchItem = grdDogDBTableView1Column1
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnHidingOnGrouping = False
        OptionsCustomize.ColumnMoving = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.NoDataToDisplayInfoText = '<'#1059#1089#1083#1091#1075#1080' '#1085#1077' '#1074#1099#1073#1088#1072#1085#1099'>'
        OptionsView.ScrollBars = ssVertical
        OptionsView.GridLines = glNone
        OptionsView.GroupByBox = False
        object grdDogDBTableView1Column1: TcxGridDBColumn
          Caption = #8470' '#1076#1086#1075#1086#1074#1086#1088#1072
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.GridMode = True
          Properties.HideSelection = False
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'NAME'
            end>
          Properties.ListSource = DataModuleMain.DSDicServices
          Options.Editing = False
          Width = 69
        end
        object grdDogDBTableView1Column2: TcxGridDBColumn
          Caption = #1057#1090#1072#1090#1091#1089' '#1076#1086#1075#1086#1074#1086#1088#1072
          Width = 81
        end
        object grdDogDBTableView1Column3: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1079#1072#1082#1083#1102#1095#1077#1085#1080#1103
          Width = 101
        end
        object grdDogDBTableView1Column4: TcxGridDBColumn
          Caption = #1054#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1081
          Width = 100
        end
      end
      object grdDogLevel1: TcxGridLevel
        GridView = grdDogDBTableView1
      end
    end
    object cmbFormat: TcxLookupComboBox
      Left = 100
      Top = 97
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NAME'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = DataModuleMain.DsFormatsCli
      TabOrder = 2
      Width = 128
    end
    object cmbStatus: TcxLookupComboBox
      Left = 100
      Top = 121
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NAME'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = DataModuleMain.DsDicStatusCli
      TabOrder = 3
      Width = 128
    end
    object lblWorker: TcxLabel
      Left = 443
      Top = 121
      AutoSize = False
      Caption = 'lblWorker'
      Height = 17
      Width = 174
    end
  end
  object edtPhone: TcxMaskEdit
    Left = 504
    Top = 6
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
    TabOrder = 2
    Text = '          '
    Width = 129
  end
  object DS: TDataSource
    Left = 392
    Top = 306
  end
end
