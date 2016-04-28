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
    Visible = False
    ExplicitLeft = 312
    ExplicitTop = 8
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
      OnCellDblClick = gridDBTableView1CellDblClick
      DataController.DataSource = DS
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
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
      OptionsView.Header = False
      object gridDBTableView1Column1: TcxGridDBColumn
        DataBinding.FieldName = 'SOCR'
        Width = 40
      end
      object gridDBTableView1Column2: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        Width = 222
      end
    end
    object gridLevel1: TcxGridLevel
      GridView = gridDBTableView1
    end
  end
end
