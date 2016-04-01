inherited FramePersonSmall: TFramePersonSmall
  Width = 290
  Height = 130
  ExplicitWidth = 290
  ExplicitHeight = 130
  object Label11: TLabel [0]
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
  object Label10: TLabel [1]
    Left = 7
    Top = 32
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
  object Label9: TLabel [2]
    Left = 7
    Top = 56
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
  object Label8: TLabel [3]
    Left = 6
    Top = 81
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
  object Label2: TLabel [4]
    Left = 7
    Top = 106
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
  object Label1: TLabel [5]
    Left = 203
    Top = 81
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
  object edtCitizen: TcxDBTextEdit [6]
    Left = 80
    Top = 103
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
    TabOrder = 0
    Width = 76
  end
  object cmbDateBirth: TcxDBDateEdit [7]
    Left = 92
    Top = 78
    Anchors = [akLeft, akTop, akRight]
    DataBinding.DataField = 'DATE_BIRTH'
    DataBinding.DataSource = DS
    TabOrder = 1
    Width = 64
  end
  object edtSurName: TcxDBTextEdit [8]
    Left = 63
    Top = 53
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
  object edtName: TcxDBTextEdit [9]
    Left = 63
    Top = 29
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
    TabOrder = 3
    Width = 218
  end
  object edtFamily: TcxDBTextEdit [10]
    Left = 63
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
    TabOrder = 4
    Width = 218
  end
  object cmbSex: TcxDBComboBox [11]
    Left = 228
    Top = 78
    DataBinding.DataField = 'SEX'
    DataBinding.DataSource = DS
    Properties.DropDownListStyle = lsFixedList
    Properties.Items.Strings = (
      #1046
      #1052)
    Properties.ReadOnly = False
    TabOrder = 5
    Width = 53
  end
  inherited Query_upd: TIBUpdateSQL
    RefreshSQL.Strings = (
      
        'select name, surname, family, date_birth, sex from PERSONS where' +
        ' id = :NEW_ID')
    InsertSQL.Strings = (
      'insert into PERSONS(name, surname, family, date_birth, sex) '
      'values(:name, :surname, :family, ;date_birth, :sex)')
    DeleteSQL.Strings = (
      'delete from PERSONS where id= :OLD_ID')
    Top = 96
  end
  inherited Query: TIBQuery
    SQL.Strings = (
      'select id, name, surname, family, date_birth, sex '
      'from persons where id = :id')
    Left = 208
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  inherited DS: TDataSource
    Left = 160
    Top = 96
  end
end
