unit uIDaoInterface;

interface
  type
  IDaoInterface = interface
  ['{FBC0316D-9782-4B66-AA1E-4FCDA167187D}']
  function save(value : TOBject) : Boolean;
  function delete(value : TOBject) : Boolean;
  function getById(value : Integer) : TOBject;
  end;

implementation

end.
