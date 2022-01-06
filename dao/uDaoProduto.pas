unit uDaoProduto;

interface
uses uProduto, uDaoModel, FireDAC.Comp.Client, System.SysUtils;

  type
  TDaoProduto = class(TDaoModel)
    private
      FProduto : TProduto;
    public
      constructor create(pConexao : TFDConnection); overload;
      constructor create(pConexao : TFDConnection; pProduto : TProduto); overload;
      property produto : TProduto read FProduto write FProduto;
      function save() : Boolean;
      function delete() : Boolean;
      function getById(value: Integer): TProduto;
  end;

implementation


{ TDaoProduto }

constructor TDaoProduto.create(pConexao: TFDConnection; pProduto: TProduto);
begin
  create(pConexao);
  FProduto := pProduto;
end;

function TDaoProduto.delete: Boolean;
begin
  try
    try
      FDConnection.Connected := False;
      FDConnection.Connected := True;
      FDConnection.StartTransaction;

      FDQuery.Close;
      FDQuery.SQL.Clear;
      FDQuery.SQL.Add('DELETE FROM produtos');
      FDQuery.SQL.Add('WHERE idproduto = :pIdProduto');
      FDQuery.ParamByName('pIdProduto').AsInteger := FProduto.idProduto;
      FDQuery.ExecSQL;

      FDConnection.Commit;
    except
      FDConnection.Transaction.Rollback;
      raise Exception.Create('Erro salvar registro de produto');
    end;
  finally
  end;
end;

function TDaoProduto.getById(value: Integer): TProduto;
begin
  try
    try
      Result := TProduto.create();

      if not FDConnection.Connected then
         FDConnection.Connected := True;

      FDQuery.Close;
      FDQuery.SQL.Clear;
      FDQuery.SQL.Add('SELECT idproduto, descricao, precovenda');
      FDQuery.SQL.Add('FROM produtos');
      FDQuery.SQL.Add('WHERE idproduto = :pIdProduto');
      FDQuery.ParamByName('pIdProduto').AsInteger := value;
      FDQuery.Open;

      Result.idProduto  := FDQuery.FieldByName('idproduto').AsInteger;
      Result.descricao  := FDQuery.FieldByName('descricao').AsString;
      Result.precoVenda := FDQuery.FieldByName('precovenda').AsFloat;

      FDQuery.Close;

      FProduto := Result;
    except
      raise Exception.Create('Erro buscar registro de produto');
    end;
  finally
  end;
end;

function TDaoProduto.save: Boolean;
begin
  try
    try
      FDQuery := TFDQuery.Create(nil);
      FDQuery.Connection := FDConnection;

      FDConnection.Connected := False;
      FDConnection.Connected := True;
      FDConnection.StartTransaction;

      FDQuery.Close;
      FDQuery.SQL.Clear;
      FDQuery.SQL.Add('INSERT INTO produtos (idproduto, descricao, precovenda)');
      FDQuery.SQL.Add('VALUES (:pIdProduto, :pDescricao, :pPrecoVenda)');
      FDQuery.SQL.Add('ON DUPLICATE KEY UPDATE');
      FDQuery.SQL.Add('idproduto = :pIdProduto, descricao = :pDescricao, precovenda = :pPrecoVenda');
      FDQuery.ParamByName('pIdProduto').AsInteger := FProduto.idProduto;
      FDQuery.ParamByName('pDescricao').AsString  := FProduto.descricao;
      FDQuery.ParamByName('pPrecoVenda').AsFloat  := FProduto.precoVenda;
      FDQuery.ExecSQL;

      FDConnection.Commit;
    except
      FDConnection.Transaction.Rollback;
      raise Exception.Create('Erro salvar registro de produto');
    end;
  finally
  end;
end;

constructor TDaoProduto.create(pConexao: TFDConnection);
begin
  inherited;
  FProduto := TProduto.create();
end;

end.
