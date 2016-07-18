inherited frmEditRegion: TfrmEditRegion
  Caption = #1042#1099#1073#1086#1088' '#1088#1077#1075#1080#1086#1085#1072
  ClientHeight = 90
  ClientWidth = 200
  OnShow = FormShow
  ExplicitWidth = 206
  ExplicitHeight = 118
  PixelsPerInch = 96
  TextHeight = 13
  inherited lblData: TLabel
    Visible = False
  end
  inherited edtData: TcxDBMaskEdit
    Top = 22
    DataBinding.DataField = 'PHONE'
    Properties.AlwaysShowBlanksAndLiterals = True
    Properties.BeepOnError = True
    Properties.EditMask = '!\(000\)000\-00\-00;0;'#9618
    Visible = False
    ExplicitTop = 22
    ExplicitWidth = 150
    Width = 150
  end
  inherited btnOK: TRzButton
    Left = 8
    Top = 49
    Width = 73
    ModalResult = 0
    Anchors = [akTop]
    OnClick = btnOKClick
    ExplicitLeft = 8
    ExplicitTop = 49
    ExplicitWidth = 73
  end
  inherited bntCancel: TRzButton
    Left = 117
    Top = 49
    Anchors = [akTop]
    ExplicitLeft = 117
    ExplicitTop = 49
  end
  object cmbPhoneType: TcxDBLookupComboBox [4]
    Left = 8
    Top = 8
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
    TabOrder = 3
    Width = 179
  end
  inherited DS: TDataSource
    Left = 133
  end
end
