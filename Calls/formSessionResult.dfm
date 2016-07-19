inherited frmSessionResult: TfrmSessionResult
  BorderIcons = [biSystemMenu]
  Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1089#1077#1089#1089#1080#1080
  ClientHeight = 159
  ClientWidth = 309
  Position = poDesktopCenter
  ExplicitWidth = 325
  ExplicitHeight = 197
  PixelsPerInch = 96
  TextHeight = 13
  inherited img1: TImage
    Left = 111
    Top = 52
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
    Left = 8
    Top = 41
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
  object edtResult: TcxDBMemo
    Left = 8
    Top = 55
    DataBinding.DataField = 'RESULT'
    DataBinding.DataSource = DS
    TabOrder = 0
    Height = 50
    Width = 289
  end
  object Cancel_btn: TRzButton
    Left = 91
    Top = 126
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
    TabOrder = 1
    ThemeAware = False
    OnClick = Cancel_btnClick
  end
  object cmbIshod: TcxDBComboBox
    Left = 91
    Top = 5
    DataBinding.DataField = 'ISHOD'
    DataBinding.DataSource = DS
    Properties.DropDownSizeable = True
    Properties.Items.Strings = (
      #1087#1088#1086#1074#1077#1076#1077#1085#1072' '#1082#1086#1085#1089#1091#1083#1100#1090#1072#1094#1080#1103
      #1073#1077#1079' '#1082#1086#1085#1089#1091#1083#1100#1090#1072#1094#1080#1080
      ' '#1074#1099#1079#1086#1074' '#1087#1077#1088#1077#1074#1077#1076#1077#1085
      #1074#1099#1079#1086#1074' '#1089#1086#1088#1074#1072#1083#1089#1103
      #1085#1086#1084#1077#1088' '#1079#1072#1085#1103#1090'/'#1085#1077#1076#1086#1089#1090#1091#1087#1077#1085)
    TabOrder = 2
    Width = 206
  end
  object DS: TDataSource
    DataSet = Q
    Left = 24
    Top = 88
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
      'result = :result,'
      'localnum = :localnum'
      'where id=:id')
    Left = 160
    Top = 80
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
    Left = 112
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'callid'
        ParamType = ptUnknown
      end>
  end
end
