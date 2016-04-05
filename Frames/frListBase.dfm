inherited FrameListBase: TFrameListBase
  Width = 217
  Height = 122
  ExplicitWidth = 217
  ExplicitHeight = 122
  object grpPhone: TRzGroupBox [0]
    Left = 1
    Top = 0
    Width = 212
    Height = 118
    BorderSides = [sdLeft, sdTop, sdRight]
    Caption = #1058#1077#1083#1077#1092#1086#1085#1099
    TabOrder = 0
    DesignSize = (
      212
      118)
    object grdPhone: TcxGrid
      Left = 4
      Top = 16
      Width = 172
      Height = 101
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      object grdPhoneDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = DS
        DataController.KeyFieldNames = 'ID'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.CancelOnExit = False
        OptionsView.GridLines = glNone
        OptionsView.GroupByBox = False
        OptionsView.Header = False
        object grdPhoneDBTableView1Column1: TcxGridDBColumn
          DataBinding.FieldName = 'ISMAIN'
        end
        object grdPhoneDBTableView1Column2: TcxGridDBColumn
          DataBinding.FieldName = 'PHONE'
        end
      end
      object grdPhoneLevel1: TcxGridLevel
        GridView = grdPhoneDBTableView1
      end
    end
    object RzPanel2: TRzPanel
      Left = 180
      Top = 14
      Width = 31
      Height = 103
      Align = alRight
      BorderSides = []
      TabOrder = 1
      DesignSize = (
        31
        103)
      object btnAdd: TRzBitBtn
        Left = 2
        Top = -1
        Width = 28
        Height = 28
        Hint = #1044#1086#1073#1072#1074#1080#1090#1100
        Anchors = [akLeft, akBottom]
        TabOrder = 0
        OnClick = btnAddClick
        ImageIndex = 0
        Images = DataModuleMain.ImgList
      end
      object btnEdit: TRzBitBtn
        Left = 2
        Top = 33
        Width = 28
        Height = 28
        Hint = #1048#1079#1084#1077#1085#1080#1090#1100
        Anchors = [akLeft, akBottom]
        TabOrder = 1
        OnClick = btnEditClick
        ImageIndex = 2
        Images = DataModuleMain.ImgList
      end
      object btnDel: TRzBitBtn
        Left = 2
        Top = 74
        Width = 28
        Height = 28
        Hint = #1059#1076#1072#1083#1080#1090#1100
        Anchors = [akLeft, akBottom]
        TabOrder = 2
        OnClick = btnDelClick
        ImageIndex = 3
        Images = DataModuleMain.ImgList
      end
    end
  end
  inherited Query_upd: TIBUpdateSQL
    Left = 88
    Top = 75
  end
  inherited Query: TIBQuery
    Left = 48
    Top = 75
  end
  inherited DS: TDataSource
    Left = 8
    Top = 75
  end
end
