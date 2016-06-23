inherited FrameRekvizits: TFrameRekvizits
  Width = 220
  Height = 135
  ExplicitWidth = 220
  ExplicitHeight = 135
  object Label4: TLabel [0]
    Left = 5
    Top = 108
    Width = 15
    Height = 13
    Caption = #1056'/'#1089
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object RzGroupBox1: TRzGroupBox [1]
    Left = 0
    Top = 0
    Width = 217
    Height = 132
    Caption = #1041#1072#1085#1082#1086#1074#1089#1082#1080#1077' '#1088#1077#1082#1074#1080#1079#1080#1090#1099
    TabOrder = 0
    object Label1: TLabel
      Left = 6
      Top = 57
      Width = 20
      Height = 13
      Caption = #1041#1048#1050
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 6
      Top = 15
      Width = 106
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1073#1072#1085#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 6
      Top = 80
      Width = 16
      Height = 13
      Caption = #1050'/'#1089
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object cxDBMaskEdit1: TcxDBMaskEdit
      Left = 32
      Top = 54
      DataBinding.DataField = 'BIK'
      DataBinding.DataSource = DS
      Properties.MaskKind = emkRegExprEx
      Properties.EditMask = '\d\d\d\d\d\d\d\d\d'
      Properties.MaxLength = 0
      Properties.ValidationOptions = [evoShowErrorIcon]
      TabOrder = 0
      Width = 178
    end
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 6
      Top = 30
      BeepOnEnter = False
      DataBinding.DataField = 'BANK_NAME'
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
      TabOrder = 1
      Width = 204
    end
    object cxDBMaskEdit2: TcxDBMaskEdit
      Left = 32
      Top = 77
      DataBinding.DataField = 'KS'
      DataBinding.DataSource = DS
      Properties.MaskKind = emkRegExprEx
      Properties.EditMask = '\d\d\d\d\d\d\d\d\d\d\d\d\d'
      Properties.MaxLength = 0
      Properties.ValidationOptions = [evoShowErrorIcon]
      TabOrder = 2
      Width = 178
    end
  end
  object cxDBMaskEdit3: TcxDBMaskEdit [2]
    Left = 32
    Top = 105
    DataBinding.DataField = 'RS'
    DataBinding.DataSource = DS
    Properties.MaskKind = emkRegExprEx
    Properties.EditMask = '\d\d\d\d\d\d\d\d\d\d\d\d\d'
    Properties.MaxLength = 0
    Properties.ValidationOptions = [evoShowErrorIcon]
    TabOrder = 1
    Width = 178
  end
  inherited Query_upd: TIBUpdateSQL
    RefreshSQL.Strings = (
      'select * from REKVIZITS where id :=id')
    ModifySQL.Strings = (
      'update REKVIZITS set '
      'ID  = :ID, '
      'BIK  = :BIK, '
      'KS  = :KS, '
      'BANK_NAME  = :BANK_NAME, '
      'RS = :RS'
      'where id = :ID')
    InsertSQL.Strings = (
      'insert into REKVIZITS('
      'ID, '
      'BIK, '
      'KS, '
      'BANK_NAME, '
      'RS'
      ')'
      'values('
      ':ID, '
      ':BIK, '
      ':KS, '
      ':BANK_NAME, '
      ':RS'
      ')')
    DeleteSQL.Strings = (
      'delete from REKVIZITS  where id = :id')
    Left = 176
    Top = 51
  end
  inherited Query: TIBQuery
    SQL.Strings = (
      'select * from REKVIZITS where id = :REKVIZIT_ID')
    GeneratorField.Generator = 'GEN_REKVIZITS_ID'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 176
    Top = 11
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'REKVIZIT_ID'
        ParamType = ptUnknown
      end>
  end
  inherited DS: TDataSource
    Left = 144
    Top = 11
  end
end
