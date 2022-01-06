unit uItem;

interface

uses uProduto, System.SysUtils;

type
  TItem = class
  private
    FIdProdutosPedido : Integer;
    FPedido_id : Integer;
    FProduto : TProduto;
    FQtde : Real;
    FVlrUnitario : Real;
    FVlrTotal : Real;
    function getIdProdutoPedido: Integer;
    function getPedidoId: Integer;
    function getProduto: TProduto;
    function getQtde: Real;
    function getVlrTotal: Real;
    function getVlrUnitario: Real;
    procedure setIdProdutoPedido(const Value: Integer);
    procedure setPedidoId(const Value: Integer);
    procedure setProduto(const Value: TProduto);
    procedure setQtde(const Value: Real);
    procedure setVlrUnitario(const Value: Real);
  public
  property idProdutosPedido : Integer read getIdProdutoPedido write setIdProdutoPedido;
  property pedidoId : Integer read getPedidoId write setPedidoId;
  property produto : TProduto read getProduto write setProduto;
  property qtde : Real read getQtde write setQtde;
  property vlrUnitario : Real read getVlrUnitario write setVlrUnitario;
  property vlrTotal : Real read getVlrTotal;
  constructor create();overload;
  constructor create(pIdProdutosPedido, pPedidoId: Integer; pProduto: TProduto; pQtde, pVlrUnitario, pValorTotal: Real);overload;
  destructor destroy();
  end;

implementation

{ TItem }

constructor TItem.create(pIdProdutosPedido, pPedidoId: Integer; pProduto: TProduto; pQtde, pVlrUnitario, pValorTotal: Real);
begin
  FIdProdutosPedido := pIdProdutosPedido;
  FPedido_id        := pPedidoId;
  FProduto          := pProduto;
  FQtde             := pQtde;
  FVlrUnitario      := pVlrUnitario;
  FVlrTotal         := pValorTotal;
end;

destructor TItem.destroy;
begin

  inherited;
end;

constructor TItem.create;
begin
  inherited;
end;

function TItem.getIdProdutoPedido: Integer;
begin
  result := FIdProdutosPedido;
end;

function TItem.getPedidoId: Integer;
begin
  result := FPedido_id;
end;

function TItem.getProduto: TProduto;
begin
  result := FProduto;
end;

function TItem.getQtde: Real;
begin
  result := FQtde;
end;

function TItem.getVlrTotal: Real;
begin
  FVlrTotal := FQtde * FVlrUnitario;
  result := FVlrTotal
end;

function TItem.getVlrUnitario: Real;
begin
  result := FVlrUnitario;
end;

procedure TItem.setIdProdutoPedido(const Value: Integer);
begin
  FIdProdutosPedido := Value;
end;

procedure TItem.setPedidoId(const Value: Integer);
begin
  FPedido_id := Value;
end;

procedure TItem.setProduto(const Value: TProduto);
begin
  FProduto := Value;
end;

procedure TItem.setQtde(const Value: Real);
begin
  FQtde := Value;
end;

procedure TItem.setVlrUnitario(const Value: Real);
begin
  FVlrUnitario := Value;
end;

end.
