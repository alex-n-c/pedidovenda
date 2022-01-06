unit uUtil;

interface

uses
  System.SysUtils;
type
  TUtil = class abstract
  private
  public
    function SoNumeros(pKey, pTipoNumero: Char): Char;
  end;

implementation

function TUtil.SoNumeros(pKey: Char; pTipoNumero : Char) : Char;
begin
  if UpperCase(pTipoNumero) = 'I' then
     begin
       if not (pKey in ['0'..'9',#8,#13] ) Then
          Result := #0
       else Result := pKey;
     end
  else if UpperCase(pTipoNumero) = 'F' then
     begin
       if not (pKey in ['0'..'9',#8,#13,#44,#46,#45] ) then
          Result := #0
       else
          begin
            if pkey = #46 then
               pkey := #44;
            Result := pKey;
          end;
     end;
end;

end.
