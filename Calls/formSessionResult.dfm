inherited frmSessionResult: TfrmSessionResult
  BorderIcons = [biSystemMenu]
  Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1089#1077#1089#1089#1080#1080
  ClientHeight = 131
  ClientWidth = 517
  Position = poDesktopCenter
  ExplicitWidth = 533
  ExplicitHeight = 169
  PixelsPerInch = 96
  TextHeight = 13
  inherited img1: TImage
    Left = 319
    Top = 24
    Width = 194
    Height = 62
    AutoSize = True
    Proportional = True
    Stretch = True
    Visible = False
    ExplicitLeft = 319
    ExplicitTop = 83
    ExplicitWidth = 194
    ExplicitHeight = 62
  end
  object Label11: TLabel
    Left = 8
    Top = 8
    Width = 67
    Height = 13
    Caption = #1048#1089#1093#1086#1076' '#1089#1077#1089#1089#1080#1080
    Color = clBtnShadow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label1: TLabel
    Left = 224
    Top = 8
    Width = 89
    Height = 13
    Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1089#1077#1089#1089#1080#1080
    Color = clBtnShadow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object cxDBMemo1: TcxDBMemo
    Left = 8
    Top = 23
    DataBinding.DataField = 'ISHOD'
    DataBinding.DataSource = DS
    TabOrder = 0
    Height = 54
    Width = 185
  end
  object cxDBMemo2: TcxDBMemo
    Left = 224
    Top = 23
    DataBinding.DataField = 'RESULT'
    DataBinding.DataSource = DS
    TabOrder = 1
    Height = 54
    Width = 289
  end
  object Cancel_btn: TRzButton
    Left = 201
    Top = 92
    Width = 124
    Height = 29
    ModalResult = 1
    Anchors = [akTop, akRight]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 2960640
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    HotTrack = True
    HotTrackColor = 16625984
    ParentFont = False
    TabOrder = 2
    ThemeAware = False
  end
  object DS: TDataSource
    DataSet = Q
    Left = 24
    Top = 88
  end
  object Q: TIBQuery
    Database = DataModuleMain.DB
    Transaction = DataModuleMain.Calls_Tr
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select id,worker_id, client_id, callid, ishod, result, callresul' +
        't'
      'from sessions'
      'where callid = :callid')
    UpdateObject = Q_upd
    Left = 72
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'callid'
        ParamType = ptUnknown
      end>
  end
  object Q_upd: TIBUpdateSQL
    ModifySQL.Strings = (
      'update sessions'
      'set '
      'worker_id = :worker_id,'
      'client_id = :client_id,'
      'ishod = :ishod,'
      'result = :result'
      'where id=:id')
    Left = 136
    Top = 80
  end
end
