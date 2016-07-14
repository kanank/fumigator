inherited frmContact: TfrmContact
  Caption = 'frmContact'
  ClientHeight = 204
  OnCreate = FormCreate
  ExplicitWidth = 657
  ExplicitHeight = 242
  PixelsPerInch = 96
  TextHeight = 13
  inherited img1: TImage
    Top = -154
    Visible = False
    ExplicitTop = -154
  end
  inherited RzPanel1: TRzPanel
    Top = 160
    ExplicitTop = 160
    inherited Image2: TImage
      Left = 2
      Top = 3
      Anchors = [akLeft, akBottom]
      ExplicitLeft = 2
      ExplicitTop = 3
    end
    object butOk: TRzButton
      Left = 363
      Top = 9
      Width = 124
      Height = 29
      ModalResult = 1
      Anchors = [akTop, akRight]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
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
      OnClick = butOkClick
    end
  end
  inline FrameContact: TFrameContact
    Left = 8
    Top = 8
    Width = 631
    Height = 149
    TabOrder = 1
    ExplicitLeft = 8
    ExplicitTop = 8
    inherited cmbType: TcxDBLookupComboBox
      Style.IsFontAssigned = True
      ExplicitHeight = 24
    end
    inherited cxDBTextEdit1: TcxDBTextEdit
      Style.IsFontAssigned = True
      ExplicitHeight = 24
    end
    inherited FramePhones: TFramePhones
      inherited grpPhone: TRzGroupBox
        inherited RzPanel2: TRzPanel
          inherited btnAdd: TRzBitBtn
            Top = 0
            ExplicitTop = 0
          end
          inherited btnDel: TRzBitBtn
            Top = 97
            ExplicitTop = 97
          end
        end
      end
    end
  end
  object DS: TDataSource
    Left = 176
    Top = 152
  end
end
