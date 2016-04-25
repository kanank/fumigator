object MF: TMF
  Left = 0
  Top = 0
  Caption = #1057#1077#1088#1074#1077#1088' "'#1060#1091#1084#1080#1075#1072#1090#1086#1088'" v.0.01b'
  ClientHeight = 529
  ClientWidth = 627
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 627
    Height = 321
    Align = alTop
    BevelKind = bkFlat
    TabOrder = 0
    DesignSize = (
      623
      317)
    object GroupBox1: TGroupBox
      Left = 1
      Top = 223
      Width = 621
      Height = 67
      Align = alTop
      Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1089#1086#1089#1090#1086#1103#1085#1080#1080' '#1089#1077#1088#1074#1077#1088#1072
      TabOrder = 0
      Visible = False
      DesignSize = (
        621
        67)
      object Label2: TLabel
        Left = 11
        Top = 19
        Width = 200
        Height = 13
        Caption = #1057#1083#1091#1078#1073#1072' '#1091#1095#1077#1090#1072' '#1088#1072#1073#1086#1095#1077#1075#1086' '#1074#1088#1077#1084#1077#1085#1080': '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Button2: TButton
        Left = 425
        Top = 21
        Width = 185
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #1057#1077#1088#1074#1077#1088' '#1091#1095#1077#1090#1072' '#1088#1072#1073#1086#1095#1077#1075#1086' '#1074#1088#1077#1084#1077#1085#1080
        TabOrder = 0
      end
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 127
      Width = 621
      Height = 96
      Align = alTop
      Caption = #1057#1083#1091#1078#1073#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080' '#1090#1077#1083#1077#1092#1086#1085#1085#1099#1093' '#1074#1099#1079#1086#1074#1086#1074#1086' (Call Events)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      DesignSize = (
        621
        96)
      object Label3: TLabel
        Left = 11
        Top = 69
        Width = 183
        Height = 13
        Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077' '#1089#1083#1091#1078#1073#1099' Call_Events:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4868682
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 11
        Top = 26
        Width = 17
        Height = 13
        Caption = 'IP: '
      end
      object Label4: TLabel
        Left = 142
        Top = 26
        Width = 29
        Height = 13
        Caption = #1055#1086#1088#1090':'
      end
      object Label5: TLabel
        Left = 251
        Top = 26
        Width = 22
        Height = 13
        Caption = 'URI:'
      end
      object TelStatus_lbl: TLabel
        Left = 200
        Top = 69
        Width = 69
        Height = 13
        Caption = #1053#1077' '#1072#1082#1090#1080#1074#1077#1085'!'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Button1: TButton
        Left = 441
        Top = 21
        Width = 169
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1089#1083#1091#1078#1073#1091' Call Events'
        TabOrder = 0
        OnClick = Button1Click
      end
      object TelPort_spin: TSpinEdit
        Left = 177
        Top = 23
        Width = 68
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxValue = 0
        MinValue = 0
        ParentFont = False
        TabOrder = 1
        Value = 45455
      end
      object TelIP_edt: TEdit
        Left = 34
        Top = 23
        Width = 102
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Text = '81.177.48.139'
      end
      object TelURI_edt: TEdit
        Left = 279
        Top = 23
        Width = 130
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Text = '/calls'
      end
    end
    object DebugMode_cb: TCheckBox
      Left = 488
      Top = 284
      Width = 121
      Height = 17
      Anchors = [akRight, akBottom]
      Caption = #1056#1077#1078#1080#1084' '#1086#1090#1083#1072#1076#1082#1080
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      State = cbChecked
      TabOrder = 2
    end
    object GroupBox3: TGroupBox
      Left = 1
      Top = 1
      Width = 621
      Height = 126
      Align = alTop
      Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1089#1086#1089#1090#1086#1103#1085#1080#1080' '#1089#1077#1088#1074#1077#1088#1072
      TabOrder = 3
      DesignSize = (
        621
        126)
      object Label6: TLabel
        Left = 7
        Top = 24
        Width = 55
        Height = 13
        Caption = #1055#1091#1090#1100' '#1082' '#1041#1044':'
      end
      object Label7: TLabel
        Left = 24
        Top = 51
        Width = 38
        Height = 13
        Caption = 'LOGIN: '
      end
      object Label8: TLabel
        Left = 184
        Top = 51
        Width = 32
        Height = 13
        Caption = 'PASS: '
      end
      object DBStatus_lbl: TLabel
        Left = 119
        Top = 84
        Width = 97
        Height = 13
        Caption = #1053#1077' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1086'!'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 11
        Top = 84
        Width = 102
        Height = 13
        Caption = #1057#1086#1077#1076#1080#1085#1077#1085#1080#1077' '#1089' '#1041#1044':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4868682
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object TestDb_btn: TButton
        Left = 441
        Top = 51
        Width = 169
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1089#1086#1077#1076#1080#1085#1077#1085#1080#1077' '#1089' '#1041#1044
        TabOrder = 0
        OnClick = TestDb_btnClick
      end
      object DBPath_edt: TEdit
        Left = 68
        Top = 21
        Width = 542
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Text = '81.177.48.139:C:\Projects\Fumigator\Db\fumigator.fdb'
      end
      object DBUser_edt: TEdit
        Left = 69
        Top = 48
        Width = 102
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Text = 'SYSDBA'
      end
      object DBPass_edt: TEdit
        Left = 229
        Top = 48
        Width = 102
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        PasswordChar = '*'
        TabOrder = 3
        Text = 'masterkey'
      end
      object Button3: TButton
        Left = 441
        Top = 84
        Width = 169
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1082#1083#1080#1077#1085#1090#1072
        TabOrder = 4
        OnClick = TestDb_btnClick
      end
    end
  end
  object Log_memo: TMemo
    Left = 0
    Top = 321
    Width = 627
    Height = 208
    Align = alClient
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object Tel_SRV: TIdHTTPServer
    Bindings = <>
    AutoStartSession = True
    OnCommandGet = Tel_SRVCommandGet
    Left = 289
    Top = 185
  end
  object DefTr: TIBTransaction
    Left = 272
    Top = 80
  end
  object DB: TIBDatabase
    DatabaseName = '81.177.48.139:C:\Projects\Fumigator\Db\fumigator.fdb'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = DefTr
    ServerType = 'IBServer'
    AllowStreamedConnected = False
    Left = 232
    Top = 80
  end
  object CallEnent_Q: TIBQuery
    Database = DB
    Transaction = DefTr
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      '  INSERT INTO CALL_EVENTS'
      ' (CALLFLOW, CALLID, CALLERIDNUM, CALLERIDNAME,'
      ' CALLEDDID, CALLEDEXTENSION, CALLSTATUS, CALLEREXTENSION,'
      ' CALLEDNUMBER, CALLAPIID)'
      ' VALUES (:CALLFLOW, :CALLID, :CALLERIDNUM, :CALLERIDNAME,'
      ' :CALLEDDID, :CALLEDEXTENSION, :CALLSTATUS, :CALLEREXTENSION,'
      ' :CALLEDNUMBER, :CALLAPIID);')
    Left = 345
    Top = 183
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CALLFLOW'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CALLID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CALLERIDNUM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CALLERIDNAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CALLEDDID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CALLEDEXTENSION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CALLSTATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CALLEREXTENSION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CALLEDNUMBER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CALLAPIID'
        ParamType = ptUnknown
      end>
  end
end
