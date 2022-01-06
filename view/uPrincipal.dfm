object frmPrincipal: TfrmPrincipal
  Left = 244
  Top = 55
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Principal'
  ClientHeight = 532
  ClientWidth = 971
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 971
    Height = 532
    Align = alClient
    BevelOuter = bvNone
    Color = 15727347
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object Label2: TLabel
      Left = 13
      Top = 55
      Width = 59
      Height = 13
      Caption = 'C'#243'd. Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 78
      Top = 55
      Width = 63
      Height = 13
      Caption = 'Nome Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 13
      Top = 111
      Width = 38
      Height = 13
      Caption = 'Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 78
      Top = 111
      Width = 102
      Height = 13
      Caption = 'Descri'#231#227'o do Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 422
      Top = 111
      Width = 56
      Height = 13
      Caption = 'Quantidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 487
      Top = 111
      Width = 56
      Height = 13
      Caption = 'Vlr. Unit'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 971
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      Color = 4999638
      ParentBackground = False
      TabOrder = 0
      object Label1: TLabel
        Left = 13
        Top = 3
        Width = 190
        Height = 32
        Caption = 'Pedido de venda'
        Color = 16571819
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -24
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
    end
    object edtCliente: TEdit
      Left = 13
      Top = 69
      Width = 59
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = 'edtCliente'
      OnChange = edtClienteChange
      OnExit = edtClienteExit
      OnKeyPress = edtClienteKeyPress
    end
    object edtNomeCliente: TEdit
      Left = 78
      Top = 69
      Width = 338
      Height = 21
      TabStop = False
      Color = 15455671
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      Text = 'edtNomeCliente'
    end
    object Panel3: TPanel
      Left = 0
      Top = 41
      Width = 971
      Height = 8
      Align = alTop
      BevelOuter = bvNone
      Color = 10124112
      ParentBackground = False
      TabOrder = 8
    end
    object pnlCarregarPedido: TPanel
      Left = 833
      Top = 50
      Width = 137
      Height = 41
      BevelOuter = bvNone
      Color = 14408113
      ParentBackground = False
      TabOrder = 9
      object SpeedButton2: TSpeedButton
        Left = 0
        Top = 0
        Width = 137
        Height = 41
        Align = alClient
        Caption = 'Carregar Pedido'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = SpeedButton2Click
        ExplicitTop = -3
      end
    end
    object Panel6: TPanel
      Left = 0
      Top = 487
      Width = 971
      Height = 45
      Align = alBottom
      BevelOuter = bvNone
      Color = 15727347
      ParentBackground = False
      TabOrder = 10
      object pnlConfirmarPedido: TPanel
        Left = 821
        Top = 0
        Width = 150
        Height = 45
        Align = alRight
        BevelOuter = bvNone
        Color = 3383357
        Constraints.MaxWidth = 150
        ParentBackground = False
        TabOrder = 0
        object spBtnConfirmarPedido: TSpeedButton
          Left = 0
          Top = 0
          Width = 150
          Height = 45
          Align = alClient
          Caption = 'Confirmar Pedido'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = spBtnConfirmarPedidoClick
          ExplicitLeft = 6
        end
      end
      object pnlCancelarPedido: TPanel
        Left = 671
        Top = 0
        Width = 150
        Height = 45
        Align = alRight
        BevelOuter = bvNone
        Color = 3690972
        Constraints.MaxWidth = 150
        ParentBackground = False
        TabOrder = 1
        object spbtnCancelarPedido: TSpeedButton
          Left = 0
          Top = 0
          Width = 150
          Height = 45
          Align = alClient
          Caption = 'Cancelar Pedido'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = spbtnCancelarPedidoClick
          ExplicitLeft = -6
          ExplicitTop = -8
        end
      end
    end
    object DBGrid1: TDBGrid
      Left = 13
      Top = 152
      Width = 948
      Height = 321
      DataSource = dsItens
      ReadOnly = True
      TabOrder = 11
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnKeyDown = DBGrid1KeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'produto_id'
          Title.Caption = 'Cod. Produto'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Title.Caption = 'Descri'#231#227'o Produto'
          Width = 400
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'qtde'
          Title.Caption = 'Qtde'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vlrunitario'
          Title.Caption = 'Vlr. Unit.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vlrtotal'
          Title.Caption = 'Vlr. Total'
          Width = 80
          Visible = True
        end>
    end
    object edtIdProduto: TEdit
      Left = 13
      Top = 125
      Width = 59
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Text = 'edtIdProduto'
      OnExit = edtIdProdutoExit
      OnKeyPress = edtIdProdutoKeyPress
    end
    object edtDescricaoProduto: TEdit
      Left = 78
      Top = 125
      Width = 338
      Height = 21
      TabStop = False
      Color = 15455671
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Text = 'edtDescricaoProduto'
    end
    object edtQtde: TEdit
      Left = 422
      Top = 125
      Width = 59
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      Text = 'edtQtde'
      OnKeyPress = edtQtdeKeyPress
    end
    object edtValorUnitario: TEdit
      Left = 487
      Top = 125
      Width = 59
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      Text = 'edtValorUnitario'
      OnKeyPress = edtValorUnitarioKeyPress
    end
    object btnSalvar: TButton
      Left = 549
      Top = 121
      Width = 75
      Height = 25
      Caption = 'Salvar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnClick = btnSalvarClick
    end
    object DBEdit1: TDBEdit
      Left = 13
      Top = 476
      Width = 121
      Height = 24
      TabStop = False
      BiDiMode = bdRightToLeft
      Color = 15455671
      DataField = 'aTotal'
      DataSource = dsItens
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 12
    end
  end
  object dsItens: TDataSource
    DataSet = cdsItens
    OnStateChange = dsItensStateChange
    Left = 53
    Top = 192
  end
  object cdsItens: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    Left = 24
    Top = 192
    object cdsItensidprodutospedido: TIntegerField
      FieldName = 'idprodutospedido'
    end
    object cdsItenspedido_id: TIntegerField
      FieldName = 'pedido_id'
    end
    object cdsItensdescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object cdsItensproduto_id: TIntegerField
      FieldName = 'produto_id'
    end
    object cdsItensqtde: TFloatField
      FieldName = 'qtde'
      DisplayFormat = '0.##'
    end
    object cdsItensvlrunitario: TFloatField
      FieldName = 'vlrunitario'
      DisplayFormat = '###,###,##0.00##'
    end
    object cdsItensvlrtotal: TFloatField
      FieldName = 'vlrtotal'
      DisplayFormat = '###,###,##0.00##'
    end
    object cdsItensaTotal: TAggregateField
      FieldName = 'aTotal'
      Active = True
      DisplayName = ''
      DisplayFormat = '###,###,##0.00'
      Expression = 'SUM(vlrtotal)'
    end
  end
end
