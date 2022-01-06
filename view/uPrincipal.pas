unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.ToolWin, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, System.IniFiles,
  uCliente, uConectionData, uPadrao, midaslib, uClienteController, Vcl.Mask,
  Vcl.DBCtrls, uPedido, uPedidoController, uItem, uProduto, uDaoProduto,
  System.SysUtils, Vcl.Dialogs, uDaoItem;

type
  TfrmPrincipal = class(TfPadrao)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edtCliente: TEdit;
    edtNomeCliente: TEdit;
    Label3: TLabel;
    Panel3: TPanel;
    pnlCarregarPedido: TPanel;
    SpeedButton2: TSpeedButton;
    Panel6: TPanel;
    pnlConfirmarPedido: TPanel;
    spBtnConfirmarPedido: TSpeedButton;
    pnlCancelarPedido: TPanel;
    spbtnCancelarPedido: TSpeedButton;
    DBGrid1: TDBGrid;
    dsItens: TDataSource;
    cdsItens: TClientDataSet;
    cdsItensidprodutospedido: TIntegerField;
    cdsItenspedido_id: TIntegerField;
    cdsItensproduto_id: TIntegerField;
    cdsItensqtde: TFloatField;
    cdsItensvlrunitario: TFloatField;
    cdsItensvlrtotal: TFloatField;
    cdsItensdescricao: TStringField;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtIdProduto: TEdit;
    edtDescricaoProduto: TEdit;
    edtQtde: TEdit;
    edtValorUnitario: TEdit;
    btnSalvar: TButton;
    cdsItensaTotal: TAggregateField;
    DBEdit1: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtClienteExit(Sender: TObject);
    procedure edtClienteKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorUnitKeyPress(Sender: TObject; var Key: Char);
    procedure spBtnConfirmarPedidoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtIdProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure edtQtdeKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorUnitarioKeyPress(Sender: TObject; var Key: Char);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtIdProdutoExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure spbtnCancelarPedidoClick(Sender: TObject);
    procedure edtClienteChange(Sender: TObject);
    procedure dsItensStateChange(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FPedido : TPedido;
    procedure carregarConfiguracaoInicial;
    procedure novo;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}


procedure TfrmPrincipal.edtClienteChange(Sender: TObject);
begin
  inherited;
  pnlCancelarPedido.Visible  := (Length(edtCliente.text) <= 0);
  pnlCarregarPedido.Visible  := (Length(edtCliente.text) <= 0);
end;

procedure TfrmPrincipal.edtClienteExit(Sender: TObject);
var
  oControllerCliente : TClienteController;
  oCliente : TCliente;
begin
  inherited;

  try
    oControllerCliente := TClienteController.Create(FConnectionData.getConection);
    oCliente   := TCliente.create;

    if (StrToIntDef(edtCliente.Text,0) <= 0) then
       Exit;

    oCliente := oControllerCliente.getById(StrToIntDef(edtCliente.Text,0));
    edtNomeCliente.Text := oCliente.nome;

  finally
    FreeAndNil(oControllerCliente);
  end;
end;

procedure TfrmPrincipal.edtClienteKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  key := FUtil.SoNumeros(key, 'I');
end;

procedure TfrmPrincipal.edtIdProdutoExit(Sender: TObject);
var
  vDaoProduto : TDaoProduto;
  vProduto : TProduto;
begin
  inherited;

  try
    vDaoProduto := TDaoProduto.Create(FConnectionData.getConection);
    TProduto.Create;
    vProduto    := vDaoProduto.getById(StrToIntDef(edtIdProduto.Text, 0));
    if (vProduto.idProduto <= 0) then
       Exit;

    edtDescricaoProduto.Text     := vProduto.descricao;
    edtValorUnitario.Text := FormatFloat('###,###,##0.00', vProduto.precoVenda);

  finally
    FreeAndNil(vDaoProduto);
    FreeAndNil(vProduto);
  end;

end;

procedure TfrmPrincipal.edtIdProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  key := FUtil.SoNumeros(key, 'I');
end;

procedure TfrmPrincipal.edtQtdeKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  key := FUtil.SoNumeros(key, 'F');
end;

procedure TfrmPrincipal.edtValorUnitarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  key := FUtil.SoNumeros(key, 'F');
end;

procedure TfrmPrincipal.edtValorUnitKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  key := FUtil.SoNumeros(key, 'F');
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
  inherited;
  if (not cdsItens.Active) or (cdsItens.Active and (cdsItens.RecordCount <= 0)) then
     novo();
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FPedido := TPedido.Create;
  carregarConfiguracaoInicial();
  edtIdProduto.Clear;
  edtDescricaoProduto.Clear;
  edtQtde.Clear;
  edtValorUnitario.Clear;
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FPedido);
end;

