object DMConnection: TDMConnection
  OldCreateOrder = False
  Height = 339
  Width = 559
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=pedidovenda'
      'User_Name=root'
      'Password=123456'
      'Server=127.0.0.1'
      'DriverID=MySQL')
    ResourceOptions.AssignedValues = [rvAutoConnect]
    ResourceOptions.AutoConnect = False
    UpdateOptions.AssignedValues = [uvUpdateMode, uvRefreshMode]
    UpdateOptions.UpdateMode = upWhereAll
    UpdateOptions.RefreshMode = rmAll
    Connected = True
    LoginPrompt = False
    Transaction = FDTransaction
    Left = 56
    Top = 32
  end
  object FDTransaction: TFDTransaction
    Connection = FDConnection
    Left = 152
    Top = 32
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    DriverID = 'MySQL'
    VendorLib = 'D:\Projetos\Delphi\PedidoVenda\lib\libmysql.dll'
    Left = 64
    Top = 96
  end
end
