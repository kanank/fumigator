inherited frmContact: TfrmContact
  Caption = ''
  ClientHeight = 282
  ClientWidth = 826
  FormStyle = fsStayOnTop
  Position = poDesktopCenter
  OnCreate = FormCreate
  ExplicitLeft = -12
  ExplicitWidth = 842
  ExplicitHeight = 320
  PixelsPerInch = 96
  TextHeight = 18
  inherited img1: TImage
    Left = 816
    Top = -213
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Visible = False
    ExplicitTop = -213
  end
  inherited RzPanel1: TRzPanel
    Top = 221
    Width = 826
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    ExplicitTop = 221
    inherited Image2: TImage
      Left = 3
      Top = 4
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Anchors = [akLeft, akBottom]
      ExplicitLeft = 3
      ExplicitTop = 4
    end
    inherited Exit_bnt: TRzButton
      Left = 887
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
    end
    object butOk: TRzButton
      Left = 648
      Top = 12
      Width = 171
      Height = 41
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ModalResult = 1
      Anchors = [akTop, akRight]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 2960640
      Font.Height = -15
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
    Left = 11
    Top = 11
    Width = 874
    Height = 206
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ExplicitLeft = 11
    ExplicitTop = 11
    ExplicitWidth = 874
    ExplicitHeight = 206
    inherited Label1: TLabel
      Left = 4
      Top = 14
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 4
      ExplicitTop = 14
    end
    inherited Label3: TLabel
      Left = 4
      Top = 60
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 4
      ExplicitTop = 60
    end
    inherited cmbType: TcxDBLookupComboBox
      Left = 121
      Top = 10
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style.IsFontAssigned = True
      ExplicitLeft = 121
      ExplicitTop = 10
      ExplicitWidth = 305
      ExplicitHeight = 26
      Width = 305
    end
    inherited cxDBTextEdit1: TcxDBTextEdit
      Left = 121
      Top = 58
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style.IsFontAssigned = True
      ExplicitLeft = 121
      ExplicitTop = 58
      ExplicitWidth = 305
      ExplicitHeight = 26
      Width = 305
    end
    inherited FramePhones: TFramePhones
      Left = 464
      Top = 4
      Width = 353
      Height = 200
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 464
      ExplicitTop = 4
      ExplicitWidth = 353
      ExplicitHeight = 200
      inherited grpPhone: TRzGroupBox
        Left = 1
        Width = 346
        Height = 196
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ExplicitLeft = 1
        ExplicitWidth = 346
        ExplicitHeight = 196
        inherited grdPhone: TcxGrid
          Left = 6
          Top = 22
          Width = 294
          Height = 165
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ExplicitLeft = 6
          ExplicitTop = 22
          ExplicitWidth = 294
          ExplicitHeight = 165
          inherited grdPhoneDBTableView2: TcxGridDBTableView
            inherited grdPhoneDBTableView2Column2: TcxGridDBColumn
              Styles.Header = FrameContact.cxStyle1
              Width = 160
            end
            inherited grdPhoneDBTableView2Column5: TcxGridDBColumn
              Styles.Header = FrameContact.cxStyle1
              Width = 39
            end
            inherited grdPhoneDBTableView2Column3: TcxGridDBColumn
              Styles.Header = FrameContact.cxStyle1
            end
          end
        end
        inherited RzPanel2: TRzPanel
          Left = 302
          Width = 43
          Height = 176
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ExplicitLeft = 302
          ExplicitWidth = 43
          ExplicitHeight = 176
          inherited btnAdd: TRzBitBtn
            Top = 3
            Width = 39
            Height = 39
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Margin = 3
            Spacing = 6
            ExplicitTop = 3
            ExplicitWidth = 39
            ExplicitHeight = 39
          end
          inherited btnEdit: TRzBitBtn
            Top = 47
            Width = 39
            Height = 39
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Margin = 3
            Spacing = 6
            ExplicitTop = 47
            ExplicitWidth = 39
            ExplicitHeight = 39
          end
          inherited btnDel: TRzBitBtn
            Top = 129
            Width = 39
            Height = 39
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Margin = 3
            Spacing = 6
            ExplicitTop = 129
            ExplicitWidth = 39
            ExplicitHeight = 39
          end
        end
      end
    end
    inherited cxStyleRepository1: TcxStyleRepository
      PixelsPerInch = 96
    end
  end
  object DS: TDataSource
    Left = 176
    Top = 152
  end
end
