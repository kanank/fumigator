inherited frmWorker: TfrmWorker
  Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082#1080
  ClientHeight = 622
  ClientWidth = 714
  Position = poDesktopCenter
  OnCreate = FormCreate
  ExplicitWidth = 730
  ExplicitHeight = 660
  PixelsPerInch = 96
  TextHeight = 13
  inherited img1: TImage
    Left = 523
    Top = 264
    ExplicitLeft = 523
    ExplicitTop = 224
  end
  inherited RzPanel1: TRzPanel
    Top = 578
    Width = 714
    ExplicitTop = 578
    ExplicitWidth = 714
    inherited Exit_bnt: TRzButton
      Left = 580
      Top = 5
      Font.Color = clWindowText
      ExplicitLeft = 580
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
      OnClick = FullForm_btnClick
    end
  end
  object RzPageControl1: TRzPageControl
    AlignWithMargins = True
    Left = 3
    Top = 0
    Width = 708
    Height = 578
    Hint = ''
    Margins.Top = 0
    Margins.Bottom = 0
    ActivePage = Full_Tab
    ActivePageDefault = Short_Tab
    Align = alClient
    ShowShadow = False
    TabIndex = 1
    TabOrder = 1
    TabStyle = tsBackSlant
    TextColors.Selected = 8224125
    FixedDimension = 19
    object Short_Tab: TRzTabSheet
      Caption = #1057#1086#1082#1088#1072#1097#1077#1085#1085#1072#1103' '#1092#1086#1088#1084#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = -1
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      object Mail_pln: TcxGroupBox
        Left = 0
        Top = 3
        Caption = #1054#1089#1085#1086#1074#1085#1099#1077' '#1089#1074#1077#1076#1077#1085#1080#1103' '#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1077':'
        Style.TextColor = clWindowText
        TabOrder = 0
        DesignSize = (
          417
          234)
        Height = 234
        Width = 417
        object Label5: TLabel
          Left = 8
          Top = 117
          Width = 84
          Height = 13
          Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4079166
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 8
          Top = 86
          Width = 53
          Height = 13
          Caption = #1054#1090#1095#1077#1089#1090#1074#1086':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4079166
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 9
          Top = 56
          Width = 23
          Height = 13
          Caption = #1048#1084#1103':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4079166
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label1: TLabel
          Left = 9
          Top = 26
          Width = 48
          Height = 13
          Caption = #1060#1072#1084#1080#1083#1080#1103':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4079166
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 8
          Top = 147
          Width = 93
          Height = 13
          Caption = #1058#1077#1083#1077#1092#1086#1085' '#1088#1072#1073#1086#1095#1080#1081':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4079166
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 8
          Top = 177
          Width = 75
          Height = 13
          Caption = 'E-mai '#1088#1072#1073#1086#1095#1080#1081':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4079166
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object BirthDate_dp: TcxDBDateEdit
          Left = 107
          Top = 114
          Anchors = [akLeft, akTop, akRight]
          DataBinding.DataField = 'BIRTH_DATE'
          DataBinding.DataSource = DataModuleMain.DsWorker
          Properties.ReadOnly = True
          Style.TextColor = clWindowText
          TabOrder = 3
          Width = 132
        end
        object SurName_edt: TcxDBTextEdit
          Left = 62
          Top = 83
          Anchors = [akLeft, akTop, akRight]
          BeepOnEnter = False
          DataBinding.DataField = 'W_OTCH'
          DataBinding.DataSource = DataModuleMain.DsWorker
          Properties.ReadOnly = True
          Style.HotTrack = False
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          Style.TextColor = clWindowText
          Style.TransparentBorder = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 2
          Width = 177
        end
        object Name_edt: TcxDBTextEdit
          Left = 62
          Top = 53
          Anchors = [akLeft, akTop, akRight]
          BeepOnEnter = False
          DataBinding.DataField = 'W_NAME'
          DataBinding.DataSource = DataModuleMain.DsWorker
          Properties.ReadOnly = True
          Style.HotTrack = False
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          Style.TextColor = clWindowText
          Style.TransparentBorder = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 1
          Width = 177
        end
        object Family_Edt: TcxDBTextEdit
          Left = 63
          Top = 26
          Anchors = [akLeft, akTop, akRight]
          BeepOnEnter = False
          DataBinding.DataField = 'W_FAMILY'
          DataBinding.DataSource = DataModuleMain.DsWorker
          Properties.ReadOnly = True
          Style.HotTrack = False
          Style.LookAndFeel.NativeStyle = True
          Style.TextColor = clWindowText
          Style.TransparentBorder = True
          StyleDisabled.Color = clBtnFace
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 0
          Width = 177
        end
        object WorkerFoto_pnl: TRzPanel
          Left = 255
          Top = 11
          Width = 152
          Height = 184
          Align = alCustom
          Anchors = [akTop, akRight]
          BorderInner = fsBump
          BorderOuter = fsFlatRounded
          TabOrder = 6
          DesignSize = (
            152
            184)
          object Foto_img: TImage
            Left = 8
            Top = 6
            Width = 138
            Height = 172
            Cursor = crHandPoint
            Anchors = [akLeft, akTop, akRight, akBottom]
            Center = True
            Proportional = True
            Stretch = True
            Transparent = True
            ExplicitWidth = 153
            ExplicitHeight = 201
          end
        end
        object Phone_edt: TcxDBTextEdit
          Left = 107
          Top = 144
          Anchors = [akLeft, akTop, akRight]
          BeepOnEnter = False
          DataBinding.DataField = 'PHONE_WORK'
          DataBinding.DataSource = DataModuleMain.DsWorker
          Properties.ReadOnly = True
          Style.HotTrack = False
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          Style.TextColor = clWindowText
          Style.TransparentBorder = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 4
          Width = 132
        end
        object Email_edt: TcxDBTextEdit
          Left = 107
          Top = 174
          Anchors = [akLeft, akTop, akRight]
          BeepOnEnter = False
          DataBinding.DataField = 'E_MAIL_WORK'
          DataBinding.DataSource = DataModuleMain.DsWorker
          Properties.ReadOnly = True
          Style.HotTrack = False
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          Style.TextColor = clWindowText
          Style.TransparentBorder = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 5
          Width = 132
        end
      end
      object cxDBImage1: TcxDBImage
        Left = 263
        Top = 20
        DataBinding.DataField = 'FOTO'
        DataBinding.DataSource = DataModuleMain.DsWorker
        Properties.GraphicClassName = 'TJPEGImage'
        TabOrder = 1
        Transparent = True
        Height = 172
        Width = 140
      end
    end
    object Full_Tab: TRzTabSheet
      Caption = #1056#1072#1089#1096#1080#1088#1077#1085#1085#1072#1103' '#1092#1086#1088#1084#1072
      object RzPanel3: TRzPanel
        Left = 0
        Top = 513
        Width = 706
        Height = 44
        Align = alBottom
        BorderOuter = fsBump
        BorderSides = [sdTop, sdBottom]
        TabOrder = 0
        DesignSize = (
          706
          44)
        object Save_btn: TRzButton
          Left = 211
          Top = 8
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
        end
        object Cancel_btn: TRzButton
          Left = 379
          Top = 8
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
        end
      end
      object cxGroupBox1: TcxGroupBox
        Left = 0
        Top = 0
        Align = alLeft
        Caption = #1054#1089#1085#1086#1074#1085#1099#1077' '#1089#1074#1077#1076#1077#1085#1080#1103' '#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1077':'
        TabOrder = 1
        DesignSize = (
          454
          513)
        Height = 513
        Width = 454
        object Label8: TLabel
          Left = 8
          Top = 146
          Width = 84
          Height = 13
          Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label9: TLabel
          Left = 8
          Top = 86
          Width = 53
          Height = 13
          Caption = #1054#1090#1095#1077#1089#1090#1074#1086':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 9
          Top = 56
          Width = 23
          Height = 13
          Caption = #1048#1084#1103':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label11: TLabel
          Left = 9
          Top = 26
          Width = 48
          Height = 13
          Caption = #1060#1072#1084#1080#1083#1080#1103':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label12: TLabel
          Left = 8
          Top = 176
          Width = 105
          Height = 13
          Caption = #1058#1077#1083#1077#1092#1086#1085#1099': '#1088#1072#1073#1086#1095#1080#1081':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label13: TLabel
          Left = 9
          Top = 116
          Width = 86
          Height = 13
          Caption = #1060'.'#1048'.'#1054'. ('#1082#1088#1072#1090#1082#1086'):'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clPurple
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label14: TLabel
          Left = 32
          Top = 236
          Width = 81
          Height = 13
          Caption = 'E-mail: '#1088#1072#1073#1086#1095#1080#1081':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 71
          Top = 203
          Width = 42
          Height = 13
          Caption = #1083#1080#1095#1085#1099#1081':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label15: TLabel
          Left = 71
          Top = 262
          Width = 42
          Height = 13
          Caption = #1083#1080#1095#1085#1099#1081':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label20: TLabel
          Left = 256
          Top = 235
          Width = 76
          Height = 13
          Caption = #1058#1072#1073#1077#1083#1100#1085#1099#1081' '#8470':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label21: TLabel
          Left = 256
          Top = 263
          Width = 40
          Height = 13
          Caption = #1057#1090#1072#1090#1091#1089':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object Label22: TLabel
          Left = 7
          Top = 348
          Width = 71
          Height = 13
          Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label23: TLabel
          Left = 7
          Top = 319
          Width = 61
          Height = 13
          Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label24: TLabel
          Left = 301
          Top = 319
          Width = 37
          Height = 13
          Caption = #1054#1082#1083#1072#1076':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object Label28: TLabel
          Left = 256
          Top = 289
          Width = 120
          Height = 13
          Caption = #1042#1085#1091#1090#1088#1077#1085#1085#1080#1081' '#1085#1086#1084#1077#1088' '#1040#1058#1057':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object F_BirthDate_dp: TcxDBDateEdit
          Left = 108
          Top = 140
          Anchors = [akLeft, akTop, akRight]
          DataBinding.DataField = 'BIRTH_DATE'
          DataBinding.DataSource = DataModuleMain.DsWorker
          TabOrder = 4
          Width = 136
        end
        object F_SurName_edt: TcxDBTextEdit
          Left = 67
          Top = 86
          Anchors = [akLeft, akTop, akRight]
          BeepOnEnter = False
          DataBinding.DataField = 'W_OTCH'
          DataBinding.DataSource = DataModuleMain.DsWorker
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
          TabOrder = 2
          Width = 181
        end
        object F_Name_edt: TcxDBTextEdit
          Left = 62
          Top = 53
          Anchors = [akLeft, akTop, akRight]
          BeepOnEnter = False
          DataBinding.DataField = 'W_NAME'
          DataBinding.DataSource = DataModuleMain.DsWorker
          Style.BorderStyle = ebsFlat
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
          Width = 181
        end
        object F_Family_edt: TcxDBTextEdit
          Left = 63
          Top = 26
          Anchors = [akLeft, akTop, akRight]
          BeepOnEnter = False
          DataBinding.DataField = 'W_FAMILY'
          DataBinding.DataSource = DataModuleMain.DsWorker
          Style.HotTrack = False
          Style.LookAndFeel.NativeStyle = True
          Style.TransparentBorder = True
          StyleDisabled.Color = clBtnFace
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 0
          Width = 181
        end
        object RzPanel4: TRzPanel
          Left = 272
          Top = 11
          Width = 167
          Height = 213
          Align = alCustom
          Anchors = [akTop, akRight]
          BorderInner = fsBump
          BorderOuter = fsFlatRounded
          TabOrder = 15
          DesignSize = (
            167
            213)
          object F_Foto_img: TImage
            Left = 8
            Top = 6
            Width = 153
            Height = 176
            Cursor = crHandPoint
            Anchors = [akLeft, akTop, akRight, akBottom]
            Center = True
            Proportional = True
            Stretch = True
            Transparent = True
            ExplicitWidth = 169
            ExplicitHeight = 201
          end
          object RzBitBtn2: TRzBitBtn
            Left = 8
            Top = 188
            Width = 66
            Height = 20
            Anchors = [akLeft, akBottom]
            Caption = #1044#1086#1073#1072#1074#1080#1090#1100
            HotTrack = True
            HotTrackColor = 10811858
            TabOrder = 0
            ThemeAware = False
          end
          object RzBitBtn3: TRzBitBtn
            Left = 95
            Top = 188
            Width = 66
            Height = 20
            Anchors = [akLeft, akBottom]
            Caption = #1048#1079#1084#1077#1085#1080#1090#1100
            HotTrack = True
            HotTrackColor = 10811858
            TabOrder = 1
            ThemeAware = False
          end
        end
        object F_ShortName_edt: TcxDBTextEdit
          Left = 107
          Top = 113
          Anchors = [akLeft, akTop, akRight]
          BeepOnEnter = False
          DataBinding.DataField = 'SHORT_NAME'
          DataBinding.DataSource = DataModuleMain.DsWorker
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
          TabOrder = 3
          Width = 136
        end
        object F_Phone_Work_edt: TcxDBTextEdit
          Left = 119
          Top = 173
          Anchors = [akLeft, akTop, akRight]
          BeepOnEnter = False
          DataBinding.DataField = 'PHONE_WORK'
          DataBinding.DataSource = DataModuleMain.DsWorker
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
          TabOrder = 5
          Width = 124
        end
        object F_Email_Work_edt: TcxDBTextEdit
          Left = 119
          Top = 233
          Anchors = [akLeft, akTop, akRight]
          BeepOnEnter = False
          DataBinding.DataField = 'E_MAIL_WORK'
          DataBinding.DataSource = DataModuleMain.DsWorker
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
          TabOrder = 7
          Width = 124
        end
        object F_Phone_Priv_edt: TcxDBTextEdit
          Left = 119
          Top = 200
          Anchors = [akLeft, akTop, akRight]
          BeepOnEnter = False
          DataBinding.DataField = 'PHONE_PRIV'
          DataBinding.DataSource = DataModuleMain.DsWorker
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
          TabOrder = 6
          Width = 124
        end
        object F_Email_Priv_edt: TcxDBTextEdit
          Left = 120
          Top = 260
          Anchors = [akLeft, akTop, akRight]
          BeepOnEnter = False
          DataBinding.DataField = 'E_MAIL_PRIV'
          DataBinding.DataSource = DataModuleMain.DsWorker
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
          TabOrder = 8
          Width = 124
        end
        object RzGroupBox1: TRzGroupBox
          Left = 5
          Top = 388
          Width = 448
          Height = 122
          Anchors = [akLeft, akRight, akBottom]
          BorderOuter = fsFlat
          Caption = #1055#1072#1089#1087#1086#1088#1090
          GroupStyle = gsStandard
          TabOrder = 16
          DesignSize = (
            448
            122)
          object Label16: TLabel
            Left = 5
            Top = 77
            Width = 59
            Height = 13
            Caption = #1050#1077#1084' '#1074#1099#1076#1072#1085':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label17: TLabel
            Left = 191
            Top = 49
            Width = 110
            Height = 13
            Caption = #1050#1086#1076' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103'.:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label18: TLabel
            Left = 6
            Top = 49
            Width = 71
            Height = 13
            Caption = #1050#1086#1075#1076#1072' '#1074#1099#1076#1072#1085':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label19: TLabel
            Left = 5
            Top = 19
            Width = 77
            Height = 13
            Caption = #1057#1077#1088#1080#1103' '#1080' '#1085#1086#1084#1077#1088':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object PassOrg_memo: TcxDBMemo
            Left = 87
            Top = 77
            Anchors = [akLeft, akTop, akRight]
            DataBinding.DataField = 'PASS_ORG'
            DataBinding.DataSource = DataModuleMain.DsWorker
            TabOrder = 0
            Height = 38
            Width = 355
          end
          object PassCode_edt: TcxDBTextEdit
            Left = 307
            Top = 47
            BeepOnEnter = False
            DataBinding.DataField = 'PASS_CODE'
            DataBinding.DataSource = DataModuleMain.DsWorker
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
            Width = 78
          end
          object PassDate_DP: TcxDBDateEdit
            Left = 87
            Top = 47
            DataBinding.DataField = 'PASS_DATE'
            DataBinding.DataSource = DataModuleMain.DsWorker
            TabOrder = 2
            Width = 90
          end
          object PassNum_medt: TcxDBMaskEdit
            Left = 87
            Top = 17
            DataBinding.DataField = 'PASS_NUM'
            DataBinding.DataSource = DataModuleMain.DsWorker
            Properties.MaskKind = emkRegExprEx
            Properties.EditMask = '\d\d\d\d '#39' '#39' \d\d\d\d\d\d'
            TabOrder = 3
            Width = 90
          end
        end
        object Tabel_edt: TcxDBTextEdit
          Left = 336
          Top = 232
          Anchors = [akLeft, akTop, akRight]
          BeepOnEnter = False
          DataBinding.DataField = 'TABELNUM'
          DataBinding.DataSource = DataModuleMain.DsWorker
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.HotTrack = False
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          Style.TransparentBorder = True
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 9
          Width = 103
        end
        object Status_LCB: TcxDBLookupComboBox
          Left = 302
          Top = 259
          DataBinding.DataField = 'STATUS'
          DataBinding.DataSource = DataModuleMain.DsWorker
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'NAME'
            end>
          Properties.ListOptions.ShowHeader = False
          TabOrder = 10
          Visible = False
          Width = 137
        end
        object Comments_memo: TcxDBMemo
          Left = 83
          Top = 348
          DataBinding.DataField = 'COMMENTS'
          DataBinding.DataSource = DataModuleMain.DsWorker
          TabOrder = 14
          Height = 37
          Width = 356
        end
        object Job_LCB: TcxDBLookupComboBox
          Left = 83
          Top = 316
          DataBinding.DataField = 'PROFESSION_ID'
          DataBinding.DataSource = DataModuleMain.DsWorker
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'NAME'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = DataModuleMain.DSDicWorkerProfs
          TabOrder = 12
          Width = 212
        end
        object Oklad_cedt: TcxDBCurrencyEdit
          Left = 344
          Top = 316
          DataBinding.DataField = 'OKLAD'
          DataBinding.DataSource = DataModuleMain.DsWorker
          Properties.UseDisplayFormatWhenEditing = True
          Properties.ValidationOptions = [evoShowErrorIcon]
          TabOrder = 13
          Visible = False
          Width = 94
        end
        object ATSNUM_edt: TcxDBTextEdit
          Left = 379
          Top = 286
          Anchors = [akLeft, akTop, akRight]
          BeepOnEnter = False
          DataBinding.DataField = 'ATS_NUM'
          DataBinding.DataSource = DataModuleMain.DsWorker
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
          TabOrder = 11
          Visible = False
          Width = 60
        end
        object ID_edt: TcxDBTextEdit
          Left = 200
          Top = 287
          Anchors = [akLeft, akTop, akRight]
          BeepOnEnter = False
          DataBinding.DataField = 'ID'
          DataBinding.DataSource = DataModuleMain.DsWorker
          ParentFont = False
          Style.Color = 13421823
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.HotTrack = False
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          Style.TransparentBorder = True
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 17
          Visible = False
          Width = 43
        end
      end
      object RzPanel5: TRzPanel
        Left = 454
        Top = 0
        Width = 252
        Height = 513
        Align = alClient
        BorderOuter = fsNone
        TabOrder = 2
        object UserParams_pnl: TcxGroupBox
          AlignWithMargins = True
          Left = 3
          Top = 388
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alBottom
          Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103':'
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.TransparentBorder = True
          TabOrder = 0
          DesignSize = (
            249
            125)
          Height = 125
          Width = 249
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
          object Label27: TLabel
            Left = 6
            Top = 76
            Width = 28
            Height = 13
            Caption = #1056#1086#1083#1100':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object User_Login_edt: TcxDBTextEdit
            Left = 62
            Top = 19
            Anchors = [akLeft, akTop, akRight]
            BeepOnEnter = False
            DataBinding.DataField = 'USER_LOGIN'
            DataBinding.DataSource = DataModuleMain.DsWorker
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
            Width = 181
          end
          object User_Pass_edt: TcxDBTextEdit
            Left = 62
            Top = 46
            Anchors = [akLeft, akTop, akRight]
            BeepOnEnter = False
            DataBinding.DataField = 'USER_PASSWORD'
            DataBinding.DataSource = DataModuleMain.DsWorker
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
            Width = 181
          end
          object User_Role_edt: TcxDBLookupComboBox
            Left = 62
            Top = 73
            Anchors = [akLeft, akTop, akRight]
            DataBinding.DataField = 'USER_TYPE'
            DataBinding.DataSource = DataModuleMain.DsWorker
            Properties.KeyFieldNames = 'ID'
            Properties.ListColumns = <
              item
                FieldName = 'TYPE_NAME'
              end>
            Properties.ListOptions.ShowHeader = False
            TabOrder = 2
            Visible = False
            Width = 181
          end
          object User_Blocked_cb: TcxDBCheckBox
            Left = 60
            Top = 100
            Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100' '#1073#1083#1086#1082#1080#1088#1086#1074#1072#1085
            DataBinding.DataField = 'USER_BLOCKED'
            DataBinding.DataSource = DataModuleMain.DsWorker
            TabOrder = 3
            Width = 159
          end
        end
        object cxGroupBox2: TcxGroupBox
          AlignWithMargins = True
          Left = 3
          Top = 0
          Margins.Top = 0
          Margins.Right = 0
          Align = alTop
          Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099':'
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.TransparentBorder = True
          TabOrder = 1
          Height = 367
          Width = 249
          object RzPanel6: TRzPanel
            Left = 2
            Top = 333
            Width = 245
            Height = 32
            Align = alBottom
            BorderOuter = fsGroove
            BorderSides = [sdLeft, sdRight, sdBottom]
            TabOrder = 0
            DesignSize = (
              245
              32)
            object DelFile_btn: TRzButton
              Left = 160
              Top = 4
              Width = 74
              Height = 23
              Anchors = [akTop, akRight]
              Caption = #1059#1076#1072#1083#1080#1090#1100
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
            end
            object AddFile_btn: TRzButton
              Left = 13
              Top = 4
              Width = 74
              Height = 23
              Caption = #1044#1086#1073#1072#1074#1080#1090#1100
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
            end
          end
          object cxListBox1: TcxListBox
            AlignWithMargins = True
            Left = 2
            Top = 18
            Width = 244
            Height = 315
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 1
            Margins.Bottom = 0
            Align = alClient
            ItemHeight = 13
            Style.Color = 15727354
            TabOrder = 1
          end
        end
      end
      object imgFoto: TcxDBImage
        Left = 280
        Top = 17
        DataBinding.DataField = 'FOTO'
        DataBinding.DataSource = DataModuleMain.DsWorker
        Properties.CustomFilter = 'All (*.jpg)|*.jpg'
        Properties.GraphicClassName = 'TdxSmartImage'
        Properties.PopupMenuLayout.MenuItems = [pmiCopy, pmiPaste, pmiDelete]
        TabOrder = 3
        Transparent = True
        Height = 176
        Width = 153
      end
    end
  end
end
