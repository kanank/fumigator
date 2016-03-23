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
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from DIC_USER_TYPES')
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
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select *  from DIC_WORKER_PROFS')
    Left = 540
    Top = 218
  end
  object DSDicWorkerProfs: TDataSource
    AutoEdit = False
    DataSet = DicWorkerProfs
    Left = 541
    Top = 269
  end
  object Workers: TIBQuery
    Database = DB
    Transaction = DefTr
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from WORKERS')
    Left = 615
    Top = 218
  end
  object DSWorkers: TDataSource
    AutoEdit = False
    DataSet = Workers
    Left = 615
    Top = 269
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
end
