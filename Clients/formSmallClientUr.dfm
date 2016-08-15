inherited frmSmallCardUr: TfrmSmallCardUr
  Caption = #1050#1088#1072#1090#1082#1072#1103' '#1082#1072#1088#1090#1086#1095#1082#1072' '#1082#1083#1080#1077#1085#1090#1072
  ClientHeight = 301
  ClientWidth = 578
  ExplicitWidth = 594
  ExplicitHeight = 339
  PixelsPerInch = 96
  TextHeight = 13
  inherited img1: TImage
    Left = 393
    Top = -57
    ExplicitLeft = 393
    ExplicitTop = -57
  end
  inherited Label7: TLabel
    Left = 12
    Top = 201
    ExplicitLeft = 12
    ExplicitTop = 201
  end
  inherited Label1: TLabel
    Left = 12
    Top = 161
    ExplicitLeft = 12
    ExplicitTop = 161
  end
  inherited Label8: TLabel
    Left = 359
    Top = 13
    ExplicitLeft = 359
    ExplicitTop = 13
  end
  inherited Label4: TLabel
    Left = 363
    ExplicitLeft = 363
  end
  object Label3: TLabel [5]
    Left = 12
    Top = 5
    Width = 76
    Height = 26
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  inherited RzPanel1: TRzPanel
    Top = 257
    Width = 578
    ExplicitTop = 257
    ExplicitWidth = 578
    inherited Image2: TImage
      Left = -57
      ExplicitLeft = -57
    end
    inherited Exit_bnt: TRzButton
      Left = 444
      ModalResult = 0
      OnClick = Exit_bntClick
      ExplicitLeft = 444
    end
    inherited RzBitBtn1: TRzBitBtn
      OnClick = RzBitBtn1Click
    end
  end
  inherited cxDBLookupComboBox2: TcxDBLookupComboBox
    Left = 75
    Top = 204
    DataBinding.DataSource = frmClientUr.DS
    ExplicitLeft = 75
    ExplicitTop = 204
  end
  inherited cxDBLookupComboBox3: TcxDBLookupComboBox
    Left = 169
    Top = 204
    DataBinding.DataSource = frmClientUr.DS
    ExplicitLeft = 169
    ExplicitTop = 204
  end
  inherited edtPhone: TcxMaskEdit
    Left = 75
    Top = 156
    Style.IsFontAssigned = True
    ExplicitLeft = 75
    ExplicitTop = 156
  end
  inherited cmbRegion: TcxDBLookupComboBox
    Left = 400
    Top = 10
    DataBinding.DataSource = frmClientUr.DS
    ExplicitLeft = 400
    ExplicitTop = 10
  end
  inherited FrameUslugi: TFrameUslugi
    Left = 360
    ExplicitLeft = 360
    inherited grpPhone: TRzGroupBox
      inherited grdPhone: TcxGrid
        ExplicitWidth = 192
        ExplicitHeight = 68
        inherited grdPhoneDBTableView1: TcxGridDBTableView
          inherited grdPhoneDBTableView1Column1: TcxGridDBColumn
            IsCaptionAssigned = True
          end
        end
      end
      inherited RzPanel2: TRzPanel
        ExplicitTop = 90
        ExplicitWidth = 200
        inherited btnDel: TRzBitBtn
          ExplicitLeft = 163
        end
      end
    end
  end
  inherited cxDBMemo1: TcxDBMemo
    Left = 363
    DataBinding.DataSource = frmClientUr.DS
    ExplicitLeft = 363
    ExplicitWidth = 202
    Width = 202
  end
  object txtName: TcxDBTextEdit
    Left = 103
    Top = 10
    BeepOnEnter = False
    DataBinding.DataField = 'NAME'
    DataBinding.DataSource = frmClientUr.DS
    Properties.MaxLength = 0
    Properties.ValidationOptions = [evoShowErrorIcon]
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
    Width = 233
  end
  object GroupBox1: TGroupBox
    Left = 5
    Top = 52
    Width = 340
    Height = 82
    Caption = #1056#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1100
    TabOrder = 8
    DesignSize = (
      340
      82)
    object Label11: TLabel
      Left = 7
      Top = 23
      Width = 44
      Height = 13
      Caption = #1060#1072#1084#1080#1083#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 7
      Top = 52
      Width = 19
      Height = 13
      Caption = #1048#1084#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtFamily: TcxDBTextEdit
      Left = 98
      Top = 20
      Anchors = [akLeft, akTop, akRight]
      BeepOnEnter = False
      DataBinding.DataField = 'FAMILY'
      Style.HotTrack = False
      Style.LookAndFeel.NativeStyle = True
      Style.TransparentBorder = True
      StyleDisabled.Color = clBtnFace
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 0
      Width = 233
    end
    object edtName: TcxDBTextEdit
      Left = 98
      Top = 49
      Anchors = [akLeft, akTop, akRight]
      BeepOnEnter = False
      DataBinding.DataField = 'NAME'
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
      Width = 233
    end
  end
end
