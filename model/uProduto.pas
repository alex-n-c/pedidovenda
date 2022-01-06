unit uProduto;

interface
type
  TProduto = class
  private
    FIdProduto : Integer;
    FDescricao : String;
    FPrecoVenda : Real;
    function getDescricao: String;
    function getIdProduto: Integer;
    function getPrecoVenda: Real;
    procedure setDescricao(const Value: String);
    procedure setIdProduto(const Value: Integer);
    procedure setPrecoVenda(const Value: Real);
  public
    property idProduto : Integer read getIdProduto write setIdProduto;
    property descricao : String read getDescricao write setDescricao;
    property precoVenda : Real read getPrecoVenda write setPrecoVenda;
    constructor create(pIdProduto : Integer; pDescricao : String; pPrecoVenda : Real); overload;
  end;


implementation

{ TProduto }

constructor TProduto.create(pIdProduto: Integer; pDescricao: String;
  pPrecoVenda: Real);
begin
  FIdProduto := pIdProduto;
  FDescricao := pDescricao;
  FPrecoVenda:= pPrecoVenda;
end;

function TProduto.getDescricao: String;
begin
  Result := FDescricao;
end;

function TProduto.getIdProduto: Integer;
begin
  Result := FIdProduto;
end;

function TProduto.getPrecoVenda: Real;
begin
  Result := FPrecoVenda;
end;

procedure TProduto.setDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TProduto.setIdProduto(const Value: Integer);
begin
  FIdProduto := Value;
end;

procedure TProduto.setPrecoVenda(const Value: Real);
begin
  FPrecoVenda := Value;
end;

end.
