inherited frameClientCalls: TframeClientCalls
  Width = 765
  Height = 190
  ExplicitWidth = 765
  ExplicitHeight = 190
  inherited grpPhone: TRzGroupBox
    Width = 760
    Height = 185
    Caption = #1047#1074#1086#1085#1082#1080' '#1082#1083#1080#1077#1085#1090#1072
    ExplicitWidth = 760
    ExplicitHeight = 185
    inherited RzPanel2: TRzPanel [0]
      Left = 728
      Height = 170
      Visible = False
      ExplicitLeft = 624
      ExplicitHeight = 170
      inherited btnAdd: TRzBitBtn
        Top = 66
        ExplicitTop = 66
      end
      inherited btnEdit: TRzBitBtn
        Top = 100
        ExplicitTop = 100
      end
      inherited btnDel: TRzBitBtn
        Top = 141
        ExplicitTop = 141
      end
    end
    inherited grdPhone: TcxGrid [1]
      Width = 754
      Height = 167
      ExplicitWidth = 650
      ExplicitHeight = 167
      object grdPhoneDBTableView1: TcxGridDBTableView [0]
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = DS
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnGrouping = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.GroupByBox = False
        object GridViewColumn1: TcxGridDBColumn
          Caption = #1058#1080#1087' '#1074#1099#1079#1086#1074#1072
          DataBinding.FieldName = 'CALLTYPE'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.GridMode = True
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'NAME'
            end>
          Properties.ListOptions.GridLines = glNone
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = DataModuleMain.DSDicCallTypes
          Properties.ValidateOnEnter = False
          HeaderAlignmentHorz = taCenter
          Width = 70
        end
        object GridViewColumn4: TcxGridDBColumn
          Caption = #1053#1072#1095#1072#1083#1086
          DataBinding.FieldName = 'STARTTIME'
          HeaderAlignmentHorz = taCenter
          Width = 96
        end
        object GridViewColumn6: TcxGridDBColumn
          Caption = #1044#1083#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100
          DataBinding.FieldName = 'DATESTRING'
          HeaderAlignmentHorz = taCenter
          Width = 85
        end
        object GridViewColumn7: TcxGridDBColumn
          Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082
          DataBinding.FieldName = 'WORKER_ID'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.GridMode = True
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'SHORT_NAME'
            end>
          Properties.ListSource = DataModuleMain.DSWorkers
          HeaderAlignmentHorz = taCenter
          Width = 112
        end
        object GridViewColumn9: TcxGridDBColumn
          Caption = #1048#1089#1093#1086#1076
          DataBinding.FieldName = 'ISHOD'
          HeaderAlignmentHorz = taCenter
          Width = 137
        end
        object GridViewColumn10: TcxGridDBColumn
          Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081' '#1082' '#1089#1077#1089#1089#1080#1080
          DataBinding.FieldName = 'RESULT'
          HeaderAlignmentHorz = taCenter
          Width = 138
        end
        object GridViewColumn11: TcxGridDBColumn
          DataBinding.FieldName = 'DURATION'
          Visible = False
          Options.AutoWidthSizable = False
          Width = 20
          IsCaptionAssigned = True
        end
        object grdPhoneDBTableView1Column1: TcxGridDBColumn
          Caption = #1047#1072#1087#1080#1089#1100' '#1088#1072#1079#1075#1086#1074#1086#1088#1072
          Width = 103
        end
      end
      inherited grdPhoneLevel1: TcxGridLevel
        GridView = grdPhoneDBTableView1
      end
    end
  end
  inherited Query: TIBQuery
    SQL.Strings = (
      'select * from sessions '
      'where client_id = :client_id and starttime > current_date-30')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'client_id'
        ParamType = ptUnknown
      end>
  end
end
