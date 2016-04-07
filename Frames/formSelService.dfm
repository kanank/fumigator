inherited frmSelectService: TfrmSelectService
  Left = 253
  Top = 27
  Caption = #1042#1099#1073#1086#1088' '#1091#1089#1083#1091#1075
  ClientHeight = 318
  ClientWidth = 205
  OnShow = FormShow
  ExplicitWidth = 211
  ExplicitHeight = 346
  PixelsPerInch = 96
  TextHeight = 13
  inherited lblData: TLabel
    Visible = False
  end
  inherited edtData: TcxDBMaskEdit
    Top = 22
    DataBinding.DataField = ''
    DataBinding.DataSource = nil
    Visible = False
    ExplicitTop = 22
  end
  inherited btnOK: TRzButton
    Left = 1
    Top = 288
    Anchors = [akLeft, akBottom]
    ExplicitLeft = 1
    ExplicitTop = 288
  end
  inherited bntCancel: TRzButton
    Left = 134
    Top = 290
    Anchors = [akRight, akBottom]
    ExplicitLeft = 134
    ExplicitTop = 290
  end
  object grdService: TcxGrid [4]
    Left = 1
    Top = -1
    Width = 203
    Height = 285
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    ExplicitHeight = 309
    object grdServiceDBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = DS
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnHidingOnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.ScrollBars = ssVertical
      OptionsView.GridLines = glNone
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      object grdServiceDBTableView1Column1: TcxGridDBColumn
        DataBinding.FieldName = 'sel'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayChecked = '1'
        Properties.DisplayUnchecked = '0'
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        Options.Grouping = False
        Options.Moving = False
        Options.ShowCaption = False
        Width = 25
      end
      object grdServiceDBTableView1Column2: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        Options.Editing = False
        Width = 174
      end
    end
    object grdServiceLevel1: TcxGridLevel
      GridView = grdServiceDBTableView1
    end
  end
  object MemServices: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 86
    Top = 290
  end
end
