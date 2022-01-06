unit uDaoCliente;

interface

uses FireDAC.Comp.Client, uDaoModel, uCliente, System.SysUtils;

type
  TDaoCliente = class(TDaoModel)
    private
    FCliente : TCliente;
    public
    function save() : Boolean;
    function delete() : Boolean;
    function getById(value : Integer) : TCliente;
    constructor create(pConexao : TFDConnection); overload;
    constructor create(pConexao : TFDConnection; pCliente : TCliente); overload;
    property cliente : TCliente read FCliente write FCliente;
    destructor destroy();
  end;

implementation

{ TDaoCadastro }

constructor TDaoCliente.create(pConexao: TFDConnection; pCliente: TCliente);
begin
  FDConnection := pConexao;
  FCliente     := pCliente;
end;

constructor TDaoCliente.create(pConexao: TFDConnection);
begin
  inherited;
  FCliente := TCliente.Create;
end;

function TDaoCliente.delete(): Boolean;
begin
  try
    try
      FDConnection.Connected := False;
      FDConnection.Connected := True;
      FDConnection.StartTransaction;

      FDQuery.Close;
      FDQuery.SQL.Clear;
      FDQuery.SQL.Add('DELETE FROM CLIENTES WHERE IDCLIENTE = :pIdCliente');
      FDQuery.ParamByName('pIdCliente').AsInteger := FCliente.idCliente;
      FDQuery.ExecSQL;

      FDConnection.Commit;
    except
      FDConnection.Transaction.Rollback;
      raise Exception.Create('Erro apagar registro de cliente: '+FCliente.nome);
    end;
  finally

  end;

end;

destructor TDaoCliente.destroy;
begin
  FreeAndNil(FCliente);
end;

function TDaoCliente.getById(value: Integer): TCliente;
begin
  try
    try
      if not FDConnection.Connected then
         FDConnection.Connected := True;

      FDQuery.Close;
      FDQuery.SQL.Clear;
      FDQuery.SQL.Add('SELECT CLIENTES.IDCLIENTE, CLIENTES.NOME, CLIENTES.CIDADE,');
      FDQuery.SQL.Add('       CLIENTES.UF');
      FDQuery.SQL.Add('FROM CLIENTES');
      FDQuery.SQL.Add('WHERE CLIENTES.IDCLIENTE = :pIdCliente');
      FDQuery.ParamByName('pIdCliente').AsInteger := value;
      FDQuery.Open;

      FCliente := TCliente.create(FDQuery.FieldByName('IDCLIENTE').AsInteger,
                                  FDQuery.FieldByName('NOME').AsString,
                                  FDQuery.FieldByName('CIDADE').AsString,
                                  FDQuery.FieldByName('UF').AsString);
      Result := FCliente;

    except
      raise Exception.Create('Erro consultar registro de cliente');
    end;
  finally
  end;
end;

function TDaoCliente.save(): Boolean;
begin
  try
    try
      FDConnection.Connected := False;
      FDConnection.Connected := True;
      FDConnection.StartTransaction;

      FDQuery.Close;
      FDQuery.SQL.Clear;
      FDQuery.SQL.Add('INSERT INTO clientes (idcliente, nome, cidade, uf)');
      FDQuery.SQL.Add('VALUES (:pIdCliente, :pNome, :pCidade, :pUf)');
      FDQuery.SQL.Add('ON DUPLICATE KEY UPDATE');
      FDQuery.SQL.Add('nome = :pNome, cidade = :pCidade, uf = :pUf');
      FDQuery.ParamByName('pIdCliente').AsInteger := FCliente.idCliente;
      FDQuery.ParamByName('pNome').AsString       := FCliente.nome;
      FDQuery.ParamByName('pCidade').AsString     := FCliente.cidade;
      FDQuery.ParamByName('pUf').AsString         := FCliente.uf;
      FDQuery.ExecSQL;

      FDConnection.Commit;
    except
      FDConnection.Transaction.Rollback;
      raise Exception.Create('Erro salvar registro de cliente: '+FCliente.nome);
    end;
  finally
  end;
end;

end.
