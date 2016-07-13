inherited FrameContact: TFrameContact
  Width = 631
  Height = 149
  ExplicitWidth = 631
  ExplicitHeight = 149
  object Label1: TLabel [0]
    Left = 3
    Top = 10
    Width = 78
    Height = 16
    Caption = #1058#1080#1087' '#1082#1086#1085#1090#1072#1082#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel [1]
    Left = 3
    Top = 43
    Width = 86
    Height = 16
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object cmbType: TcxDBLookupComboBox [2]
    Left = 95
    Top = 7
    DataBinding.DataField = 'TYPE_ID'
    DataBinding.DataSource = DS
    ParentFont = False
    Properties.KeyFieldNames = 'ID'
    Properties.ListColumns = <
      item
        FieldName = 'NAME'
      end>
    Properties.ListOptions.GridLines = glNone
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DataModuleMain.DsDicContactTypes
    Properties.ReadOnly = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 0
    Width = 258
  end
  object cxDBTextEdit1: TcxDBTextEdit [3]
    Left = 95
    Top = 42
    BeepOnEnter = False
    DataBinding.DataField = 'BANK_NAME'
    ParentFont = False
    Properties.MaxLength = 0
    Properties.ValidationOptions = [evoShowErrorIcon]
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.HotTrack = False
    Style.LookAndFeel.Kind = lfFlat
    Style.LookAndFeel.NativeStyle = True
    Style.TransparentBorder = True
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 1
    Width = 258
  end
  inline FramePhones: TFramePhones [4]
    Left = 370
    Top = 3
    Width = 255
    Height = 144
    TabOrder = 2
    ExplicitLeft = 370
    ExplicitTop = 3
    ExplicitWidth = 255
    ExplicitHeight = 144
    inherited grpPhone: TRzGroupBox
      Top = -1
      Width = 250
      Height = 142
      ExplicitTop = -1
      ExplicitWidth = 250
      ExplicitHeight = 142
      inherited grdPhone: TcxGrid
        Width = 213
        Height = 119
        ExplicitHeight = 119
        inherited grdPhoneDBTableView2: TcxGridDBTableView
          inherited grdPhoneDBTableView2Column2: TcxGridDBColumn
            Width = 96
          end
        end
      end
      inherited RzPanel2: TRzPanel
        Left = 218
        Height = 127
        ExplicitHeight = 127
        inherited btnAdd: TRzBitBtn
          Top = 2
          ExplicitTop = 2
        end
        inherited btnEdit: TRzBitBtn
          Top = 34
          ExplicitTop = 34
        end
        inherited btnDel: TRzBitBtn
          Top = 91
          ExplicitTop = 91
        end
      end
    end
    inherited Query: TIBQuery
      SQL.Strings = (
        'select * from phones where client_id = :client_id and type=3')
    end
  end
  inherited Query_upd: TIBUpdateSQL [5]
    ModifySQL.Strings = (
      'update CONTACTS set '
      'name = :name, '
      'type_id = :type_id, '
      'comment = :comment'
      'where id = :ID')
    InsertSQL.Strings = (
      'insert into contacts (name, type_id, comment)'
      'values(:name, :type_id, :comment)')
  end
  inherited Query: TIBQuery [6]
    SQL.Strings = (
      'select * from CONTACTS where id = :id')
    GeneratorField.Generator = 'GEN_CONTACTS_ID'
    GeneratorField.ApplyEvent = gamOnPost
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
end
