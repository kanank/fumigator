inherited frmClients: TfrmClients
  Caption = #1050#1083#1080#1077#1085#1090#1099
  Position = poDesktopCenter
  ExplicitWidth = 657
  ExplicitHeight = 396
  PixelsPerInch = 96
  TextHeight = 13
  inherited RzPanel2: TRzPanel
    ExplicitTop = -7
    inherited Image1: TImage
      Left = 7
      Top = 4
      ExplicitLeft = 7
      ExplicitTop = 4
    end
    object Fiz_btn: TRzButton
      Left = 368
      Top = 2
      Width = 130
      Height = 27
      GroupIndex = 2
      Down = True
      FrameColor = clGray
      ShowDownPattern = False
      Anchors = [akTop, akRight]
      Caption = #1060#1080#1079#1080#1095#1077#1089#1082#1080#1077' '#1083#1080#1094#1072
      Color = 16444638
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      HotTrack = True
      HotTrackColor = 16625984
      ParentFont = False
      TabOrder = 0
      ThemeAware = False
      OnClick = Fiz_btnClick
    end
    object Ur_btn: TRzButton
      Left = 504
      Top = 2
      Width = 130
      Height = 27
      GroupIndex = 2
      FrameColor = clGray
      ShowDownPattern = False
      Anchors = [akTop, akRight]
      Caption = #1070#1088#1080#1076#1080#1095#1077#1089#1082#1080#1077' '#1083#1080#1094#1072
      Color = 15332600
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      HotTrack = True
      HotTrackColor = 16625984
      ParentFont = False
      TabOrder = 1
      ThemeAware = False
      OnClick = Ur_btnClick
    end
  end
  inherited RzPanel1: TRzPanel
    inherited Cancel_btn: TRzButton
      ExplicitLeft = 505
    end
  end
  inherited Grid: TcxGrid
    inherited GridView: TcxGridDBTableView
      DataController.DataSource = DS
      OptionsView.GridLines = glVertical
      OptionsView.HeaderAutoHeight = True
      Styles.Header = cxStyle1
      object GridViewColumn1: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        HeaderAlignmentHorz = taCenter
        Width = 48
      end
      object GridViewColumn2: TcxGridDBColumn
        Caption = #1050#1083#1080#1077#1085#1090
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        Width = 155
      end
      object GridViewColumn3: TcxGridDBColumn
        Caption = #1058#1077#1083#1077#1092#1086#1085
        DataBinding.FieldName = 'PHONE'
        HeaderAlignmentHorz = taCenter
        Width = 106
      end
      object GridViewColumn4: TcxGridDBColumn
        DataBinding.FieldName = 'EMAIL'
        HeaderAlignmentHorz = taCenter
        Width = 112
      end
      object GridViewColumn5: TcxGridDBColumn
        Caption = #1054#1090#1074'. '#1089#1086#1090#1088#1091#1076#1085#1080#1082
        DataBinding.FieldName = 'WORKER_NAME'
        HeaderAlignmentHorz = taCenter
        Width = 136
      end
      object GridViewColumn6: TcxGridDBColumn
        Caption = #1050#1086#1083'-'#1074#1086' '#1076#1086#1075'.'
        DataBinding.FieldName = 'CNT_DOG'
        HeaderAlignmentHorz = taCenter
      end
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
  end
  object DS: TDataSource
    AutoEdit = False
    Left = 453
    Top = 312
  end
end
