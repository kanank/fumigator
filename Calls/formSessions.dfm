inherited frmSessions: TfrmSessions
  Caption = #1057#1077#1089#1089#1080#1080
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [1]
    Left = 155
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
  inherited RzPanel2: TRzPanel
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
    object edtTimeStart: TcxDateEdit
      Left = 153
      Top = 5
      Properties.DisplayFormat = 'dd.mm.yyyy'
      TabOrder = 0
      Width = 88
    end
  end
  inherited RzPanel1: TRzPanel
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
    inherited GridView: TcxGridDBTableView
      DataController.DataSource = DS
    end
  end
  object cxDateEdit1: TcxDateEdit
    Left = 299
    Top = 5
    Properties.DisplayFormat = 'dd.mm.yyyy'
    TabOrder = 3
    Width = 88
  end
  object Q: TIBQuery
    Database = DataModuleMain.DB
    Transaction = DataModuleMain.DefTr
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select *'
      'from sessions'
      '')
    Left = 72
    Top = 80
  end
  object DS: TDataSource
    DataSet = Q
    Left = 24
    Top = 88
  end
end
