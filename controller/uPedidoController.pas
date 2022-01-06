unit uPedidoController;

interface

uses
  uDaoPedido, FireDAC.Comp.Client, uPedido, System.SysUtils, uItem,
  System.Generics.Collections;
type
  TPedidoController = class
    private
      FDaoPedido : TDaoPedido;
    public
      Constructor Create(pConexao: TFDConnection); overload;
      Constructor Create(pConexao: TFDConnection; pPedido: TPedido); overload;
      Constructor Destroy();
      function save() : Boolean;
      function delete() : Boolean;
      function getById(pIdPedido : Integer) : TPedido;
  end;
implementation

{ TPedidoController }
constructor TPedidoController.Create(pConexao: TFDConnection);
begin
  FDaoPedido := TDaoPedido.Create(pConexao);
end;


constructor TPedidoController.Create(pConexao: TFDConnection; pPedido: TPedido);
begin
  Create(pConexao);
  FDaoPedido.pedido := pPedido;

end;

function TPedidoController.delete(): Boolean;
begin
  try
    Result := false;
    FDaoPedido.delete();
    Result := true;
  except
    on E : exception do
       begin
         raise Exception.Create('Erro ao apagar registro');
       end
  end;
end;

constructor TPedidoController.Destroy;
begin
  FreeAndNil(FDaoPedido);
end;

function TPedidoController.getById(pIdPedido: Integer): TPedido;
begin
  try
    Result := FDaoPedido.getById(pIdPedido);
  except
    on E : exception do
       begin
         raise Exception.Create('Erro ao buscar registro');
       end
  end;
end;

function TPedidoController.save(): Boolean;
begin
  try
    Result := false;
    FDaoPedido.save();
    Result := true;
  except
    on E : exception do
       begin
         raise Exception.Create('Erro ao salvar registro');
       end
  end;
end;

end.
