inherited frmSessions: TfrmSessions
  Caption = #1057#1077#1089#1089#1080#1080
  ClientWidth = 787
  Position = poDesktopCenter
  OnCreate = FormCreate
  ExplicitWidth = 803
  PixelsPerInch = 96
  TextHeight = 13
  inherited img1: TImage
    Left = 594
  end
  inherited RzPanel2: TRzPanel
    Width = 787
    inherited Image1: TImage
      Left = 690
    end
    object Label11: TLabel
      Left = 9
      Top = 8
      Width = 129
      Height = 13
      Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072' '#1079#1072' '#1087#1077#1088#1080#1086#1076' '#1086#1090
      Color = clBtnShadow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label1: TLabel
      Left = 252
      Top = 8
      Width = 13
      Height = 13
      Caption = #1076#1086
      Color = clBtnShadow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object edtTimeStart: TcxDateEdit
      Left = 153
      Top = 5
      Properties.DisplayFormat = 'dd.mm.yyyy'
      TabOrder = 0
      Width = 88
    end
    object RzButton1: TRzButton
      Left = 367
      Top = 5
      Width = 83
      Height = 21
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      HotTrack = True
      HotTrackColor = 16625984
      ParentFont = False
      TabOrder = 1
      ThemeAware = False
      OnClick = RzButton1Click
    end
  end
  inherited RzPanel1: TRzPanel
    Width = 787
    inherited Cancel_btn: TRzButton
      Left = 651
    end
    inherited Edit_btn: TRzButton
      Visible = False
    end
    inherited Del_btn: TRzButton
      Visible = False
    end
    inherited Add_btn: TRzButton
      Visible = False
    end
  end
  inherited Grid: TcxGrid
    Top = 33
    Width = 787
    Height = 276
    Align = alClient
    ExplicitWidth = 787
    inherited GridView: TcxGridDBTableView
      DataController.DataSource = DS
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GridLines = glVertical
      OptionsView.HeaderHeight = 40
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
        Styles.Header = cxStyle1
      end
      object GridViewColumn2: TcxGridDBColumn
        Caption = #8470' '#1080#1089#1090#1086#1095#1085#1080#1082#1072
        DataBinding.FieldName = 'CALLERNUM'
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle1
        Width = 70
      end
      object GridViewColumn3: TcxGridDBColumn
        Caption = #8470' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
        DataBinding.FieldName = 'CALLEDNUM'
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle1
        Width = 75
      end
      object GridViewColumn4: TcxGridDBColumn
        Caption = #1053#1072#1095#1072#1083#1086
        DataBinding.FieldName = 'STARTTIME'
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle1
        Width = 59
      end
      object GridViewColumn5: TcxGridDBColumn
        Caption = #1050#1086#1085#1077#1094
        DataBinding.FieldName = 'ENDTIME'
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle1
        Width = 60
      end
      object GridViewColumn6: TcxGridDBColumn
        Caption = #1044#1083#1080#1090#1077#1083#1100'-'#1085#1086#1089#1090#1100
        DataBinding.FieldName = 'DURATION'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.DisplayFormat = 'hh:nn:ss.ms'
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle1
        Width = 66
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
        Styles.Header = cxStyle1
        Width = 75
      end
      object GridViewColumn8: TcxGridDBColumn
        Caption = #1050#1083#1080#1077#1085#1090
        DataBinding.FieldName = 'CLIENT_ID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.GridMode = True
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'NAME'
          end>
        Properties.ListSource = DataModuleMain.DsClients
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle1
        Width = 90
      end
      object GridViewColumn9: TcxGridDBColumn
        Caption = #1048#1089#1093#1086#1076
        DataBinding.FieldName = 'ISHOD'
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle1
        Width = 85
      end
      object GridViewColumn10: TcxGridDBColumn
        Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090
        DataBinding.FieldName = 'RESULT'
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle1
        Width = 130
      end
    end
  end
  object edtTimeEnd: TcxDateEdit
    Left = 273
    Top = 5
    Properties.DisplayFormat = 'dd.mm.yyyy'
    TabOrder = 3
    Width = 88
  end
  object Q: TIBQuery
    Database = DataModuleMain.DB
    Transaction = DataModuleMain.DefTr
    AutoCalcFields = False
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select *'
      'from sessions'
      'where starttime >=:date1 and  starttime <:date2')
    Left = 72
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'date1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'date2'
        ParamType = ptUnknown
      end>
  end
  object DS: TDataSource
    AutoEdit = False
    DataSet = Q
    Left = 24
    Top = 88
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
end
