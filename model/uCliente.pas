unit uCliente;

interface

uses
  System.SysUtils;

type
  TCliente = Class
    private
      FIdCliente : Integer;
      FNome : String;
      FCidade: String;
      FUf : String;
      function getCidade: string;
      function getIdCliente: integer;
      function getNome: string;
      function getUf: string;
      procedure setCidade(const Value: string);
      procedure setIdCliente(const Value: integer);
      procedure setNome(const Value: string);
      procedure setUf(const Value: string);
    public

      property idCliente : integer read getIdCliente write setIdCliente;
      property nome : string read getNome write setNome;
      property cidade : string read getCidade write setCidade;
      property uf : string read getUf write setUf;
      constructor create(pIdCliente: Integer; pNome, pCidade, pUf : String); overload;
  end;

implementation

{ TCliente }

constructor TCliente.create(pIdCliente: Integer; pNome, pCidade, pUf: String);
begin
  FIdCliente := pIdCliente;
  FNome      := pNome;
  FCidade    := pCidade;
  FUf        := pUf;
end;

function TCliente.getCidade: string;
begin
  result := FCidade;
end;

function TCliente.getIdCliente: integer;
begin
  result := FIdCliente;
end;

function TCliente.getNome: string;
begin
  result := FNome;
end;

function TCliente.getUf: string;
begin
  result := FUf;
end;

procedure TCliente.setCidade(const Value: string);
begin
  FCidade := Value;
end;

procedure TCliente.setIdCliente(const Value: integer);
begin
  FIdCliente := Value;
end;

procedure TCliente.setNome(const Value: string);
begin
  FNome := Value;
end;

procedure TCliente.setUf(const Value: string);
begin
  if (Length(Value) <> 2) then
     raise EArgumentException.Create('UF tem que possuir 2 caracteres!');

  FUf := Value;
end;

end.
