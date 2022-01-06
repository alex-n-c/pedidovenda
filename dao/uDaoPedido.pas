unit uDaoPedido;

interface

uses
  uDaoModel, uPedido, uItem, FireDAC.Comp.Client, System.Generics.Collections,
  System.SysUtils, uDaoCliente, uCliente;
type
  TDaoPedido = class(TDaoModel)
  private
    FPedido : TPedido;
  public
    function save() : Boolean;
    function delete() : Boolean;
    function getById(value: Integer): TPedido;
    function getItens() : TFDQuery;
    constructor create(pConexao : TFDConnection); overload;
    constructor create(pConexao : TFDConnection; pPedido : TPedido); overload;
    destructor destroy(); override;
    property pedido : TPedido read FPedido write FPedido;
  end;

implementation

uses uDaoItem;

constructor TDaoPedido.create(pConexao: TFDConnection);
begin
  inherited;
  FPedido := TPedido.create();
end;

constructor TDaoPedido.create(pConexao: TFDConnection; pPedido: TPedido);
begin
  Create(pConexao);
  FPedido := pPedido;
end;

function TDaoPedido.delete(): Boolean;
begin
  try
    try
      FDConnection.Connected := False;
      FDConnection.Connected := True;
      FDConnection.StartTransaction;

      FDQuery.Close;
      FDQuery.SQL.Clear;
      FDQuery.SQL.Add('DELETE FROM produtospedido WHERE pedido_id = :pIdPedido');
      FDQuery.ParamByName('pIdPedido').AsInteger := FPedido.idPedido;
      FDQuery.ExecSQL;


      FDQuery.Close;
      FDQuery.SQL.Clear;
      FDQuery.SQL.Add('DELETE FROM pedidos WHERE idpedido = :pIdPedido');
      FDQuery.ParamByName('pIdPedido').AsInteger := FPedido.idPedido;
      FDQuery.ExecSQL;

      FDConnection.Commit;
    except
      FDConnection.Transaction.Rollback;
      raise Exception.Create('Erro apagar registro de pedido: '+IntToStr(FPedido.idPedido));
    end;
  finally
  end;

end;

destructor TDaoPedido.destroy;
begin
  FreeAndNil(FPedido);
  inherited;
end;

function TDaoPedido.getById(value: Integer): TPedido;
var
  daoCliente : TDaoCliente;
  vCliente : TCliente;
begin
  try
    daoCliente := TDaoCliente.create(FDConnection);
    vCliente := TCliente.Create;
    try
      if not FDConnection.Connected then
         FDConnection.Connected := True;

      FDQuery.Close;
      FDQuery.SQL.Clear;
      FDQuery.SQL.Add('SELECT idpedido, dtemissao, cliente_id, valortotal');
      FDQuery.SQL.Add('FROM pedidos');
      FDQuery.SQL.Add('WHERE pedidos.idpedido = :pIdPedido');
      FDQuery.ParamByName('pIdPedido').AsInteger := value;
      FDQuery.Open;

      vCliente := daoCliente.getById(FDQuery.FieldByName('cliente_id').AsInteger);

      FPedido := TPedido.create(FDQuery.FieldByName('idpedido').AsInteger,
                                FDQuery.FieldByName('dtemissao').AsDateTime,
                                vCliente,
                                FDQuery.FieldByName('valortotal').AsFloat);

      getItens;

      Result := FPedido;
    except
      raise Exception.Create('Erro apagar registro de cliente');
    end;
  finally
    FreeAndNil(vCliente);
  end;
end;

function TDaoPedido.getItens(): TFDQuery;
var
  daoItem : TDaoItem;
begin
  try
    daoItem := TDaoItem.Create(FDConnection);
    try
      if not FDConnection.Connected then
         FDConnection.Connected := True;

      FDQuery.Close;
      FDQuery.SQL.Clear;
      FDQuery.SQL.Add('SELECT idprodutospedido, pedido_id, produto_id, qtde,');
      FDQuery.SQL.Add('vlrunitario, vlrtotal');
      FDQuery.SQL.Add('FROM produtospedido');
      FDQuery.SQL.Add('WHERE pedido_id = :pIdPedido');
      FDQuery.ParamByName('pIdPedido').AsInteger := FPedido.idPedido;
      FDQuery.Open;

      FPedido.itens.Clear;

      FDQuery.First;
      while not FDQuery.eof do
         begin
           FPedido.itens.Add(daoItem.getById(FDQuery.FieldByName('pedido_id').AsInteger,
                                          FDQuery.FieldByName('idprodutospedido').AsInteger));
           FDQuery.Next;
         end;

      FDQuery.First;
      Result := FDQuery;
    except
      raise Exception.Create('Erro ao carregar itens do pedido');
    end;
  finally
    FreeAndNil(daoItem);
  end;
end;

function TDaoPedido.save(): Boolean;
var
  vItem : TItem;
  daoItem : TDaoItem;
begin
  try
    daoItem := TDaoItem.Create(FDConnection);
    try
      FDConnection.Connected := False;
      FDConnection.Connected := True;
      FDConnection.StartTransaction;

      FDQuery.Close;
      FDQuery.SQL.Clear;
      FDQuery.SQL.Add('INSERT INTO pedidos (idpedido, dtemissao, cliente_id, valortotal)');
      FDQuery.SQL.Add('VALUES (:pIdPedido, :pDtEmissao, :pClienteId, :pValorTotal)');
      FDQuery.SQL.Add('ON DUPLICATE KEY UPDATE');
      FDQuery.SQL.Add('idpedido = :pIdPedido, dtemissao = :pDtEmissao, cliente_id = :pClienteId, valortotal = :pValorTotal');
      FDQuery.ParamByName('pIdPedido').AsInteger   := FPedido.idPedido;
      FDQuery.ParamByName('pDtEmissao').AsDateTime := FPedido.dtEmissao;
      FDQuery.ParamByName('pClienteId').AsInteger  := FPedido.cliente.idCliente;
      FDQuery.ParamByName('pValorTotal').AsFloat   := FPedido.valorTotal;
      FDQuery.ExecSQL;

      if (FPedido.idPedido <= 0) then
         begin
           FDQuery.Close;
           FDQuery.SQL.Clear;
           FDQuery.SQL.Add('SELECT LAST_INSERT_ID() as ID');
           FDQuery.Open;
           FPedido.idPedido := FDQuery.FieldByName('ID').AsInteger;
         end;

      for vItem in FPedido.itens do
         begin
           vItem.pedidoId := FPedido.idPedido;
           daoItem.save(vItem);
         end;

      FDConnection.Commit;

    except
      FDConnection.Transaction.Rollback;
      raise Exception.Create('Erro salvar registro de pedido');
    end;
  finally
  end;
end;

end.