procedure TfrmPrincipal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (key = #13) then
     begin
       SelectNext(ActiveControl as TWinControl,True,True);
       key := #0;
     end;
end;

procedure TfrmPrincipal.btnSalvarClick(Sender: TObject);
begin
  inherited;
  ActiveControl := nil;

  if (trim(edtDescricaoProduto.Text) = '') then
     begin
       ShowMessage('Informe um produto antes de salvar.');
       edtIdProduto.SetFocus;
       Exit;
     end;

  if (StrToFloatDef(edtQtde.Text,0) <= 0) then
     begin
       ShowMessage('Informe a qtde antes de salvar.');
       edtQtde.SetFocus;
       Exit;
     end;

  if (StrToFloatDef(edtValorUnitario.Text,0) <= 0) then
     begin
       ShowMessage('Informe o valor antes de salvar.');
       edtValorUnitario.SetFocus;
       Exit;
     end;

  if (cdsItens.State <> dsEdit) then
     cdsItens.Append;

  if (dsItens.State = dsInsert) and (FPedido.idPedido > 0) then
     begin
       cdsItenspedido_id.AsInteger := FPedido.idPedido;
     end;

  cdsItensproduto_id.AsInteger:= StrToInt(edtIdProduto.Text);
  cdsItensdescricao.AsString  := edtDescricaoProduto.Text;
  cdsItensqtde.AsFloat        := StrToFloatDef(edtQtde.Text, 0);
  cdsItensvlrunitario.AsFloat := StrToFloatDef(edtValorUnitario.Text, 0);
  cdsItensvlrtotal.AsFloat    := cdsItensqtde.AsFloat * cdsItensvlrunitario.AsFloat;
  cdsItens.Post;

  edtIdProduto.Clear;
  edtDescricaoProduto.Clear;
  edtQtde.Clear;
  edtValorUnitario.Clear;

  edtIdProduto.SetFocus;

end;

procedure TfrmPrincipal.carregarConfiguracaoInicial();
var  dirArquivoINI, dirAplicacao,
     servidor, driverName, userName, password, porta, dataBaseName : string;
     localServer : Integer;
     arqConfiguracoes : TIniFile;
begin
  {CONFIGURAÇÕES PADRÃO}
  driverName   := 'MySQL';
  servidor     := '127.0.0.1';
  dataBaseName := 'pedidovenda';

  porta        := '3306';
  userName     := 'root';
  password     := '123456';

  dirAplicacao  := ExtractFilePath(Application.ExeName);
  dirArquivoINI := dirAplicacao + 'Configuracao.ini';

  arqConfiguracoes := TIniFile.Create(dirArquivoINI);

  Try
    if arqConfiguracoes.ValueExists('ConexaoBanco', 'Servidor') then
       servidor := arqConfiguracoes.ReadString('ConexaoBanco', 'Servidor', servidor)
    else
       arqConfiguracoes.WriteString('ConexaoBanco','Servidor', servidor);

    if arqConfiguracoes.ValueExists('ConexaoBanco', 'Porta') then
       porta := arqConfiguracoes.ReadString('ConexaoBanco', 'Porta', porta)
    else
       arqConfiguracoes.WriteString('ConexaoBanco','Porta', porta);
  Finally
    arqConfiguracoes.Free;
  end;

  FConnectionData := TConectionData.Create(driverName,
                                        dirAplicacao+'Lib\libmysql.dll',
                                        servidor,
                                        userName,
                                        password,
                                        dataBaseName,
                                        porta);
end;

procedure TfrmPrincipal.DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  daoItem : TDaoItem;
  vItem : TItem;
begin
  inherited;
  if (not cdsItens.Active) or (cdsItens.RecordCount <= 0) then
     Exit;
  if (Key = VK_RETURN) then
     begin
       cdsItens.Edit;
       edtIdProduto.Text        := cdsItensproduto_id.AsString;
       edtDescricaoProduto.Text := cdsItensdescricao.AsString;
       edtQtde.Text             := FloatToStr(cdsItensqtde.AsFloat);
       edtValorUnitario.Text    := FloatToStr(cdsItensvlrunitario.AsFloat);
     end
  else if (Key = VK_DELETE) then
     begin
       if (Application.MessageBox('Deseja excluir o item do pedido?','CANCELAR PEDIDO', mb_YesNo+mb_IconInformation+mb_DefButton2) = 5) then
          Exit;

       if (FPedido.idPedido <= 0) then
          begin
            cdsItens.Delete;
            Exit;
          end;

       try
         daoItem := TDaoItem.Create(FConnectionData.getConection);
         vItem := TItem.create();
         vItem := daoItem.getById(cdsItenspedido_id.AsInteger, cdsItensidprodutospedido.AsInteger);
         daoItem.delete(vItem);
         cdsItens.Delete;
       finally
         FreeAndNil(daoItem);
         FreeAndNil(vItem);
       end;

     end;

end;

procedure TfrmPrincipal.dsItensStateChange(Sender: TObject);
begin
  inherited;
  edtIdProduto.Enabled := dsItens.State <> dsEdit;
end;

procedure TfrmPrincipal.novo();
begin
  FPedido.Free;
  FPedido := TPedido.create();

  edtCliente.Clear;
  edtNomeCliente.Clear;

  cdsItens.Close;
  cdsItens.CreateDataSet;
  cdsItens.EmptyDataSet;
  cdsItens.Open;

end;

procedure TfrmPrincipal.spbtnCancelarPedidoClick(Sender: TObject);
var
  vControllerPedido : TPedidoController;
  vPedido : TPedido;
  vCodPedido : String;
begin
  inherited;
  try
    vControllerPedido := TPedidoController.Create(FConnectionData.getConection);
    vPedido := TPedido.create;

    InputQuery('Pedido','Informe o código do pedido', vCodPedido);
    if (StrToIntDef(vCodPedido,0) <= 0) then
       begin
         ShowMessage('Informe um pedido válido.');
         Exit;
       end;

    vPedido := vControllerPedido.getById(StrToIntDef(vCodPedido,0));

    if (vPedido.idPedido <= 0) then
       begin
         ShowMessage('Não foi possível localizar o pedido informado.');
         Exit;
       end;

    if (Application.MessageBox('Deseja cancelar o pedido?','CANCELAR PEDIDO', mb_YesNo+mb_IconInformation+mb_DefButton2) = 5) then
       Exit;

    if (vControllerPedido.delete) then
       begin
         novo();
         ShowMessage('Pedido cancelado.');
       end;
  finally
    FreeAndNil(vControllerPedido);
    FreeAndNil(vPedido);
  end;
end;

procedure TfrmPrincipal.spBtnConfirmarPedidoClick(Sender: TObject);
var
  vControllerPedido : TPedidoController;
  vDaoProduto : TDaoProduto;
begin
  inherited;
  try
    ActiveControl := nil;

    cdsItens.DisableControls;
    vDaoProduto := TDaoProduto.Create(FConnectionData.getConection);

    if (trim(edtNomeCliente.Text) = '') then
       begin
         ShowMessage('Informe o cliente');
         edtCliente.SetFocus;
         exit;
       end;

    if (FPedido.cliente.idCliente <= 0) then
       begin
         FPedido.dtEmissao := Date;
         FPedido.cliente   := TClienteController.Create(FConnectionData.getConection).getById(StrToIntDef(edtCliente.Text, 0));
       end;

    FPedido.valorTotal := VarType(cdsItensaTotal.AsVariant).ToDouble;

    cdsItens.First;
    FPedido.itens.Clear;
    while not cdsItens.Eof do
       begin
         FPedido.itens.Add(TItem.create(cdsItensidprodutospedido.AsInteger,
                                        cdsItenspedido_id.AsInteger,
                                        vDaoProduto.getById(cdsItensproduto_id.AsInteger),
                                        cdsItensqtde.AsFloat,
                                        cdsItensvlrunitario.AsFloat,
                                        cdsItensvlrunitario.AsFloat * cdsItensqtde.AsFloat));
         cdsItens.Next;
       end;

    vControllerPedido := TPedidoController.Create(FConnectionData.getConection(), FPedido);

    if (vControllerPedido.save) then
       begin
         novo;
         ShowMessage('Pedido inserido com sucesso.');
       end;
  finally
    cdsItens.EnableControls;
    FreeAndNil(vControllerPedido);
  end;

end;

procedure TfrmPrincipal.SpeedButton2Click(Sender: TObject);
var
  vControllerPedido : TPedidoController;
  vItem : TItem;
  vCodPedido : String;
begin
  inherited;
  try
    novo();
    vControllerPedido := TPedidoController.Create(FConnectionData.getConection());

    InputQuery('Pedido','Informe o código do pedido', vCodPedido);
    if (StrToIntDef(vCodPedido,0) <= 0) then
       begin
         ShowMessage('Informe um pedido válido.');
         Exit;
       end;

    FPedido := vControllerPedido.getById(StrToIntDef(vCodPedido,0));

    if (FPedido.idPedido <= 0) then
       begin
         novo();
         ShowMessage('Não foi possível localizar o pedido informado.');
         Exit;
       end;

    edtCliente.Text     := FPedido.cliente.idCliente.ToString;
    edtClienteExit(nil);

    for vItem in FPedido.itens do
       begin
         cdsItens.Append;
         cdsItensidprodutospedido.AsInteger := vItem.idProdutosPedido;
         cdsItenspedido_id.AsInteger        := vItem.pedidoId;
         cdsItensproduto_id.AsInteger       := vItem.produto.idProduto;
         cdsItensdescricao.AsString         := vItem.produto.descricao;
         cdsItensqtde.AsFloat               := vItem.qtde;
         cdsItensvlrunitario.AsFloat        := vItem.vlrUnitario;
         cdsItensvlrtotal.AsFloat           := vItem.vlrTotal;
         cdsItens.Post;
       end;

  finally
    FreeAndNil(vControllerPedido);
  end;

end;

end.
