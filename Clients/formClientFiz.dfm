inherited frmClientFiz: TfrmClientFiz
  Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1082#1083#1080#1077#1085#1090#1072'. '#1060#1080#1079#1080#1095#1077#1089#1082#1086#1077' '#1083#1080#1094#1086
  ClientHeight = 345
  ClientWidth = 786
  Position = poDesktopCenter
  OnCreate = FormCreate
  ExplicitWidth = 802
  ExplicitHeight = 383
  PixelsPerInch = 96
  TextHeight = 13
  inherited img1: TImage
    Left = 652
    Top = 256
    Width = 126
    Height = 40
    Visible = False
    ExplicitLeft = 600
    ExplicitTop = 226
    ExplicitWidth = 126
    ExplicitHeight = 40
  end
  object Label14: TLabel [1]
    Left = 3
    Top = 248
    Width = 67
    Height = 13
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel [2]
    Left = 4
    Top = 278
    Width = 138
    Height = 13
    Caption = #1054#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1081' '#1089#1086#1090#1088#1091#1076#1085#1080#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel [3]
    Left = 365
    Top = 278
    Width = 82
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1076#1086#1075#1086#1074#1086#1088#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  inherited RzPanel1: TRzPanel
    Top = 301
    Width = 786
    TabOrder = 6
    ExplicitTop = 301
    ExplicitWidth = 786
    inherited Image2: TImage
      Left = 58
      ExplicitLeft = 58
    end
    inherited Exit_bnt: TRzButton
      Left = 652
      OnClick = Exit_bntClick
      ExplicitLeft = 652
    end
    object butOK: TRzButton
      Left = 508
      Top = 8
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
      OnClick = butOKClick
    end
  end
  object ID_edt: TcxDBTextEdit
    Left = 400
    Top = 180
    Anchors = [akLeft, akTop, akRight]
    BeepOnEnter = False
    DataBinding.DataField = 'ID'
    ParentFont = False
    Style.Color = 13421823
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.HotTrack = False
    Style.LookAndFeel.Kind = lfFlat
    Style.LookAndFeel.NativeStyle = True
    Style.TransparentBorder = True
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 2
    Visible = False
    Width = 73
  end
  object Comments_memo: TcxDBMemo
    Left = 77
    Top = 244
    DataBinding.DataField = 'COMMENT'
    DataBinding.DataSource = DS
    Properties.MaxLength = 0
    Properties.ValidationOptions = [evoShowErrorIcon]
    TabOrder = 3
    Height = 26
    Width = 480
  end
  inline FramePerson: TFramePersonFull
    Left = -1
    Top = 0
    Width = 786
    Height = 172
    TabOrder = 0
    ExplicitLeft = -1
    ExplicitWidth = 786
    inherited Label3: TLabel
      Visible = False
    end
    inherited Label5: TLabel
      Left = 367
      Top = 151
      Width = 24
      Caption = 'Email'
      ExplicitLeft = 367
      ExplicitTop = 151
      ExplicitWidth = 24
    end
    inherited FramePassport: TFramePassport
      Left = 564
      ExplicitLeft = 564
    end
    inherited FramePhones: TFramePhones
      Left = 288
      Top = 31
      Width = 271
      Height = 110
      ExplicitLeft = 288
      ExplicitTop = 31
      ExplicitWidth = 271
      ExplicitHeight = 110
      inherited grpPhone: TRzGroupBox
        Top = -2
        Height = 112
        ExplicitTop = -2
        ExplicitHeight = 112
        inherited grdPhone: TcxGrid
          Height = 88
          ExplicitHeight = 88
        end
        inherited RzPanel2: TRzPanel
          Height = 97
          ExplicitHeight = 97
          inherited btnEdit: TRzBitBtn
            Top = 29
            ExplicitTop = 29
          end
          inherited btnDel: TRzBitBtn
            Top = 62
            ExplicitTop = 62
          end
        end
      end
    end
    inherited RzPanel1: TRzPanel
      Width = 338
      ExplicitWidth = 338
      inherited Label10: TLabel [0]
      end
      inherited Label9: TLabel [1]
      end
      inherited Label1: TLabel [2]
        Top = 85
        ExplicitTop = 85
      end
      inherited Label11: TLabel [3]
      end
      inherited Label4: TLabel [4]
        Left = 2
        Visible = False
        ExplicitLeft = 2
      end
      inherited Label2: TLabel [5]
        Top = 113
        ExplicitTop = 113
      end
      inherited Label8: TLabel [6]
        Top = 85
        Width = 51
        Height = 26
        WordWrap = True
        ExplicitTop = 85
        ExplicitWidth = 51
        ExplicitHeight = 26
      end
      inherited edtSurName: TcxDBTextEdit [7]
        ExplicitWidth = 216
        Width = 216
      end
      inherited edtName: TcxDBTextEdit [8]
        ExplicitWidth = 215
        Width = 215
      end
      inherited edtFamily: TcxDBTextEdit [9]
        Left = 71
        ExplicitLeft = 71
        ExplicitWidth = 216
        Width = 216
      end
      inherited cmbSex: TcxDBComboBox [10]
        Top = 81
        ExplicitTop = 81
      end
      inherited cmbProf: TcxDBLookupComboBox [11]
        Visible = False
      end
      inherited edtCitizen: TcxDBTextEdit [12]
        Top = 110
        ExplicitTop = 110
        ExplicitWidth = 215
        Width = 215
      end
      inherited cmbDateBirth: TcxDBDateEdit [13]
        Left = 72
        Top = 81
        Properties.OnInitPopup = FramePersoncmbDateBirthPropertiesInitPopup
        ExplicitLeft = 72
        ExplicitTop = 81
        ExplicitWidth = 125
        Width = 125
      end
    end
    inherited FrameAddress: TFrameKladrAdrFull
      Left = 2
      Top = 145
      Width = 359
      Height = 28
      Visible = True
      ExplicitLeft = 2
      ExplicitTop = 145
      ExplicitWidth = 359
      ExplicitHeight = 28
      inherited Label2: TLabel
        Top = -1
        Width = 66
        Height = 28
        AutoSize = False
        Caption = #1040#1076#1088#1077#1089' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
        WordWrap = True
        ExplicitTop = -1
        ExplicitWidth = 66
        ExplicitHeight = 28
      end
      inherited btnEdit: TRzBitBtn
        Left = 328
        Top = 1
        ExplicitLeft = 328
        ExplicitTop = 1
      end
      inherited edtAddress: TcxTextEdit
        Left = 72
        Top = 2
        ExplicitLeft = 72
        ExplicitTop = 2
        ExplicitWidth = 252
        Width = 252
      end
    end
    inherited edtEmailPrivate: TcxDBTextEdit
      Visible = False
      ExplicitWidth = 133
      Width = 133
    end
    inherited edtEmailWork: TcxDBTextEdit
      Left = 394
      Top = 148
      ExplicitLeft = 394
      ExplicitTop = 148
      ExplicitWidth = 164
      Width = 164
    end
    inherited DS: TDataSource
      OnDataChange = FramePersonDSDataChange
    end
  end
  inline FrameUslugi: TFrameUslugi
    Left = 563
    Top = 144
    Width = 216
    Height = 125
    TabOrder = 4
    ExplicitLeft = 563
    ExplicitTop = 144
    ExplicitWidth = 216
    ExplicitHeight = 125
    inherited grpPhone: TRzGroupBox
      Width = 212
      Height = 128
      ExplicitWidth = 212
      ExplicitHeight = 128
      inherited grdPhone: TcxGrid
        Width = 202
        Height = 81
        ExplicitWidth = 202
        ExplicitHeight = 81
        inherited grdPhoneDBTableView1: TcxGridDBTableView
          OptionsView.Header = False
          inherited grdPhoneDBTableView1Column1: TcxGridDBColumn
            Width = 200
            IsCaptionAssigned = True
          end
        end
      end
      inherited RzPanel2: TRzPanel
        Top = 97
        Width = 210
        Height = 30
        ExplicitTop = 97
        ExplicitWidth = 210
        ExplicitHeight = 30
        inherited btnDel: TRzBitBtn
          Left = 173
          ExplicitLeft = 173
        end
      end
    end
  end
  inline FrameAddress: TFrameKladrAdrFull
    Left = -1
    Top = 171
    Width = 562
    Height = 71
    TabOrder = 5
    Visible = False
    ExplicitLeft = -1
    ExplicitTop = 171
    ExplicitWidth = 562
    ExplicitHeight = 71
    inherited Label2: TLabel [0]
      Left = 5
      Top = 50
      ExplicitLeft = 5
      ExplicitTop = 50
    end
    inherited Label8: TLabel [1]
      Left = 5
      Top = 7
      ExplicitLeft = 5
      ExplicitTop = 7
    end
    inherited Label1: TLabel [2]
      Left = 5
      Top = 27
      ExplicitLeft = 5
      ExplicitTop = 27
    end
    inherited edtAddress: TcxTextEdit [4]
      Left = 76
      Top = 47
      ExplicitLeft = 76
      ExplicitTop = 47
      ExplicitWidth = 482
      Width = 482
    end
    inherited FrameRegion: TFrameItemKLADR [5]
    end
    inherited FrameCity: TFrameItemKLADR [6]
    end
    inherited FrameSite: TFrameItemKLADR [7]
    end
    inherited FrameDom: TFrameItemDomKLADR [8]
    end
    inherited FrameStreet: TFrameItemKLADR [9]
    end
    inherited FrameArea: TFrameItemKLADR [10]
    end
    inherited btnEdit: TRzBitBtn [11]
      Left = 384
      Top = 9
      Width = 41
      Height = 31
      Layout = blGlyphTop
      ExplicitLeft = 384
      ExplicitTop = 9
      ExplicitWidth = 41
      ExplicitHeight = 31
    end
    inherited edtRegion: TcxTextEdit [12]
      Left = 75
      Top = 2
      ExplicitLeft = 75
      ExplicitTop = 2
      ExplicitWidth = 251
      Width = 251
    end
    inherited edtSite: TcxTextEdit [13]
      Left = 75
      Top = 24
      ExplicitLeft = 75
      ExplicitTop = 24
      ExplicitWidth = 251
      Width = 251
    end
  end
  inline FramePhones: TFramePhones
    Left = 291
    Top = 30
    Width = 267
    Height = 112
    TabOrder = 1
    ExplicitLeft = 291
    ExplicitTop = 30
    ExplicitWidth = 267
    ExplicitHeight = 112
    inherited grpPhone: TRzGroupBox
      Width = 262
      Height = 110
      ExplicitWidth = 262
      ExplicitHeight = 110
      inherited grdPhone: TcxGrid
        Left = 5
        Top = 15
        Width = 225
        Height = 91
        ExplicitLeft = 5
        ExplicitTop = 15
        ExplicitWidth = 225
        ExplicitHeight = 91
        inherited grdPhoneDBTableView2: TcxGridDBTableView
          inherited grdPhoneDBTableView2Column2: TcxGridDBColumn
            Width = 104
          end
          inherited grdPhoneDBTableView2Column5: TcxGridDBColumn
            Width = 36
          end
        end
      end
      inherited RzPanel2: TRzPanel
        Left = 230
        Height = 95
        ExplicitLeft = 230
        ExplicitHeight = 95
        inherited btnEdit: TRzBitBtn
          Top = 34
          ExplicitTop = 34
        end
        inherited btnDel: TRzBitBtn
          Top = 65
          ExplicitTop = 65
        end
      end
    end
  end
  object cmbWorker: TcxDBLookupComboBox
    Left = 147
    Top = 275
    DataBinding.DataField = 'WORKER_ID'
    DataBinding.DataSource = DS
    Properties.KeyFieldNames = 'ID'
    Properties.ListColumns = <
      item
        FieldName = 'SHORT_NAME'
      end>
    Properties.ListOptions.GridLines = glNone
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DataModuleMain.DSWorkers
    Properties.ReadOnly = False
    Properties.OnCloseUp = cmbWorkerPropertiesCloseUp
    Properties.OnPopup = cmbWorkerPropertiesPopup
    TabOrder = 7
    Width = 178
  end
  object RzPanel2: TRzPanel
    Left = 295
    Top = 0
    Width = 262
    Height = 28
    BorderSides = []
    TabOrder = 8
    object Label2: TLabel
      Left = 138
      Top = 10
      Width = 38
      Height = 13
      Caption = #1060#1086#1088#1084#1072#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 0
      Top = 10
      Width = 36
      Height = 13
      Caption = #1057#1090#1072#1090#1091#1089
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object cmbFormat: TcxDBLookupComboBox
      Left = 180
      Top = 6
      DataBinding.DataField = 'FORMAT_ID'
      DataBinding.DataSource = DS
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NAME'
        end>
      Properties.ListOptions.AnsiSort = True
      Properties.ListOptions.GridLines = glNone
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = DataModuleMain.DsFormatsCli
      TabOrder = 1
      Width = 81
    end
    object cmbStatus: TcxDBLookupComboBox
      Left = 43
      Top = 6
      AutoSize = False
      DataBinding.DataField = 'STATUS_ID'
      DataBinding.DataSource = DS
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NAME'
        end>
      Properties.ListOptions.AnsiSort = True
      Properties.ListOptions.GridLines = glNone
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = DataModuleMain.DsDicStatusCli
      TabOrder = 0
      Height = 21
      Width = 89
    end
  end
  object edtDogNum: TcxDBTextEdit
    Left = 452
    Top = 275
    Anchors = [akLeft, akTop, akRight]
    BeepOnEnter = False
    DataBinding.DataField = 'DOG_NUM'
    DataBinding.DataSource = DS
    Style.BorderStyle = ebsFlat
    Style.HotTrack = False
    Style.LookAndFeel.Kind = lfFlat
    Style.LookAndFeel.NativeStyle = True
    Style.TransparentBorder = True
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 9
    Width = 105
  end
  object DS: TDataSource
    AutoEdit = False
    Left = 352
    Top = 319
  end
  object QCheck: TIBQuery
    Database = DataModuleMain.DB
    Transaction = DataModuleMain.DefTr
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select id, name from clients where name = :name and act=1')
    Left = 248
    Top = 271
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'name'
        ParamType = ptUnknown
      end>
  end
end
