unit uDaoItem;

interface

uses uDaoModel, uItem, FireDAC.Comp.Client, System.Classes,
  System.SysUtils, uDaoProduto;
  type
  TDaoItem = class(TDaoModel)
    private
    public
    function save(value: TItem) : Boolean;
    function delete(Value : TItem) : Boolean;
    function getById(pPedidoId, pItemId : Integer) : TItem;
  end;

implementation

{ TDaoItem }

function TDaoItem.delete(value: TItem): Boolean;
begin
  try
    try
      FDConnection.Connected := False;
      FDConnection.Connected := True;
      FDConnection.StartTransaction;

      FDQuery.Close;
      FDQuery.SQL.Clear;
      FDQuery.SQL.Add('DELETE FROM produtospedido');
      FDQuery.SQL.Add('WHERE pedido_id = :pPedido  ');
      FDQuery.SQL.Add('AND idprodutospedido = :idprodutospedido');
      FDQuery.ParamByName('pPedido').AsInteger := value.pedidoId;
      FDQuery.ParamByName('idprodutospedido').AsInteger := value.idProdutosPedido;
      FDQuery.ExecSQL;

      FDConnection.Commit;
    except
      FDConnection.Transaction.Rollback;
      raise Exception.Create('Erro apagar registro de cliente: ');
    end;
  finally
  end;

end;

function TDaoItem.getById(pPedidoId, pItemId : Integer): TItem;
var
  daoProduto : TDaoProduto;
begin
  try
    daoProduto := TDaoProduto.create(FDConnection);
    try
      FDQuery := TFDQuery.Create(nil);
      FDQuery.Connection := FDConnection;

      FDQuery.Close;
      FDQuery.SQL.Clear;
      FDQuery.SQL.Add('SELECT idprodutospedido, pedido_id, produto_id, qtde, vlrunitario, vlrtotal');
      FDQuery.SQL.Add('FROM produtospedido');
      FDQuery.SQL.Add('WHERE pedido_id = :pPedido  ');
      FDQuery.SQL.Add('AND idprodutospedido = :idprodutospedido');
      FDQuery.ParamByName('pPedido').AsInteger := pPedidoId;
      FDQuery.ParamByName('idprodutospedido').AsInteger := pItemId;
      FDQuery.Open;

      Result := TItem.create(FDQuery.FieldByName('idprodutospedido').AsInteger,
                             FDQuery.FieldByName('pedido_id').AsInteger,
                             daoProduto.getById(FDQuery.FieldByName('produto_id').AsInteger),
                             FDQuery.FieldByName('qtde').AsFloat,
                             FDQuery.FieldByName('vlrunitario').AsFloat,
                             FDQuery.FieldByName('vlrtotal').AsFloat);

    except
      FDConnection.Transaction.Rollback;
      raise Exception.Create('Erro apagar registro de cliente');
    end;
  finally
    FreeAndNil(daoProduto);
  end;
end;

function TDaoItem.save(value: TItem): Boolean;
begin
  try
    try
      FDConnection.Connected := False;
      FDConnection.Connected := True;
      FDConnection.StartTransaction;

      FDQuery.Close;
      FDQuery.SQL.Clear;
      FDQuery.SQL.Add('INSERT INTO produtospedido (idprodutospedido, pedido_id,');
      FDQuery.SQL.Add('produto_id, qtde, vlrunitario, vlrtotal)');
      FDQuery.SQL.Add('VALUES (:pIdprodutospedido, :pPedido_id, :pProduto_id, :pQtde,');
      FDQuery.SQL.Add(':pVlrunitario, :pVlrtotal)');
      FDQuery.SQL.Add('ON DUPLICATE KEY UPDATE');
      FDQuery.SQL.Add('idprodutospedido = :pIdprodutospedido, pedido_id = :pPedido_id,');
      FDQuery.SQL.Add('produto_id = :pProduto_id, qtde = :pQtde, vlrunitario = :pVlrunitario, vlrtotal = :pVlrtotal');
      FDQuery.ParamByName('pIdprodutospedido').AsInteger := value.idProdutosPedido;
      FDQuery.ParamByName('pPedido_id').AsInteger        := value.pedidoId;
      FDQuery.ParamByName('pProduto_id').AsInteger       := value.produto.idProduto;
      FDQuery.ParamByName('pQtde').AsFloat               := value.qtde;
      FDQuery.ParamByName('pVlrunitario').AsFloat        := value.vlrUnitario;
      FDQuery.ParamByName('pVlrtotal').AsFloat           := value.vlrTotal;
      FDQuery.ExecSQL;

      FDConnection.Commit;
    except
      FDConnection.Transaction.Rollback;
      raise Exception.Create('Erro salvar registro de produto no pedido');
    end;
  finally
  end;
end;

end.
