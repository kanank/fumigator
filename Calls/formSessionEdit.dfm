inherited frmSessionEdit: TfrmSessionEdit
  Width = 846
  Height = 639
  VertScrollBar.ButtonSize = 10
  VertScrollBar.Size = 100
  AutoScroll = True
  Caption = #1057#1077#1089#1089#1080#1103' ['#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077']'
  Position = poDesktopCenter
  ExplicitWidth = 846
  ExplicitHeight = 639
  PixelsPerInch = 96
  TextHeight = 13
  inherited img1: TImage
    Left = 645
    Top = 243
    ExplicitLeft = 578
    ExplicitTop = 141
  end
  inherited RzPanel1: TRzPanel
    Top = 557
    Width = 830
    ExplicitTop = 557
    ExplicitWidth = 830
    inherited Image2: TImage
      Left = 4
      Top = 6
      Anchors = [akLeft, akBottom]
      ExplicitLeft = 4
      ExplicitTop = 6
    end
    inherited Exit_bnt: TRzButton
      Left = 696
      ExplicitLeft = 696
    end
    object RzButton1: TRzButton
      Left = 560
      Top = 9
      Width = 124
      Height = 29
      ModalResult = 1
      Anchors = [akTop, akRight]
      Caption = #1054#1050
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 2960640
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      HotTrack = True
      HotTrackColor = 16625984
      ParentFont = False
      TabOrder = 1
      ThemeAware = False
    end
    object btnClientEdit: TRzButton
      Left = 168
      Top = 10
      Width = 137
      Height = 29
      Anchors = [akTop, akRight]
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1082#1072#1088#1090#1086#1095#1082#1091' '#1082#1083#1080#1077#1085#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 2960640
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      HotTrack = True
      HotTrackColor = 16625984
      ParentFont = False
      TabOrder = 2
      ThemeAware = False
      OnClick = btnClientEditClick
    end
  end
  object pnlResult: TRzPanel
    Left = 0
    Top = 0
    Width = 830
    Height = 163
    Align = alTop
    BorderOuter = fsFlat
    BorderSides = [sdBottom]
    TabOrder = 1
  end
  object pnlCalls: TRzPanel
    Left = 0
    Top = 376
    Width = 830
    Height = 181
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 2
    inline frameClientCalls: TframeClientCalls
      Left = -2
      Top = 0
      Width = 765
      Height = 190
      TabOrder = 0
      ExplicitLeft = -2
      inherited grpPhone: TRzGroupBox
        Width = 764
        ExplicitWidth = 764
        inherited RzPanel2: TRzPanel
          Left = 732
          ExplicitLeft = 732
        end
        inherited grdPhone: TcxGrid
          Left = 5
          Top = 17
          Width = 758
          ExplicitLeft = 5
          ExplicitTop = 17
          ExplicitWidth = 758
          inherited GridView: TcxGridDBTableView
            inherited GridViewColumn11: TcxGridDBColumn
              IsCaptionAssigned = True
            end
          end
        end
      end
    end
  end
  object pnlClient: TRzPanel
    Left = 0
    Top = 163
    Width = 830
    Height = 213
    Align = alClient
    AutoSize = True
    BorderOuter = fsFlat
    BorderSides = [sdBottom]
    TabOrder = 3
  end
end
