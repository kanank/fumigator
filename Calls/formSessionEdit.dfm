inherited frmSessionEdit: TfrmSessionEdit
  Caption = #1057#1077#1089#1089#1080#1103' ['#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077']'
  ClientHeight = 601
  ClientWidth = 763
  ExplicitWidth = 779
  ExplicitHeight = 639
  PixelsPerInch = 96
  TextHeight = 13
  inherited img1: TImage
    Left = 578
    Top = 243
    ExplicitLeft = 578
    ExplicitTop = 141
  end
  inherited RzPanel1: TRzPanel
    Top = 557
    Width = 763
    ExplicitTop = 455
    ExplicitWidth = 763
    inherited Image2: TImage
      Left = 128
      ExplicitLeft = 128
    end
    inherited Exit_bnt: TRzButton
      Left = 629
      ExplicitLeft = 629
    end
    object RzButton1: TRzButton
      Left = 493
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
  end
  object pnlResult: TRzPanel
    Left = 0
    Top = 0
    Width = 763
    Height = 163
    Align = alTop
    BorderOuter = fsFlat
    BorderSides = [sdBottom]
    TabOrder = 1
  end
  object pnlCalls: TRzPanel
    Left = 0
    Top = 376
    Width = 763
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
        inherited RzPanel2: TRzPanel
          ExplicitLeft = 728
        end
        inherited grdPhone: TcxGrid
          Left = 5
          Top = 17
          ExplicitLeft = 5
          ExplicitTop = 17
          ExplicitWidth = 754
          inherited grdPhoneDBTableView1: TcxGridDBTableView
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
    Width = 763
    Height = 213
    Align = alClient
    BorderOuter = fsFlat
    BorderSides = [sdBottom]
    TabOrder = 3
    ExplicitHeight = 230
  end
end