inherited frmOptions: TfrmOptions
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 408
  ClientWidth = 891
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 907
  ExplicitHeight = 446
  PixelsPerInch = 96
  TextHeight = 13
  inherited img1: TImage
    Left = 696
    Top = 277
    Visible = False
    ExplicitLeft = 696
    ExplicitTop = 277
  end
  object Label22: TLabel [1]
    Left = 4
    Top = 3
    Width = 178
    Height = 14
    Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103' '#1082' '#1041#1044':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel [2]
    Left = 7
    Top = 45
    Width = 215
    Height = 14
    Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1087#1086#1095#1090#1086#1074#1086#1075#1086' '#1089#1077#1088#1074#1077#1088#1072' SMTP:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel [3]
    Left = 8
    Top = 87
    Width = 141
    Height = 14
    Caption = #1055#1091#1090#1100' '#1082' '#1086#1073#1097#1077#1084#1091' '#1082#1072#1090#1072#1083#1086#1075#1091':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel [4]
    Left = 345
    Top = 3
    Width = 82
    Height = 14
    Caption = #1055#1088#1072#1074#1072' '#1076#1086#1089#1090#1091#1087#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  inherited RzPanel1: TRzPanel
    Top = 364
    Width = 891
    ExplicitTop = 386
    ExplicitWidth = 891
    inherited Image2: TImage
      Visible = False
    end
    inherited Exit_bnt: TRzButton
      Left = 757
      Font.Color = clWindowText
      ExplicitLeft = 757
    end
    object btnAccept: TRzButton
      Left = 541
      Top = 9
      Width = 124
      Height = 29
      Anchors = [akTop, akRight]
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      HotTrack = True
      HotTrackColor = 16625984
      ParentFont = False
      TabOrder = 1
      ThemeAware = False
      Visible = False
      OnClick = btnAcceptClick
    end
  end
  object txtDBPath: TcxTextEdit
    Left = 4
    Top = 18
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -12
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 1
    Width = 321
  end
  object txtSMTP: TcxTextEdit
    Left = 8
    Top = 60
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -12
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 2
    Width = 321
  end
  object txtTemp: TcxTextEdit
    Left = 8
    Top = 102
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -12
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 3
    Width = 321
  end
  object GridRights: TcxGrid
    Left = 552
    Top = 19
    Width = 331
    Height = 254
    TabOrder = 4
    object GridRightsView: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.InfoPanel.Visible = True
      OnCellClick = GridRightsViewCellClick
      DataController.DataSource = DS_rights_list
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnGrouping = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.NoDataToDisplayInfoText = '<'#1057#1087#1080#1089#1086#1082' '#1087#1091#1089#1090'>'
      OptionsView.CellAutoHeight = True
      OptionsView.GridLines = glNone
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      object GridRightsViewColumn1: TcxGridDBColumn
        Caption = #1055#1088#1072#1074#1086
        DataBinding.FieldName = 'RIGHT_NAME'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringAddValueItems = False
        Options.FilteringFilteredItemsList = False
        Options.FilteringMRUItemsList = False
        Options.FilteringPopup = False
        Options.FilteringPopupMultiSelect = False
        Options.IgnoreTimeForFiltering = False
        Options.ShowEditButtons = isebNever
        Options.AutoWidthSizable = False
        Options.GroupFooters = False
        Options.Grouping = False
        Options.Moving = False
        Options.ShowCaption = False
        Styles.Content = cxStyle3
        Styles.Header = cxStyle2
        Width = 271
      end
      object GridRightsViewColumn2: TcxGridDBColumn
        Caption = #1047#1085#1072#1095'.'
        DataBinding.FieldName = 'VAL'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taCenter
        Properties.DisplayChecked = '1'
        Properties.DisplayUnchecked = '0'
        Properties.NullStyle = nssUnchecked
        Properties.ReadOnly = True
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        HeaderAlignmentHorz = taCenter
        Options.FilteringAddValueItems = False
        Options.FilteringFilteredItemsList = False
        Options.FilteringMRUItemsList = False
        Options.FilteringPopup = False
        Options.FilteringPopupMultiSelect = False
        Options.IgnoreTimeForFiltering = False
        Options.GroupFooters = False
        Options.Grouping = False
        Options.Moving = False
        Options.ShowCaption = False
        Styles.Header = cxStyle1
        Width = 30
      end
    end
    object GridRightsLevel1: TcxGridLevel
      GridView = GridRightsView
    end
  end
  object GridUserTypes: TcxGrid
    Left = 345
    Top = 19
    Width = 208
    Height = 254
    TabOrder = 5
    object cxGridDBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.InfoPanel.Visible = True
      OnCellClick = cxGridDBTableView1CellClick
      DataController.DataSource = DataModuleMain.DSDicUserTypes
      DataController.Options = [dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoSortByDisplayText]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.FocusRect = False
      OptionsView.NoDataToDisplayInfoText = '<'#1057#1087#1080#1089#1086#1082' '#1087#1091#1089#1090'>'
      OptionsView.GridLines = glNone
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      object cxGridDBColumn1: TcxGridDBColumn
        Caption = #1055#1088#1072#1074#1086
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringAddValueItems = False
        Options.FilteringFilteredItemsList = False
        Options.FilteringMRUItemsList = False
        Options.FilteringPopup = False
        Options.FilteringPopupMultiSelect = False
        Options.IgnoreTimeForFiltering = False
        Options.ShowEditButtons = isebNever
        Options.AutoWidthSizable = False
        Options.GroupFooters = False
        Options.Grouping = False
        Options.Moving = False
        Options.ShowCaption = False
        Styles.Content = cxStyle3
        Styles.Header = cxStyle2
        Width = 200
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxGridDBTableView1
    end
  end
  object btnTuneDictionaries: TRzButton
    Left = 345
    Top = 285
    Width = 184
    Height = 29
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1086#1074
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    HotTrack = True
    HotTrackColor = 16625984
    ParentFont = False
    TabOrder = 6
    ThemeAware = False
    OnClick = btnTuneDictionariesClick
  end
  object btnTuneOPClentList: TRzButton
    Left = 345
    Top = 320
    Width = 184
    Height = 36
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1089#1087#1080#1089#1082#1072' '#1082#1083#1080#1077#1085#1090#1086#1074' '#1076#1083#1103' '#1086#1087#1077#1088#1072#1090#1086#1088#1086#1074
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    HotTrack = True
    HotTrackColor = 16625984
    ParentFont = False
    TabOrder = 7
    ThemeAware = False
    OnClick = btnTuneOPClentListClick
  end
  object RzPanel2: TRzPanel
    Left = 8
    Top = 152
    Width = 321
    Height = 204
    BorderInner = fsGroove
    BorderOuter = fsNone
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 8
    object Label4: TLabel
      Left = 4
      Top = 8
      Width = 165
      Height = 14
      Caption = #1058#1080#1087#1099' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077#1081' '#1085#1072' '#1076#1072#1090#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object cxGrid1: TcxGrid
      Left = 0
      Top = 33
      Width = 320
      Height = 170
      TabOrder = 0
      object cxGridDBTableView2: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.InfoPanel.Visible = True
        DataController.DataSource = DataModuleMain.DSWorkerTypeByDate
        DataController.Options = [dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoSortByDisplayText]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsView.FocusRect = False
        OptionsView.NoDataToDisplayInfoText = '<'#1057#1087#1080#1089#1086#1082' '#1087#1091#1089#1090'>'
        OptionsView.ScrollBars = ssVertical
        OptionsView.GridLines = glVertical
        OptionsView.GroupByBox = False
        OptionsView.HeaderHeight = 22
        object cxGridDBTableView2Column2: TcxGridDBColumn
          Caption = #1058#1080#1087
          DataBinding.FieldName = 'TYPE_ID'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.DropDownAutoSize = True
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'NAME'
            end>
          Properties.ListOptions.GridLines = glNone
          Properties.ListOptions.ShowHeader = False
          Properties.ListOptions.SyncMode = True
          Properties.ListSource = DataModuleMain.DSDicUserTypes
          Properties.PostPopupValueOnTab = True
          Properties.OnCloseUp = cxGridDBTableView2Column2PropertiesCloseUp
          HeaderAlignmentHorz = taCenter
          Styles.Header = cxStyle1
          Width = 150
        end
        object cxGridDBTableView2Column1: TcxGridDBColumn
          Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082
          DataBinding.FieldName = 'WORKER_ID'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.GridMode = True
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'SHORT_NAME'
            end>
          Properties.ListOptions.GridLines = glNone
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = DataModuleMain.DSWorkers
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Styles.Header = cxStyle1
          Width = 148
        end
      end
      object cxGridLevel2: TcxGridLevel
        GridView = cxGridDBTableView2
      end
    end
    object edtWorkerDate: TcxDateEdit
      Left = 195
      Top = 6
      Properties.OnCloseUp = edtWorkerDatePropertiesCloseUp
      TabOrder = 1
      Width = 121
    end
  end
  object rights_list: TIBQuery
    Database = DataModuleMain.DB
    Transaction = RightsTran
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    SQL.Strings = (
      'select * from get_rights_by_user_types')
    UpdateObject = rights_upd
    OnFilterRecord = rights_listFilterRecord
    Left = 495
    Top = 34
  end
  object DS_rights_list: TDataSource
    DataSet = memRights_list
    OnDataChange = DS_rights_listDataChange
    Left = 495
    Top = 85
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 384
    Top = 32
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object cxStyle3: TcxStyle
    end
  end
  object rights_upd: TIBUpdateSQL
    ModifySQL.Strings = (
      
        'execute procedure update_rights (:ur_id, :user_id, :right_id, :v' +
        'al)')
    Left = 552
    Top = 32
  end
  object RightsTran: TIBTransaction
    DefaultDatabase = DataModuleMain.DB
    AutoStopAction = saCommit
    Left = 560
    Top = 88
  end
  object memRights_list: TdxMemData
    Indexes = <>
    SortOptions = []
    OnFilterRecord = rights_listFilterRecord
    Left = 624
    Top = 40
  end
end
