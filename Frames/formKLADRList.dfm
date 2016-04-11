inherited frmKLADRList: TfrmKLADRList
  Caption = #1042#1099#1073#1086#1088
  ClientHeight = 272
  ClientWidth = 282
  ExplicitWidth = 288
  ExplicitHeight = 300
  PixelsPerInch = 96
  TextHeight = 13
  inherited lblData: TLabel
    Left = 312
    Top = 8
    Width = 25
    Visible = False
    ExplicitLeft = 312
    ExplicitTop = 8
    ExplicitWidth = 25
  end
  inherited edtData: TcxDBMaskEdit
    Left = 304
    Visible = False
    ExplicitLeft = 304
    ExplicitWidth = 33
    Width = 33
  end
  inherited btnOK: TRzButton
    Left = 48
    Top = 241
    ExplicitLeft = 48
    ExplicitTop = 241
  end
  inherited bntCancel: TRzButton
    Left = 147
    Top = 241
    ExplicitLeft = 147
    ExplicitTop = 241
  end
  object grid: TcxGrid [4]
    Left = -1
    Top = 0
    Width = 283
    Height = 240
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    object gridDBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = DS
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsBehavior.IncSearchItem = gridDBTableView1Column1
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnHidingOnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ScrollBars = ssVertical
      OptionsView.GridLines = glNone
      OptionsView.GroupByBox = False
      object gridDBTableView1Column1: TcxGridDBColumn
        DataBinding.FieldName = 'SERVICE_ID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.GridMode = True
        Properties.HideSelection = False
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'NAME'
          end>
        Properties.ListSource = DataModuleMain.DSDicServices
        Options.Editing = False
        Width = 281
        IsCaptionAssigned = True
      end
    end
    object gridLevel1: TcxGridLevel
      GridView = gridDBTableView1
    end
  end
end
