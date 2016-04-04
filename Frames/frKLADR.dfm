inherited FrameKLADR: TFrameKLADR
  Width = 385
  Height = 27
  ExplicitWidth = 385
  ExplicitHeight = 27
  DesignSize = (
    385
    27)
  object Label8: TLabel [0]
    Left = 2
    Top = 6
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
  object Adres_memo: TcxDBMemo [1]
    Left = 51
    Top = 3
    Anchors = [akLeft, akTop, akRight]
    DataBinding.DataField = 'ADRESS'
    Properties.MaxLength = 0
    Properties.ValidationOptions = [evoShowErrorIcon]
    TabOrder = 0
    Height = 22
    Width = 302
  end
  object btnEdit: TRzBitBtn [2]
    Left = 353
    Top = 2
    Width = 30
    Height = 23
    Hint = #1048#1079#1084#1077#1085#1080#1090#1100
    Alignment = taLeftJustify
    Anchors = [akTop, akRight]
    TabOrder = 1
    ImageIndex = 2
    Images = DataModuleMain.ImgList
    Spacing = 1
  end
  inherited Query_upd: TIBUpdateSQL
    Left = 152
    Top = 0
  end
  inherited Query: TIBQuery
    Left = 216
    Top = 0
  end
  inherited DS: TDataSource
    Left = 184
    Top = 0
  end
end
