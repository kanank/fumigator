inherited FrameItemKLADR: TFrameItemKLADR
  Width = 334
  Height = 30
  ExplicitWidth = 334
  ExplicitHeight = 30
  DesignSize = (
    334
    30)
  object lblName: TLabel [0]
    Left = 2
    Top = 7
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
  object btnEdit: TRzBitBtn [1]
    Left = 301
    Top = 3
    Width = 30
    Height = 22
    Hint = #1048#1079#1084#1077#1085#1080#1090#1100
    Alignment = taLeftJustify
    Anchors = [akTop, akRight]
    TabOrder = 0
    OnClick = btnEditClick
    ImageIndex = 9
    Images = DataModuleMain.ImgList
    Spacing = 1
  end
  object edtName: TcxTextEdit [2]
    Left = 102
    Top = 4
    TabOrder = 1
    Width = 199
  end
  object edtSocr: TcxTextEdit [3]
    Left = 67
    Top = 4
    Enabled = False
    Style.BorderStyle = ebsNone
    Style.Color = clBtnFace
    Style.HotTrack = False
    Style.Shadow = False
    StyleDisabled.TextColor = clCaptionText
    TabOrder = 2
    Width = 33
  end
  inherited Query_upd: TIBUpdateSQL
    Left = 153
    Top = 0
  end
  inherited Query: TIBQuery
    BeforeOpen = QueryBeforeOpen
    SQL.Strings = (
      'select * from KLADR '
      'where '
      'Region_id = :Region_id and'
      'Area_id = :Area_id and'
      'City_id = :City_id and'
      'Site_id = :Site_id')
    UpdateObject = nil
    Left = 121
    Top = 0
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Region_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Area_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'City_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Site_id'
        ParamType = ptUnknown
      end>
  end
  inherited DS: TDataSource
    Left = 193
    Top = 0
  end
  object QuerySearch: TIBQuery
    Database = DataModuleMain.DB
    Transaction = DataModuleMain.DefTr
    BeforeOpen = QuerySearchBeforeOpen
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from KLADR '
      'where '
      'REGION_ID >0 and'
      'Area_id =0 and'
      'City_id =0 and'
      'Site_id = 0 and'
      'actual = 0 and'
      'upper(name) like upper(:searchstr)')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_PERSONS_ID'
    GeneratorField.ApplyEvent = gamOnServer
    Left = 233
    Top = 2
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'searchstr'
        ParamType = ptUnknown
      end>
  end
end
