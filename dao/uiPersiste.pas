unit uiPersiste;

interface

uses FireDAC.Comp.Client;

type
  IPersiste = Interface
    ['{1AFEA816-26C2-40EC-B601-FBBA978B27EE}']
    function save : Boolean;
    function delete : Boolean;
    function getById(value : Integer) : TObject;
    function getListAll() : TFDQuery;
  end;

implementation

end.
