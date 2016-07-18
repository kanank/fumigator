inherited frmClientUr: TfrmClientUr
  Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1082#1083#1080#1077#1085#1090#1072'. '#1070#1088#1080#1076#1080#1095#1077#1089#1082#1086#1077' '#1083#1080#1094#1086
  ClientHeight = 480
  ClientWidth = 768
  Position = poDesktopCenter
  OnCreate = FormCreate
  ExplicitWidth = 784
  ExplicitHeight = 518
  PixelsPerInch = 96
  TextHeight = 13
  inherited img1: TImage
    Left = 583
    Top = 61
    Visible = False
    ExplicitLeft = 596
    ExplicitTop = 8
  end
  object Label5: TLabel [1]
    Left = 499
    Top = 365
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
  object Label6: TLabel [2]
    Left = 546
    Top = 125
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
  inline FrameClientExtUr: TFrameClientExtUr [3]
    Left = 2
    Top = 72
    Width = 470
    Height = 329
    TabOrder = 7
    ExplicitLeft = 2
    ExplicitTop = 72
    ExplicitWidth = 470
    ExplicitHeight = 329
    inherited Label1: TLabel
      Top = 38
      ExplicitTop = 38
    end
    inherited Label2: TLabel
      Left = 216
      Top = 37
      ExplicitLeft = 216
      ExplicitTop = 37
    end
    inherited Label3: TLabel
      Left = 248
      Top = 244
      ExplicitLeft = 248
      ExplicitTop = 244
    end
    inherited Label5: TLabel
      Left = 248
      Top = 266
      ExplicitLeft = 248
      ExplicitTop = 266
    end
    inherited Label6: TLabel
      Left = 248
      Top = 289
      ExplicitLeft = 248
      ExplicitTop = 289
    end
    inherited cxDBMaskEdit3: TcxDBMaskEdit [5]
      Left = 280
      Top = 263
      Properties.EditMask = '\d\d\d\d '#39' '#39' \d\d '#39' '#39' \d\d\d'
      TabOrder = 3
      ExplicitLeft = 280
      ExplicitTop = 263
    end
    inherited cxDBMaskEdit4: TcxDBMaskEdit [6]
      Left = 280
      Top = 286
      Properties.EditMask = '\d '#39' '#39' \d\d '#39' '#39' \d\d '#39' '#39' \d\d\d\d\d '#39' '#39' \d'
      TabOrder = 4
      ExplicitLeft = 280
      ExplicitTop = 286
    end
    inherited cmbForma: TcxDBLookupComboBox [7]
      Left = 95
      Top = 35
      TabOrder = 0
      ExplicitLeft = 95
      ExplicitTop = 35
      ExplicitWidth = 100
      Width = 100
    end
    inherited cmbSfera: TcxDBLookupComboBox [8]
      Left = 255
      Top = 35
      TabOrder = 2
      ExplicitLeft = 255
      ExplicitTop = 35
      ExplicitWidth = 113
      Width = 113
    end
    inherited FrameRekvizits: TFrameRekvizits [9]
      Left = 5
      Top = 200
      ExplicitLeft = 5
      ExplicitTop = 200
      inherited RzGroupBox1: TRzGroupBox
        Height = 129
        ExplicitHeight = 129
      end
    end
    inherited cxDBMaskEdit1: TcxDBMaskEdit [10]
      Left = 280
      Top = 241
      Properties.EditMask = '\d\d '#39' '#39' \d\d '#39' '#39' \d\d\d\d\d '#39' '#39' \d'
      TabOrder = 1
      ExplicitLeft = 280
      ExplicitTop = 241
    end
    inherited Query_upd: TIBUpdateSQL
      Left = 688
      Top = 168
    end
    inherited Query: TIBQuery
      Left = 688
      Top = 144
    end
    inherited DS: TDataSource
      Left = 688
      Top = 192
    end
  end
  inherited RzPanel1: TRzPanel
    Top = 436
    Width = 768
    TabOrder = 6
    ExplicitTop = 436
    ExplicitWidth = 768
    inherited Image2: TImage
      Left = 50
      Top = 6
      ExplicitLeft = 57
      ExplicitTop = 6
    end
    inherited Exit_bnt: TRzButton
      Left = 639
      OnClick = Exit_bntClick
      ExplicitLeft = 639
    end
    object butOK: TRzButton
      Left = 500
      Top = 9
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
      TabOrder = 1
      ThemeAware = False
      OnClick = butOKClick
    end
  end
  object RzGroupBox1: TRzGroupBox
    Left = 8
    Top = 127
    Width = 293
    Height = 145
    Caption = #1056#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1100
    TabOrder = 1
    inline FramePerson: TFramePersonSmall
      Left = 0
      Top = 12
      Width = 290
      Height = 130
      TabOrder = 0
      ExplicitTop = 12
      ExplicitHeight = 130
      inherited RzPanel1: TRzPanel
        Top = 2
        Height = 132
        ExplicitTop = 2
        ExplicitHeight = 132
        inherited Label8: TLabel
          Visible = False
        end
        inherited Label1: TLabel
          Visible = False
        end
        inherited Label4: TLabel
          Left = 7
          Top = 90
          ExplicitLeft = 7
          ExplicitTop = 90
        end
        inherited edtCitizen: TcxDBTextEdit
          Visible = False
        end
        inherited cmbDateBirth: TcxDBDateEdit
          Top = 82
          Visible = False
          ExplicitTop = 82
        end
        inherited cmbSex: TcxDBComboBox
          Visible = False
        end
        inherited cmbProf: TcxDBLookupComboBox
          Top = 86
          Properties.ListSource = DataModuleMain.DsDicCliProfs
          ExplicitTop = 86
          ExplicitWidth = 218
          Width = 218
        end
      end
      inherited Query_upd: TIBUpdateSQL
        RefreshSQL.Strings = (
          
            'select name, surname, family, date_birth, sex, prof_id from PERS' +
            'ONS where id = :ID')
        DeleteSQL.Strings = (
          'delete from PERSONS where id= :ID')
      end
    end
  end
  object RzPanel4: TRzPanel
    Left = 253
    Top = 273
    Width = 239
    Height = 31
    BorderSides = []
    TabOrder = 3
    object Label4: TLabel
      Left = 0
      Top = 7
      Width = 24
      Height = 13
      Caption = 'Email'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object cxDBTextEdit2: TcxDBTextEdit
      Left = 27
      Top = 4
      AutoSize = False
      BeepOnEnter = False
      DataBinding.DataField = 'EMAIL'
      DataBinding.DataSource = DS
      Properties.MaxLength = 0
      Properties.ValidationOptions = [evoShowErrorIcon]
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
      TabOrder = 0
      Height = 21
      Width = 182
    end
  end
  object RzPanel5: TRzPanel
    Left = 8
    Top = 407
    Width = 536
    Height = 26
    BorderSides = []
    TabOrder = 4
    object Label14: TLabel
      Left = -2
      Top = 3
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
    object Comments_memo: TcxDBMemo
      Left = 68
      Top = 0
      DataBinding.DataField = 'COMMENT'
      DataBinding.DataSource = DS
      Properties.MaxLength = 0
      Properties.ValidationOptions = [evoShowErrorIcon]
      TabOrder = 0
      Height = 23
      Width = 459
    end
  end
  inline FrameAddress: TFrameKladrAdrFull
    Left = 435
    Top = 0
    Width = 332
    Height = 73
    TabOrder = 0
    Visible = False
    ExplicitLeft = 435
    ExplicitWidth = 332
    inherited Label1: TLabel
      Top = 30
      ExplicitTop = 30
    end
    inherited Label2: TLabel
      Top = 53
      ExplicitTop = 53
    end
    inherited btnEdit: TRzBitBtn
      Left = 270
      Top = 11
      Width = 41
      Height = 31
      Layout = blGlyphTop
      ExplicitLeft = 270
      ExplicitTop = 11
      ExplicitWidth = 41
      ExplicitHeight = 31
    end
    inherited edtRegion: TcxTextEdit
      Left = 63
      ExplicitLeft = 63
      ExplicitWidth = 200
      Width = 200
    end
    inherited edtSite: TcxTextEdit
      Left = 63
      ExplicitLeft = 63
      ExplicitWidth = 200
      Width = 200
    end
    inherited edtAddress: TcxTextEdit
      Left = 63
      Top = 50
      ExplicitLeft = 63
      ExplicitTop = 50
      ExplicitWidth = 266
      Width = 266
    end
  end
  inline FrameUslugi: TFrameUslugi
    Left = 310
    Top = 133
    Width = 217
    Height = 104
    TabOrder = 5
    ExplicitLeft = 310
    ExplicitTop = 133
    ExplicitWidth = 217
    ExplicitHeight = 104
    inherited grpPhone: TRzGroupBox
      Top = -3
      Width = 214
      Height = 107
      ExplicitTop = -3
      ExplicitWidth = 214
      ExplicitHeight = 107
      inherited grdPhone: TcxGrid
        Top = 14
        Width = 205
        Height = 65
        ExplicitTop = 14
        ExplicitWidth = 205
        ExplicitHeight = 65
        inherited grdPhoneDBTableView1: TcxGridDBTableView
          OptionsView.Header = False
          inherited grdPhoneDBTableView1Column1: TcxGridDBColumn
            MinWidth = 200
            Options.Grouping = False
            Options.HorzSizing = False
            Width = 200
            IsCaptionAssigned = True
          end
        end
      end
      inherited RzPanel2: TRzPanel
        Top = 79
        Width = 212
        Height = 27
        ExplicitTop = 79
        ExplicitWidth = 212
        ExplicitHeight = 27
        inherited btnAdd: TRzBitBtn
          Left = 3
          Top = -1
          ExplicitLeft = 3
          ExplicitTop = -1
        end
        inherited btnEdit: TRzBitBtn
          Top = 0
          ExplicitTop = 0
        end
        inherited btnDel: TRzBitBtn
          Left = 175
          Top = -1
          Width = 32
          ExplicitLeft = 175
          ExplicitTop = -1
          ExplicitWidth = 32
        end
      end
    end
  end
  object cmbWorker: TcxDBLookupComboBox
    Left = 588
    Top = 368
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
    TabOrder = 8
    Width = 172
  end
  object RzPanel2: TRzPanel
    Left = 1
    Top = 0
    Width = 425
    Height = 86
    BorderSides = []
    TabOrder = 9
    DesignSize = (
      425
      86)
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
    object Label8: TLabel
      Left = 5
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
    object Label9: TLabel
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
    object Label10: TLabel
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
    object Label11: TLabel
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
    object cxDBLookupComboBox1: TcxDBLookupComboBox
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
      Properties.OnCloseUp = cmbWorkerPropertiesCloseUp
      Properties.OnPopup = cmbWorkerPropertiesPopup
      TabOrder = 2
      Width = 162
    end
    object cxDBTextEdit1: TcxDBTextEdit
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
    object cxDBLookupComboBox2: TcxDBLookupComboBox
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
    object cxDBLookupComboBox3: TcxDBLookupComboBox
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
    object cxDBLookupComboBox4: TcxDBLookupComboBox
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
  inline FramePhones: TFramePhones
    Left = 493
    Top = 235
    Width = 267
    Height = 127
    TabOrder = 10
    ExplicitLeft = 493
    ExplicitTop = 235
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
          Top = 32
          ExplicitTop = 32
        end
        inherited btnDel: TRzBitBtn
          Top = 63
          ExplicitTop = 63
        end
      end
    end
  end
  object cxDBMemo1: TcxDBMemo
    Left = 545
    Top = 138
    DataBinding.DataField = 'goods'
    DataBinding.DataSource = DS
    TabOrder = 11
    Height = 89
    Width = 215
  end
  object RzPanel3: TRzPanel
    Left = 6
    Top = 79
    Width = 466
    Height = 24
    BorderSides = []
    TabOrder = 2
    object Label3: TLabel
      Left = 0
      Top = 7
      Width = 149
      Height = 16
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object txtName: TcxDBTextEdit
      Left = 178
      Top = 4
      BeepOnEnter = False
      DataBinding.DataField = 'NAME'
      DataBinding.DataSource = DS
      Properties.MaxLength = 0
      Properties.ValidationOptions = [evoShowErrorIcon]
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
      TabOrder = 0
      Width = 272
    end
  end
  object DS: TDataSource
    OnDataChange = DSDataChange
    Left = 200
    Top = 326
  end
  object QCheck: TIBQuery
    Database = DataModuleMain.DB
    Transaction = DataModuleMain.DefTr
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select id, name from clients where name = :name and act=1')
    Left = 272
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'name'
        ParamType = ptUnknown
      end>
  end
end
