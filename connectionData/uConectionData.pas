unit uConectionData;

interface

uses
  FireDAC.Comp.Client, FireDAC.Phys.MySQL, System.SysUtils, Vcl.Dialogs;

  type
    TConectionData = class
    private
    FDConnection: TFDConnection;
    FDTransaction: TFDTransaction;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    FDirLibMySql : String;
    FServidor : String;
    FUserName : String;
    FPassWord : String;
    FDataBaseName : String;
    FDriverName : String;
    FPorta : String;

    function getDriverName: String;
    procedure setDriverName(const Value: String);
    function getDirLibMySql: String;
    procedure setDirLibMySql(const Value: String);
    procedure carregarParam();
    function getDataBaseName: String;
    function getPassWord: String;
    function getPorta: String;
    function getServidor: String;
    function getUserName: String;
    procedure setDataBaseName(const Value: String);
    procedure setPassWord(const Value: String);
    procedure setPorta(const Value: String);
    procedure setServidor(const Value: String);
    procedure setUserName(const Value: String);
    public
    {property driverName : String read getDriverName write setDriverName;
    property dirLibMySql : String read getDirLibMySql write setDirLibMySql;
    property servidor : String read getServidor write setServidor;
    property userName : String read getUserName write setUserName;
    property passWord : String read getPassWord write setPassWord;
    property dataBaseName : String read getDataBaseName write setDataBaseName;
    property porta : String read getPorta write setPorta; }
    function getConection() : TFDConnection;

    constructor Create(psDriverName, psDirLibMySql, psServidor, psUserName,
                       psPassWord, psDataBaseName, psPorta : String); overload; virtual;
    destructor Destroy; override;
    end;

implementation

{ TConectionData }

procedure TConectionData.carregarParam;
begin
  FDConnection.Connected := false;
  FDConnection.Params.Clear;

  FDPhysMySQLDriverLink1.DriverID     := getDriverName;
  FDPhysMySQLDriverLink1.VendorLib    := getDirLibMySql;//dirAplicacao+'Lib\libmysql.dll';

  FDConnection.DriverName  := getDriverName;
  FDConnection.LoginPrompt := False;

  FDConnection.Params.Values['Server']    := getServidor;
  FDConnection.Params.Values['User_Name'] := getUserName;
  FDConnection.Params.Values['Password']  := getPassWord;
  FDConnection.Params.Values['Database']  := getDataBaseName;
  FDConnection.Params.Values['DriverID']  := getDriverName;
  FDConnection.Params.Values['Port']      := getPorta;
end;

constructor TConectionData.Create(psDriverName, psDirLibMySql, psServidor,
                                  psUserName, psPassWord, psDataBaseName,
                                  psPorta : String);
begin

  try
    FDriverName   := psDriverName;
    FDirLibMySql  := psDirLibMySql;
    FServidor     := psServidor;
    FUserName     := psUserName;
    FPassWord     := psPassWord;
    FDataBaseName := psDataBaseName;
    FPorta        := psPorta;

    FDConnection           := TFDConnection.Create(nil);
    FDTransaction          := TFDTransaction.Create(nil);
    FDPhysMySQLDriverLink1 := TFDPhysMySQLDriverLink.Create(nil);
    carregarParam();
  except
    raise Exception.Create('Erro ao incializar class conection.');
  end;

end;

destructor TConectionData.Destroy;
begin
  FreeAndNil(FDConnection);
  FreeAndNil(FDTransaction);
  FreeAndNil(FDPhysMySQLDriverLink1);
  
  inherited;
end;

function TConectionData.getConection: TFDConnection;
begin
  Result := FDConnection;
end;

function TConectionData.getDataBaseName: String;
begin
  result := FDataBaseName;
end;

function TConectionData.getDirLibMySql: String;
begin
  result := FDirLibMySql;
end;

function TConectionData.getDriverName: String;
begin
  result := FDriverName;
end;

function TConectionData.getPassWord: String;
begin
  result := FPassWord;
end;

function TConectionData.getPorta: String;
begin
  result := FPorta;
end;

function TConectionData.getServidor: String;
begin
  result := FServidor;
end;

function TConectionData.getUserName: String;
begin
  result := FUserName;
end;

procedure TConectionData.setDataBaseName(const Value: String);
begin
  FDataBaseName := Value;
end;

procedure TConectionData.setDirLibMySql(const Value: String);
begin
  if (not Fileexists(Value)) then
     raise Exception.Create('Diretório e/ou arquivo lib mysql inexistente.');

  FDirLibMySql := value;
end;

procedure TConectionData.setDriverName(const Value: String);
begin
  FDriverName := value;
end;

procedure TConectionData.setPassWord(const Value: String);
begin
  FPassWord := Value;
end;

procedure TConectionData.setPorta(const Value: String);
begin
  FPorta := Value;
end;

procedure TConectionData.setServidor(const Value: String);
begin
  FServidor := Value;
end;

procedure TConectionData.setUserName(const Value: String);
begin
  FUserName := Value;
end;

end.
