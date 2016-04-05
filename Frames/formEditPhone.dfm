inherited frmEditPhone: TfrmEditPhone
  Caption = #1053#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072
  ClientHeight = 91
  ClientWidth = 168
  Position = poOwnerFormCenter
  OnShow = FormShow
  ExplicitWidth = 174
  ExplicitHeight = 119
  PixelsPerInch = 96
  TextHeight = 13
  inherited lblData: TLabel
    Visible = False
  end
  inherited edtData: TcxDBMaskEdit
    Top = 24
    DataBinding.DataField = 'PHONE'
    Properties.EditMask = '!\(999\)000-0000;1;_'
    ExplicitTop = 24
    ExplicitWidth = 150
    Width = 150
  end
  inherited btnOK: TRzButton
    Left = 7
    Top = 58
    Anchors = [akTop]
    ExplicitLeft = 8
    ExplicitTop = 58
  end
  inherited bntCancel: TRzButton
    Left = 88
    Top = 58
    Anchors = [akTop]
    ExplicitLeft = 88
    ExplicitTop = 58
  end
  object chbkIsMain: TcxDBCheckBox [4]
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
  inherited DS: TDataSource
    Left = 133
  end
end
