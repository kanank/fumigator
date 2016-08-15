inherited frmSmallCard: TfrmSmallCard
  Caption = #1050#1088#1072#1090#1082#1072#1103' '#1082#1072#1088#1090#1086#1095#1082#1072'. '#1053#1086#1074#1099#1081' '#1082#1083#1080#1077#1085#1090
  ClientHeight = 315
  Position = poDesktopCenter
  ExplicitWidth = 657
  ExplicitHeight = 353
  PixelsPerInch = 96
  TextHeight = 13
  inherited img1: TImage
    Top = -43
  end
  object Label7: TLabel [1]
    Left = 5
    Top = 97
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
  object Label1: TLabel [2]
    Left = 8
    Top = 71
    Width = 44
    Height = 13
    Caption = #1058#1077#1083#1077#1092#1086#1085
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel [3]
    Left = 316
    Top = 12
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
  object Label4: TLabel [4]
    Left = 319
    Top = 166
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
    Top = 271
    inherited Image2: TImage
      Visible = False
    end
    inherited Exit_bnt: TRzButton
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    end
    object RzBitBtn1: TRzBitBtn
      Left = 6
      Top = 8
      Width = 163
      Height = 29
      Caption = #1055#1086#1076#1088#1086#1073#1085#1072#1103' '#1082#1072#1088#1090#1086#1095#1082#1072
      TabOrder = 1
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000003000000090000000A0000
        0003000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000010000000D552C19A64E2916A40000
        000D000000010000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000623130B54A77053FD9E6443FD2011
        0A54000000060000000000000000000000000000000000000000000000000000
        000000000000000000000000000204020117814A2EDEDFBF9BFFD4AC7EFF7942
        26DF030201180000000200000000000000000000000000000000000000000000
        00000000000000000001000000094D2D1C90C69D7FFFDFB987FFDFB785FFBA87
        5FFF472617910000000A00000001000000000000000000000000000000000000
        00000000000000000004180F0A3AA87252FBE5C89FFFDCB27AFFDCB17BFFE0BC
        8EFF9C6140FB160C073B00000004000000000000000000000000000000000000
        0000000000010000000C7E4E32CCDDBFA0FFDFB783FFDDB37DFFDDB37DFFDFB6
        82FFD2AB80FF714027CD0000000D000000020000000000000000000000000000
        000000000006452C1E78C69D7FFFE4C394FFDEB680FFDFB680FFDEB67FFFDEB5
        7FFFE3BF8FFFB8855FFF3E241679000000070000000000000000000000000000
        0002120C0828AA7758F3E9CEAAFFE4C290FFE5C794FFE8CA98FFE8CA99FFE6C5
        93FFE3C18DFFE2C193FF996141F31009062A0000000300000000000000000000
        0006795339B6E0C7ADFFF9F1E0FFFAF2E2FFFAF2E2FFEBD3A3FFECD2A3FFF1DD
        B7FFF0DDB7FFF9F1E0FFDBBEA6FF6B4028B80000000700000000000000000000
        0006C1906AFFC18E68FFC08C66FFBE8A64FFFBF5E5FFEFDAACFFEFD9ACFFF3E2
        BEFFB9805AFFB77E58FFB77C55FFB57A54FF0000000800000000000000000000
        000200000006000000070000000DC08D68FFFBF7E9FFF2E1B4FFF2E1B4FFF5E9
        C5FFB27753FF0000001000000009000000070000000200000000000000000000
        0000000000000000000000000007C3926CFFFCF8EBFFF5E8BCFFF5E7BCFFF8EE
        CCFFB47C56FF0000000800000000000000000000000000000000000000000000
        0000000000000000000000000005C59570FFFDFAEDFFFDFAEDFFFDFAEDFFFDFA
        EDFFB67F5AFF0000000600000000000000000000000000000000000000000000
        000000000000000000000000000393755CBACDA37EFFCBA17DFFCAA07BFFC99D
        79FF8C6A50BB0000000400000000000000000000000000000000000000000000
        0000000000000000000000000001000000020000000400000004000000040000
        0004000000030000000100000000000000000000000000000000}
      Layout = blGlyphRight
    end
  end
  object cxDBLookupComboBox2: TcxDBLookupComboBox
    Left = 67
    Top = 100
    DataBinding.DataField = 'AREA_ID'
    Properties.KeyFieldNames = 'ID'
    Properties.ListColumns = <
      item
        FieldName = 'NAME'
      end>
    Properties.ListOptions.GridLines = glNone
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DataModuleMain.DsDicAreaVolume
    Properties.ReadOnly = False
    TabOrder = 1
    Width = 88
  end
  object cxDBLookupComboBox3: TcxDBLookupComboBox
    Left = 161
    Top = 100
    DataBinding.DataField = 'AREA_UNIT_ID'
    Properties.KeyFieldNames = 'ID'
    Properties.ListColumns = <
      item
        FieldName = 'NAME'
      end>
    Properties.ListOptions.GridLines = glNone
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DataModuleMain.DsDicUnits
    Properties.ReadOnly = False
    TabOrder = 2
    Width = 46
  end
  object edtPhone: TcxMaskEdit
    Left = 67
    Top = 66
    AutoSize = False
    ParentFont = False
    Properties.AlwaysShowBlanksAndLiterals = True
    Properties.EditMask = '\(999\)000\-00\-00;0;'#9618
    Properties.ReadOnly = True
    Properties.ValidationOptions = [evoShowErrorIcon, evoAllowLoseFocus]
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 3
    Text = '          '
    Height = 23
    Width = 188
  end
  object cmbRegion: TcxDBLookupComboBox
    Left = 356
    Top = 8
    DataBinding.DataField = 'REGION_ID'
    Properties.KeyFieldNames = 'REGION_ID'
    Properties.ListColumns = <
      item
        FieldName = 'NAME'
      end>
    Properties.ListOptions.GridLines = glNone
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DataModuleMain.DsDicRegions
    Properties.ReadOnly = False
    TabOrder = 4
    Width = 162
  end
  inline FrameUslugi: TFrameUslugi
    Left = 316
    Top = 35
    Width = 205
    Height = 125
    TabOrder = 5
    ExplicitLeft = 316
    ExplicitTop = 35
    ExplicitWidth = 205
    ExplicitHeight = 125
    inherited grpPhone: TRzGroupBox
      Left = 3
      Width = 202
      Height = 121
      ExplicitLeft = 3
      ExplicitWidth = 202
      ExplicitHeight = 121
      DesignSize = (
        202
        121)
      inherited grdPhone: TcxGrid
        Width = 192
        Height = 68
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
        Top = 90
        Width = 200
        Height = 30
        ExplicitTop = 97
        ExplicitWidth = 199
        ExplicitHeight = 30
        inherited btnDel: TRzBitBtn
          Left = 163
          ExplicitLeft = 162
        end
      end
    end
  end
  object cxDBMemo1: TcxDBMemo
    Left = 319
    Top = 179
    DataBinding.DataField = 'goods'
    TabOrder = 6
    Height = 70
    Width = 185
  end
end
