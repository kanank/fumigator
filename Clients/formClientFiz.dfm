inherited frmClientFiz: TfrmClientFiz
  Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1082#1083#1080#1077#1085#1090#1072'. '#1060#1080#1079#1080#1095#1077#1089#1082#1086#1077' '#1083#1080#1094#1086
  ClientHeight = 636
  ClientWidth = 786
  Position = poDesktopCenter
  OnCreate = FormCreate
  ExplicitWidth = 802
  ExplicitHeight = 674
  PixelsPerInch = 96
  TextHeight = 13
  inherited img1: TImage
    Left = 652
    Top = 547
    Width = 126
    Height = 40
    Visible = False
    ExplicitLeft = 600
    ExplicitTop = 226
    ExplicitWidth = 126
    ExplicitHeight = 40
  end
  object Label14: TLabel [1]
    Left = 386
    Top = 352
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
    Left = 385
    Top = 379
    Width = 84
    Height = 26
    Caption = #1054#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1081' '#1089#1086#1090#1088#1091#1076#1085#1080#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label4: TLabel [3]
    Left = 594
    Top = 94
    Width = 38
    Height = 13
    Caption = #1058#1086#1074#1072#1088#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  inherited RzPanel1: TRzPanel
    Top = 592
    Width = 786
    TabOrder = 6
    ExplicitTop = 592
    ExplicitWidth = 786
    inherited Image2: TImage
      Left = 58
      ExplicitLeft = 58
    end
    object btnHide: TRzButton [1]
      Left = 652
      Top = 8
      Width = 124
      Height = 29
      Anchors = [akTop, akRight]
      Caption = #1057#1082#1088#1099#1090#1100
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
      Visible = False
      OnClick = btnHideClick
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
    TabOrder = 10
    Visible = False
    Width = 73
  end
  object Comments_memo: TcxDBMemo
    Left = 460
    Top = 348
    DataBinding.DataField = 'COMMENT'
    DataBinding.DataSource = DS
    Properties.MaxLength = 0
    Properties.ValidationOptions = [evoShowErrorIcon]
    TabOrder = 3
    Height = 26
    Width = 300
  end
  inline FramePerson: TFramePersonFull
    Left = 0
    Top = 80
    Width = 370
    Height = 313
    TabOrder = 0
    ExplicitTop = 80
    ExplicitWidth = 370
    ExplicitHeight = 313
    inherited Label3: TLabel
      Visible = False
    end
    inherited Label5: TLabel
      Left = 238
      Top = 181
      Width = 24
      Caption = 'Email'
      ExplicitLeft = 238
      ExplicitTop = 181
      ExplicitWidth = 24
    end
    inherited FramePassport: TFramePassport
      Left = 5
      Top = 160
      ExplicitLeft = 5
      ExplicitTop = 160
      inherited RzGroupBox1: TRzGroupBox
        Top = 15
        Height = 136
        ExplicitTop = 15
        ExplicitHeight = 136
      end
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
        Visible = False
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
      Top = 6
      Width = 287
      ExplicitTop = 6
      ExplicitWidth = 287
      DesignSize = (
        287
        142)
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
        ExplicitWidth = 165
        Width = 165
      end
      inherited edtName: TcxDBTextEdit [8]
        ExplicitWidth = 164
        Width = 164
      end
      inherited edtFamily: TcxDBTextEdit [9]
        Left = 71
        ExplicitLeft = 71
        ExplicitWidth = 165
        Width = 165
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
        ExplicitWidth = 164
        Width = 164
      end
      inherited cmbDateBirth: TcxDBDateEdit [13]
        Left = 72
        Top = 81
        Properties.OnInitPopup = FramePersoncmbDateBirthPropertiesInitPopup
        ExplicitLeft = 72
        ExplicitTop = 81
        ExplicitWidth = 74
        Width = 74
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
      Left = 288
      Top = 179
      AutoSize = False
      Visible = False
      ExplicitLeft = 288
      ExplicitTop = 179
      ExplicitWidth = 0
      Width = 0
    end
    inherited edtEmailWork: TcxDBTextEdit
      Left = 268
      Top = 179
      ExplicitLeft = 268
      ExplicitTop = 179
      ExplicitWidth = 92
      Width = 92
    end
    inherited DS: TDataSource
      OnDataChange = FramePersonDSDataChange
    end
  end
  inline FrameUslugi: TFrameUslugi
    Left = 380
    Top = 87
    Width = 205
    Height = 125
    TabOrder = 4
    ExplicitLeft = 380
    ExplicitTop = 87
    ExplicitWidth = 205
    ExplicitHeight = 125
    inherited grpPhone: TRzGroupBox
      Left = 3
      Width = 201
      Height = 128
      ExplicitLeft = 3
      ExplicitWidth = 201
      ExplicitHeight = 128
      DesignSize = (
        201
        128)
      inherited grdPhone: TcxGrid
        Width = 191
        Height = 81
        ExplicitWidth = 191
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
        Width = 199
        Height = 30
        ExplicitTop = 97
        ExplicitWidth = 199
        ExplicitHeight = 30
        inherited btnDel: TRzBitBtn
          Left = 162
          ExplicitLeft = 162
        end
      end
    end
  end
  inline FrameAddress: TFrameKladrAdrFull
    Left = 432
    Top = 0
    Width = 350
    Height = 81
    TabOrder = 5
    Visible = False
    ExplicitLeft = 432
    ExplicitWidth = 350
    ExplicitHeight = 81
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
      ExplicitWidth = 271
      Width = 271
    end
    inherited FrameRegion: TFrameItemKLADR [5]
      Visible = False
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
      Left = 300
      Top = 8
      Width = 41
      Height = 31
      Layout = blGlyphTop
      ExplicitLeft = 300
      ExplicitTop = 8
      ExplicitWidth = 41
      ExplicitHeight = 31
    end
    inherited edtRegion: TcxTextEdit [12]
      Left = 75
      Top = 2
      ExplicitLeft = 75
      ExplicitTop = 2
      ExplicitWidth = 210
      Width = 210
    end
    inherited edtSite: TcxTextEdit [13]
      Left = 75
      Top = 24
      ExplicitLeft = 75
      ExplicitTop = 24
      ExplicitWidth = 210
      Width = 210
    end
  end
  inline FramePhones: TFramePhones
    Left = 386
    Top = 212
    Width = 267
    Height = 127
    TabOrder = 1
    ExplicitLeft = 386
    ExplicitTop = 212
    ExplicitWidth = 267
    ExplicitHeight = 127
    inherited grpPhone: TRzGroupBox
      Left = 2
      Top = 3
      Width = 262
      Height = 125
      ExplicitLeft = 2
      ExplicitTop = 3
      ExplicitWidth = 262
      ExplicitHeight = 125
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
        Height = 110
        ExplicitLeft = 230
        ExplicitHeight = 110
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
    Left = 472
    Top = 380
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
    Left = -2
    Top = 0
    Width = 425
    Height = 88
    BorderSides = []
    TabOrder = 8
    DesignSize = (
      425
      88)
    object Label2: TLabel
      Left = 219
      Top = 32
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
      Left = 219
      Top = 8
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
    object Label3: TLabel
      Left = 6
      Top = 33
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
    object Label6: TLabel
      Left = 6
      Top = 58
      Width = 69
      Height = 13
      Caption = #1058#1080#1087' '#1076#1086#1075#1086#1074#1086#1088#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 219
      Top = 54
      Width = 54
      Height = 26
      Caption = #1055#1083#1086#1097#1072#1076#1100' '#1086#1073#1088#1072#1073#1086#1090#1082#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object Label8: TLabel
      Left = 4
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
    object cmbFormat: TcxDBLookupComboBox
      Left = 263
      Top = 31
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
      Width = 88
    end
    object cmbStatus: TcxDBLookupComboBox
      Left = 262
      Top = 4
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
    object cmbRegion: TcxDBLookupComboBox
      Left = 44
      Top = 4
      DataBinding.DataField = 'REGION_ID'
      DataBinding.DataSource = DS
      Properties.KeyFieldNames = 'REGION_ID'
      Properties.ListColumns = <
        item
          FieldName = 'NAME'
        end>
      Properties.ListOptions.GridLines = glNone
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = DataModuleMain.DsDicRegions
      Properties.ReadOnly = False
      TabOrder = 2
      Width = 162
    end
    object edtDogNum: TcxDBTextEdit
      Left = 93
      Top = 30
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
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
      TabOrder = 3
      Height = 21
      Width = 110
    end
    object cxDBLookupComboBox1: TcxDBLookupComboBox
      Left = 94
      Top = 53
      DataBinding.DataField = 'DOG_TYPE_ID'
      DataBinding.DataSource = DS
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NAME'
        end>
      Properties.ListOptions.GridLines = glNone
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = DataModuleMain.DSDicDogTypes
      Properties.ReadOnly = False
      Properties.OnCloseUp = cmbWorkerPropertiesCloseUp
      Properties.OnPopup = cmbWorkerPropertiesPopup
      TabOrder = 4
      Width = 111
    end
    object cxDBLookupComboBox2: TcxDBLookupComboBox
      Left = 281
      Top = 57
      DataBinding.DataField = 'AREA_ID'
      DataBinding.DataSource = DS
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NAME'
        end>
      Properties.ListOptions.GridLines = glNone
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = DataModuleMain.DsDicAreaVolume
      Properties.ReadOnly = False
      Properties.OnCloseUp = cmbWorkerPropertiesCloseUp
      Properties.OnPopup = cmbWorkerPropertiesPopup
      TabOrder = 5
      Width = 88
    end
    object cxDBLookupComboBox3: TcxDBLookupComboBox
      Left = 375
      Top = 57
      DataBinding.DataField = 'AREA_UNIT_ID'
      DataBinding.DataSource = DS
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NAME'
        end>
      Properties.ListOptions.GridLines = glNone
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = DataModuleMain.DsDicUnits
      Properties.ReadOnly = False
      Properties.OnCloseUp = cmbWorkerPropertiesCloseUp
      Properties.OnPopup = cmbWorkerPropertiesPopup
      TabOrder = 6
      Width = 46
    end
  end
  object cxDBMemo1: TcxDBMemo
    Left = 593
    Top = 107
    DataBinding.DataField = 'goods'
    DataBinding.DataSource = DS
    TabOrder = 9
    Height = 89
    Width = 185
  end
  object pnlCalls: TRzPanel
    Left = 0
    Top = 411
    Width = 786
    Height = 181
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 2
    inline frameClientCalls: TframeClientCalls
      Left = -2
      Top = 0
      Width = 765
      Height = 160
      TabOrder = 0
      ExplicitLeft = -2
      ExplicitHeight = 160
      inherited grpPhone: TRzGroupBox
        Width = 772
        ExplicitWidth = 772
        inherited RzPanel2: TRzPanel
          Left = 740
          ExplicitLeft = 740
        end
        inherited grdPhone: TcxGrid
          Left = 5
          Top = 17
          Width = 757
          ExplicitLeft = 5
          ExplicitTop = 17
          ExplicitWidth = 757
          inherited GridView: TcxGridDBTableView
            inherited GridViewColumn11: TcxGridDBColumn
              IsCaptionAssigned = True
            end
          end
        end
      end
    end
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
