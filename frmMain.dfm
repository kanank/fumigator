inherited frmMain: TfrmMain
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  ExplicitWidth = 657
  ExplicitHeight = 396
  PixelsPerInch = 96
  TextHeight = 13
  inherited img1: TImage
    Left = 389
    Top = 274
    Width = 249
    Height = 81
    Proportional = True
    Stretch = True
    ExplicitLeft = 389
    ExplicitTop = 274
    ExplicitWidth = 249
    ExplicitHeight = 81
  end
  object lblSocket: TLabel
    Left = 435
    Top = 0
    Width = 203
    Height = 13
    Alignment = taRightJustify
    Caption = #1057#1086#1077#1076#1080#1085#1077#1085#1080#1077' '#1089' '#1089#1077#1088#1074#1077#1088#1086#1084' '#1085#1077' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object btnWorkers: TRzMenuButton
    Left = 8
    Top = 319
    Width = 170
    Height = 31
    Anchors = [akLeft, akBottom]
    Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    HotTrack = True
    HotTrackColor = 16625984
    ParentFont = False
    TabOrder = 0
    ThemeAware = False
    OnClick = btnWorkersClick
    ShowArrow = False
  end
  object btnTune: TRzMenuButton
    Left = 205
    Top = 319
    Width = 170
    Height = 31
    Anchors = [akLeft, akRight, akBottom]
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    HotTrack = True
    HotTrackColor = 16625984
    ParentFont = False
    TabOrder = 1
    ThemeAware = False
    OnClick = btnTuneClick
    DropDownMenu = mOptions
    ShowArrow = False
  end
  object RzMenuButton1: TRzMenuButton
    Left = 8
    Top = 8
    Width = 170
    Height = 31
    Caption = #1053#1086#1074#1099#1081' '#1082#1083#1080#1077#1085#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    HotTrack = True
    HotTrackColor = 16625984
    ParentFont = False
    TabOrder = 2
    ThemeAware = False
    DropDownMenu = NewClientBtn_PUM
    ShowArrow = False
  end
  object btnClients: TRzMenuButton
    Left = 8
    Top = 45
    Width = 170
    Height = 31
    Caption = #1057#1087#1080#1089#1086#1082' '#1082#1083#1080#1077#1085#1090#1086#1074
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    HotTrack = True
    HotTrackColor = 16625984
    ParentFont = False
    TabOrder = 3
    ThemeAware = False
    DropDownMenu = Clients_PUM
    ShowArrow = False
  end
  object RzMenuButton2: TRzMenuButton
    Left = 528
    Top = 19
    Width = 87
    Height = 31
    Anchors = [akLeft, akRight, akBottom]
    Caption = #1058#1077#1089#1090' '#1079#1074#1086#1085#1082#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    HotTrack = True
    HotTrackColor = 16625984
    ParentFont = False
    TabOrder = 4
    ThemeAware = False
    Visible = False
    OnClick = RzMenuButton2Click
    ShowArrow = False
  end
  object RzMenuButton3: TRzMenuButton
    Left = 205
    Top = 8
    Width = 170
    Height = 31
    Caption = #1057#1087#1080#1089#1086#1082' '#1082#1083#1080#1077#1085#1090#1086#1074' '#1085#1072' '#1076#1072#1090#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInactiveCaption
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    HotTrack = True
    HotTrackColor = 16625984
    ParentFont = False
    TabOrder = 5
    ThemeAware = False
    OnClick = RzMenuButton3Click
    ShowArrow = False
  end
  object RzMenuButton4: TRzMenuButton
    Left = 8
    Top = 82
    Width = 170
    Height = 31
    Caption = #1057#1077#1089#1089#1080#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    HotTrack = True
    HotTrackColor = 16625984
    ParentFont = False
    TabOrder = 6
    ThemeAware = False
    OnClick = RzMenuButton4Click
    ShowArrow = False
  end
  object NewClientBtn_PUM: TPopupMenu
    Left = 192
    Top = 88
    object NewFizClnt_mi: TMenuItem
      Caption = #1060#1080#1079#1080#1095#1077#1089#1082#1086#1077' '#1083#1080#1094#1086
      OnClick = NewFizClnt_miClick
    end
    object NewURClnt_mi: TMenuItem
      Caption = #1070#1088#1080#1076#1080#1095#1077#1089#1082#1086#1077' '#1083#1080#1094#1086
      OnClick = NewURClnt_miClick
    end
  end
  object Clients_PUM: TPopupMenu
    Left = 128
    Top = 128
    object AllCli_mi: TMenuItem
      Caption = #1054#1073#1097#1080#1081' '#1089#1087#1080#1089#1086#1082
      OnClick = AllCli_miClick
    end
    object FizClients_mi: TMenuItem
      Caption = #1060#1080#1079#1080#1095#1077#1089#1082#1080#1077' '#1083#1080#1094#1072
      OnClick = FizClients_miClick
    end
    object UrClients_mi: TMenuItem
      Caption = #1070#1088#1080#1076#1080#1095#1077#1089#1082#1080#1077' '#1083#1080#1094#1072
      OnClick = UrClients_miClick
    end
  end
  object ClientSocket: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnConnect = ClientSocketConnect
    OnDisconnect = ClientSocketDisconnect
    OnRead = ClientSocketRead
    OnError = ClientSocketError
    Left = 576
    Top = 64
  end
  object TrayIcon: TRzTrayIcon
    Hint = #1060#1091#1084#1080#1075#1072#1090#1086#1088
    PopupMenu = TrayMenu
    Icons = DataModuleMain.imgListTray
    PopupMenuOn = ticRightClick
    Left = 345
    Top = 266
  end
  object TrayMenu: TPopupMenu
    Left = 280
    Top = 264
    object miShowMain: TMenuItem
      Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100
      OnClick = miShowMainClick
    end
    object miExit: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = miExitClick
    end
  end
  object mOptions: TPopupMenu
    Left = 392
    Top = 200
    object miListCli: TMenuItem
      Caption = #1057#1087#1080#1089#1086#1082' '#1082#1083#1080#1077#1085#1090#1086#1074' '#1076#1083#1103' '#1086#1087#1077#1088#1072#1090#1086#1088#1086#1074
      OnClick = miListCliClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object miOptions: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      OnClick = miOptionsClick
    end
  end
  object TCPClient: TIdTCPClient
    OnDisconnected = TCPClientDisconnected
    OnConnected = TCPClientConnected
    ConnectTimeout = 0
    IPVersion = Id_IPv4
    Port = 0
    ReadTimeout = -1
    Left = 504
    Top = 64
  end
end
