inherited FrameKladrAdrFull: TFrameKladrAdrFull
  Width = 384
  Height = 73
  Visible = False
  ExplicitWidth = 384
  ExplicitHeight = 73
  DesignSize = (
    384
    73)
  object Label8: TLabel [0]
    Left = 3
    Top = 6
    Width = 35
    Height = 13
    Caption = #1056#1077#1075#1080#1086#1085
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel [1]
    Left = 3
    Top = 29
    Width = 55
    Height = 13
    Caption = #1053#1072#1089'. '#1087#1091#1085#1082#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel [2]
    Left = 3
    Top = 52
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
  inherited FrameRegion: TFrameItemKLADR
    Top = 76
    ExplicitTop = 76
  end
  inherited FrameCity: TFrameItemKLADR
    Top = 109
    ExplicitTop = 109
  end
  inherited FrameSite: TFrameItemKLADR
    Top = 134
    ExplicitTop = 134
  end
  inherited FrameStreet: TFrameItemKLADR
    Top = 159
    ExplicitTop = 159
  end
  inherited FrameArea: TFrameItemKLADR
    Top = 83
    ExplicitTop = 83
  end
  object btnEdit: TRzBitBtn [9]
    Left = 353
    Top = 2
    Width = 30
    Height = 23
    Hint = #1048#1079#1084#1077#1085#1080#1090#1100
    Alignment = taLeftJustify
    Anchors = [akTop, akRight]
    TabOrder = 10
    OnClick = btnEditClick
    ImageIndex = 8
    Images = DataModuleMain.ImgList
    Spacing = 1
  end
  object edtRegion: TcxTextEdit [10]
    Left = 64
    Top = 3
    Properties.ReadOnly = True
    TabOrder = 7
    Width = 287
  end
  object edtSite: TcxTextEdit [11]
    Left = 64
    Top = 26
    Properties.ReadOnly = True
    TabOrder = 8
    Width = 287
  end
  object edtAddress: TcxTextEdit [12]
    Left = 65
    Top = 49
    Properties.ReadOnly = True
    TabOrder = 9
    Width = 287
  end
  inherited FrameDom: TFrameItemDomKLADR
    Top = 186
    ExplicitTop = 186
  end
  inherited Query_upd: TIBUpdateSQL
    Top = 114
  end
  inherited Query: TIBQuery
    Top = 74
  end
  inherited DS: TDataSource
    Top = 74
  end
end
