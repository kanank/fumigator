inherited FramePassport: TFramePassport
  Width = 218
  Height = 140
  ExplicitWidth = 218
  ExplicitHeight = 140
  object RzGroupBox1: TRzGroupBox [0]
    Left = 0
    Top = 0
    Width = 217
    Height = 140
    Caption = #1055#1072#1089#1087#1086#1088#1090#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
    TabOrder = 0
    object Label1: TLabel
      Left = 13
      Top = 19
      Width = 73
      Height = 13
      Caption = #1057#1077#1088#1080#1103' '#1080' '#1085#1086#1084#1077#1088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 13
      Top = 44
      Width = 67
      Height = 13
      Caption = #1050#1086#1075#1076#1072' '#1074#1099#1076#1072#1085
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 13
      Top = 69
      Width = 102
      Height = 13
      Caption = #1050#1086#1076' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 13
      Top = 91
      Width = 55
      Height = 13
      Caption = #1050#1077#1084' '#1074#1099#1076#1072#1085
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object cxDBMaskEdit1: TcxDBMaskEdit
      Left = 119
      Top = 16
      DataBinding.DataField = 'PASS_NUM'
      DataBinding.DataSource = DS
      Properties.MaskKind = emkRegExprEx
      Properties.EditMask = '\d\d\d\d '#39' '#39' \d\d\d\d\d\d'
      Properties.MaxLength = 0
      Properties.ValidationOptions = [evoShowErrorIcon]
      TabOrder = 0
      Width = 90
    end
    object cxDBDateEdit1: TcxDBDateEdit
      Left = 119
      Top = 41
      DataBinding.DataField = 'PASS_DATE'
      DataBinding.DataSource = DS
      TabOrder = 1
      Width = 90
    end
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 119
      Top = 66
      BeepOnEnter = False
      DataBinding.DataField = 'PASE_CODE'
      DataBinding.DataSource = DS
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
      TabOrder = 2
      Width = 90
    end
    object cxDBMemo1: TcxDBMemo
      Left = 13
      Top = 106
      DataBinding.DataField = 'PASS_ORG'
      DataBinding.DataSource = DS
      Properties.MaxLength = 128
      Properties.ValidationOptions = [evoShowErrorIcon]
      TabOrder = 3
      Height = 28
      Width = 196
    end
  end
  inherited Query_upd: TIBUpdateSQL
    RefreshSQL.Strings = (
      'select * from PASSPORTS where id = :NEW_ID')
    ModifySQL.Strings = (
      'update PASSPORTS set '
      '  PASS_NUM =  :PASS_NUM ,'
      '  PASS_ORG =  :PASS_ORG ,'
      '  PASS_DATE = :PASS_DATE ,'
      '  PASS_CODE = :PASS_CODE '
      'where id = :ID')
    InsertSQL.Strings = (
      'insert into PERSONS(name, surname, family, date_birth, sex) '
      'values(:name, :surname, :family, ;date_birth, :sex)')
    DeleteSQL.Strings = (
      'delete from PERSONS where id= :OLD_ID')
    Left = 176
    Top = 96
  end
  inherited Query: TIBQuery
    SQL.Strings = (
      'select * from passports where id = :id')
    Left = 144
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  inherited DS: TDataSource
    Left = 104
    Top = 96
  end
end
