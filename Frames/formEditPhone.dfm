inherited frmEditPhone: TfrmEditPhone
  Caption = #1053#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072
  ClientHeight = 164
  ClientWidth = 168
  OnShow = FormShow
  ExplicitWidth = 174
  ExplicitHeight = 192
  PixelsPerInch = 96
  TextHeight = 13
  inherited lblData: TLabel
    Visible = False
  end
  object Label2: TLabel [1]
    Left = 8
    Top = 99
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
  object Label1: TLabel [2]
    Left = 8
    Top = 30
    Width = 44
    Height = 13
    Caption = #1058#1077#1083'. '#1082#1086#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel [3]
    Left = 8
    Top = 75
    Width = 64
    Height = 13
    Caption = #1044#1086#1073#1072#1074#1086#1095#1085#1099#1081
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  inherited edtData: TcxDBMaskEdit
    Top = 49
    DataBinding.DataField = 'PHONE'
    Properties.AlwaysShowBlanksAndLiterals = True
    Properties.BeepOnError = True
    Properties.EditMask = '!\(000\)000\-00\-00;0;'#9618
    ExplicitTop = 49
    ExplicitWidth = 150
    Width = 150
  end
  inherited btnOK: TRzButton
    Left = 7
    Top = 130
    ModalResult = 0
    Anchors = [akTop]
    OnClick = btnOKClick
    ExplicitLeft = 7
    ExplicitTop = 130
  end
  inherited bntCancel: TRzButton
    Left = 88
    Top = 130
    Anchors = [akTop]
    ExplicitLeft = 88
    ExplicitTop = 130
  end
  object chbkIsMain: TcxDBCheckBox [7]
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
  object cmbPhoneType: TcxDBLookupComboBox [8]
    Left = 43
    Top = 96
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
  object cxDBMaskEdit1: TcxDBMaskEdit [9]
    Left = 58
    Top = 27
    DataBinding.DataField = 'CODE'
    DataBinding.DataSource = DS
    Properties.AlwaysShowBlanksAndLiterals = True
    Properties.BeepOnError = True
    Properties.EditMask = '!+09;0;'#9618
    Properties.ValidationOptions = [evoShowErrorIcon]
    TabOrder = 5
    Width = 100
  end
  object cxDBMaskEdit2: TcxDBMaskEdit [10]
    Left = 78
    Top = 72
    DataBinding.DataField = 'ADD_NUMBER'
    DataBinding.DataSource = DS
    Properties.AlwaysShowBlanksAndLiterals = True
    Properties.BeepOnError = True
    Properties.EditMask = '99999;0;'#9618
    Properties.ValidationOptions = [evoShowErrorIcon]
    TabOrder = 6
    Width = 80
  end
  inherited DS: TDataSource
    Left = 133
  end
end
