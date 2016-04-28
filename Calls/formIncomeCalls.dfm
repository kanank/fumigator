inherited frmIncomeCall: TfrmIncomeCall
  Caption = 'frmIncomeCall'
  PixelsPerInch = 96
  TextHeight = 13
  inherited img1: TImage
    Left = 568
    Width = 73
    Height = 25
    Visible = False
    ExplicitLeft = 568
    ExplicitWidth = 73
    ExplicitHeight = 25
  end
  object Label11: TLabel [1]
    Left = 2
    Top = 8
    Width = 88
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edtPhone: TcxDBMaskEdit
    Left = 96
    Top = 5
    DataBinding.DataField = 'PHONE'
    DataBinding.DataSource = DS
    Enabled = False
    Properties.EditMask = '!\(999\)000-0000;1;_'
    Properties.ValidationOptions = [evoRaiseException, evoShowErrorIcon]
    StyleDisabled.BorderColor = clInfoText
    StyleDisabled.TextColor = clMenuText
    TabOrder = 1
    Width = 129
  end
  object RzGroupBox1: TRzGroupBox
    Left = 4
    Top = 27
    Width = 551
    Height = 249
    Caption = #1044#1072#1085#1085#1099#1077' '#1086' '#1082#1083#1080#1077#1085#1090#1077
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -11
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = [fsBold]
    TabOrder = 2
    object Label1: TLabel
      Left = 10
      Top = 98
      Width = 83
      Height = 13
      Caption = #1060#1086#1088#1084#1072#1090' '#1082#1083#1080#1077#1085#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 10
      Top = 123
      Width = 81
      Height = 13
      Caption = #1057#1090#1072#1090#1091#1089' '#1082#1083#1080#1077#1085#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    inline FramePerson: TFramePersonSmall
      Left = 1
      Top = 15
      Width = 227
      Height = 82
      TabOrder = 0
      ExplicitLeft = 1
      ExplicitTop = 15
      ExplicitWidth = 227
      ExplicitHeight = 82
      inherited RzPanel1: TRzPanel
        Width = 349
        Height = 87
        ExplicitWidth = 301
        ExplicitHeight = 87
        inherited edtCitizen: TcxDBTextEdit
          Width = 212
        end
        inherited cmbDateBirth: TcxDBDateEdit
          Width = 128
        end
        inherited edtSurName: TcxDBTextEdit
          Left = 97
          ExplicitLeft = 97
          ExplicitWidth = 282
          Width = 282
        end
        inherited edtName: TcxDBTextEdit
          Left = 97
          ExplicitLeft = 97
          ExplicitWidth = 282
          Width = 282
        end
        inherited edtFamily: TcxDBTextEdit
          Left = 97
          ExplicitLeft = 97
          ExplicitWidth = 282
          Width = 282
        end
      end
    end
    object cmbFormat: TcxDBLookupComboBox
      Left = 99
      Top = 96
      DataBinding.DataField = 'FORMAT_ID'
      DataBinding.DataSource = DS
      Properties.GridMode = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NAME'
        end>
      Properties.ListOptions.GridLines = glNone
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = DataModuleMain.DsFormatsCli
      Properties.ReadOnly = False
      TabOrder = 1
      Width = 128
    end
    object cmbStatus: TcxDBLookupComboBox
      Left = 100
      Top = 120
      DataBinding.DataField = 'STATUS_ID'
      DataBinding.DataSource = DS
      Properties.GridMode = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NAME'
        end>
      Properties.ListOptions.GridLines = glNone
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = DataModuleMain.DsDicStatusCli
      Properties.ReadOnly = False
      TabOrder = 2
      Width = 128
    end
  end
  object DS: TDataSource
    Left = 392
    Top = 306
  end
end
