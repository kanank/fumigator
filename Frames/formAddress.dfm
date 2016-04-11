inherited frmAddress: TfrmAddress
  Caption = #1040#1076#1088#1077#1089
  ClientHeight = 145
  ClientWidth = 489
  ExplicitWidth = 495
  ExplicitHeight = 173
  PixelsPerInch = 96
  TextHeight = 13
  inherited lblData: TLabel
    Left = 408
    Top = 8
    Visible = False
    ExplicitLeft = 408
    ExplicitTop = 8
  end
  object Label1: TLabel [1]
    Left = 8
    Top = 11
    Width = 35
    Height = 13
    Caption = #1056#1077#1075#1080#1086#1085
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  inherited edtData: TcxDBMaskEdit
    Left = 448
    Top = 8
    Visible = False
    ExplicitLeft = 448
    ExplicitTop = 8
    ExplicitWidth = 33
    Width = 33
  end
  inherited btnOK: TRzButton
    Left = 168
    Top = 95
    ExplicitLeft = 168
    ExplicitTop = 95
  end
  inherited bntCancel: TRzButton
    Left = 267
    Top = 95
    ExplicitLeft = 267
    ExplicitTop = 95
  end
  object cbRegion: TcxDBLookupComboBox [5]
    Left = 87
    Top = 8
    Properties.ListColumns = <>
    TabOrder = 3
    Width = 202
  end
end
