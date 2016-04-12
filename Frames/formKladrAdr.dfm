inherited frmKladrAdr: TfrmKladrAdr
  Caption = #1042#1099#1073#1086#1088' '#1072#1076#1088#1077#1089#1072
  ClientHeight = 201
  ClientWidth = 337
  ExplicitWidth = 343
  ExplicitHeight = 229
  PixelsPerInch = 96
  TextHeight = 13
  inherited lblData: TLabel
    Left = 304
    Top = 262
    Visible = False
    ExplicitLeft = 304
    ExplicitTop = 262
  end
  inherited edtData: TcxDBMaskEdit
    Left = 304
    Top = 249
    Visible = False
    ExplicitLeft = 304
    ExplicitTop = 249
  end
  inherited btnOK: TRzButton
    Top = 165
    ExplicitTop = 165
  end
  inherited bntCancel: TRzButton
    Top = 165
    ExplicitTop = 165
  end
  inline FrameKladrAll1: TFrameKladrAll [4]
    Left = 0
    Top = 0
    Width = 335
    Height = 158
    TabOrder = 3
    inherited FrameStreet: TFrameItemKLADR
      inherited QuerySearch: TIBQuery
        SQL.Strings = (
          'select * from KLADR_STREET'
          'where '
          'Region_id = :Region_id  and'
          'Area_id = :Area_id  and'
          'City_id = :City_id  and'
          'Site_id = :Site_id  and'
          'actual = 0')
      end
    end
    inherited Query_upd: TIBUpdateSQL
      RefreshSQL.Strings = (
        'select id, code_kladr from ADRESS where id = :id')
      ModifySQL.Strings = (
        'update ADRESS set '
        'code_kladr = :code_kladr'
        'where id = :ID')
      DeleteSQL.Strings = (
        'delete from ADRESS where id = :id')
    end
  end
end
