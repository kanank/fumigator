inherited frmSmallCardFiz: TfrmSmallCardFiz
  Caption = #1050#1088#1072#1090#1082#1072#1103' '#1082#1072#1088#1090#1086#1095#1082#1072' '#1082#1083#1080#1077#1085#1090#1072
  ClientHeight = 262
  ClientWidth = 458
  ExplicitWidth = 474
  ExplicitHeight = 300
  PixelsPerInch = 96
  TextHeight = 13
  inherited img1: TImage
    Left = 239
    Top = -96
    Width = 170
    ExplicitLeft = 310
    ExplicitTop = -75
    ExplicitWidth = 170
  end
  inherited Label1: TLabel
    Left = 7
    Top = 75
    ExplicitLeft = 7
    ExplicitTop = 75
  end
  object Label10: TLabel [3]
    Left = 7
    Top = 36
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
  object Label11: TLabel [4]
    Left = 7
    Top = 11
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
  inherited Label8: TLabel
    Left = 253
    Top = 11
    ExplicitLeft = 253
    ExplicitTop = 11
  end
  inherited Label4: TLabel
    Left = 253
    Top = 147
    ExplicitLeft = 253
    ExplicitTop = 147
  end
  inherited RzPanel1: TRzPanel
    Top = 218
    Width = 458
    ExplicitTop = 218
    ExplicitWidth = 458
    inherited Image2: TImage
      Left = -177
      ExplicitLeft = -177
    end
    inherited Exit_bnt: TRzButton
      Left = 324
      Default = True
      ModalResult = 0
      OnClick = Exit_bntClick
      ExplicitLeft = 324
    end
    inherited RzBitBtn1: TRzBitBtn
      OnClick = RzBitBtn1Click
    end
  end
  inherited cxDBLookupComboBox2: TcxDBLookupComboBox
    DataBinding.DataSource = frmClientFiz.DS
  end
  inherited cxDBLookupComboBox3: TcxDBLookupComboBox
    DataBinding.DataSource = frmClientFiz.DS
  end
  inherited edtPhone: TcxMaskEdit
    Style.IsFontAssigned = True
    ExplicitWidth = 162
    ExplicitHeight = 22
    Height = 22
    Width = 162
  end
  object edtName: TcxDBTextEdit [11]
    Left = 67
    Top = 35
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
    TabOrder = 4
    Width = 162
  end
  object edtFamily: TcxDBTextEdit [12]
    Left = 67
    Top = 8
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
    TabOrder = 5
    Width = 162
  end
  inherited cmbRegion: TcxDBLookupComboBox
    Left = 300
    Top = 7
    DataBinding.DataSource = frmClientFiz.DS
    TabOrder = 6
    ExplicitLeft = 300
    ExplicitTop = 7
    ExplicitWidth = 149
    Width = 149
  end
  inherited FrameUslugi: TFrameUslugi
    Left = 253
    Width = 196
    Height = 111
    TabOrder = 7
    ExplicitLeft = 253
    ExplicitWidth = 196
    ExplicitHeight = 111
    inherited grpPhone: TRzGroupBox
      Left = 1
      Width = 193
      Height = 107
      ExplicitLeft = 1
      ExplicitWidth = 193
      ExplicitHeight = 107
      inherited grdPhone: TcxGrid
        Width = 183
        Height = 60
        ExplicitWidth = 183
        ExplicitHeight = 60
        inherited grdPhoneDBTableView1: TcxGridDBTableView
          inherited grdPhoneDBTableView1Column1: TcxGridDBColumn
            IsCaptionAssigned = True
          end
        end
      end
      inherited RzPanel2: TRzPanel
        Top = 76
        Width = 191
        ExplicitTop = 76
        ExplicitWidth = 191
        inherited btnDel: TRzBitBtn
          Left = 154
          ExplicitLeft = 154
        end
      end
    end
    inherited Query_upd: TIBUpdateSQL
      Left = 72
      Top = 43
    end
    inherited Query: TIBQuery
      Left = 32
      Top = 43
    end
    inherited DS: TDataSource
      Top = 43
    end
  end
  inherited cxDBMemo1: TcxDBMemo
    Left = 253
    Top = 161
    DataBinding.DataSource = frmClientFiz.DS
    TabOrder = 8
    ExplicitLeft = 253
    ExplicitTop = 161
    ExplicitWidth = 196
    ExplicitHeight = 51
    Height = 51
    Width = 196
  end
end
