inherited FrameKLADRAdrRegion: TFrameKLADRAdrRegion
  Width = 507
  Height = 59
  ExplicitWidth = 507
  ExplicitHeight = 59
  DesignSize = (
    507
    59)
  inherited Label8: TLabel
    Top = 36
    ExplicitTop = 36
  end
  object Label1: TLabel [1]
    Left = 2
    Top = 8
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
  object Label2: TLabel [2]
    Left = 228
    Top = 8
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
    Left = 40
    Top = 33
    ExplicitLeft = 40
    ExplicitTop = 33
    ExplicitWidth = 427
    Width = 427
  end
  inherited btnEdit: TRzBitBtn
    Left = 469
    Top = 13
    Width = 32
    Height = 32
    Margins.Left = 6
    Alignment = taCenter
    ImageIndex = 8
    Layout = blGlyphTop
    ExplicitLeft = 469
    ExplicitTop = 13
    ExplicitWidth = 32
    ExplicitHeight = 32
  end
  object cxDBMemo1: TcxDBMemo [5]
    Left = 40
    Top = 5
    Anchors = [akLeft, akTop, akRight]
    DataBinding.DataField = 'ADRESS'
    Properties.MaxLength = 0
    Properties.ValidationOptions = [evoShowErrorIcon]
    TabOrder = 2
    Height = 22
    Width = 181
  end
  object cxDBMemo2: TcxDBMemo [6]
    Left = 288
    Top = 5
    Anchors = [akLeft, akTop, akRight]
    DataBinding.DataField = 'ADRESS'
    Properties.MaxLength = 0
    Properties.ValidationOptions = [evoShowErrorIcon]
    TabOrder = 3
    Height = 22
    Width = 179
  end
  inherited Query_upd: TIBUpdateSQL
    Left = 272
    Top = 32
  end
  inherited Query: TIBQuery
    Left = 336
    Top = 32
  end
  inherited DS: TDataSource
    Left = 304
    Top = 32
  end
end
