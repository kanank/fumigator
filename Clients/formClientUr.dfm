inherited frmClientUr: TfrmClientUr
  Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1082#1083#1080#1077#1085#1090#1072'. '#1070#1088#1080#1076#1080#1095#1077#1089#1082#1086#1077' '#1083#1080#1094#1086
  ClientHeight = 354
  ClientWidth = 724
  Position = poDesktopCenter
  ExplicitWidth = 740
  ExplicitHeight = 392
  PixelsPerInch = 96
  TextHeight = 13
  inherited img1: TImage
    Left = 539
    Top = -65
    Visible = False
    ExplicitLeft = 596
    ExplicitTop = 8
  end
  inherited RzPanel1: TRzPanel
    Top = 310
    Width = 724
    inherited Exit_bnt: TRzButton
      Left = 595
      ExplicitLeft = 595
    end
    object butOK: TRzButton
      Left = 456
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
    end
  end
  inline FrameClientExtUr1: TFrameClientExtUr
    Left = 0
    Top = -3
    Width = 773
    Height = 310
    TabOrder = 1
    ExplicitTop = -3
    ExplicitWidth = 773
    ExplicitHeight = 310
    inherited Label2: TLabel
      Left = 357
      Top = 35
      ExplicitLeft = 357
      ExplicitTop = 35
    end
    inherited Label3: TLabel
      Left = 501
      Top = 143
      ExplicitLeft = 501
      ExplicitTop = 143
    end
    inherited Label5: TLabel
      Left = 501
      Top = 167
      ExplicitLeft = 501
      ExplicitTop = 167
    end
    inherited Label6: TLabel
      Left = 501
      Top = 191
      ExplicitLeft = 501
      ExplicitTop = 191
    end
    inherited cmbFormat: TcxDBLookupComboBox
      ExplicitWidth = 108
      Width = 108
    end
    inherited cxDBLookupComboBox1: TcxDBLookupComboBox
      Left = 396
      Top = 31
      ExplicitLeft = 396
      ExplicitTop = 31
      ExplicitWidth = 90
      Width = 90
    end
    inherited FrameBank1: TFrameBank
      Left = 501
      Top = 2
      ExplicitLeft = 501
      ExplicitTop = 2
    end
    inherited cxDBMaskEdit1: TcxDBMaskEdit
      Left = 533
      Top = 140
      DataBinding.DataSource = FrameClientExtUr1.FrameBank1.DS
      ExplicitLeft = 533
      ExplicitTop = 140
    end
    inherited cxDBMaskEdit3: TcxDBMaskEdit
      Left = 533
      Top = 164
      DataBinding.DataSource = FrameClientExtUr1.FrameBank1.DS
      ExplicitLeft = 533
      ExplicitTop = 164
    end
    inherited cxDBMaskEdit4: TcxDBMaskEdit
      Left = 533
      Top = 188
      DataBinding.DataSource = FrameClientExtUr1.FrameBank1.DS
      ExplicitLeft = 533
      ExplicitTop = 188
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
  object RzGroupBox1: TRzGroupBox
    Left = 3
    Top = 65
    Width = 293
    Height = 148
    Caption = #1056#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1100
    TabOrder = 2
    inline FramePersonSmall1: TFramePersonSmall
      Left = 0
      Top = 13
      Width = 290
      Height = 136
      TabOrder = 0
      ExplicitTop = 13
      inherited RzPanel1: TRzPanel
        Left = 3
        Top = 0
        ExplicitLeft = 3
        ExplicitTop = 0
      end
    end
  end
  object RzPanel2: TRzPanel
    Left = 224
    Top = -4
    Width = 268
    Height = 28
    BorderSides = []
    TabOrder = 3
    object Label1: TLabel
      Left = 3
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
    object Label2: TLabel
      Left = 133
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
    object cmbFormat: TcxDBLookupComboBox
      Left = 47
      Top = 6
      DataBinding.DataField = 'FORMAT_ID'
      DataBinding.DataSource = FrameClientExtUr1.DS
      Properties.DropDownListStyle = lsFixedList
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NAME'
        end>
      Properties.ListOptions.AnsiSort = True
      Properties.ListOptions.GridLines = glNone
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = DataModuleMain.DsFormatsCli
      TabOrder = 0
      Width = 68
    end
    object cxDBLookupComboBox1: TcxDBLookupComboBox
      Left = 172
      Top = 6
      DataBinding.DataField = 'FORMAT_ID'
      DataBinding.DataSource = FrameClientExtUr1.DS
      Properties.DropDownListStyle = lsFixedList
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
      Width = 90
    end
  end
  object RzPanel3: TRzPanel
    Left = 3
    Top = 26
    Width = 350
    Height = 41
    BorderSides = []
    TabOrder = 4
    object Label3: TLabel
      Left = 5
      Top = 4
      Width = 108
      Height = 30
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 82
      Top = 7
      BeepOnEnter = False
      DataBinding.DataField = 'PASE_CODE'
      Properties.MaxLength = 16
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
      Width = 254
    end
  end
  inline FramePhones1: TFramePhones
    Left = 300
    Top = 65
    Width = 199
    Height = 146
    TabOrder = 5
    ExplicitLeft = 300
    ExplicitTop = 65
    ExplicitWidth = 199
    ExplicitHeight = 146
    inherited grpPhone: TRzGroupBox
      Width = 189
      Height = 123
      ExplicitWidth = 189
      ExplicitHeight = 123
      inherited grdPhone: TcxGrid
        Width = 180
        Height = 96
        ExplicitWidth = 180
        ExplicitHeight = 96
      end
      inherited RzPanel2: TRzPanel
        Left = 157
        Height = 108
        ExplicitLeft = 157
        ExplicitHeight = 129
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
    Width = 190
    Height = 31
    BorderSides = []
    TabOrder = 6
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
      BeepOnEnter = False
      DataBinding.DataField = 'PASE_CODE'
      Properties.MaxLength = 16
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
      Width = 161
    end
  end
  inline FrameKLADRAdrRegion1: TFrameKLADRAdrRegion
    Left = 8
    Top = 214
    Width = 507
    Height = 62
    TabOrder = 7
    ExplicitLeft = 8
    ExplicitTop = 214
    inherited Adres_memo: TcxDBMemo
      ExplicitWidth = 411
      Width = 411
    end
    inherited btnEdit: TRzBitBtn
      Left = 451
      ExplicitLeft = 451
    end
    inherited cxDBMemo2: TcxDBMemo
      ExplicitWidth = 163
      Width = 163
    end
  end
  object RzPanel5: TRzPanel
    Left = 8
    Top = 275
    Width = 485
    Height = 32
    BorderSides = []
    TabOrder = 8
    object Label14: TLabel
      Left = 2
      Top = 7
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
      Left = 90
      Top = 4
      DataBinding.DataField = 'COMMENTS'
      Properties.MaxLength = 0
      Properties.ValidationOptions = [evoShowErrorIcon]
      TabOrder = 0
      Height = 23
      Width = 392
    end
  end
  inline FrameUslugi1: TFrameUslugi
    Left = 501
    Top = 207
    Width = 217
    Height = 100
    TabOrder = 9
    ExplicitLeft = 501
    ExplicitTop = 207
    ExplicitHeight = 100
    inherited grpPhone: TRzGroupBox
      Height = 96
      inherited grdPhone: TcxGrid
        Top = 15
        Height = 77
        ExplicitTop = 15
        ExplicitHeight = 77
      end
      inherited RzPanel2: TRzPanel
        Height = 81
        ExplicitTop = 15
        ExplicitHeight = 73
        inherited btnAdd: TRzBitBtn
          Top = 0
          Height = 23
          ExplicitTop = 0
          ExplicitHeight = 23
        end
        inherited btnEdit: TRzBitBtn
          Top = 22
          Height = 23
          ExplicitTop = 22
          ExplicitHeight = 23
        end
        inherited btnDel: TRzBitBtn
          Top = 55
          Height = 23
          ExplicitTop = 55
          ExplicitHeight = 23
        end
      end
    end
    inherited Query_upd: TIBUpdateSQL
      Top = 41
    end
    inherited Query: TIBQuery
      Top = 41
    end
    inherited DS: TDataSource
      Top = 41
    end
  end
end
