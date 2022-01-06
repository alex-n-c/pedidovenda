unit uPedido;

interface

uses uCliente, uItem, System.Generics.Collections;
  type
  TPedido = class
  private
    FIdPedido : Integer;
    FDtEmissao : TDateTime;
    FCliente : TCliente;
    FValorTotal : Real;
    FListaItem : TObjectList<TItem>;
    function getCliente: TCliente;
    function getDtEmissao: TDateTime;
    function getIdPedido: Integer;
    function getValorTotal: Real;
    procedure setCliente(const Value: TCliente);
    procedure setDtEmissao(const Value: TDateTime);
    procedure setIdPedido(const Value: Integer);
    procedure setValorTotal(const Value: Real);
  public
  property idPedido : Integer read getIdPedido write setIdPedido;
  property dtEmissao : TDateTime read getDtEmissao write setDtEmissao;
  property cliente : TCliente read getCliente write setCliente;
  property valorTotal : Real read getValorTotal write setValorTotal;
  constructor create();overload;
  constructor create(pIdPedido : Integer; pDtEmissao : TDateTime; pCliente : TCliente; pValorTotal : Real);overload;
  property itens : TObjectList<TItem> read FListaItem write FListaItem;
  destructor destroy();
  end;
implementation

uses
  System.SysUtils;

{ TPedido }

constructor TPedido.create(pIdPedido : Integer; pDtEmissao : TDateTime;
pCliente : TCliente; pValorTotal : Real);
begin
  create();

  FIdPedido   := pIdPedido;
  FDtEmissao  := pDtEmissao;
  FCliente    := pCliente;
  FValorTotal := pValorTotal;
end;

destructor TPedido.destroy;
begin
  FreeAndNil(FCliente);
  FreeAndNil(FListaItem);
end;

constructor TPedido.create;
begin
  inherited;
  FCliente := TCliente.create();
  FListaItem := TObjectList<TItem>.Create;
end;

function TPedido.getCliente: TCliente;
begin
  Result := FCliente;
end;

function TPedido.getDtEmissao: TDateTime;
begin
  Result := FDtEmissao;
end;

function TPedido.getIdPedido: Integer;
begin
  Result := FIdPedido;
end;

function TPedido.getValorTotal: Real;
begin
  Result := FValorTotal;
end;

procedure TPedido.setCliente(const Value: TCliente);
begin
  FCliente := Value;
end;

procedure TPedido.setDtEmissao(const Value: TDateTime);
begin
  FDtEmissao := Value;
end;

procedure TPedido.setIdPedido(const Value: Integer);
begin
  FIdPedido := Value;


end;

procedure TPedido.setValorTotal(const Value: Real);
begin
  FValorTotal := Value;
end;

end.
