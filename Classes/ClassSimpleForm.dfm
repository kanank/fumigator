inherited SimpleForm: TSimpleForm
  Caption = 'SimpleForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited img1: TImage
    Left = 456
    Top = 0
    Width = 185
    Height = 81
    Proportional = True
    Stretch = True
    Transparent = True
    ExplicitLeft = 456
    ExplicitTop = 0
    ExplicitWidth = 185
    ExplicitHeight = 81
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 314
    Width = 641
    Height = 44
    Align = alBottom
    BorderOuter = fsBump
    BorderSides = [sdTop, sdBottom]
    TabOrder = 0
    DesignSize = (
      641
      44)
    object Exit_bnt: TRzButton
      Left = 507
      Top = 9
      Width = 124
      Height = 29
      ModalResult = 2
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1093#1086#1076
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 2960640
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      HotTrack = True
      HotTrackColor = 16625984
      ParentFont = False
      TabOrder = 0
      ThemeAware = False
    end
  end
end
