inherited frmIncomeCallRoot: TfrmIncomeCallRoot
  BorderIcons = []
  BorderStyle = bsNone
  Caption = #1042#1093#1086#1076#1103#1097#1080#1081' '#1079#1074#1086#1085#1086#1082
  ClientHeight = 131
  ClientWidth = 276
  TransparentColor = True
  TransparentColorValue = clBtnFace
  WindowState = wsMinimized
  OnShow = FormShow
  ExplicitWidth = 276
  ExplicitHeight = 131
  PixelsPerInch = 96
  TextHeight = 13
  inherited img1: TImage
    Left = 24
    Top = 128
    Visible = False
    ExplicitLeft = 8
    ExplicitTop = 90
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 200
    OnTimer = Timer1Timer
    Left = 120
    Top = 24
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 200
    OnTimer = Timer2Timer
    Left = 168
    Top = 24
  end
  object CheckTimer: TTimer
    Enabled = False
    OnTimer = CheckTimerTimer
    Left = 224
    Top = 24
  end
end
