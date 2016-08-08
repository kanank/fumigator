inherited frmSessionResult: TfrmSessionResult
  BorderIcons = [biSystemMenu]
  Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1089#1077#1089#1089#1080#1080
  ClientHeight = 207
  ClientWidth = 233
  Position = poDesktopCenter
  ExplicitWidth = 249
  ExplicitHeight = 245
  PixelsPerInch = 96
  TextHeight = 13
  inherited img1: TImage
    Left = 228
    Top = 21
    Width = 194
    Height = 62
    AutoSize = True
    Proportional = True
    Stretch = True
    Visible = False
    ExplicitLeft = 304
    ExplicitTop = 8
    ExplicitWidth = 194
    ExplicitHeight = 62
  end
  object Label1: TLabel
    Left = 8
    Top = 1
    Width = 112
    Height = 13
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081' '#1082' '#1089#1077#1089#1089#1080#1080
    Color = clBtnShadow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Cancel_btn: TRzButton
    Left = 63
    Top = 168
    Width = 124
    Height = 29
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
    TabOrder = 0
    ThemeAware = False
    OnClick = Cancel_btnClick
  end
  object edtComment: TcxMemo
    Left = 8
    Top = 15
    Lines.Strings = (
      'edtComment')
    TabOrder = 1
    Height = 65
    Width = 217
  end
  object grpIshod: TcxGroupBox
    Left = 8
    Top = 86
    Caption = #1048#1089#1093#1086#1076
    TabOrder = 2
    DesignSize = (
      217
      116)
    Height = 116
    Width = 217
    object btnConsult: TRzButton
      Left = 6
      Top = 18
      Width = 208
      Height = 29
      Anchors = [akTop, akRight]
      Caption = #1055#1088#1086#1074#1077#1076#1077#1085#1072' '#1082#1086#1085#1089#1091#1083#1100#1090#1072#1094#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 2960640
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      HotTrack = True
      HotTrackColor = 16625984
      ParentFont = False
      TabOrder = 0
      ThemeAware = False
      OnClick = btnConsultClick
      ExplicitLeft = 3
    end
    object btnNonConsult: TRzButton
      Left = 6
      Top = 49
      Width = 208
      Height = 29
      Anchors = [akTop, akRight]
      Caption = #1041#1077#1079' '#1082#1086#1085#1089#1091#1083#1100#1090#1072#1094#1080#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 2960640
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      HotTrack = True
      HotTrackColor = 16625984
      ParentFont = False
      TabOrder = 1
      ThemeAware = False
      OnClick = btnConsultClick
      ExplicitLeft = 3
    end
    object btnOther: TRzButton
      Left = 6
      Top = 82
      Width = 208
      Height = 29
      Anchors = [akTop, akRight]
      Caption = #1044#1088#1091#1075#1086#1077
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
      OnClick = btnOtherClick
      ExplicitLeft = 3
    end
    object edtIshod: TcxMemo
      Left = 3
      Top = 17
      Lines.Strings = (
        'edtComment')
      TabOrder = 3
      Visible = False
      Height = 63
      Width = 212
    end
  end
  object DS: TDataSource
    DataSet = Q
    Left = 56
    Top = 16
  end
  object Q: TIBQuery
    Database = DataModuleMain.DB
    Transaction = DataModuleMain.Calls_Tr
    BeforeOpen = QBeforeOpen
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select id,worker_id, client_id, callid, ishod, result, callresul' +
        't, localnum'
      'from sessions'
      'where callid = :callid')
    UpdateObject = Q_upd
    Left = 88
    Top = 15
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
      'result = :result,'
      'localnum = :localnum'
      'where id=:id')
    Left = 56
    Top = 65500
  end
  object QApi: TIBQuery
    Database = DataModuleMain.DB
    Transaction = DataModuleMain.Calls_Tr
    BeforeOpen = QBeforeOpen
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select id,worker_id, client_id, callid, ishod, result, callresul' +
        't, localnum'
      'from sessions'
      'where callapiid = :callid')
    Left = 120
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'callid'
        ParamType = ptUnknown
      end>
  end
end
