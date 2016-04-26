inherited frmWorker: TfrmWorker
  Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082#1080
  ClientHeight = 325
  ClientWidth = 772
  Position = poDesktopCenter
  OnCreate = FormCreate
  ExplicitWidth = 788
  ExplicitHeight = 363
  PixelsPerInch = 96
  TextHeight = 13
  inherited img1: TImage
    Left = 581
    Top = -33
    ExplicitLeft = 523
    ExplicitTop = 224
  end
  inherited RzPanel1: TRzPanel
    Top = 281
    Width = 772
    ExplicitTop = 281
    ExplicitWidth = 772
    inherited Exit_bnt: TRzButton
      Left = 638
      Top = 5
      Font.Color = clWindowText
      OnClick = Exit_bntClick
      ExplicitLeft = 638
      ExplicitTop = 5
    end
    object FullForm_btn: TRzButton
      Left = 22
      Top = 9
      Width = 119
      Height = 29
      Caption = #1056#1072#1079#1074#1077#1088#1085#1091#1090#1100
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
      Visible = False
      OnClick = FullForm_btnClick
    end
  end
  object RzPageControl1: TRzPageControl
    Left = 0
    Top = 0
    Width = 772
    Height = 281
    Hint = ''
    Margins.Top = 0
    Margins.Bottom = 0
    ActivePage = Full_Tab
    ActivePageDefault = Full_Tab
    Align = alClient
    ShowShadow = False
    TabIndex = 0
    TabOrder = 1
    TabStyle = tsBackSlant
    TextColors.Selected = 8224125
    FixedDimension = 19
    object Short_Tab: TRzTabSheet
      TabVisible = False
      Caption = #1057#1086#1082#1088#1072#1097#1077#1085#1085#1072#1103' '#1092#1086#1088#1084#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = -1
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      inline _FramePersonSmall: TFramePersonSmallFoto
        Left = -1
        Top = 8
        Width = 579
        Height = 128
        TabOrder = 0
        ExplicitLeft = -1
        ExplicitTop = 8
        inherited RzPanel1: TRzPanel
          Top = 3
          ExplicitTop = 3
          inherited FrameFoto: TFrameFoto
            inherited RzPanel4: TRzPanel
              Left = 2
              ExplicitLeft = 2
            end
          end
          inherited FramePhones: TFramePhones
            inherited grpPhone: TRzGroupBox
              Height = 68
              ExplicitHeight = 68
              inherited grdPhone: TcxGrid
                Width = 162
                ExplicitWidth = 162
              end
            end
          end
        end
      end
    end
    object Full_Tab: TRzTabSheet
      Caption = #1056#1072#1089#1096#1080#1088#1077#1085#1085#1072#1103' '#1092#1086#1088#1084#1072
      object RzPanel3: TRzPanel
        Left = 0
        Top = 222
        Width = 770
        Height = 38
        Align = alBottom
        BorderOuter = fsBump
        BorderSides = [sdTop, sdBottom]
        TabOrder = 0
        DesignSize = (
          770
          38)
        object Save_btn: TRzButton
          Left = 216
          Top = 4
          Width = 121
          Height = 29
          ModalResult = 1
          Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HotTrack = True
          HotTrackColor = 16625984
          ParentFont = False
          TabOrder = 0
          ThemeAware = False
          OnClick = Save_btnClick
        end
        object Cancel_btn: TRzButton
          Left = 443
          Top = 5
          Width = 124
          Height = 29
          ModalResult = 2
          Anchors = [akTop, akRight]
          Caption = #1054#1090#1084#1077#1085#1072
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
          OnClick = Cancel_btnClick
        end
      end
      object RzPanel5: TRzPanel
        Left = 0
        Top = 0
        Width = 770
        Height = 222
        Align = alClient
        BorderOuter = fsNone
        TabOrder = 1
        object Label25: TLabel
          Left = 6
          Top = 22
          Width = 29
          Height = 13
          Caption = 'Login:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label26: TLabel
          Left = 6
          Top = 49
          Width = 50
          Height = 13
          Caption = 'Password:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        inline _FramePersonFull: TFramePersonFullFoto
          Left = 0
          Top = 1
          Width = 764
          Height = 221
          TabOrder = 0
          ExplicitTop = 1
          inherited RzPanel1: TRzPanel
            Top = 3
            ExplicitTop = 3
            inherited Label6: TLabel
              Top = 58
              ExplicitTop = 58
            end
            inherited FrameFoto: TFrameFoto
              inherited RzPanel4: TRzPanel
                inherited btnLoad: TRzBitBtn
                  Top = 94
                  ExplicitTop = 94
                end
                inherited btnClear: TRzBitBtn
                  Top = 113
                  ExplicitTop = 113
                end
              end
            end
            inherited FramePhones: TFramePhones
              inherited grpPhone: TRzGroupBox
                Height = 88
                ExplicitHeight = 88
                inherited RzPanel2: TRzPanel
                  Height = 73
                  ExplicitHeight = 73
                  inherited btnEdit: TRzBitBtn
                    Top = 24
                    ExplicitTop = 24
                  end
                end
                inherited grdPhone: TcxGrid
                  Width = 137
                  ExplicitWidth = 137
                end
              end
            end
          end
          inherited edtEmailPrivate: TcxDBTextEdit
            Top = 58
            ExplicitTop = 58
          end
        end
        object RzPanel4: TRzPanel
          Left = 452
          Top = 59
          Width = 221
          Height = 30
          BorderSides = []
          TabOrder = 1
          DesignSize = (
            221
            30)
          object Label28: TLabel
            Left = 4
            Top = 1
            Width = 116
            Height = 13
            Caption = #1042#1085#1091#1090#1088#1077#1085#1085#1080#1081' '#1085#1086#1084#1077#1088' '#1040#1058#1057
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object ATSNUM_edt: TcxDBTextEdit
            Left = 133
            Top = -2
            Anchors = [akLeft, akTop, akRight]
            BeepOnEnter = False
            DataBinding.DataField = 'ATS_NUM'
            DataBinding.DataSource = DS
            Properties.PasswordChar = '*'
            Style.HotTrack = False
            Style.LookAndFeel.Kind = lfFlat
            Style.LookAndFeel.NativeStyle = True
            Style.TransparentBorder = True
            StyleDisabled.LookAndFeel.Kind = lfFlat
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.Kind = lfFlat
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.Kind = lfFlat
            StyleHot.LookAndFeel.NativeStyle = True
            TabOrder = 0
            Width = 82
          end
        end
        object RzPanel6: TRzPanel
          Left = 432
          Top = 191
          Width = 332
          Height = 28
          BorderSides = []
          TabOrder = 2
          object Label1: TLabel
            Left = 6
            Top = 9
            Width = 30
            Height = 13
            Caption = #1051#1086#1075#1080#1085
            FocusControl = cxDBTextEdit1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label2: TLabel
            Left = 174
            Top = 9
            Width = 37
            Height = 13
            Caption = #1055#1072#1088#1086#1083#1100
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object cxDBTextEdit1: TcxDBTextEdit
            Left = 42
            Top = 9
            BeepOnEnter = False
            DataBinding.DataField = 'USER_LOGIN'
            DataBinding.DataSource = DS
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsFlat
            Style.Color = clWindow
            Style.HotTrack = False
            Style.LookAndFeel.Kind = lfFlat
            Style.LookAndFeel.NativeStyle = True
            Style.TransparentBorder = False
            StyleDisabled.LookAndFeel.Kind = lfFlat
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.Kind = lfFlat
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.Kind = lfFlat
            StyleHot.LookAndFeel.NativeStyle = True
            TabOrder = 0
            Width = 110
          end
          object cxDBTextEdit2: TcxDBTextEdit
            Left = 218
            Top = 6
            BeepOnEnter = False
            DataBinding.DataField = 'USER_PASSWORD'
            DataBinding.DataSource = DS
            Properties.PasswordChar = '*'
            Style.HotTrack = False
            Style.LookAndFeel.Kind = lfFlat
            Style.LookAndFeel.NativeStyle = True
            Style.TransparentBorder = True
            StyleDisabled.LookAndFeel.Kind = lfFlat
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.Kind = lfFlat
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.Kind = lfFlat
            StyleHot.LookAndFeel.NativeStyle = True
            TabOrder = 1
            Width = 110
          end
        end
        object RzPanel2: TRzPanel
          Left = 452
          Top = 36
          Width = 221
          Height = 20
          BorderSides = []
          TabOrder = 3
          DesignSize = (
            221
            20)
          object Label3: TLabel
            Left = 3
            Top = 1
            Width = 89
            Height = 13
            Caption = #1058#1072#1073#1077#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object cxDBTextEdit3: TcxDBTextEdit
            Left = 133
            Top = -2
            Anchors = [akLeft, akTop, akRight]
            BeepOnEnter = False
            DataBinding.DataField = 'TABELNUM'
            DataBinding.DataSource = DS
            Properties.PasswordChar = '*'
            Style.HotTrack = False
            Style.LookAndFeel.Kind = lfFlat
            Style.LookAndFeel.NativeStyle = True
            Style.TransparentBorder = True
            StyleDisabled.LookAndFeel.Kind = lfFlat
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.Kind = lfFlat
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.LookAndFeel.Kind = lfFlat
            StyleHot.LookAndFeel.NativeStyle = True
            TabOrder = 0
            Width = 82
          end
        end
      end
    end
  end
  object DS: TDataSource
    Left = 184
    Top = 19
  end
end
