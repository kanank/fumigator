inherited FramePhones: TFramePhones
  Width = 222
  Height = 145
  ExplicitWidth = 222
  ExplicitHeight = 145
  DesignSize = (
    222
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
      object grdPhoneDBTableView2: TcxGridDBTableView [0]
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = DS
        DataController.KeyFieldNames = 'ID'
        DataController.MasterKeyFieldNames = 'ID'
        DataController.Options = [dcoAssignMasterDetailKeys, dcoSaveExpanding]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.IncSearchItem = grdPhoneDBTableView2Column2
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.NoDataToDisplayInfoText = '<'#1053#1086#1084#1077#1088#1072' '#1085#1077' '#1076#1086#1073#1072#1074#1083#1077#1085#1099' >'
        OptionsView.ScrollBars = ssVertical
        OptionsView.GridLines = glNone
        OptionsView.GroupByBox = False
        OptionsView.Header = False
        object grdPhoneDBTableView2Column1: TcxGridDBColumn
          DataBinding.FieldName = 'ismain'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.Alignment = taCenter
          Properties.DisplayChecked = '1'
          Properties.DisplayUnchecked = '0'
          Properties.ReadOnly = False
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          Options.AutoWidthSizable = False
          Options.Moving = False
          Options.ShowCaption = False
          Width = 30
        end
        object grdPhoneDBTableView2Column2: TcxGridDBColumn
          DataBinding.FieldName = 'phone'
          Options.Editing = False
          Options.Moving = False
          Options.ShowCaption = False
          Width = 95
        end
        object grdPhoneDBTableView2Column3: TcxGridDBColumn
          DataBinding.FieldName = 'PHONE_TYPE_ID'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.DropDownListStyle = lsFixedList
          Properties.GridMode = True
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'SHORTNAME'
            end>
          Properties.ListOptions.GridLines = glNone
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = DataModuleMain.DsDicPhoneType
          Width = 33
        end
      end
      inherited grdPhoneLevel1: TcxGridLevel
        GridView = grdPhoneDBTableView2
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
        Left = 0
        Top = 1
        ExplicitLeft = 0
        ExplicitTop = 1
      end
      inherited btnEdit: TRzBitBtn
        Left = 0
        Top = 35
        ExplicitLeft = 0
        ExplicitTop = 35
      end
      inherited btnDel: TRzBitBtn
        Left = 0
        Top = 98
        ExplicitLeft = 0
        ExplicitTop = 98
      end
    end
  end
  inherited Query_upd: TIBUpdateSQL
    ModifySQL.Strings = (
      'update PHONES set '
      'PHONE = :PHONE,'
      'CLIENT_ID = :CLIENT_ID,'
      'ISMAIN = :ISMAIN,'
      '"TYPE" = :TYPE,'
      'PHONE_TYPE_ID = :PHONE_TYPE_ID'
      'where id = :ID')
    InsertSQL.Strings = (
      'insert into phones('
      'ID,'
      'PHONE,'
      'CLIENT_ID,'
      'ISMAIN,'
      '"TYPE",'
      'PHONE_TYPE_ID'
      ')'
      'values('
      ':ID,'
      ':PHONE,'
      ':CLIENT_ID,'
      ':ISMAIN,'
      ':TYPE,'
      ':PHONE_TYPE_ID'
      ')')
    DeleteSQL.Strings = (
      'delete from phones where id = :ID')
  end
  inherited Query: TIBQuery
    AfterPost = QueryAfterPost
    SQL.Strings = (
      'select * from phones where client_id = :client_id and type=0')
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
