inherited FrameClientExtUr: TFrameClientExtUr
  Width = 601
  Height = 235
  ExplicitWidth = 601
  ExplicitHeight = 235
  object Label1: TLabel [0]
    Left = 3
    Top = 10
    Width = 84
    Height = 13
    Caption = #1055#1088#1072#1074#1086#1074#1072#1103' '#1092#1086#1088#1084#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel [1]
    Left = 179
    Top = 10
    Width = 33
    Height = 13
    Caption = #1057#1092#1077#1088#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel [2]
    Left = 378
    Top = 153
    Width = 21
    Height = 13
    Caption = #1048#1053#1053
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel [3]
    Left = 378
    Top = 180
    Width = 21
    Height = 13
    Caption = #1050#1055#1055
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel [4]
    Left = 378
    Top = 207
    Width = 27
    Height = 13
    Caption = #1054#1043#1056#1053
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object cmbFormat: TcxDBLookupComboBox [5]
    Left = 93
    Top = 6
    DataBinding.DataField = 'FORMA_ID'
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
    Properties.ListSource = DataModuleMain.DsDicUrForm
    TabOrder = 0
    Width = 68
  end
  object cxDBLookupComboBox1: TcxDBLookupComboBox [6]
    Left = 218
    Top = 6
    DataBinding.DataField = 'SPHERA_ID'
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
    Properties.ListSource = DataModuleMain.DsDicCliSfera
    TabOrder = 1
    Width = 68
  end
  inline FrameBank1: TFrameBank [7]
    Left = 378
    Top = 1
    Width = 220
    Height = 135
    TabOrder = 2
    ExplicitLeft = 378
    ExplicitTop = 1
    inherited RzGroupBox1: TRzGroupBox
      Top = 3
      ExplicitTop = 3
    end
  end
  object cxDBMaskEdit1: TcxDBMaskEdit [8]
    Left = 410
    Top = 150
    DataBinding.DataField = 'INN'
    DataBinding.DataSource = DS
    Properties.MaskKind = emkRegExprEx
    Properties.EditMask = '\d\d\d\d '#39' '#39' \d\d\d\d\d\d'
    Properties.MaxLength = 0
    Properties.ValidationOptions = [evoShowErrorIcon]
    TabOrder = 3
    Width = 185
  end
  object cxDBMaskEdit3: TcxDBMaskEdit [9]
    Left = 410
    Top = 177
    DataBinding.DataField = 'KPP'
    DataBinding.DataSource = DS
    Properties.MaskKind = emkRegExprEx
    Properties.EditMask = '\d\d\d\d '#39' '#39' \d\d\d\d\d\d'
    Properties.MaxLength = 0
    Properties.ValidationOptions = [evoShowErrorIcon]
    TabOrder = 4
    Width = 185
  end
  object cxDBMaskEdit4: TcxDBMaskEdit [10]
    Left = 410
    Top = 204
    DataBinding.DataField = 'OGRN'
    DataBinding.DataSource = DS
    Properties.MaskKind = emkRegExprEx
    Properties.EditMask = '\d\d\d\d '#39' '#39' \d\d\d\d\d\d'
    Properties.MaxLength = 0
    Properties.ValidationOptions = [evoShowErrorIcon]
    TabOrder = 5
    Width = 185
  end
  inherited Query_upd: TIBUpdateSQL [11]
    RefreshSQL.Strings = (
      'select * from CLIENTS_EXT_UR where id = :id')
    ModifySQL.Strings = (
      'update CLIENTS_EXT_UR set '
      'CLIENT_ID = :CLIENT_ID,'
      'REKVIZIT_ID = :REKVIZIT_ID,'
      'FORMA_ID = :FORMA_ID,'
      'SPHERA_ID = :SPHERA_ID,'
      'INN = :INN,'
      'KPP = :KPP,'
      'OGRN = :OGRN'
      'where id = :ID')
    InsertSQL.Strings = (
      'insert into CLIENTS_EXT_UR('
      'ID,'
      'CLIENT_ID,'
      'REKVIZIT_ID,'
      'FORMA_ID,'
      'SPHERA_ID,'
      'INN,'
      'KPP,'
      'OGRN)'
      'values('
      ':ID,'
      ':CLIENT_ID,'
      ':REKVIZIT_ID,'
      ':FORMA_ID,'
      ':SPHERA_ID,'
      ':INN,'
      ':KPP,'
      ':OGRN'
      ')')
    DeleteSQL.Strings = (
      'delete from CLIENTS_EXT_UR where id = :id ')
    Top = 72
  end
  inherited Query: TIBQuery [12]
    SQL.Strings = (
      'select * from CLIENTS_EXT_UR')
    GeneratorField.Generator = 'GEN_CLIENTS_EXT_UR_ID'
    Top = 32
  end
  inherited DS: TDataSource
    Top = 32
  end
end
