unit uClienteController;

interface

uses
  uCliente, FireDAC.Comp.Client, System.SysUtils, uDaoCliente;

type
  TClienteController = class
    private
      FDaoCliente : TDaoCliente;
      function getCliente: TCliente;
      procedure setCliente(const Value: TCliente);
    public
      Constructor Create(pConexao: TFDConnection); overload;
      Constructor Create(pConexao: TFDConnection; pCliente : TCliente); overload;
      Constructor Destroy();
      function save() : Boolean;
      function delete() : Boolean;
      function getById(piValue : Integer) : TCliente;
      property cliente : TCliente read getCliente write setCliente;
  end;

implementation

{ TClienteController }

constructor TClienteController.Create(pConexao: TFDConnection);
begin
  FDaoCliente := TDaoCliente.Create(pConexao);
end;


constructor TClienteController.Create(pConexao: TFDConnection; pCliente: TCliente);
begin
  Create(pConexao);
  FDaoCliente.cliente := pCliente;
end;

function TClienteController.delete(): Boolean;
begin
  try
    Result := false;
    FDaoCliente.delete();
    Result := true;
  except
    on E : exception do
       begin
         raise Exception.Create('Erro ao apagar registro');
       end
  end;
end;

constructor TClienteController.Destroy;
begin
  FreeAndNil(FDaoCliente);
end;

function TClienteController.getById(piValue: Integer): TCliente;
begin
  try
    Result := FDaoCliente.getById(piValue);
  except
    on E : exception do
       begin
         raise Exception.Create('Erro ao buscar registro');
       end
  end;
end;

function TClienteController.getCliente: TCliente;
begin
  result := FDaoCliente.cliente;
end;

function TClienteController.save(): Boolean;
begin
  try
    Result := false;

    if (Trim(FDaoCliente.cliente.nome) = '') then
       begin
         raise Exception.Create('Informe o nome.');
         Exit;
       end;
    
    Result := FDaoCliente.save();
  except
    on E : exception do
       begin
         raise Exception.Create('Erro ao salvar cliente - controller');
       end
  end;
end;

procedure TClienteController.setCliente(const Value: TCliente);
begin
  FDaoCliente.cliente := Value;
end;

end.
