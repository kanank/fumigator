inherited frmClients: TfrmClients
  Caption = #1050#1083#1080#1077#1085#1090#1099
  ClientHeight = 435
  ClientWidth = 922
  Position = poDesktopCenter
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitLeft = -186
  ExplicitWidth = 938
  ExplicitHeight = 473
  PixelsPerInch = 96
  TextHeight = 13
  inherited img1: TImage
    Left = 729
    Top = 331
    Visible = False
    ExplicitLeft = 641
    ExplicitTop = 331
  end
  inherited RzPanel2: TRzPanel
    Width = 922
    Height = 30
    ExplicitWidth = 922
    ExplicitHeight = 30
    inherited Image1: TImage
      Left = 91
      Top = 1
      ExplicitLeft = 3
      ExplicitTop = 1
    end
    object Fiz_btn: TRzButton
      Left = 649
      Top = 1
      Width = 130
      Height = 27
      GroupIndex = 2
      FrameColor = clGray
      ShowDownPattern = False
      Anchors = [akTop, akRight]
      Caption = #1060#1080#1079#1080#1095#1077#1089#1082#1080#1077' '#1083#1080#1094#1072
      Color = 15332600
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      HotTrack = True
      HotTrackColor = 16625984
      ParentFont = False
      TabOrder = 0
      ThemeAware = False
      OnClick = Fiz_btnClick
    end
    object Ur_btn: TRzButton
      Left = 785
      Top = 1
      Width = 130
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
      TabOrder = 1
      ThemeAware = False
      OnClick = Ur_btnClick
    end
    object btnAll: TRzButton
      Left = 497
      Top = 1
      Width = 130
      Height = 27
      GroupIndex = 2
      FrameColor = clGray
      ShowDownPattern = False
      Anchors = [akTop, akRight]
      Caption = #1054#1073#1097#1080#1081' '#1089#1087#1080#1089#1086#1082
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
      OnClick = btnAllClick
    end
  end
  inherited RzPanel1: TRzPanel
    Top = 386
    Width = 922
    ExplicitTop = 386
    ExplicitWidth = 922
    inherited Cancel_btn: TRzButton
      Left = 785
      Caption = #1042#1099#1093#1086#1076
      ExplicitLeft = 785
    end
    inherited Edit_btn: TRzButton
      OnClick = Edit_btnClick
    end
    inherited Del_btn: TRzButton
      Top = 5
      OnClick = Del_btnClick
      ExplicitTop = 5
    end
    inherited Add_btn: TRzButton
      Top = 5
      Visible = False
      OnClick = Add_btnClick
      ExplicitTop = 5
    end
    object RzButton1: TRzButton
      Left = 537
      Top = 8
      Width = 121
      Height = 29
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      HotTrack = True
      HotTrackColor = 16625984
      ParentFont = False
      TabOrder = 4
      ThemeAware = False
      Visible = False
      OnClick = RzButton1Click
    end
    object Add_btn1: TRzMenuButton
      Left = 8
      Top = 8
      Width = 122
      Height = 29
      Caption = #1057#1086#1079#1076#1072#1090#1100
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
      OnClick = Add_btn1Click
      DropDownMenu = NewClientBtn_PUM
      ShowArrow = False
    end
  end
  inherited Grid: TcxGrid
    Top = 48
    Width = 922
    Height = 337
    Anchors = [akLeft, akTop, akRight, akBottom]
    ExplicitTop = 48
    ExplicitWidth = 922
    ExplicitHeight = 337
    inherited GridView: TcxGridDBTableView
      OnCellDblClick = GridViewUrCellDblClick
      DataController.DataModeController.GridMode = True
      DataController.DataModeController.SmartRefresh = True
      DataController.DataSource = DS
      OptionsBehavior.IncSearch = True
      OptionsBehavior.IncSearchItem = GridViewColumn2
      OptionsView.GridLines = glVertical
      OptionsView.HeaderAutoHeight = True
      Styles.Header = cxStyle1
      object GridViewColumn1: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        HeaderAlignmentHorz = taCenter
        Width = 48
      end
      object GridViewColumn2: TcxGridDBColumn
        Caption = #1050#1083#1080#1077#1085#1090
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 189
      end
      object GridViewColumn7: TcxGridDBColumn
        Caption = #1056#1077#1075#1080#1086#1085
        DataBinding.FieldName = 'region'
        HeaderAlignmentHorz = taCenter
        Width = 90
      end
      object GridViewColumn8: TcxGridDBColumn
        Caption = #1059#1089#1083#1091#1075#1080
        DataBinding.FieldName = 'uslugi'
        HeaderAlignmentHorz = taCenter
        Width = 132
      end
      object GridViewColumn3: TcxGridDBColumn
        Caption = #1058#1077#1083#1077#1092#1086#1085
        DataBinding.FieldName = 'PHONE'
        HeaderAlignmentHorz = taCenter
        Width = 126
      end
      object GridViewColumn5: TcxGridDBColumn
        Caption = #1054#1090#1074'. '#1089#1086#1090#1088#1091#1076#1085#1080#1082
        DataBinding.FieldName = 'WORKER_NAME'
        HeaderAlignmentHorz = taCenter
        Options.GroupFooters = False
        Options.Grouping = False
        Width = 138
      end
      object GridViewColumn4: TcxGridDBColumn
        DataBinding.FieldName = 'Email'
        HeaderAlignmentHorz = taCenter
        MinWidth = 112
        Options.Editing = False
        Options.AutoWidthSizable = False
        Options.GroupFooters = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 112
      end
      object GridViewColumn6: TcxGridDBColumn
        Caption = #1050#1086#1083'-'#1074#1086' '#1074#1099#1087'. '#1079#1072#1103#1074#1086#1082
        DataBinding.FieldName = 'CNT_DOG'
        HeaderAlignmentHorz = taCenter
      end
    end
    object GridViewUr: TcxGridDBTableView [1]
      Navigator.Buttons.CustomButtons = <>
      OnCellClick = GridViewCellClick
      OnCellDblClick = GridViewUrCellDblClick
      DataController.DataSource = DS
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsBehavior.IncSearchItem = GridViewUrColumn2
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.GridLines = glVertical
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      Styles.Header = cxStyle1
      object GridViewUrColumn1: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        HeaderAlignmentHorz = taCenter
        Width = 48
      end
      object GridViewUrColumn2: TcxGridDBColumn
        Caption = #1050#1083#1080#1077#1085#1090
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 172
      end
      object GridViewUrColumn7: TcxGridDBColumn
        Caption = #1056#1077#1075#1080#1086#1085
        DataBinding.FieldName = 'region'
        HeaderAlignmentHorz = taCenter
        Width = 99
      end
      object GridViewUrColumn8: TcxGridDBColumn
        Caption = #1059#1089#1083#1091#1075#1080
        DataBinding.FieldName = 'uslugi'
        HeaderAlignmentHorz = taCenter
        Width = 132
      end
      object GridViewUrColumn5: TcxGridDBColumn
        Caption = #1054#1090#1074'. '#1089#1086#1090#1088#1091#1076#1085#1080#1082
        DataBinding.FieldName = 'WORKER_NAME'
        HeaderAlignmentHorz = taCenter
        Options.GroupFooters = False
        Options.Grouping = False
        Width = 123
      end
      object GridViewUrColumn3: TcxGridDBColumn
        Caption = #1058#1077#1083#1077#1092#1086#1085
        DataBinding.FieldName = 'PHONE'
        HeaderAlignmentHorz = taCenter
        Width = 118
      end
      object GridViewUrColumn4: TcxGridDBColumn
        DataBinding.FieldName = 'Email'
        HeaderAlignmentHorz = taCenter
        MinWidth = 112
        Options.Editing = False
        Options.AutoWidthSizable = False
        Options.GroupFooters = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 112
      end
      object GridViewUrColumn6: TcxGridDBColumn
        Caption = #1050#1086#1083'-'#1074#1086' '#1074#1099#1087'. '#1079#1072#1103#1074#1086#1082
        DataBinding.FieldName = 'CNT_DOG'
        HeaderAlignmentHorz = taCenter
      end
    end
    object GridViewAll: TcxGridDBTableView [2]
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.Append.Enabled = False
      Navigator.Buttons.Delete.Enabled = False
      Navigator.Buttons.Edit.Enabled = False
      Navigator.Buttons.Cancel.Enabled = False
      Navigator.Buttons.Cancel.Visible = False
      OnCellDblClick = GridViewUrCellDblClick
      DataController.DataSource = DS
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsBehavior.IncSearchItem = GridViewAllColumn3
      OptionsCustomize.ColumnGrouping = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 32
      object GridViewAllColumn1: TcxGridDBColumn
        Caption = 'ID'
        DataBinding.FieldName = 'id'
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle1
      end
      object GridViewAllColumn2: TcxGridDBColumn
        Caption = #1060#1086#1088#1084#1072' '#1082#1083#1080#1077#1085#1090#1072
        DataBinding.FieldName = 'type_clis'
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle1
        Width = 69
      end
      object GridViewAllColumn3: TcxGridDBColumn
        Caption = #1050#1083#1080#1077#1085#1090
        DataBinding.FieldName = 'name'
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle1
        Width = 150
      end
      object GridViewAllColumn4: TcxGridDBColumn
        Caption = #1056#1077#1075#1080#1086#1085
        DataBinding.FieldName = 'region'
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle1
        Width = 84
      end
      object GridViewAllColumn5: TcxGridDBColumn
        Caption = #1059#1089#1083#1091#1075#1080
        DataBinding.FieldName = 'uslugi'
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle1
        Width = 146
      end
      object GridViewAllColumn6: TcxGridDBColumn
        Caption = #1054#1090#1074'. '#1089#1086#1090#1088#1091#1076#1085#1080#1082
        DataBinding.FieldName = 'WORKER_NAME'
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle1
        Width = 133
      end
      object GridViewAllColumn7: TcxGridDBColumn
        Caption = #1058#1077#1083#1077#1092#1086#1085
        DataBinding.FieldName = 'PHONE'
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle1
        Width = 102
      end
      object GridViewAllColumn8: TcxGridDBColumn
        Caption = 'Email'
        DataBinding.FieldName = 'email'
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle1
        Width = 88
      end
      object GridViewAllColumn9: TcxGridDBColumn
        DataBinding.FieldName = #1050#1086#1083'-'#1074#1086' '#1074#1099#1087'. '#1079#1072#1103#1074#1086#1082
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Styles.Header = cxStyle1
        Width = 76
      end
    end
    inherited GridLevel1: TcxGridLevel
      GridView = GridViewAll
    end
  end
  object btnCli: TRzButton
    Left = 0
    Top = 30
    Width = 65
    Height = 18
    GroupIndex = 2
    FrameColor = clGray
    ShowDownPattern = False
    Caption = #1050#1083#1080#1077#1085#1090#1099
    Color = 16444638
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
    OnClick = btnCliClick
  end
  object btnLid: TRzButton
    Left = 65
    Top = 30
    Width = 65
    Height = 18
    GroupIndex = 2
    Down = True
    FrameColor = clGray
    ShowDownPattern = False
    Caption = #1051#1080#1076#1099
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
    TabOrder = 4
    ThemeAware = False
    OnClick = btnLidClick
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 184
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
  object DS: TDataSource
    AutoEdit = False
    Left = 453
    Top = 312
  end
  object NewClientBtn_PUM: TPopupMenu
    Left = 208
    Top = 16
    object NewFizClnt_mi: TMenuItem
      Caption = #1060#1080#1079#1080#1095#1077#1089#1082#1086#1077' '#1083#1080#1094#1086
      OnClick = NewFizClnt_miClick
    end
    object NewURClnt_mi: TMenuItem
      Caption = #1070#1088#1080#1076#1080#1095#1077#1089#1082#1086#1077' '#1083#1080#1094#1086
      OnClick = NewFizClnt_miClick
    end
  end
  object PropStore: TcxPropertiesStore
    Active = False
    Components = <
      item
        Component = Owner
        Properties.Strings = (
          'Height'
          'Width')
      end
      item
        Component = Grid
        Properties.Strings = (
          'Height'
          'Width')
      end
      item
        Component = GridViewAllColumn1
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewAllColumn2
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewAllColumn3
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewAllColumn4
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewAllColumn5
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewAllColumn6
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewAllColumn7
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewAllColumn8
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewAllColumn9
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewColumn1
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewColumn2
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewColumn3
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewColumn4
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewColumn5
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewColumn6
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewColumn7
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewColumn8
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewUrColumn1
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewUrColumn2
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewUrColumn3
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewUrColumn4
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewUrColumn5
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewUrColumn6
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewUrColumn7
        Properties.Strings = (
          'Width')
      end
      item
        Component = GridViewUrColumn8
        Properties.Strings = (
          'Width')
      end
      item
        Component = Image1
        Properties.Strings = (
          'Height'
          'Width')
      end
      item
        Component = img1
        Properties.Strings = (
          'Height'
          'Width')
      end
      item
        Component = RzButton1
        Properties.Strings = (
          'Height'
          'Width')
      end
      item
        Component = RzPanel1
        Properties.Strings = (
          'Height'
          'Width')
      end
      item
        Component = RzPanel2
        Properties.Strings = (
          'Height'
          'Width')
      end
      item
        Component = Ur_btn
        Properties.Strings = (
          'Height'
          'Width')
      end>
    StorageName = 'fumigator.prop'
    Left = 376
    Top = 104
  end
end
