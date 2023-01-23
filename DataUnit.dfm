object geData: TgeData
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 257
  Width = 245
  object SensorsTable: TTable
    TableName = 'e:\Siborg\projects\GeoEdit\bin\sensors.db'
    Left = 32
    Top = 96
  end
  object SensorsDataSource: TDataSource
    DataSet = SensorsTable
    Left = 128
    Top = 96
  end
  object geQuery: TQuery
    RequestLive = True
    SQL.Strings = (
      '')
    Left = 152
    Top = 16
  end
  object geDataSource: TDataSource
    DataSet = geTable
    Left = 80
    Top = 16
  end
  object geTable: TTable
    AfterPost = geTableAfterPost
    BeforeScroll = geTableBeforeScroll
    AfterScroll = geTableAfterScroll
    TableType = ttParadox
    Left = 16
    Top = 16
  end
  object ToolsTable: TTable
    Left = 24
    Top = 160
  end
end
