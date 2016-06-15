inherited FramePersonSmall: TFramePersonSmall
  Width = 290
  Height = 162
  ExplicitWidth = 290
  ExplicitHeight = 162
  DesignSize = (
    290
    162)
  object RzPanel1: TRzPanel [0]
    Left = 2
    Top = 3
    Width = 285
    Height = 157
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderSides = []
    TabOrder = 0
    DesignSize = (
      285
      157)
    object Label11: TLabel
      Left = 7
      Top = 8
      Width = 44
      Height = 13
      Caption = #1060#1072#1084#1080#1083#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 7
      Top = 33
      Width = 19
      Height = 13
      Caption = #1048#1084#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 7
      Top = 58
      Width = 49
      Height = 13
      Caption = #1054#1090#1095#1077#1089#1090#1074#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 6
      Top = 84
      Width = 80
      Height = 13
      Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 7
      Top = 132
      Width = 68
      Height = 13
      Caption = #1043#1088#1072#1078#1076#1072#1085#1089#1090#1074#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 203
      Top = 84
      Width = 19
      Height = 13
      Caption = #1055#1086#1083
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 6
      Top = 108
      Width = 57
      Height = 13
      Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtCitizen: TcxDBTextEdit
      Left = 80
      Top = 129
      Anchors = [akLeft, akTop, akRight]
      BeepOnEnter = False
      DataBinding.DataField = 'CITIZEN'
      DataBinding.DataSource = DS
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
      TabOrder = 6
      Width = 148
    end
    object cmbDateBirth: TcxDBDateEdit
      Left = 92
      Top = 81
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataField = 'DATE_BIRTH'
      DataBinding.DataSource = DS
      Properties.DateButtons = []
      Properties.DisplayFormat = 'dd.mm.yyyy'
      Properties.EditFormat = 'dd.mm.yyyy'
      Properties.InputKind = ikStandard
      Properties.ShowTime = False
      Properties.ValidationOptions = [evoShowErrorIcon, evoAllowLoseFocus]
      Properties.OnInitPopup = cmbDateBirthPropertiesInitPopup
      TabOrder = 3
      Width = 93
    end
    object edtSurName: TcxDBTextEdit
      Left = 66
      Top = 55
      Anchors = [akLeft, akTop, akRight]
      BeepOnEnter = False
      DataBinding.DataField = 'SURNAME'
      DataBinding.DataSource = DS
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
      Width = 218
    end
    object edtName: TcxDBTextEdit
      Left = 66
      Top = 30
      Anchors = [akLeft, akTop, akRight]
      BeepOnEnter = False
      DataBinding.DataField = 'NAME'
      DataBinding.DataSource = DS
      Style.BorderStyle = ebsFlat
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
      Width = 218
    end
    object edtFamily: TcxDBTextEdit
      Left = 66
      Top = 5
      Anchors = [akLeft, akTop, akRight]
      BeepOnEnter = False
      DataBinding.DataField = 'FAMILY'
      DataBinding.DataSource = DS
      Style.HotTrack = False
      Style.LookAndFeel.NativeStyle = True
      Style.TransparentBorder = True
      StyleDisabled.Color = clBtnFace
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 0
      Width = 218
    end
    object cmbSex: TcxDBComboBox
      Left = 228
      Top = 81
      DataBinding.DataField = 'SEX'
      DataBinding.DataSource = DS
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        #1046
        #1052)
      Properties.ReadOnly = False
      TabOrder = 4
      Width = 53
    end
    object cmbProf: TcxDBLookupComboBox
      Left = 66
      Top = 104
      DataBinding.DataField = 'PROF_ID'
      DataBinding.DataSource = DS
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NAME'
        end>
      Properties.ListOptions.GridLines = glNone
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = DataModuleMain.DSDicWorkerProfs
      TabOrder = 5
      Width = 162
    end
  end
  inherited Query_upd: TIBUpdateSQL
    RefreshSQL.Strings = (
      
        'select name, surname, family, date_birth, sex, prof_id from PERS' +
        'ONS where id = :NEW_ID')
    ModifySQL.Strings = (
      'update PERSONS set '
      'NAME = :NAME, '
      'SURNAME = :SURNAME , '
      'FAMILY = :FAMILY , '
      'DATE_BIRTH = :DATE_BIRTH , '
      'SEX = :SEX,'
      'PROF_ID = :PROF_ID'
      'where id = :ID')
    InsertSQL.Strings = (
      
        'insert into PERSONS(id, name, surname, family, date_birth, sex, ' +
        'prof_id) '
      
        'values(:id, :name, :surname, :family, :date_birth, :sex, :prof_i' +
        'd)')
    DeleteSQL.Strings = (
      'delete from PERSONS where id= :OLD_ID')
    Top = 107
  end
  inherited Query: TIBQuery
    SQL.Strings = (
      
        'select id, name, surname, family, date_birth, sex, prof_id, shor' +
        'tname '
      'from persons where id = :person_id')
    GeneratorField.ApplyEvent = gamOnPost
    Left = 232
    Top = 107
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'person_id'
        ParamType = ptUnknown
      end>
  end
  inherited DS: TDataSource
    Left = 160
    Top = 107
  end
end
