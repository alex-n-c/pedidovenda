unit uDMConnection;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Comp.Client,
  Data.DB, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef;

type
  TDMConnection = class(TDataModule)
    FDConnection: TFDConnection;
    FDTransaction: TFDTransaction;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMConnection: TDMConnection;

implementation
{$R *.dfm}

{ TDMConnection }

end.
