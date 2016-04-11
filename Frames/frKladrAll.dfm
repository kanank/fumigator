inherited FrameKladrAll: TFrameKladrAll
  Width = 335
  Height = 158
  ExplicitWidth = 335
  ExplicitHeight = 158
  inline FrameRegion: TFrameItemKLADR [0]
    Left = 0
    Top = 1
    Width = 334
    Height = 30
    TabOrder = 0
    ExplicitTop = 1
    inherited lblName: TLabel
      Width = 35
      Caption = #1056#1077#1075#1080#1086#1085
      ExplicitWidth = 35
    end
    inherited Query: TIBQuery
      BeforeOpen = nil
      SQL.Strings = (
        'select * from KLADR '
        'where '
        'Region_id = :Region_id and'
        'Area_id =0 and'
        'City_id = 0 and'
        'Site_id = 0')
      ParamData = <
        item
          DataType = ftUnknown
          Name = 'Region_id'
          ParamType = ptUnknown
        end>
    end
    inherited QuerySearch: TIBQuery
      SQL.Strings = (
        'select * from KLADR '
        'where '
        'REGION_ID > 0 and'
        'AREA_ID = 0 and'
        'CITY_ID  = 0 and'
        'SITE_ID  = 0 and'
        'ACTUAL  = 0 ')
    end
  end
  inline FrameCity: TFrameItemKLADR [1]
    Left = 0
    Top = 52
    Width = 334
    Height = 30
    Enabled = False
    TabOrder = 1
    ExplicitTop = 52
    inherited lblName: TLabel
      Caption = #1043#1086#1088#1086#1076
    end
    inherited Query: TIBQuery
      SQL.Strings = (
        'select * from KLADR '
        'where '
        'Region_id = :Region_id and'
        'Area_id = :Area_id and'
        'City_id = :City_id and'
        'Site_id = 0')
      ParamData = <
        item
          DataType = ftUnknown
          Name = 'Region_id'
          ParamType = ptUnknown
        end
        item
          DataType = ftUnknown
          Name = 'Area_id'
          ParamType = ptUnknown
        end
        item
          DataType = ftUnknown
          Name = 'City_id'
          ParamType = ptUnknown
        end>
    end
    inherited QuerySearch: TIBQuery
      SQL.Strings = (
        'select * from KLADR '
        'where '
        'Region_id = :Region_id and'
        'AREA_ID = :AREA_ID  and'
        'CITY_ID > 0 and'
        'SITE_ID  = 0 and'
        'ACTUAL  = 0 and'
        'upper(name) like upper('#39'%:search%'#39')')
      ParamData = <
        item
          DataType = ftUnknown
          Name = 'Region_id'
          ParamType = ptUnknown
        end
        item
          DataType = ftUnknown
          Name = 'Area_id'
          ParamType = ptUnknown
        end>
    end
  end
  inline FrameSite: TFrameItemKLADR [2]
    Left = 0
    Top = 77
    Width = 334
    Height = 30
    Enabled = False
    TabOrder = 2
    ExplicitTop = 77
    inherited lblName: TLabel
      Width = 55
      Caption = #1053#1072#1089'. '#1087#1091#1085#1082#1090
      ExplicitWidth = 55
    end
    inherited QuerySearch: TIBQuery
      SQL.Strings = (
        'select * from KLADR '
        'where '
        'Region_id = :Region_id and'
        'AREA_ID = :AREA_ID  and'
        'CITY_ID  = :CITY_ID  and'
        'SITE_ID  > 0 and'
        'ACTUAL  = 0 and'
        'upper(name) like upper('#39'%:search%'#39')')
      ParamData = <
        item
          DataType = ftUnknown
          Name = 'Region_id'
          ParamType = ptUnknown
        end
        item
          DataType = ftUnknown
          Name = 'Area_id'
          ParamType = ptUnknown
        end
        item
          DataType = ftUnknown
          Name = 'City_id'
          ParamType = ptUnknown
        end>
    end
  end
  inline FrameDom: TFrameItemKLADR
    Left = 0
    Top = 129
    Width = 334
    Height = 30
    Enabled = False
    TabOrder = 3
    ExplicitTop = 129
    inherited lblName: TLabel
      Width = 20
      Caption = #1044#1086#1084
      ExplicitWidth = 20
    end
    inherited btnEdit: TRzBitBtn
      Top = 4
      ExplicitTop = 4
    end
    inherited edtName: TcxTextEdit
      Top = 3
      ExplicitTop = 3
      ExplicitWidth = 83
      Width = 83
    end
    inherited edtSocr: TcxTextEdit
      Top = 3
      ExplicitTop = 3
    end
  end
  inline FrameStreet: TFrameItemKLADR
    Left = 0
    Top = 102
    Width = 334
    Height = 30
    Enabled = False
    TabOrder = 4
    ExplicitTop = 102
    inherited lblName: TLabel
      Caption = #1059#1083#1080#1094#1072
    end
  end
  inline FrameArea: TFrameItemKLADR
    Left = 0
    Top = 26
    Width = 334
    Height = 30
    Enabled = False
    TabOrder = 5
    ExplicitTop = 26
    inherited lblName: TLabel
      Width = 30
      Caption = #1056#1072#1081#1086#1085
      ExplicitWidth = 30
    end
    inherited Query: TIBQuery
      SQL.Strings = (
        'select * from KLADR '
        'where '
        'Region_id = :Region_id and'
        'Area_id = :Area_id and'
        'City_id = 0 and'
        'Site_id = 0')
      ParamData = <
        item
          DataType = ftUnknown
          Name = 'Region_id'
          ParamType = ptUnknown
        end
        item
          DataType = ftUnknown
          Name = 'Area_id'
          ParamType = ptUnknown
        end>
    end
    inherited QuerySearch: TIBQuery
      SQL.Strings = (
        'select * from KLADR '
        'where '
        'Region_id = :Region_id and'
        'AREA_ID > 0 and'
        'CITY_ID  = 0 and'
        'SITE_ID  = 0 and'
        'ACTUAL  = 0 and'
        'upper(name) like upper('#39'%:search%'#39')')
      ParamData = <
        item
          DataType = ftUnknown
          Name = 'Region_id'
          ParamType = ptUnknown
        end>
    end
  end
  inherited Query_upd: TIBUpdateSQL
    RefreshSQL.Strings = (
      'select id, code_kladr from address where id = :id')
    ModifySQL.Strings = (
      'update address set '
      'code_kladr = :code_kladr'
      'where id = :ID')
    InsertSQL.Strings = (
      'insert into adress (id, code_kladr)'
      'values(:id, :code_kladr)')
    DeleteSQL.Strings = (
      'delete from address where id = :id')
    Left = 248
    Top = 57
  end
  inherited Query: TIBQuery
    SQL.Strings = (
      'select ID, CODE_KLADR from ADRESS'
      'where id = :id')
    GeneratorField.Generator = 'GEN_ADRESS_ID'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 248
    Top = 17
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  inherited DS: TDataSource
    Left = 216
    Top = 17
  end
end
