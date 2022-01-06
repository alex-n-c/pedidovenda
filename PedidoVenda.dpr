program PedidoVenda;

uses
  Vcl.Forms,
  uPrincipal in 'view\uPrincipal.pas' {frmPrincipal},
  uCliente in 'model\uCliente.pas',
  uClienteController in 'controller\uClienteController.pas',
  uDaoCliente in 'dao\uDaoCliente.pas',
  uConectionData in 'connectionData\uConectionData.pas',
  uDaoModel in 'dao\uDaoModel.pas',
  uPadrao in 'view\model\uPadrao.pas' {fPadrao},
  uIDaoInterface in 'dao\uIDaoInterface.pas',
  uUtil in 'util\uUtil.pas',
  uItem in 'model\uItem.pas',
  uPedido in 'model\uPedido.pas',
  uDaoItem in 'dao\uDaoItem.pas',
  uDaoPedido in 'dao\uDaoPedido.pas',
  uPedidoController in 'controller\uPedidoController.pas',
  uProduto in 'model\uProduto.pas',
  uDaoProduto in 'dao\uDaoProduto.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfPadrao, fPadrao);
  Application.Run;
end.
