inherited frmClientFiz: TfrmClientFiz
  Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1082#1083#1080#1077#1085#1090#1072'. '#1060#1080#1079#1080#1095#1077#1089#1082#1086#1077' '#1083#1080#1094#1086
  ClientHeight = 315
  ClientWidth = 734
  Position = poDesktopCenter
  OnCreate = FormCreate
  ExplicitWidth = 750
  ExplicitHeight = 353
  PixelsPerInch = 96
  TextHeight = 13
  inherited img1: TImage
    Left = 600
    Top = 226
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
    Top = 238
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
  object Label18: TLabel [2]
    Left = 398
    Top = 11
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
  object Label15: TLabel [3]
    Left = 290
    Top = 12
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
  inherited RzPanel1: TRzPanel
    Top = 271
    Width = 734
    TabOrder = 8
    ExplicitTop = 271
    ExplicitWidth = 734
    inherited Exit_bnt: TRzButton
      Left = 600
      ExplicitLeft = 600
    end
    object butOK: TRzButton
      Left = 456
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
    TabOrder = 1
    Visible = False
    Width = 21
  end
  object Comments_memo: TcxDBMemo
    Left = 77
    Top = 234
    DataBinding.DataField = 'COMMENT'
    DataBinding.DataSource = DS
    Properties.MaxLength = 0
    Properties.ValidationOptions = [evoShowErrorIcon]
    TabOrder = 2
    Height = 31
    Width = 431
  end
  inline FramePerson: TFramePersonFull
    Left = 0
    Top = 0
    Width = 733
    Height = 172
    TabOrder = 5
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
    inherited FramePhones: TFramePhones
      Left = 288
      Top = 31
      Height = 110
      ExplicitLeft = 288
      ExplicitTop = 31
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
        ExplicitTop = 85
      end
      inherited edtSurName: TcxDBTextEdit [7]
      end
      inherited edtName: TcxDBTextEdit [8]
      end
      inherited edtFamily: TcxDBTextEdit [9]
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
      end
      inherited cmbDateBirth: TcxDBDateEdit [13]
        Top = 80
        Properties.OnInitPopup = FramePersoncmbDateBirthPropertiesInitPopup
        ExplicitTop = 80
      end
    end
    inherited FrameAddress: TFrameKladrAdrFull
      Height = 26
      Visible = True
      ExplicitHeight = 26
      inherited Label2: TLabel
        Left = 0
        ExplicitLeft = 0
      end
    end
    inherited edtEmailPrivate: TcxDBTextEdit
      Visible = False
      ExplicitWidth = 80
      Width = 80
    end
    inherited edtEmailWork: TcxDBTextEdit
      Left = 394
      Top = 148
      ExplicitLeft = 394
      ExplicitTop = 148
      ExplicitWidth = 114
      Width = 114
    end
    inherited DS: TDataSource
      OnDataChange = FramePersonDSDataChange
    end
  end
  object cmbFormat: TcxDBLookupComboBox
    Left = 439
    Top = 8
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
    TabOrder = 3
    Width = 68
  end
  object cmbStatus: TcxDBLookupComboBox
    Left = 327
    Top = 8
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
    TabOrder = 4
    Width = 62
  end
  inline FrameUslugi: TFrameUslugi
    Left = 514
    Top = 144
    Width = 216
    Height = 123
    TabOrder = 6
    ExplicitLeft = 514
    ExplicitTop = 144
    ExplicitWidth = 216
    ExplicitHeight = 123
    inherited grpPhone: TRzGroupBox
      Width = 212
      Height = 126
      ExplicitWidth = 212
      ExplicitHeight = 126
      inherited grdPhone: TcxGrid
        Width = 202
        Height = 79
        ExplicitWidth = 202
        ExplicitHeight = 79
        inherited grdPhoneDBTableView1: TcxGridDBTableView
          OptionsView.Header = False
          inherited grdPhoneDBTableView1Column1: TcxGridDBColumn
            Width = 200
            IsCaptionAssigned = True
          end
        end
      end
      inherited RzPanel2: TRzPanel
        Top = 95
        Width = 210
        Height = 30
        ExplicitTop = 95
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
    Width = 509
    Height = 47
    TabOrder = 7
    Visible = False
    ExplicitLeft = -1
    ExplicitTop = 171
    ExplicitWidth = 509
    ExplicitHeight = 47
    inherited Label2: TLabel [0]
      Left = 1
      Top = 4
      Visible = False
      ExplicitLeft = 1
      ExplicitTop = 4
    end
    inherited Label8: TLabel [1]
      Left = 5
      Top = 7
      ExplicitLeft = 5
      ExplicitTop = 7
    end
    inherited Label1: TLabel [2]
      Left = 5
      ExplicitLeft = 5
    end
    inherited edtAddress: TcxTextEdit [4]
      Left = 75
      Top = 2
      Visible = False
      ExplicitLeft = 75
      ExplicitTop = 2
      ExplicitWidth = 432
      Width = 432
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
      Left = 331
      ExplicitLeft = 331
    end
    inherited edtRegion: TcxTextEdit [12]
      Left = 75
      Top = 2
      ExplicitLeft = 75
      ExplicitTop = 2
      ExplicitWidth = 253
      Width = 253
    end
    inherited edtSite: TcxTextEdit [13]
      Left = 75
      ExplicitLeft = 75
      ExplicitWidth = 253
      Width = 253
    end
  end
  inline FramePhones: TFramePhones
    Left = 291
    Top = 30
    Width = 216
    Height = 112
    TabOrder = 0
    ExplicitLeft = 291
    ExplicitTop = 30
    ExplicitWidth = 216
    ExplicitHeight = 112
    inherited grpPhone: TRzGroupBox
      Height = 110
      ExplicitHeight = 110
      inherited grdPhone: TcxGrid
        Left = 5
        Top = 15
        Height = 91
        ExplicitLeft = 5
        ExplicitTop = 15
        ExplicitHeight = 91
      end
      inherited RzPanel2: TRzPanel
        Height = 95
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
  object DS: TDataSource
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
      'select id, name from clients where name = :name')
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
