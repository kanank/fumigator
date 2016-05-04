inherited frmEditPhone: TfrmEditPhone
  Caption = #1053#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072
  ClientHeight = 107
  ClientWidth = 168
  OnShow = FormShow
  ExplicitWidth = 174
  ExplicitHeight = 135
  PixelsPerInch = 96
  TextHeight = 13
  inherited lblData: TLabel
    Visible = False
  end
  object Label2: TLabel [1]
    Left = 8
    Top = 51
    Width = 18
    Height = 13
    Caption = #1058#1080#1087
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  inherited edtData: TcxDBMaskEdit
    Top = 24
    DataBinding.DataField = 'PHONE'
    Properties.BeepOnError = True
    Properties.EditMask = '!\(999\)000\-00\-00;0;_'
    Properties.ReadOnly = True
    ExplicitTop = 24
    ExplicitWidth = 150
    Width = 150
  end
  inherited btnOK: TRzButton
    Left = 7
    Top = 75
    Anchors = [akTop]
    ExplicitLeft = 7
    ExplicitTop = 75
  end
  inherited bntCancel: TRzButton
    Left = 88
    Top = 75
    Anchors = [akTop]
    ExplicitLeft = 88
    ExplicitTop = 75
  end
  object chbkIsMain: TcxDBCheckBox [5]
    Left = 5
    Top = 2
    AutoSize = False
    Caption = #1054#1089#1085#1086#1074#1085#1086#1081' '#1085#1086#1084#1077#1088
    DataBinding.DataField = 'ISMAIN'
    DataBinding.DataSource = DS
    ParentShowHint = False
    Properties.DisplayChecked = '1'
    Properties.DisplayUnchecked = '0'
    Properties.ValueChecked = '1'
    Properties.ValueUnchecked = '0'
    ShowHint = True
    TabOrder = 3
    Transparent = True
    Height = 21
    Width = 121
  end
  object cmbPhoneType: TcxDBLookupComboBox [6]
    Left = 43
    Top = 48
    DataBinding.DataField = 'PHONE_TYPE_ID'
    DataBinding.DataSource = DS
    Properties.KeyFieldNames = 'ID'
    Properties.ListColumns = <
      item
        FieldName = 'NAME'
      end>
    Properties.ListOptions.GridLines = glNone
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DataModuleMain.DsDicPhoneType
    TabOrder = 4
    Width = 117
  end
  inherited DS: TDataSource
    Left = 133
  end
end
