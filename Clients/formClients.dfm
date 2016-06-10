inherited frmClients: TfrmClients
  Caption = #1050#1083#1080#1077#1085#1090#1099
  ClientWidth = 834
  Position = poDesktopCenter
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitWidth = 850
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  inherited img1: TImage
    Left = 641
    Visible = False
    ExplicitLeft = 641
  end
  inherited RzPanel2: TRzPanel
    Width = 834
    Height = 30
    ExplicitWidth = 834
    ExplicitHeight = 30
    inherited Image1: TImage
      Left = 3
      Top = 1
      ExplicitLeft = 3
      ExplicitTop = 1
    end
    object Fiz_btn: TRzButton
      Left = 561
      Top = 1
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
      TabOrder = 0
      ThemeAware = False
      OnClick = Fiz_btnClick
    end
    object Ur_btn: TRzButton
      Left = 697
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
  end
  inherited RzPanel1: TRzPanel
    Width = 834
    ExplicitWidth = 834
    inherited Cancel_btn: TRzButton
      Left = 697
      Caption = #1042#1099#1093#1086#1076
      ExplicitLeft = 697
    end
    inherited Edit_btn: TRzButton
      OnClick = Edit_btnClick
    end
    inherited Del_btn: TRzButton
      OnClick = Del_btnClick
    end
    inherited Add_btn: TRzButton
      OnClick = Add_btnClick
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
  end
  inherited Grid: TcxGrid
    Top = 48
    Width = 834
    Height = 260
    Anchors = [akLeft, akTop, akRight]
    ExplicitTop = 48
    ExplicitWidth = 834
    ExplicitHeight = 260
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
        Width = 204
      end
      object GridViewColumn3: TcxGridDBColumn
        Caption = #1058#1077#1083#1077#1092#1086#1085
        DataBinding.FieldName = 'PHONE'
        HeaderAlignmentHorz = taCenter
        Width = 126
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
      object GridViewColumn5: TcxGridDBColumn
        Caption = #1054#1090#1074'. '#1089#1086#1090#1088#1091#1076#1085#1080#1082
        DataBinding.FieldName = 'WORKER_NAME'
        HeaderAlignmentHorz = taCenter
        Options.GroupFooters = False
        Options.Grouping = False
        Width = 223
      end
      object GridViewColumn6: TcxGridDBColumn
        Caption = #1050#1086#1083'-'#1074#1086' '#1076#1086#1075'.'
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
        Width = 138
      end
      object GridViewUrColumn7: TcxGridDBColumn
        Caption = #1048#1053#1053
        DataBinding.FieldName = 'INN'
        HeaderAlignmentHorz = taCenter
        Width = 99
      end
      object GridViewUrColumn8: TcxGridDBColumn
        Caption = #1056#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1100
        DataBinding.FieldName = 'PERSON_NAME'
        HeaderAlignmentHorz = taCenter
        Width = 124
      end
      object GridViewUrColumn3: TcxGridDBColumn
        Caption = #1058#1077#1083#1077#1092#1086#1085
        DataBinding.FieldName = 'PHONE'
        HeaderAlignmentHorz = taCenter
        Width = 106
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
      object GridViewUrColumn5: TcxGridDBColumn
        Caption = #1054#1090#1074'. '#1089#1086#1090#1088#1091#1076#1085#1080#1082
        DataBinding.FieldName = 'WORKER_NAME'
        HeaderAlignmentHorz = taCenter
        Options.GroupFooters = False
        Options.Grouping = False
        Width = 123
      end
      object GridViewUrColumn6: TcxGridDBColumn
        Caption = #1050#1086#1083'-'#1074#1086' '#1076#1086#1075'.'
        DataBinding.FieldName = 'CNT_DOG'
        HeaderAlignmentHorz = taCenter
      end
    end
    inherited GridLevel1: TcxGridLevel
      GridView = GridViewUr
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
end
