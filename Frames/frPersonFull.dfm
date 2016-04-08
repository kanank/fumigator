inherited FramePersonFull: TFramePersonFull
  Width = 733
  Height = 172
  ExplicitWidth = 733
  ExplicitHeight = 172
  DesignSize = (
    733
    172)
  inline FramePassport: TFramePassport [0]
    Left = 512
    Top = 0
    Width = 218
    Height = 142
    TabOrder = 3
    ExplicitLeft = 512
    ExplicitHeight = 142
  end
  inline FramePhones: TFramePhones [1]
    Left = 287
    Top = 0
    Width = 218
    Height = 144
    TabOrder = 2
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
  inline FramePersonAdr: TFrameKLADRAdr [2]
    Left = 0
    Top = 143
    Width = 507
    Height = 27
    TabOrder = 1
    ExplicitTop = 143
    ExplicitWidth = 507
    inherited Label8: TLabel
      Left = 8
      Width = 98
      Caption = #1040#1076#1088#1077#1089' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
      ExplicitLeft = 8
      ExplicitWidth = 98
    end
    inherited Adres_memo: TcxDBMemo
      Left = 109
      Top = 2
      ExplicitLeft = 109
      ExplicitTop = 2
      ExplicitWidth = 360
      ExplicitHeight = 23
      Height = 23
      Width = 360
    end
    inherited btnEdit: TRzBitBtn
      Left = 473
      Width = 28
      ExplicitLeft = 473
      ExplicitWidth = 28
    end
  end
  inherited RzPanel1: TRzPanel [3]
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
      'CITIZEN = :CITIZEN'
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
      'CITIZEN'
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
      ':CITIZEN'
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
