unit uPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConectionData, uUtil;

type
  TfPadrao = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
    FConnectionData : TConectionData;
    FUtil : TUtil;
  end;

var
  fPadrao: TfPadrao;

implementation

{$R *.dfm}

end.
