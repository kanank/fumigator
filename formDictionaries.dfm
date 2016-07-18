inherited frmDictionaries: TfrmDictionaries
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
  ClientWidth = 984
  Position = poDesktopCenter
  OnShow = FormShow
  ExplicitLeft = -159
  ExplicitWidth = 1000
  ExplicitHeight = 396
  PixelsPerInch = 96
  TextHeight = 13
  inherited img1: TImage
    Left = 799
    Visible = False
    ExplicitLeft = 713
  end
  inherited RzPanel1: TRzPanel
    Width = 984
    ExplicitWidth = 984
    inherited Image2: TImage
      Left = 84
      ExplicitLeft = 84
    end
    inherited Exit_bnt: TRzButton
      Left = 850
      ExplicitLeft = 850
    end
  end
  object GridUserTypes: TcxGrid
    Left = 8
    Top = 8
    Width = 168
    Height = 265
    TabOrder = 1
    OnEnter = GridUserTypesEnter
    object cxGridDBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.InfoPanel.Visible = True
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
      object cxGridDBColumn1: TcxGridDBColumn
        Caption = #1058#1080#1087' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.FilteringPopup = False
        Options.FilteringPopupMultiSelect = False
        Options.IgnoreTimeForFiltering = False
        Options.ShowEditButtons = isebNever
        Options.AutoWidthSizable = False
        Options.GroupFooters = False
        Options.Grouping = False
        Options.Moving = False
        Styles.Header = cxStyle1
        Width = 205
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxGridDBTableView1
    end
  end
  object pnlEdit: TRzPanel
    Left = 8
    Top = 273
    Width = 168
    Height = 34
    Align = alCustom
    BorderInner = fsStatus
    BorderOuter = fsPopup
    TabOrder = 2
    DesignSize = (
      168
      34)
    object btnAdd: TRzBitBtn
      Left = 7
      Top = 3
      Width = 28
      Height = 28
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 0
      OnClick = btnAddClick
      ImageIndex = 0
      Images = DataModuleMain.ImgList
    end
    object btnEdit: TRzBitBtn
      Left = 41
      Top = 3
      Width = 28
      Height = 28
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      OnClick = btnEditClick
      ImageIndex = 2
      Images = DataModuleMain.ImgList
    end
    object btnDel: TRzBitBtn
      Left = 135
      Top = 3
      Width = 28
      Height = 28
      Hint = #1059#1076#1072#1083#1080#1090#1100
      Anchors = [akTop, akRight]
      TabOrder = 2
      OnClick = btnDelClick
      ImageIndex = 3
      Images = DataModuleMain.ImgList
    end
  end
  object GridProfs: TcxGrid
    Left = 193
    Top = 8
    Width = 177
    Height = 265
    TabOrder = 3
    OnEnter = GridUserTypesEnter
    object cxGridDBTableView2: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.InfoPanel.Visible = True
      DataController.DataSource = DataModuleMain.DSDicWorkerProfs
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
      object cxGridDBColumn2: TcxGridDBColumn
        Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1080
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.FilteringPopup = False
        Options.FilteringPopupMultiSelect = False
        Options.IgnoreTimeForFiltering = False
        Options.ShowEditButtons = isebNever
        Options.AutoWidthSizable = False
        Options.GroupFooters = False
        Options.Grouping = False
        Options.Moving = False
        Styles.Header = cxStyle1
        Width = 205
      end
    end
    object cxGridLevel2: TcxGridLevel
      GridView = cxGridDBTableView2
    end
  end
  object GridMaterials: TcxGrid
    Left = 384
    Top = 8
    Width = 208
    Height = 265
    TabOrder = 4
    OnEnter = GridUserTypesEnter
    object cxGridDBTableView3: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.InfoPanel.Visible = True
      DataController.DataSource = DataModuleMain.DSDicMaterials
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
      object cxGridDBColumn3: TcxGridDBColumn
        Caption = #1056#1072#1089#1093#1086#1076#1085#1099#1077' '#1084#1072#1090#1077#1088#1080#1072#1083#1099
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.FilteringPopup = False
        Options.FilteringPopupMultiSelect = False
        Options.IgnoreTimeForFiltering = False
        Options.ShowEditButtons = isebNever
        Options.AutoWidthSizable = False
        Options.GroupFooters = False
        Options.Grouping = False
        Options.Moving = False
        Styles.Header = cxStyle1
        Width = 205
      end
    end
    object cxGridLevel3: TcxGridLevel
      GridView = cxGridDBTableView3
    end
  end
  object GridServices: TcxGrid
    Left = 608
    Top = 8
    Width = 177
    Height = 265
    TabOrder = 5
    OnEnter = GridUserTypesEnter
    object cxGridDBTableView4: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.InfoPanel.Visible = True
      DataController.DataSource = DataModuleMain.DSDicServices
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
      object cxGridDBColumn4: TcxGridDBColumn
        Caption = #1059#1089#1083#1091#1075#1080
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.FilteringPopup = False
        Options.FilteringPopupMultiSelect = False
        Options.IgnoreTimeForFiltering = False
        Options.ShowEditButtons = isebNever
        Options.AutoWidthSizable = False
        Options.GroupFooters = False
        Options.Grouping = False
        Options.Moving = False
        Styles.Header = cxStyle1
        Width = 205
      end
    end
    object cxGridLevel4: TcxGridLevel
      GridView = cxGridDBTableView4
    end
  end
  object tvMaterials: TdxDBTreeView
    Left = 384
    Top = 27
    Width = 208
    Height = 246
    ShowNodeHint = True
    RowSelect = True
    DataSource = DataModuleMain.DSDicMaterials
    DisplayField = 'NAME'
    KeyField = 'ID'
    ListField = 'NAME'
    ParentField = 'PARENT'
    RootValue = 0
    SeparatedSt = ' - '
    RaiseOnError = True
    ReadOnly = True
    HideSelection = False
    Indent = 19
    ParentColor = False
    Options = [trDBConfirmDelete, trCanDBNavigate, trSmartRecordCopy, trCheckHasChildren]
    SelectedIndex = -1
    TabOrder = 6
    OnEnter = tvMaterialsEnter
  end
  object GridGoods: TcxGrid
    Left = 799
    Top = 8
    Width = 177
    Height = 265
    TabOrder = 7
    Visible = False
    OnEnter = GridUserTypesEnter
    object cxGridDBTableView5: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.InfoPanel.Visible = True
      DataController.DataSource = DataModuleMain.DSDicServices
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
      object cxGridDBColumn5: TcxGridDBColumn
        Caption = #1059#1089#1083#1091#1075#1080
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.FilteringPopup = False
        Options.FilteringPopupMultiSelect = False
        Options.IgnoreTimeForFiltering = False
        Options.ShowEditButtons = isebNever
        Options.AutoWidthSizable = False
        Options.GroupFooters = False
        Options.Grouping = False
        Options.Moving = False
        Styles.Header = cxStyle1
        Width = 205
      end
    end
    object cxGridLevel5: TcxGridLevel
      GridView = cxGridDBTableView5
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
  end
end
