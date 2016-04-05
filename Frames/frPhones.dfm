inherited FramePhones: TFramePhones
  Width = 218
  Height = 145
  ExplicitWidth = 218
  ExplicitHeight = 145
  DesignSize = (
    218
    145)
  inherited grpPhone: TRzGroupBox
    Left = 4
    Width = 214
    Height = 143
    Anchors = [akLeft, akTop, akBottom]
    ExplicitLeft = 4
    ExplicitWidth = 214
    ExplicitHeight = 143
    DesignSize = (
      214
      143)
    inherited grdPhone: TcxGrid
      Width = 177
      Height = 125
      ExplicitWidth = 177
      ExplicitHeight = 125
      inherited grdPhoneDBTableView1: TcxGridDBTableView
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        inherited grdPhoneDBTableView1Column2: TcxGridDBColumn [0]
          Options.Editing = False
          Options.Moving = False
          Options.ShowCaption = False
          Width = 146
        end
        inherited grdPhoneDBTableView1Column1: TcxGridDBColumn [1]
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.Alignment = taCenter
          Properties.DisplayChecked = '1'
          Properties.DisplayUnchecked = '0'
          Properties.ReadOnly = False
          Properties.ValueChecked = '1'
          Properties.ValueUnchecked = '0'
          Options.Editing = False
          Options.AutoWidthSizable = False
          Options.ShowCaption = False
          Width = 30
        end
      end
    end
    inherited RzPanel2: TRzPanel
      Left = 182
      Height = 128
      ExplicitLeft = 182
      ExplicitHeight = 128
      DesignSize = (
        31
        128)
      inherited btnAdd: TRzBitBtn
        Top = 1
        OnClick = btnAddClick
        ExplicitTop = 1
      end
      inherited btnEdit: TRzBitBtn
        Top = 35
        ExplicitTop = 35
      end
      inherited btnDel: TRzBitBtn
        Top = 98
        ExplicitTop = 98
      end
    end
  end
  inherited Query_upd: TIBUpdateSQL
    ModifySQL.Strings = (
      'updatePHONES set '
      'PHONE = :PHONE,'
      'CLIENT_ID = :CLIENT_ID,'
      'ISMAIN = :ISMAIN,'
      '"TYPE" = :TYPE'
      'where id = :ID')
    InsertSQL.Strings = (
      'insert into phones('
      'ID,'
      'PHONE,'
      'CLIENT_ID,'
      'ISMAIN,'
      'TYPE'
      ')'
      'values('
      ':ID,'
      ':PHONE,'
      ':CLIENT_ID,'
      ':ISMAIN,'
      ':TYPE'
      ')')
    DeleteSQL.Strings = (
      'delete from phones where id = :ID')
  end
  inherited Query: TIBQuery
    AfterPost = QueryAfterPost
    SQL.Strings = (
      'select * from phones where client_id = :client_id')
    GeneratorField.Generator = 'GEN_PHONES_ID'
    GeneratorField.ApplyEvent = gamOnPost
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'client_id'
        ParamType = ptUnknown
      end>
  end
end
