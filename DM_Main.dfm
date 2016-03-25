object DataModuleMain: TDataModuleMain
  OldCreateOrder = False
  Height = 454
  Width = 790
  object DB: TIBDatabase
    Connected = True
    DatabaseName = '81.177.48.139:C:\Projects\Fumigator\Db\fumigator.fdb'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = DefTr
    ServerType = 'IBServer'
    AllowStreamedConnected = False
    Left = 24
    Top = 24
  end
  object DefTr: TIBTransaction
    Active = True
    Left = 80
    Top = 24
  end
  object DicUserTypes: TIBQuery
    Database = DB
    Transaction = DefTr
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    SQL.Strings = (
      'select * from DIC_USER_TYPES')
    UpdateObject = DicUserTypes_upd
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_DIC_USER_TYPES_ID'
    GeneratorField.ApplyEvent = gamOnServer
    Left = 455
    Top = 218
  end
  object DSDicUserTypes: TDataSource
    AutoEdit = False
    DataSet = DicUserTypes
    Left = 455
    Top = 269
  end
  object DicWorkerProfs: TIBQuery
    Database = DB
    Transaction = DefTr
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    SQL.Strings = (
      'select *  from DIC_WORKER_PROFS')
    UpdateObject = DicWorkerProfs_upd
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_DIC_WORKER_PROFS_ID'
    GeneratorField.ApplyEvent = gamOnServer
    Left = 524
    Top = 198
  end
  object DSDicWorkerProfs: TDataSource
    AutoEdit = False
    DataSet = DicWorkerProfs
    Left = 525
    Top = 249
  end
  object Workers: TIBQuery
    Database = DB
    Transaction = DefTr
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    SQL.Strings = (
      'select * from WORKERS')
    Left = 586
    Top = 226
  end
  object DSWorkers: TDataSource
    AutoEdit = False
    DataSet = Workers
    Left = 586
    Top = 277
  end
  object Worker_upd: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select *'
      'from workers'
      'where'
      '  ID = :ID')
    ModifySQL.Strings = (
      'update WORKERS set'
      #9'W_FAMILY = :W_FAMILY,'
      #9'W_NAME = :W_NAME,'
      #9'W_OTCH = :W_OTCH,'
      #9'FULL_NAME = :FULL_NAME,'
      #9'SHORT_NAME = :SHORT_NAME,'
      #9'BIRTH_DATE = :BIRTH_DATE,'
      #9'PASS_NUM = :PASS_NUM,'
      #9'PASS_ORG = :PASS_ORG,'
      #9'PASS_DATE = :PASS_DATE,'
      #9'PASS_CODE = :PASS_CODE,'
      #9'PROFESSION_ID = :PROFESSION_ID,'
      #9'E_MAIL_WORK = :E_MAIL_WORK,'
      #9'E_MAIL_PRIV = :E_MAIL_PRIV,'
      #9'PHONE_WORK = :PHONE_WORK,'
      #9'PHONE_PRIV = :PHONE_PRIV,'
      #9'OKLAD = :OKLAD,'
      #9'STATUS = :STATUS,'
      #9'TABELNUM = :TABELNUM,'
      #9'COMMENTS = :COMMENTS,'
      #9'IS_DELETED = :IS_DELETED,'
      #9'USER_LOGIN = :USER_LOGIN,'
      #9'USER_PASSWORD = :USER_PASSWORD,'
      #9'USER_TYPE = :USER_TYPE,'
      #9'USER_BLOCKED = :USER_BLOCKED,'
      #9'ATS_NUM = :ATS_NUM,'
      '                FOTO = :FOTO'
      'where id = :OLD_ID')
    InsertSQL.Strings = (
      'INSERT INTO WORKERS ('
      #9'W_FAMILY,'
      #9'W_NAME,'
      #9'W_OTCH,'
      #9'FULL_NAME,'
      #9'SHORT_NAME,'
      #9'BIRTH_DATE,'
      #9'PASS_NUM,'
      #9'PASS_ORG,'
      #9'PASS_DATE,'
      #9'PASS_CODE,'
      #9'PROFESSION_ID,'
      #9'E_MAIL_WORK,'
      #9'E_MAIL_PRIV,'
      #9'PHONE_WORK,'
      #9'PHONE_PRIV,'
      #9'OKLAD,'
      #9'STATUS,'
      #9'TABELNUM,'
      #9'COMMENTS,'
      #9'IS_DELETED,'
      #9'USER_LOGIN,'
      #9'USER_PASSWORD,'
      #9'USER_TYPE,'
      #9'USER_BLOCKED,'
      #9'ATS_NUM, '
      '                FOTO)'
      'Values('
      #9':W_FAMILY,'
      #9':W_NAME,'
      #9':W_OTCH,'
      #9':FULL_NAME,'
      #9':SHORT_NAME,'
      #9':BIRTH_DATE,'
      #9':PASS_NUM,'
      #9':PASS_ORG,'
      #9':PASS_DATE,'
      #9':PASS_CODE,'
      #9':PROFESSION_ID,'
      #9':E_MAIL_WORK,'
      #9':E_MAIL_PRIV,'
      #9':PHONE_WORK,'
      #9':PHONE_PRIV,'
      #9':OKLAD,'
      #9':STATUS,'
      #9':TABELNUM,'
      #9':COMMENTS,'
      #9':IS_DELETED,'
      #9':USER_LOGIN,'
      #9':USER_PASSWORD,'
      #9':USER_TYPE,'
      #9':USER_BLOCKED,'
      #9':ATS_NUM,'
      '                :FOTO)'#9)
    DeleteSQL.Strings = (
      'delete from workers'
      'where'
      '  ID = :OLD_ID')
    Left = 216
    Top = 64
  end
  object Worker_Q: TIBQuery
    Database = DB
    Transaction = worker_tr
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from workers where id = :ID')
    UpdateObject = Worker_upd
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_WORKERS_ID'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 160
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object worker_tr: TIBTransaction
    DefaultDatabase = DB
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saCommit
    Left = 272
    Top = 64
  end
  object DsWorker: TDataSource
    AutoEdit = False
    DataSet = Worker_Q
    OnDataChange = DsWorkerDataChange
    Left = 333
    Top = 64
  end
  object ImgList: TcxImageList
    FormatVersion = 1
    DesignInfo = 525032
    ImageInfo = <
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000020000000A170D0738542D1894814626D193502AEA924F2AE87F45
          25D0522C17931209053000000009000000010000000000000000000000000000
          00030201011159311B97A96239FAC58957FFD6A36DFFDDAF75FFDDAF74FFD6A4
          6BFFC58956FFA46137F53C2112730000000F0000000300000000000000020201
          0110744226B9BC7C4DFFDDAE77FFDEB076FFE2B782FFE3BB87FFE3BC86FFE1B7
          82FFDEAF74FFDBAB72FFBD7E4EFF6F3E24B50000001000000002000000085C36
          2095BE8053FFE0B37CFFDFB076FFDEB177FFB78254FFAA7144FFAB7245FFBC88
          59FFDFB279FFDFB277FFDEB077FFC08253FF55321D920000000A190F0932B070
          47FADFB27DFFDFB27AFFE0B37BFFE0B57DFFA56B3FFFF5EFEAFFF8F3EEFFAB72
          45FFE2B67EFFE0B47CFFE0B47BFFDEB079FFB3734AFB130B072F613C2795CD9B
          6FFFE2B780FFE5BD89FFE7C291FFE8C393FFA56B3FFFF1E6DEFFF9F5F1FFAA71
          44FFE8C494FFE8C393FFE5BF8CFFE1B77FFFD09C6EFF5434218B935E3DD2DCB3
          83FFE3B781FFBA8659FFA97043FFAB7245FFAC7346FFF5EDE6FFFAF6F3FFAD75
          47FFB0784AFFB17A4BFFC29162FFE4B983FFDEB17EFF8E5B3BD0B0744CF2E3BF
          8FFFE4BB84FFA56B3FFFF3EBE6FFFAF6F3FFF6EFE8FFF7F0EAFFFBF7F5FFFAF7
          F4FFFAF7F3FFFAF6F2FFAB7245FFE5BD87FFE5BE8BFFAB714CEEAE764FECE9C9
          A0FFE5BE89FFA56B3FFFE0D2CAFFE1D3CCFFE3D5CFFFF2EAE4FFF8F3EFFFEADF
          D9FFE6DAD4FFE9DED9FFAA7144FFE7C08CFFEACA9DFFAE764FEE9A6A49D0E9CD
          ACFFEAC796FFB78456FFA56B3FFFA56B3FFFA56B3FFFF1EAE5FFFAF6F3FFA56B
          3FFFA56B3FFFA56B3FFFB78457FFEACA99FFEBD1ADFF996A49D46E4E3697DDBB
          9DFFEED3A9FFEECFA2FFEED2A5FFF0D6A9FFA56B3FFFF0EAE7FFFDFCFBFFA56B
          3FFFF1D6AAFFF0D5A8FFEED2A5FFEFD4A7FFE0C2A2FF6246318F1C140E2BC794
          6CFCF5E8CCFFEFD6ABFFF1D8AEFFF2DAB0FFA56B3FFFDECFC9FFDFD1CBFFA56B
          3FFFF3DCB2FFF1DBB0FFF1D8ADFFF7EACDFFC69470FA1A120D2E000000036F52
          3C92D7B08CFFF8EFD3FFF3E0B9FFF3DFB7FFB98A5FFFA56B3FFFA56B3FFFBA8A
          5FFFF4E1B9FFF4E2BDFFFAF1D5FFD9B390FF664B368C00000006000000010202
          0107906C4EB8D9B38FFFF7EDD3FFF8EED0FFF7EBC9FFF6E8C4FFF6E8C5FFF7EC
          CAFFF8EED0FFF4E8CDFFD7AF8BFF88664AB30202010B00000001000000000000
          00010202010770543F8FCFA078FCE2C4A2FFEBD7B8FFF4E9CDFFF4EACEFFECD8
          B9FFE3C5A3FFC59973F24C392A67000000060000000100000000000000000000
          000000000001000000022019122C6C543E89A47E5FCCC59770F1C19570EEA47E
          60CD6C543F8B16110D2200000003000000010000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000020000000A170D0738542D1894814626D193502AEA924F2AE87F45
          25D0522C17931209053000000009000000010000000000000000000000000000
          00030201011159311B97A96239FAC58957FFD6A36DFFDDAF75FFDDAF74FFD6A4
          6BFFC58956FFA46137F53C2112730000000F0000000300000000000000020201
          0110744226B9BC7C4DFFDDAE77FFDEB076FFDEAF75FFDEAF75FFDEB074FFDDAF
          75FFDEAF74FFDBAB72FFBD7E4EFF6F3E24B50000001000000002000000085C36
          2095BE8053FFE0B37CFFDFB076FFDEB177FFDFB279FFE0B379FFE0B27AFFE0B2
          79FFDFB279FFDFB277FFDEB077FFC08253FF55321D920000000A190F0932B070
          47FADFB27DFFDFB27AFFE0B37BFFE0B57DFFE1B67EFFE2B67FFFE2B77FFFE2B7
          7FFFE2B67EFFE0B47CFFE0B47BFFDEB079FFB3734AFB130B072F613C2795CD9B
          6FFFE2B780FFE5BD89FFE7C291FFE8C393FFE8C494FFE8C594FFE8C495FFE8C4
          95FFE8C494FFE8C393FFE5BF8CFFE1B77FFFD09C6EFF5434218B935E3DD2DCB3
          83FFE3B781FFBA8659FFA97043FFAB7245FFAC7346FFB0794AFFAB7245FFAD75
          47FFB0784AFFB17A4BFFC29162FFE4B983FFDEB17EFF8E5B3BD0B0744CF2E3BF
          8FFFE4BB84FFA56B3FFFF5EEE9FFFAF6F3FFFAF7F3FFFBF7F4FFFBF7F5FFFAF7
          F4FFFAF7F3FFFAF6F2FFAB7245FFE5BD87FFE5BE8BFFAB714CEEAE764FECE9C9
          A0FFE5BE89FFA56B3FFFE6D9D2FFE7DBD4FFE9DED7FFEAE0D9FFEAE0DAFFEBE1
          DBFFEBE0DBFFEEE5E1FFAA7144FFE7C08CFFEACA9DFFAE764FEE9A6A49D0E9CD
          ACFFEAC796FFB78456FFA56B3FFFA56B3FFFA56B3FFFA56B3FFFA56B3FFFA56B
          3FFFA56B3FFFA56B3FFFB78457FFEACA99FFEBD1ADFF996A49D46E4E3697DDBB
          9DFFEED3A9FFEECFA2FFEED2A5FFF0D6A9FFF1D7ABFFF1D8ADFFF1D8ADFFF1D8
          ADFFF1D6AAFFF0D5A8FFEED2A5FFEFD4A7FFE0C2A2FF6246318F1C140E2BC794
          6CFCF5E8CCFFEFD6ABFFF1D8AEFFF2DAB0FFF3DCB3FFF3DEB4FFF3DEB4FFF3DE
          B4FFF3DCB2FFF1DBB0FFF1D8ADFFF7EACDFFC69470FA1A120D2E000000036F52
          3C92D7B08CFFF8EFD3FFF3E0B9FFF3DFB7FFF4E1B9FFF5E3BBFFF5E2BBFFF5E2
          BBFFF4E1B9FFF4E2BDFFFAF1D5FFD9B390FF664B368C00000006000000010202
          0107906C4EB8D9B38FFFF7EDD3FFF8EED0FFF7EBC9FFF6E8C4FFF6E8C5FFF7EC
          CAFFF8EED0FFF4E8CDFFD7AF8BFF88664AB30202010B00000001000000000000
          00010202010770543F8FCFA078FCE2C4A2FFEBD7B8FFF4E9CDFFF4EACEFFECD8
          B9FFE3C5A3FFC59973F24C392A67000000060000000100000000000000000000
          000000000001000000022019122C6C543E89A47E5FCCC59770F1C19570EEA47E
          60CD6C543F8B16110D2200000003000000010000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00000000000000000000000000000000001F421C11FF30140DEC190A06B30304
          075F0000001B0000000500000000000000000000000000000000000000000000
          00000000000000000000000000000000001E663C2BE7B9C7D2FF7889A2FF2441
          82FF051033AF0000002100000005000000000000000000000000000000000000
          0002000000090000000E0000000F0000002041261BAE879AB2FFC8E3F5FF1F66
          B6FF2B6BA8FF051236AD0000001F000000040000000000000000000000000000
          00088C6657C0C38C7AFFC38C79FFCBA395FFA89894FF488BC3FFDEFEFDFF51B4
          E3FF1F68B7FF3173AEFF061538AA0000001C0000000400000000000000000000
          000CC5917EFFFDFBFAFFFCF8F6FFFAF7F5FFECEAE9FF7CA3BFFF479FD2FFDEFE
          FDFF59BFE9FF216BB9FF367BB3FF07173AA70000001A00000004000000000000
          000CC79481FFFEFBFAFFF9F0EAFFF8F0EAFFF7F0EBFFE8E4E1FF7EA4BFFF4BA5
          D5FFDEFEFDFF61CAEFFF246FBCFF3B83B9FF081A3DA300000018000000000000
          000BC99786FFFEFCFBFFF9F2EDFFF9F2EDFFF9F0EBFFF8F2EDFFEBE7E5FF82A7
          C2FF4EAAD7FFDEFEFDFF68D4F4FF2875BEFF3F8BBEFF091B3F9E000000000000
          000ACB9C8BFFFEFDFCFFFAF3EFFFFAF4EEFFFAF3EEFFFAF1ECFFF8F2EEFFEDE9
          E7FF85ABC7FF51AEDAFFDEFEFDFF6EDDF8FF2C7BC2FF18448BFF000000000000
          0009CFA08DFFFEFEFDFFFBF5F1FFFBF5F0FFFBF4F0FFFAF3EFFFFAF3EFFFF8F4
          EFFFEFECE9FF89AECAFF54B1DCFFDEFEFDFF4FA6D4FF102C4E93000000000000
          0009D0A393FFFEFEFDFFFAF5F3FFFBF6F2FFFBF5F1FFFBF5F0FFFBF5F0FFFAF4
          EFFFFAF6F1FFF3EFEDFF83A0B8FF357FBCFF173A598F0000000C000000000000
          0008D3A897FFFEFEFEFFFBF6F4FFFBF6F4FFFCF6F3FFFCF6F3FFFCF4F2FFFBF5
          F1FFFBF5F0FFFAF6F3FFE2CCC4FF000000160000000600000001000000000000
          0007D3AB9AFFFFFEFEFFFCF8F6FFFCF7F5FFFCF7F5FFFBF6F4FFFBF6F4FFFCF6
          F3FFFCF6F2FFFBF6F1FFD1A494FF0000000C0000000000000000000000000000
          0006D8AE9DFFFFFFFEFFFDF9F7FFFDF9F7FFFCF8F7FFFCF8F6FFFCF7F5FFFBF7
          F5FFFBF7F4FFFCF7F3FFD3A897FF0000000B0000000000000000000000000000
          0006D8B0A0FFFFFFFFFFFDFAF9FFFDFAF8FFFDFAF8FFFDF9F7FFFCF8F7FFFBF8
          F6FFFBF7F6FFFCF7F5FFD4AC9BFF0000000A0000000000000000000000000000
          0005D9B3A3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFEFFFEFEFEFFFFFE
          FEFFFEFEFEFFFEFEFEFFD7AE9EFF000000090000000000000000000000000000
          0003A3867AC0DBB5A5FFDAB5A4FFDAB5A4FFDAB4A4FFD9B3A3FFD9B3A3FFD9B3
          A2FFD9B2A2FFD8B2A2FFA08377C2000000060000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000020000000A00000010000000090000000200000000000000000000
          00020000000A000000120000000C000000030000000000000000000000000000
          00020000000F0F0742921D0F7EEF0603347A0000000E00000002000000020000
          000F0804347C1D0F7EF00F084194000000120000000200000000000000000000
          0008120B47923233AFFF3648CCFF1D1EA5FF0603357A0000000F0000000F0703
          357C1F20A5FF3747CCFF2D2FAEFF120B46950000000B00000000000000000000
          000C281C8DF1596CD8FF3B51D3FF3A4FD2FF1E22A6FF0602347D0502357E2022
          A6FF3A50D3FF3A50D3FF4C5FD4FF291D8CF10000001000000000000000000000
          0006130F3C734D4FBAFF667EE0FF415AD6FF415AD7FF1F24A7FF2529A8FF415A
          D7FF415AD7FF5B72DEFF484AB8FF130F3C790000000900000000000000000000
          00010000000A16123F73585CC1FF758DE6FF4A64DBFF4A65DBFF4A65DBFF4A64
          DBFF6983E3FF5356C0FF16123F780000000C0000000200000000000000000000
          0000000000010000000A191643755D63C7FF6783E5FF5774E2FF5774E2FF5774
          E2FF565CC6FF1916437A0000000D000000020000000000000000000000000000
          00000000000100000009100E3D734A50BEFF7492EBFF6383E7FF6483E7FF6383
          E7FF3840B6FF0B0839780000000C000000020000000000000000000000000000
          0001000000071413416E555CC5FF85A1EFFF7897EDFF9CB6F4FF9DB7F5FF7997
          EEFF7796EDFF414ABCFF0E0C3C730000000A0000000100000000000000000000
          00041818456B636CCFFF93AFF3FF83A1F1FFA6BFF7FF676DCAFF7E87DDFFAFC7
          F8FF83A3F2FF83A1F1FF5058C4FF121040710000000600000000000000000000
          00065759C3EFAFC6F6FF8EADF4FFABC4F8FF6F76D0FF1817456F24244F70868E
          E1FFB5CCF9FF8DACF4FFA1B8F4FF5758C3EF0000000900000000000000000000
          000331326B8695A0EAFFC0D3F9FF7880D7FF1C1C496B00000006000000072527
          526C8B93E6FFC1D3F9FF949EE9FF303168870000000500000000000000000000
          00010000000431336B825E62CBEC1F204D680000000500000001000000010000
          00052728536B5E62CBEC31326883000000070000000100000000000000000000
          0000000000000000000200000004000000020000000100000000000000000000
          0001000000030000000500000004000000010000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000002000000070000
          000D0000000F0000000D00000007000000020000000000000000000000020000
          00090000000F00000010000000110000001100000014020101214C28168E8648
          27DAA55831FF854627DB4A28158C020100150000000400000000000000098B63
          56C1C18977FFC08976FFC08875FFC59584FFCFAFA3FFB0704EFFC07C4AFFDEA6
          69FFF4D3A1FFDEA76AFFBF7C4BFF844728D406030217000000020000000CC38E
          79FFFDFBFAFFFBF7F4FFFCF6F3FFF7F4F1FFC8A28CFFC48656FFEDBC7CFFEEBF
          7FFF83400EFFF2CC94FFEFC181FFC38657FF58321C93000000070000000DC591
          7EFFFDFCFBFFF8EFE8FFF7EEE8FFF2EDE9FFBA7D57FFE4B377FFF5D9ABFFF5DA
          AFFF8B4914FFF7E3BEFFF6DBB2FFE5B77FFF995C36E30000000B0000000CC794
          81FFFEFCFBFFF9F0EAFFF8F0EAFFF3EFECFFBC784FFFF1CE95FF995420FF9752
          1DFF934F1CFF904C19FF8D4917FFF5DBAEFFB16F45FA0000000B0000000BC997
          86FFFEFDFCFFF9F2EDFFF9F2EDFFF5F0EDFFC68C65FFEFDDB7FFF3CF98FFF5D5
          9FFF9B5622FFF7E0B2FFF5D7A4FFEFDDB8FFA46942E2000000080000000ACB9C
          8BFFFEFDFDFFFAF3EFFFFAF4EEFFF8F3F0FFDBB9A4FFD8AE86FFF9F3D1FFF8E1
          B5FFA35D28FFFAEAC6FFFAF6D5FFD8AF89FF5E3E29850000000400000009CFA0
          8DFFFEFEFDFFFBF5F1FFFBF5F0FFFAF4F1FFF6F2EFFFD5A785FFDCB48DFFF2E9
          CAFFFAFDE1FFF2E9CAFFDCB38CFF996B4AC80202010A0000000100000009D0A3
          93FFFEFEFDFFFAF5F3FFFBF6F2FFFBF5F1FFFBF6F2FFF8F4F0FFE4C9B4FFDAAF
          8AFFD8A578FFDBAE8AFFD7B098FF02020117000000010000000000000008D3A8
          97FFFEFEFEFFFBF6F4FFFBF6F4FFFCF6F3FFFCF6F3FFFCF5F4FFFAF6F3FFFAF6
          F3FFF8F6F3FFFBF9F8FFDAB9ADFF0000000E000000000000000000000007D3AB
          9AFFFFFEFEFFFCF8F6FFFCF7F5FFFCF7F5FFFBF6F4FFFBF6F4FFFCF6F3FFFCF6
          F2FFFBF6F1FFFDFBF9FFD0A493FF0000000C000000000000000000000006D8AE
          9DFFFFFFFEFFFDF9F7FFFDF9F7FFFCF8F7FFFCF8F6FFFCF7F5FFFBF7F5FFFBF7
          F4FFFCF7F3FFFDFCFAFFD2A897FF0000000B000000000000000000000006D8B0
          A0FFFFFFFFFFFDFAF9FFFDFAF8FFFDFAF8FFFDF9F7FFFCF8F7FFFBF8F6FFFBF7
          F6FFFCF7F5FFFEFCFCFFD5AA9AFF0000000B000000000000000000000005D9B3
          A3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFEFFFEFEFEFFFFFEFEFFFEFE
          FEFFFEFEFEFFFEFEFDFFD7AE9EFF00000009000000000000000000000003A386
          7AC0DBB5A5FFDAB5A4FFDAB5A4FFDAB4A4FFD9B3A3FFD9B3A3FFD9B3A2FFD9B2
          A2FFD8B2A2FFD8B1A1FFA08277C2000000060000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000002000000070000
          000D0000000F0000000D00000007000000020000000000000000000000020000
          00090000000F00000010000000110000001100000014020101214C28168E8648
          27DAA55831FF854627DB4A28158C020100150000000400000000000000098B63
          56C1C18977FFC08976FFC08875FFC59584FFCFAFA3FFB0704EFFC07C4AFFDEA6
          69FFEDBC78FFDEA76AFFBF7C4BFF844728D406030217000000020000000CC38E
          79FFFDFBFAFFFBF7F4FFFCF6F3FFF7F4F1FFC8A28CFFC48656FFEDBC7CFFEEBF
          7FFFEEC183FFEFC383FFEFC181FFC38657FF58321C93000000070000000DC591
          7EFFFDFCFBFFF8EFE8FFF7EEE8FFF2EDE9FFBA7D57FFE4B377FFF5D9ABFFF5DA
          AFFFF6DCB2FFF6DEB3FFF6DBB2FFE5B77FFF995C36E30000000B0000000CC794
          81FFFEFCFBFFF9F0EAFFF8F0EAFFF3EFECFFBC784FFFF1CE95FF99541FFF944E
          1BFF8E4A16FF894512FF85400EFFF5DBAEFFB16F45FA0000000B0000000BC997
          86FFFEFDFCFFF9F2EDFFF9F2EDFFF5F0EDFFC68C65FFEFDDB7FFF3CF98FFF5D5
          9FFFF5D7A4FFF6DAA5FFF5D7A4FFEFDDB8FFA46942E2000000080000000ACB9C
          8BFFFEFDFDFFFAF3EFFFFAF4EEFFF8F3F0FFDBB9A4FFD8AE86FFF9F3D1FFF8E1
          B5FFF9DFAFFFF9E6BCFFFAF6D5FFD8AF89FF5E3E29850000000400000009CFA0
          8DFFFEFEFDFFFBF5F1FFFBF5F0FFFAF4F1FFF6F2EFFFD5A785FFDCB48DFFF2E9
          CAFFFAFDE1FFF2E9CAFFDCB38CFF996B4AC80202010A0000000100000009D0A3
          93FFFEFEFDFFFAF5F3FFFBF6F2FFFBF5F1FFFBF6F2FFF8F4F0FFE4C9B4FFDAAF
          8AFFD8A578FFDBAE8AFFD7B098FF02020117000000010000000000000008D3A8
          97FFFEFEFEFFFBF6F4FFFBF6F4FFFCF6F3FFFCF6F3FFFCF5F4FFFAF6F3FFFAF6
          F3FFF8F6F3FFFBF9F8FFDAB9ADFF0000000E000000000000000000000007D3AB
          9AFFFFFEFEFFFCF8F6FFFCF7F5FFFCF7F5FFFBF6F4FFFBF6F4FFFCF6F3FFFCF6
          F2FFFBF6F1FFFDFBF9FFD0A493FF0000000C000000000000000000000006D8AE
          9DFFFFFFFEFFFDF9F7FFFDF9F7FFFCF8F7FFFCF8F6FFFCF7F5FFFBF7F5FFFBF7
          F4FFFCF7F3FFFDFCFAFFD2A897FF0000000B000000000000000000000006D8B0
          A0FFFFFFFFFFFDFAF9FFFDFAF8FFFDFAF8FFFDF9F7FFFCF8F7FFFBF8F6FFFBF7
          F6FFFCF7F5FFFEFCFCFFD5AA9AFF0000000B000000000000000000000005D9B3
          A3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFEFFFEFEFEFFFFFEFEFFFEFE
          FEFFFEFEFEFFFEFEFDFFD7AE9EFF00000009000000000000000000000003A386
          7AC0DBB5A5FFDAB5A4FFDAB5A4FFDAB4A4FFD9B3A3FFD9B3A3FFD9B3A2FFD9B2
          A2FFD8B2A2FFD8B1A1FFA08277C2000000060000000000000000}
      end>
  end
  object DicServices: TIBQuery
    Database = DB
    Transaction = DefTr
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    SQL.Strings = (
      'select * from DIC_SERVICES')
    UpdateObject = DicServices_upd
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_DIC_SERVICES_ID'
    GeneratorField.ApplyEvent = gamOnServer
    Left = 399
    Top = 190
  end
  object DSDicServices: TDataSource
    AutoEdit = False
    DataSet = DicServices
    Left = 399
    Top = 249
  end
  object DSDicMaterials: TDataSource
    AutoEdit = False
    DataSet = DicMaterials
    Left = 343
    Top = 277
  end
  object DicMaterials: TIBQuery
    Database = DB
    Transaction = DefTr
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    SQL.Strings = (
      'select * from DIC_MATERIALS')
    UpdateObject = DicMaterials_upd
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_DIC_MATERIALS_ID'
    GeneratorField.ApplyEvent = gamOnServer
    Left = 343
    Top = 218
  end
  object DicMaterials_upd: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  NAME,'
      '  TYPE_ID,'
      '  SERVICE_ID,'
      '  SUBTYPE_ID'
      'from DIC_MATERIALS '
      'where'
      '  ID = :ID')
    ModifySQL.Strings = (
      'update DIC_MATERIALS'
      'set'
      '  NAME = :NAME,'
      '  SERVICE_ID = :SERVICE_ID,'
      '  SUBTYPE_ID = :SUBTYPE_ID,'
      '  TYPE_ID = :TYPE_ID'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into DIC_MATERIALS'
      '  (NAME, SERVICE_ID, SUBTYPE_ID, TYPE_ID)'
      'values'
      '  (:NAME, :SERVICE_ID, :SUBTYPE_ID, :TYPE_ID)')
    DeleteSQL.Strings = (
      'delete from DIC_MATERIALS'
      'where'
      '  ID = :OLD_ID')
    Left = 344
    Top = 328
  end
  object DicServices_upd: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select * from DIC_SERVICES where  ID = :ID')
    ModifySQL.Strings = (
      'update DIC_SERVICES set NAME = :NAME where id = :OLD_ID')
    InsertSQL.Strings = (
      'INSERT INTO DIC_SERVICES (NAME) Values(:NAME)'#9)
    DeleteSQL.Strings = (
      'delete from DIC_SERVICES'
      'where'
      '  ID = :OLD_ID')
    Left = 400
    Top = 296
  end
  object DicUserTypes_upd: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select * from dic_user_types where  ID = :ID')
    ModifySQL.Strings = (
      'update DIC_USER_TYPES set NAME = :NAME where id = :OLD_ID')
    InsertSQL.Strings = (
      'INSERT INTO DIC_USER_TYPES (NAME) Values(:NAME)'#9)
    DeleteSQL.Strings = (
      'delete from DIC_USER_TYPES'
      'where'
      '  ID = :OLD_ID')
    Left = 456
    Top = 312
  end
  object DicWorkerProfs_upd: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select * from DIC_WORKER_PROFS where  ID = :ID')
    ModifySQL.Strings = (
      'update  DIC_WORKER_PROFS set NAME = :NAME where id = :OLD_ID')
    InsertSQL.Strings = (
      'INSERT INTO  DIC_WORKER_PROFS (NAME) Values(:NAME)'#9)
    DeleteSQL.Strings = (
      'delete from DIC_WORKER_PROFS'
      'where'
      '  ID = :OLD_ID')
    Left = 528
    Top = 296
  end
  object DicMaterialType: TIBQuery
    Database = DB
    Transaction = DefTr
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    SQL.Strings = (
      'select * from DIC_MATERIAL_TYPES')
    UpdateObject = DicMaterialType_upd
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_DIC_MATERIAL_TYPES_ID'
    GeneratorField.ApplyEvent = gamOnServer
    Left = 303
    Top = 202
  end
  object DsDicMaterialType: TDataSource
    AutoEdit = False
    DataSet = DicMaterialType
    Left = 303
    Top = 261
  end
  object DicMaterialType_upd: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  NAME'
      'from DIC_MATERIAL_TYPES '
      'where'
      '  ID = :ID')
    ModifySQL.Strings = (
      'update DIC_MATERIAL_TYPES'
      'set'
      '  ID = :ID,'
      '  NAME = :NAME'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into DIC_MATERIAL_TYPES'
      '  (ID, NAME)'
      'values'
      '  (:ID, :NAME)')
    DeleteSQL.Strings = (
      'delete from DIC_MATERIAL_TYPES'
      'where'
      '  ID = :OLD_ID')
    Left = 304
    Top = 312
  end
  object DicMaterialSubTypes: TIBQuery
    Database = DB
    Transaction = DefTr
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    SQL.Strings = (
      'select * from DIC_MATERIAL_SUBTYPES')
    UpdateObject = DicMaterialSubTypes_upd
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_DIC_MATERIAL_TYPES_ID'
    GeneratorField.ApplyEvent = gamOnServer
    Left = 255
    Top = 250
  end
  object DsDicMaterialSubTypes: TDataSource
    AutoEdit = False
    DataSet = DicMaterialSubTypes
    Left = 255
    Top = 309
  end
  object DicMaterialSubTypes_upd: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  SERVICE_ID,'
      '  NAME'
      'from DIC_MATERIAL_SUBTYPES '
      'where'
      '  ID = :ID')
    ModifySQL.Strings = (
      'update DIC_MATERIAL_SUBTYPES'
      'set'
      '  NAME = :NAME,'
      '  SERVICE_ID = :SERVICE_ID'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into DIC_MATERIAL_SUBTYPES'
      '  (NAME, SERVICE_ID)'
      'values'
      '  (:NAME, :SERVICE_ID)')
    DeleteSQL.Strings = (
      'delete from DIC_MATERIAL_SUBTYPES'
      'where'
      '  ID = :OLD_ID')
    Left = 256
    Top = 360
  end
end
