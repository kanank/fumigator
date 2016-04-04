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
    Height = 140
    TabOrder = 0
    ExplicitLeft = 512
  end
  inline FramePhones: TFramePhones [1]
    Left = 285
    Top = 0
    Width = 218
    Height = 140
    TabOrder = 1
    ExplicitLeft = 285
    ExplicitHeight = 140
    inherited grpPhone: TRzGroupBox
      Height = 138
      ExplicitHeight = 138
      inherited grdPhone: TcxGrid
        Height = 119
        ExplicitHeight = 119
      end
      inherited RzPanel2: TRzPanel
        Height = 123
        ExplicitHeight = 123
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
    Top = 141
    Width = 507
    Height = 27
    TabOrder = 2
    ExplicitTop = 141
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
    Height = 135
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    ExplicitHeight = 135
    DesignSize = (
      285
      135)
  end
  inherited Query_upd: TIBUpdateSQL
    RefreshSQL.Strings = (
      'select * from PERSONS where id = :NEW_ID')
  end
  inherited Query: TIBQuery
    SQL.Strings = (
      'select * '
      'from persons where id = :person_id')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'person_id'
        ParamType = ptUnknown
      end>
  end
end
