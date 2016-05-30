inherited frmClientCard: TfrmClientCard
  Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1082#1083#1080#1077#1085#1090#1072
  ClientHeight = 242
  ClientWidth = 626
  Position = poDesktopCenter
  OnShow = FormShow
  ExplicitWidth = 642
  ExplicitHeight = 280
  PixelsPerInch = 96
  TextHeight = 13
  inherited img1: TImage
    Left = 441
    Top = -116
    Visible = False
  end
  object Label3: TLabel [1]
    Left = 8
    Top = 8
    Width = 85
    Height = 13
    Caption = #1044#1072#1085#1085#1099#1077' '#1082#1083#1080#1077#1085#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel [2]
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
  object Label1: TLabel [3]
    Left = 252
    Top = 131
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
  object Label4: TLabel [4]
    Left = 252
    Top = 174
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
  inherited RzPanel1: TRzPanel
    Top = 198
    Width = 626
    inherited Image2: TImage
      Left = -9
      Visible = False
    end
    inherited Exit_bnt: TRzButton
      Left = 492
      ModalResult = 0
      Caption = #1053#1086#1074#1099#1081' '#1076#1086#1075#1086#1074#1086#1088
    end
    object RzButton1: TRzButton
      Left = 8
      Top = 9
      Width = 124
      Height = 29
      Anchors = [akTop, akRight]
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
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
      OnClick = RzButton1Click
    end
    object RzButton2: TRzButton
      Left = 180
      Top = 9
      Width = 124
      Height = 29
      ModalResult = 2
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1084#1077#1085#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 2960640
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      HotTrack = True
      HotTrackColor = 16625984
      ParentFont = False
      TabOrder = 2
      ThemeAware = False
    end
  end
  object edtClientInfo: TcxDBMemo
    Left = 8
    Top = 22
    DataBinding.DataField = 'CLIENT_INFO'
    DataBinding.DataSource = DS
    Properties.ReadOnly = True
    Properties.ScrollBars = ssVertical
    TabOrder = 1
    Height = 170
    Width = 238
  end
  object grdDog: TcxGrid
    Left = 252
    Top = 22
    Width = 365
    Height = 101
    TabOrder = 2
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
      OptionsView.NoDataToDisplayInfoText = '<'#1044#1086#1075#1086#1074#1086#1088#1086#1074' '#1085#1077' '#1085#1072#1081#1076#1077#1085#1086'>'
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
  object edtComment: TcxDBTextEdit
    Left = 252
    Top = 144
    DataBinding.DataField = 'COMMENTS'
    DataBinding.DataSource = DS
    Properties.ReadOnly = True
    TabOrder = 3
    Width = 365
  end
  object cxDBLookupComboBox1: TcxDBLookupComboBox
    Left = 339
    Top = 171
    DataBinding.DataField = 'STATUS_ID'
    DataBinding.DataSource = DS
    Properties.KeyFieldNames = 'ID'
    Properties.ListColumns = <
      item
        FieldName = 'NAME'
      end>
    Properties.ListOptions.GridLines = glNone
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DataModuleMain.DsDicStatusCli
    Properties.ReadOnly = True
    TabOrder = 4
    Width = 118
  end
  object DS: TDataSource
    AutoEdit = False
    DataSet = Q
    Left = 440
    Top = 288
  end
  object Q: TIBQuery
    Database = DataModuleMain.DB
    Transaction = DataModuleMain.Calls_Tr
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from GET_CLIENTINFO (:CLIENT_ID)')
    Left = 520
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CLIENT_ID'
        ParamType = ptUnknown
      end>
  end
end
