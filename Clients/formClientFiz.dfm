inherited frmClientFiz: TfrmClientFiz
  Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1082#1083#1080#1077#1085#1090#1072'. '#1060#1080#1079'. '#1083#1080#1094#1086
  ClientHeight = 353
  ClientWidth = 734
  Position = poDesktopCenter
  OnCreate = FormCreate
  ExplicitWidth = 750
  ExplicitHeight = 391
  PixelsPerInch = 96
  TextHeight = 13
  inherited img1: TImage
    Left = 600
    Top = 267
    Width = 126
    Height = 40
    ExplicitLeft = 600
    ExplicitTop = 280
    ExplicitWidth = 126
    ExplicitHeight = 40
  end
  object Label14: TLabel [1]
    Left = 8
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
    Top = 8
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
    Top = 9
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
    Top = 309
    Width = 734
    ExplicitTop = 297
    ExplicitWidth = 717
    inherited Exit_bnt: TRzButton
      Left = 600
      ExplicitLeft = 583
    end
  end
  object ID_edt: TcxDBTextEdit
    Left = 535
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
    ExplicitWidth = 82
    Width = 21
  end
  object Comments_memo: TcxDBMemo
    Left = 81
    Top = 232
    DataBinding.DataField = 'COMMENTS'
    Properties.MaxLength = 0
    Properties.ValidationOptions = [evoShowErrorIcon]
    TabOrder = 2
    Height = 31
    Width = 392
  end
  inline FramePersonFull1: TFramePersonFull
    Left = 0
    Top = 0
    Width = 733
    Height = 172
    TabOrder = 5
    inherited FramePhones1: TFramePhones
      Left = 288
      Top = 31
      Height = 105
      ExplicitLeft = 288
      ExplicitTop = 31
      ExplicitHeight = 105
      inherited grpPhone: TRzGroupBox
        Top = -2
        Height = 107
        ExplicitTop = -2
        ExplicitHeight = 107
        inherited grdPhone: TcxGrid
          Height = 88
          ExplicitHeight = 88
        end
        inherited RzPanel2: TRzPanel
          Height = 92
          ExplicitHeight = 123
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
    inherited FrameAddress1: TFrameKLADR
      inherited Adres_memo: TcxDBMemo
        ExplicitWidth = 364
        Width = 364
      end
      inherited btnEdit: TRzBitBtn
        Left = 476
        ExplicitLeft = 476
      end
    end
    inherited RzPanel1: TRzPanel
      ExplicitHeight = 135
    end
  end
  object cmbFormat: TcxDBLookupComboBox
    Left = 439
    Top = 4
    DataBinding.DataField = 'FORMAT_ID'
    DataBinding.DataSource = DS
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
    TabOrder = 3
    Width = 68
  end
  object cmbStatus: TcxDBLookupComboBox
    Left = 327
    Top = 5
    DataBinding.DataField = 'STATUS_ID'
    DataBinding.DataSource = DS
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
    TabOrder = 4
    Width = 62
  end
  inline FrameKLADRAdrRegion1: TFrameKLADRAdrRegion
    Left = 8
    Top = 166
    Width = 507
    Height = 62
    TabOrder = 6
    ExplicitLeft = 8
    ExplicitTop = 166
    inherited Adres_memo: TcxDBMemo
      ExplicitWidth = 425
      Width = 425
    end
    inherited btnEdit: TRzBitBtn
      Left = 468
      Width = 28
      ExplicitLeft = 468
      ExplicitWidth = 28
    end
    inherited cxDBMemo2: TcxDBMemo
      ExplicitWidth = 177
      Width = 177
    end
  end
  inline FrameUslugi1: TFrameUslugi
    Left = 514
    Top = 144
    Width = 216
    Height = 122
    TabOrder = 7
    ExplicitLeft = 514
    ExplicitTop = 144
    ExplicitWidth = 216
  end
  object DS: TDataSource
    Left = 480
    Top = 311
  end
end
