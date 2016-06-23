inherited frmClientUr: TfrmClientUr
  Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1082#1083#1080#1077#1085#1090#1072'. '#1070#1088#1080#1076#1080#1095#1077#1089#1082#1086#1077' '#1083#1080#1094#1086
  ClientHeight = 384
  ClientWidth = 775
  Position = poDesktopCenter
  OnCreate = FormCreate
  ExplicitWidth = 791
  ExplicitHeight = 422
  PixelsPerInch = 96
  TextHeight = 13
  inherited img1: TImage
    Left = 590
    Top = -35
    Visible = False
    ExplicitLeft = 596
    ExplicitTop = 8
  end
  object Label5: TLabel [1]
    Left = 8
    Top = 317
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
  inline FrameClientExtUr: TFrameClientExtUr [2]
    Left = 0
    Top = -2
    Width = 773
    Height = 310
    TabOrder = 9
    ExplicitTop = -2
    ExplicitWidth = 773
    ExplicitHeight = 310
    inherited Label1: TLabel
      Left = 8
      Top = 12
      ExplicitLeft = 8
      ExplicitTop = 12
    end
    inherited Label2: TLabel
      Left = 385
      Top = 37
      ExplicitLeft = 385
      ExplicitTop = 37
    end
    inherited Label3: TLabel
      Left = 553
      Top = 136
      ExplicitLeft = 553
      ExplicitTop = 136
    end
    inherited Label5: TLabel
      Left = 553
      Top = 158
      ExplicitLeft = 553
      ExplicitTop = 158
    end
    inherited Label6: TLabel
      Left = 553
      Top = 181
      ExplicitLeft = 553
      ExplicitTop = 181
    end
    inherited cxDBMaskEdit3: TcxDBMaskEdit [5]
      Left = 585
      Top = 155
      Properties.EditMask = '\d\d\d\d '#39' '#39' \d\d '#39' '#39' \d\d\d'
      TabOrder = 3
      ExplicitLeft = 585
      ExplicitTop = 155
    end
    inherited cxDBMaskEdit4: TcxDBMaskEdit [6]
      Left = 585
      Top = 178
      Properties.EditMask = '\d '#39' '#39' \d\d '#39' '#39' \d\d '#39' '#39' \d\d\d\d\d '#39' '#39' \d'
      TabOrder = 4
      ExplicitLeft = 585
      ExplicitTop = 178
    end
    inherited cmbForma: TcxDBLookupComboBox [7]
      Left = 100
      Top = 9
      TabOrder = 0
      ExplicitLeft = 100
      ExplicitTop = 9
      ExplicitWidth = 100
      Width = 100
    end
    inherited cmbSfera: TcxDBLookupComboBox [8]
      Left = 424
      Top = 35
      TabOrder = 2
      ExplicitLeft = 424
      ExplicitTop = 35
      ExplicitWidth = 113
      Width = 113
    end
    inherited FrameRekvizits: TFrameRekvizits [9]
      Left = 553
      Top = 2
      ExplicitLeft = 553
      ExplicitTop = 2
      inherited RzGroupBox1: TRzGroupBox
        Height = 129
        ExplicitHeight = 129
      end
    end
    inherited cxDBMaskEdit1: TcxDBMaskEdit [10]
      Left = 585
      Top = 133
      Properties.EditMask = '\d\d '#39' '#39' \d\d '#39' '#39' \d\d\d\d\d '#39' '#39' \d'
      TabOrder = 1
      ExplicitLeft = 585
      ExplicitTop = 133
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
    Top = 340
    Width = 775
    TabOrder = 8
    ExplicitTop = 310
    ExplicitWidth = 724
    inherited Image2: TImage
      Left = 57
      Top = 6
      ExplicitTop = 6
    end
    inherited Exit_bnt: TRzButton
      Left = 646
      OnClick = Exit_bntClick
      ExplicitLeft = 595
    end
    object butOK: TRzButton
      Left = 507
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
      ExplicitLeft = 456
    end
  end
  object RzGroupBox1: TRzGroupBox
    Left = 2
    Top = 65
    Width = 293
    Height = 145
    Caption = #1056#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1100
    TabOrder = 2
    inline FramePerson: TFramePersonSmall
      Left = 0
      Top = 12
      Width = 290
      Height = 130
      TabOrder = 0
      ExplicitTop = 12
      ExplicitHeight = 130
      inherited RzPanel1: TRzPanel
        Left = 3
        Height = 132
        ExplicitLeft = 3
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
  object RzPanel2: TRzPanel
    Left = 224
    Top = 0
    Width = 318
    Height = 28
    BorderSides = []
    TabOrder = 1
    object Label2: TLabel
      Left = 156
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
      Left = 1
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
      Left = 200
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
      Width = 113
    end
    object cmbStatus: TcxDBLookupComboBox
      Left = 48
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
  object RzPanel3: TRzPanel
    Left = 2
    Top = 27
    Width = 364
    Height = 41
    BorderSides = []
    TabOrder = 3
    object Label3: TLabel
      Left = 6
      Top = 4
      Width = 76
      Height = 26
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
      Left = 87
      Top = 7
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
  inline FramePhones: TFramePhones
    Left = 300
    Top = 65
    Width = 238
    Height = 146
    TabOrder = 4
    ExplicitLeft = 300
    ExplicitTop = 65
    ExplicitWidth = 238
    ExplicitHeight = 146
    inherited grpPhone: TRzGroupBox
      Top = -1
      Width = 234
      Height = 123
      ExplicitTop = -1
      ExplicitWidth = 234
      ExplicitHeight = 123
      inherited grdPhone: TcxGrid
        Width = 198
        Height = 96
        ExplicitWidth = 153
        ExplicitHeight = 96
        inherited grdPhoneDBTableView2: TcxGridDBTableView
          inherited grdPhoneDBTableView2Column4: TcxGridDBColumn
            Options.Editing = False
            Options.Filtering = False
            Options.FilteringAddValueItems = False
            Options.FilteringFilteredItemsList = False
            Options.FilteringMRUItemsList = False
            Options.FilteringPopup = False
            Options.FilteringPopupMultiSelect = False
            Options.IncSearch = False
          end
          inherited grdPhoneDBTableView2Column2: TcxGridDBColumn
            Width = 80
          end
          inherited grdPhoneDBTableView2Column5: TcxGridDBColumn
            Width = 34
          end
          inherited grdPhoneDBTableView2Column3: TcxGridDBColumn
            Width = 28
          end
        end
      end
      inherited RzPanel2: TRzPanel
        Left = 202
        Height = 108
        ExplicitLeft = 157
        ExplicitHeight = 108
        inherited btnEdit: TRzBitBtn
          Top = 30
          ExplicitTop = 30
        end
        inherited btnDel: TRzBitBtn
          Top = 71
          Width = 29
          ExplicitTop = 71
          ExplicitWidth = 29
        end
      end
    end
  end
  object RzPanel4: TRzPanel
    Left = 304
    Top = 184
    Width = 239
    Height = 31
    BorderSides = []
    TabOrder = 5
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
      Width = 206
    end
  end
  object RzPanel5: TRzPanel
    Left = 8
    Top = 275
    Width = 536
    Height = 32
    BorderSides = []
    TabOrder = 6
    object Label14: TLabel
      Left = 1
      Top = 13
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
      Left = 71
      Top = 10
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
    Left = 6
    Top = 210
    Width = 533
    Height = 73
    TabOrder = 0
    Visible = False
    ExplicitLeft = 6
    ExplicitTop = 210
    ExplicitWidth = 533
    inherited Label1: TLabel
      Top = 30
      ExplicitTop = 30
    end
    inherited Label2: TLabel
      Top = 53
      ExplicitTop = 53
    end
    inherited btnEdit: TRzBitBtn
      Top = 11
      Width = 41
      Height = 31
      Layout = blGlyphTop
      ExplicitTop = 11
      ExplicitWidth = 41
      ExplicitHeight = 31
    end
    inherited edtRegion: TcxTextEdit
      Left = 63
      ExplicitLeft = 63
    end
    inherited edtSite: TcxTextEdit
      Left = 63
      ExplicitLeft = 63
    end
    inherited edtAddress: TcxTextEdit
      Left = 63
      Top = 50
      ExplicitLeft = 63
      ExplicitTop = 50
      ExplicitWidth = 468
      Width = 468
    end
  end
  inline FrameUslugi: TFrameUslugi
    Left = 553
    Top = 201
    Width = 217
    Height = 104
    TabOrder = 7
    ExplicitLeft = 553
    ExplicitTop = 201
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
    Left = 150
    Top = 314
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
    TabOrder = 10
    Width = 178
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
