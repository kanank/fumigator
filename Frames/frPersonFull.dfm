inherited FramePersonFull: TFramePersonFull
  Width = 733
  Height = 172
  ExplicitWidth = 733
  ExplicitHeight = 172
  DesignSize = (
    733
    172)
  object Label3: TLabel [0]
    Left = 367
    Top = 152
    Width = 47
    Height = 13
    Caption = 'Emal '#1083#1080#1095'.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel [1]
    Left = 553
    Top = 153
    Width = 47
    Height = 13
    Caption = 'Emal '#1088#1072#1073'.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  inline FramePassport: TFramePassport [2]
    Left = 512
    Top = 0
    Width = 218
    Height = 142
    TabOrder = 3
    ExplicitLeft = 512
    ExplicitHeight = 142
  end
  inline FramePhones: TFramePhones [3]
    Left = 287
    Top = 0
    Width = 218
    Height = 144
    TabOrder = 1
    ExplicitLeft = 287
    ExplicitWidth = 218
    ExplicitHeight = 144
    inherited grpPhone: TRzGroupBox
      Height = 142
      ExplicitHeight = 142
      inherited grdPhone: TcxGrid
        Height = 119
        ExplicitHeight = 119
      end
      inherited RzPanel2: TRzPanel
        Height = 127
        ExplicitHeight = 127
        inherited btnAdd: TRzBitBtn
          Top = 2
          ExplicitTop = 2
        end
        inherited btnEdit: TRzBitBtn
          Top = 33
          ExplicitTop = 33
        end
        inherited btnDel: TRzBitBtn
          Top = 93
          ExplicitTop = 93
        end
      end
    end
  end
  inherited RzPanel1: TRzPanel [4]
    Left = 3
    Height = 142
    Anchors = [akLeft, akTop, akRight]
    ExplicitLeft = 3
    ExplicitHeight = 142
    DesignSize = (
      285
      142)
    inherited Label11: TLabel
      Left = 2
      ExplicitLeft = 2
    end
    inherited Label10: TLabel
      Left = 2
      Top = 31
      ExplicitLeft = 2
      ExplicitTop = 31
    end
    inherited Label9: TLabel
      Left = 2
      Top = 54
      ExplicitLeft = 2
      ExplicitTop = 54
    end
    inherited Label8: TLabel
      Left = 2
      Top = 77
      ExplicitLeft = 2
      ExplicitTop = 77
    end
    inherited Label2: TLabel
      Left = 2
      Top = 122
      ExplicitLeft = 2
      ExplicitTop = 122
    end
    inherited Label1: TLabel
      Top = 77
      ExplicitTop = 77
    end
    inherited Label4: TLabel
      Left = 3
      Top = 99
      ExplicitLeft = 3
      ExplicitTop = 99
    end
    inherited edtCitizen: TcxDBTextEdit
      Left = 72
      Top = 119
      ExplicitLeft = 72
      ExplicitTop = 119
      ExplicitWidth = 162
      Width = 162
    end
    inherited cmbDateBirth: TcxDBDateEdit
      Top = 72
      ExplicitTop = 72
      ExplicitWidth = 94
      Width = 94
    end
    inherited edtSurName: TcxDBTextEdit
      Left = 72
      Top = 51
      ExplicitLeft = 72
      ExplicitTop = 51
      ExplicitWidth = 213
      Width = 213
    end
    inherited edtName: TcxDBTextEdit
      Left = 72
      Top = 28
      ExplicitLeft = 72
      ExplicitTop = 28
      ExplicitWidth = 213
      Width = 213
    end
    inherited edtFamily: TcxDBTextEdit
      Left = 72
      ExplicitLeft = 72
      ExplicitWidth = 213
      Width = 213
    end
    inherited cmbSex: TcxDBComboBox
      Top = 73
      Properties.Alignment.Horz = taCenter
      ExplicitTop = 73
      ExplicitWidth = 57
      Width = 57
    end
    inherited cmbProf: TcxDBLookupComboBox
      Left = 72
      Top = 96
      ExplicitLeft = 72
      ExplicitTop = 96
    end
  end
  inline FrameAddress: TFrameKladrAdrFull [5]
    Left = 3
    Top = 148
    Width = 356
    Height = 27
    TabOrder = 2
    Visible = False
    ExplicitLeft = 3
    ExplicitTop = 148
    ExplicitWidth = 356
    ExplicitHeight = 27
    inherited Label8: TLabel
      Visible = False
    end
    inherited Label1: TLabel
      Visible = False
    end
    inherited Label2: TLabel
      Left = 1
      Top = 4
      ExplicitLeft = 1
      ExplicitTop = 4
    end
    inherited btnEdit: TRzBitBtn
      Left = 325
      Top = 0
      ExplicitLeft = 325
      ExplicitTop = 0
    end
    inherited edtRegion: TcxTextEdit
      Visible = False
      ExplicitWidth = 218
      Width = 218
    end
    inherited edtSite: TcxTextEdit
      Visible = False
    end
    inherited edtAddress: TcxTextEdit
      Left = 63
      Top = 1
      ExplicitLeft = 63
      ExplicitTop = 1
      ExplicitWidth = 262
      Width = 262
    end
  end
  object edtEmailPrivate: TcxDBTextEdit
    Left = 417
    Top = 149
    Anchors = [akLeft, akTop, akRight]
    BeepOnEnter = False
    DataBinding.DataField = 'EMAIL_PRIVATE'
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
    TabOrder = 4
    Width = 123
  end
  object edtEmailWork: TcxDBTextEdit
    Left = 606
    Top = 149
    Anchors = [akLeft, akTop, akRight]
    BeepOnEnter = False
    DataBinding.DataField = 'EMAIL_WORK'
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
    TabOrder = 5
    Width = 123
  end
  inherited Query_upd: TIBUpdateSQL
    RefreshSQL.Strings = (
      'select * from PERSONS where id = :NEW_ID')
    ModifySQL.Strings = (
      'update PERSONS set '
      'FAMILY = :FAMILY,'
      'NAME = :NAME,'
      'SURNAME = :SURNAME,'
      'ADR_ID = :ADR_ID,'
      'PASS_ID = :PASS_ID,'
      'DATE_BIRTH = :DATE_BIRTH,'
      'SEX = :SEX,'
      'CITIZEN = :CITIZEN,'
      'PROF_ID = :PROF_ID,'
      'PASS_ID = :PASS_ID,'
      'EMAIL_PRIVATE = :EMAIL_PRIVATE,'
      'EMAIL_WORK = :EMAIL_WORK'
      'where id = :ID')
    InsertSQL.Strings = (
      'insert into PERSONS('
      'ID,'
      'FAMILY,'
      'NAME,'
      'SURNAME,'
      'ADR_ID,'
      'PASS_ID,'
      'DATE_BIRTH,'
      'SEX,'
      'CITIZEN,'
      'PROF_ID,'
      'EMAIL_PRIVATE,'
      'EMAIL_WORK,'
      'PASS_ID'
      ') '
      'values('
      ':ID,'
      ':FAMILY,'
      ':NAME,'
      ':SURNAME,'
      ':ADR_ID,'
      ':PASS_ID,'
      ':DATE_BIRTH,'
      ':SEX,'
      ':CITIZEN,'
      ':PROF_ID,'
      ':EMAIL_PRIVATE,'
      ':EMAIL_WORK,'
      ':PASS_ID'
      ')')
    Left = 240
    Top = 11
  end
  inherited Query: TIBQuery
    SQL.Strings = (
      'select * '
      'from persons where id = :person_id')
    Left = 216
    Top = 11
  end
  inherited DS: TDataSource
    Left = 184
    Top = 19
  end
end
