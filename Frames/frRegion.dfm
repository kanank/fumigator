inherited FrameKLADRRegion: TFrameKLADRRegion
  Width = 404
  ExplicitWidth = 404
  inherited Label8: TLabel
    Top = 5
    Width = 35
    Caption = #1056#1077#1075#1080#1086#1085
    ExplicitTop = 5
    ExplicitWidth = 35
  end
  object Label1: TLabel [1]
    Left = 177
    Top = 5
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
  inherited Adres_memo: TcxDBMemo
    Left = 39
    Top = 2
    ExplicitLeft = 39
    ExplicitTop = 2
    ExplicitWidth = 129
    Width = 129
  end
  inherited btnEdit: TRzBitBtn
    Left = 372
  end
  object cxDBMemo1: TcxDBMemo [4]
    Left = 235
    Top = 2
    Anchors = [akLeft, akTop, akRight]
    DataBinding.DataField = 'ADRESS'
    Properties.MaxLength = 0
    Properties.ValidationOptions = [evoShowErrorIcon]
    TabOrder = 2
    Height = 22
    Width = 136
  end
  inherited Query_upd: TIBUpdateSQL
    Left = 64
    Top = 8
  end
  inherited Query: TIBQuery
    Left = 128
    Top = 8
  end
  inherited DS: TDataSource
    Left = 96
    Top = 8
  end
end
