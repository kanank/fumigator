inherited FramePhones: TFramePhones
  Width = 218
  Height = 145
  ExplicitWidth = 218
  ExplicitHeight = 145
  DesignSize = (
    218
    145)
  inherited grpPhone: TRzGroupBox
    Left = 4
    Width = 214
    Height = 143
    Anchors = [akLeft, akTop, akBottom]
    ExplicitLeft = 4
    ExplicitWidth = 214
    ExplicitHeight = 143
    DesignSize = (
      214
      143)
    inherited grdPhone: TcxGrid
      Width = 177
      Height = 125
      ExplicitWidth = 177
      ExplicitHeight = 125
    end
    inherited RzPanel2: TRzPanel
      Left = 182
      Height = 128
      DesignSize = (
        31
        128)
      inherited btnAdd: TRzBitBtn
        Top = 1
      end
      inherited btnEdit: TRzBitBtn
        Top = 32
      end
      inherited btnDel: TRzBitBtn
        Top = 98
        ExplicitTop = 98
      end
    end
  end
  inherited Query: TIBQuery
    SQL.Strings = (
      'select * from phones where client_id = :client_id')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'client_id'
        ParamType = ptUnknown
      end>
  end
end
