object frmEditData: TfrmEditData
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 84
  ClientWidth = 345
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  DesignSize = (
    345
    84)
  PixelsPerInch = 96
  TextHeight = 13
  object lblData: TLabel
    Left = 8
    Top = 3
    Width = 73
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edtData: TcxDBMaskEdit
    Left = 8
    Top = 19
    DataBinding.DataField = 'NAME'
    DataBinding.DataSource = DS
    Properties.ValidationOptions = [evoRaiseException, evoShowErrorIcon]
    TabOrder = 0
    Width = 329
  end
  object btnOK: TRzButton
    Left = 88
    Top = 47
    Width = 70
    Height = 29
    Default = True
    ModalResult = 1
    Anchors = [akTop, akRight]
    Caption = 'OK'
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
  object bntCancel: TRzButton
    Left = 187
    Top = 47
    Width = 70
    Height = 29
    Cancel = True
    ModalResult = 2
    Anchors = [akTop, akRight]
    Caption = #1054#1090#1084#1077#1085#1072
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
  end
  object DS: TDataSource
    Left = 309
    Top = 2
  end
end
