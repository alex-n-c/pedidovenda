unit uDaoModel;

interface

  uses uConectionData, FireDAC.Comp.Client, FireDAC.DApt, uIDaoInterface;

  type
    TDaoModel = class(TInterfacedObject, IDaoInterface)
    private
    public
    FDConnection: TFDConnection;
    FDQuery : TFDQuery;
    function save(value : TObject) : Boolean;virtual;
    function delete(value : TObject) : Boolean;virtual;
    function getById(value: Integer): TObject;virtual;
    constructor Create(pConexao : TFDConnection); virtual;
    destructor Destroy; override;
    end;

implementation

uses
  System.SysUtils, Vcl.Dialogs;
{ TDaoModel }

constructor TDaoModel.Create(pConexao : TFDConnection);
begin
  try
    FDConnection := pConexao;
    FDQuery := TFDQuery.Create(nil);
    FDQuery.Connection := FDConnection;
  except
    raise Exception.Create('Erro ao inicializar DaoModel.');
  end;
end;

function TDaoModel.delete(value: TObject): Boolean;
begin

end;

destructor TDaoModel.Destroy;
begin
  FreeAndNil(FDQuery);
  inherited;
end;

function TDaoModel.save(value: TObject): Boolean;
begin

end;

function TDaoModel.getById(value : Integer) : TObject;
begin

end;

end.
