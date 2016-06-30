inherited frmWorkerShedule: TfrmWorkerShedule
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1089#1087#1080#1089#1082#1072' '#1082#1083#1080#1077#1085#1090#1086#1074
  ClientHeight = 334
  ClientWidth = 772
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitWidth = 788
  ExplicitHeight = 372
  PixelsPerInch = 96
  TextHeight = 13
  inherited img1: TImage
    Left = 707
    Top = -82
    Width = 65
    Height = 25
    Visible = False
    ExplicitLeft = 723
    ExplicitTop = -9
    ExplicitWidth = 65
    ExplicitHeight = 25
  end
  object Label11: TLabel [1]
    Left = 413
    Top = 13
    Width = 56
    Height = 13
    Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel [2]
    Left = 648
    Top = 13
    Width = 26
    Height = 13
    Caption = #1044#1072#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  inherited RzPanel1: TRzPanel
    Top = 290
    Width = 772
    ExplicitTop = 290
    ExplicitWidth = 772
    inherited Exit_bnt: TRzButton
      Left = 638
      ExplicitLeft = 638
    end
    object butOk: TRzButton
      Left = 502
      Top = 9
      Width = 124
      Height = 29
      ModalResult = 1
      Anchors = [akTop, akRight]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
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
      OnClick = butOkClick
    end
  end
  object GridCli: TcxGrid
    Left = 2
    Top = 31
    Width = 369
    Height = 257
    TabOrder = 1
    object GridCliUrView: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.InfoPanel.Visible = True
      DataController.DataSource = DsCli
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.ImmediateEditor = False
      OptionsCustomize.ColumnGrouping = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.MultiSelect = True
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.NoDataToDisplayInfoText = '<'#1057#1087#1080#1089#1086#1082' '#1087#1091#1089#1090'>'
      OptionsView.GridLines = glVertical
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      object GridCliUrViewColumn1: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'NAME'
        Width = 117
      end
      object GridCliUrViewColumn2: TcxGridDBColumn
        Caption = #1056#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1100
        DataBinding.FieldName = 'PERSON_NAME'
        Width = 81
      end
      object GridCliUrViewColumn3: TcxGridDBColumn
        Caption = #1058#1077#1083#1077#1092#1086#1085
        DataBinding.FieldName = 'PHONE'
      end
      object GridCliUrViewColumn4: TcxGridDBColumn
        Caption = #1054#1090#1074'. '#1089#1086#1090#1088#1091#1076#1085#1080#1082
        DataBinding.FieldName = 'WORKER_NAME'
        Width = 89
      end
      object GridCliUrViewColumn5: TcxGridDBColumn
        DataBinding.FieldName = 'id'
        Visible = False
      end
    end
    object GridCliLevel1: TcxGridLevel
      GridView = GridCliUrView
    end
  end
  object Fiz_btn: TRzButton
    Left = 2
    Top = 3
    Width = 130
    Height = 27
    GroupIndex = 2
    FrameColor = clGray
    ShowDownPattern = False
    Anchors = [akTop, akRight]
    Caption = #1060#1080#1079#1080#1095#1077#1089#1082#1080#1077' '#1083#1080#1094#1072
    Color = 16444638
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
    OnClick = Fiz_btnClick
  end
  object Ur_btn: TRzButton
    Left = 135
    Top = 3
    Width = 126
    Height = 27
    GroupIndex = 2
    Down = True
    FrameColor = clGray
    ShowDownPattern = False
    Anchors = [akTop, akRight]
    Caption = #1070#1088#1080#1076#1080#1095#1077#1089#1082#1080#1077' '#1083#1080#1094#1072
    Color = 15332600
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    HotTrack = True
    HotTrackColor = 16625984
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    ThemeAware = False
    OnClick = Ur_btnClick
  end
  object GridShedule: TcxGrid
    Left = 411
    Top = 31
    Width = 350
    Height = 257
    TabOrder = 4
    object GridSheduleView: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.InfoPanel.Visible = True
      DataController.DataSource = DS
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnGrouping = False
      OptionsSelection.CellSelect = False
      OptionsView.NoDataToDisplayInfoText = '<'#1057#1087#1080#1089#1086#1082' '#1087#1091#1089#1090'>'
      OptionsView.GridLines = glVertical
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      object cxGridDBColumn1: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'CLIENT_ID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.GridMode = True
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'NAME'
          end>
        Properties.ListSource = DataModuleMain.DsClients
        Width = 117
      end
      object cxGridDBColumn3: TcxGridDBColumn
        Caption = #1058#1077#1083#1077#1092#1086#1085
        DataBinding.FieldName = 'CLIENT_ID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.GridMode = True
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'PHONE'
          end>
        Properties.ListSource = DataModuleMain.DsClients
        Width = 102
      end
      object cxGridDBColumn4: TcxGridDBColumn
        Caption = #1054#1090#1074'. '#1089#1086#1090#1088#1091#1076#1085#1080#1082
        DataBinding.FieldName = 'CLIENT_ID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.GridMode = True
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'WORKER_NAME'
          end>
        Properties.ListSource = DataModuleMain.DsClients
        Width = 105
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = GridSheduleView
    end
  end
  object btnAdd: TRzBitBtn
    Left = 377
    Top = 67
    Width = 28
    Height = 28
    Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1089#1087#1080#1089#1086#1082
    Enabled = False
    TabOrder = 5
    OnClick = btnAddClick
    ImageIndex = 10
    Images = DataModuleMain.ImgList
  end
  object btnDel: TRzBitBtn
    Left = 377
    Top = 131
    Width = 28
    Height = 28
    Hint = #1059#1076#1072#1083#1080#1090#1100' '#1080#1079' '#1089#1087#1080#1089#1082#1072
    Enabled = False
    TabOrder = 6
    OnClick = btnDelClick
    ImageIndex = 11
    Images = DataModuleMain.ImgList
  end
  object cxDBDateEdit1: TcxDBDateEdit
    Left = 677
    Top = 8
    DataBinding.DataField = 'DATESHEDULE'
    DataBinding.DataSource = DsMem
    Properties.ImmediatePost = True
    Properties.SaveTime = False
    Properties.ShowTime = False
    TabOrder = 7
    Width = 84
  end
  object cmbWorker: TcxDBLookupComboBox
    Left = 475
    Top = 8
    DataBinding.DataField = 'WORKER_ID'
    DataBinding.DataSource = DsMem
    Properties.ImmediatePost = True
    Properties.KeyFieldNames = 'ID'
    Properties.ListColumns = <
      item
        FieldName = 'SHORT_NAME'
      end>
    Properties.ListOptions.GridLines = glNone
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DataModuleMain.DSWorkers
    TabOrder = 8
    Width = 145
  end
  object DS: TDataSource
    AutoEdit = False
    DataSet = QWorkerShedule
    Left = 381
    Top = 362
  end
  object DsCli: TDataSource
    AutoEdit = False
    DataSet = MemCli
    Left = 285
    Top = 364
  end
  object memData: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 352
    Top = 288
    object memDataWORKER_ID: TIntegerField
      FieldName = 'WORKER_ID'
    end
    object memDataDATESHEDULE: TDateField
      FieldName = 'DATESHEDULE'
    end
  end
  object DsMem: TDataSource
    DataSet = memData
    Left = 400
    Top = 288
  end
  object QWorkerShedule: TIBQuery
    Database = DataModuleMain.DB
    Transaction = DataModuleMain.DefTr
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    SQL.Strings = (
      'select * from WORKER_SHEDULE'
      'where WORKER_ID = :WORKER_ID and '
      'DATESHEDULE = :DATESHEDULE')
    UpdateObject = QWorkerShedule_upd
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_WORKER_SHEDULE_ID'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 184
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WORKER_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATESHEDULE'
        ParamType = ptUnknown
      end>
  end
  object QWorkerShedule_upd: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select * from clientslist(:id, null)')
    ModifySQL.Strings = (
      'update worker_shedule set'
      'WORKER_ID = :WORKER_ID,'
      'CLIENT_ID = :CLIENT_ID,'
      'DATESHEDULE = :DATESHEDULE'
      'where id = :id')
    InsertSQL.Strings = (
      'insert into WORKER_SHEDULE('
      'id,'
      'WORKER_ID,'
      'CLIENT_ID,'
      'DATESHEDULE'
      ')'
      'values'
      '('
      ':ID,'
      ':WORKER_ID,'
      ':CLIENT_ID,'
      ':DATESHEDULE'
      ')')
    DeleteSQL.Strings = (
      'delete from worker_shedule where id = :id')
    Left = 248
    Top = 288
  end
  object MemCli: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 96
    Top = 240
  end
end
