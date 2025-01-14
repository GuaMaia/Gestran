object FRelVendas: TFRelVendas
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Vendas'
  ClientHeight = 159
  ClientWidth = 668
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  inline FFrame_Relatorio1: TFFrame_Relatorio
    Left = 0
    Top = 0
    Width = 668
    Height = 50
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 664
    inherited Panel1: TPanel
      Width = 668
      ExplicitWidth = 664
      inherited Panel2: TPanel
        ExplicitLeft = 0
        inherited btexportar: TSpeedButton
          OnClick = FFrame_Relatorio1btexportarClick
        end
      end
      inherited Panel4: TPanel
        Left = 611
        ExplicitLeft = 607
        inherited btSair: TSpeedButton
          OnClick = FFrame_Relatorio1btSairClick
        end
      end
    end
  end
  object pnlData: TPanel
    Left = 2
    Top = 113
    Width = 201
    Height = 38
    BevelOuter = bvNone
    TabOrder = 1
    object Label5: TLabel
      Left = 0
      Top = -3
      Width = 28
      Height = 15
      Cursor = crHandPoint
      Caption = 'DATA'
    end
    object Label1: TLabel
      Left = 83
      Top = 18
      Width = 19
      Height = 15
      Cursor = crHandPoint
      Caption = 'AT'#201
    end
    object edDataIni: TMaskEdit
      Left = 0
      Top = 13
      Width = 75
      Height = 23
      Cursor = crHandPoint
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
    end
    object edDataFim: TMaskEdit
      Left = 110
      Top = 13
      Width = 76
      Height = 23
      Cursor = crHandPoint
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
    end
  end
  object pnlvendedor: TPanel
    Left = 209
    Top = 111
    Width = 299
    Height = 49
    BevelOuter = bvNone
    TabOrder = 2
    object Label2: TLabel
      Left = 75
      Top = -1
      Width = 23
      Height = 15
      Cursor = crHandPoint
      Caption = 'M'#202'S'
    end
    object Label3: TLabel
      Left = 0
      Top = -1
      Width = 60
      Height = 15
      Cursor = crHandPoint
      Caption = 'VENDEDOR'
    end
    object EdMes: TMaskEdit
      Left = 75
      Top = 14
      Width = 53
      Height = 23
      EditMask = '99/9999;1;_'
      MaxLength = 7
      TabOrder = 0
      Text = '  /    '
    end
    object CbVendedor: TDBLookupComboBox
      Left = 0
      Top = 14
      Width = 60
      Height = 23
      Cursor = crHandPoint
      KeyField = 'ID_VENDEDOR'
      ListField = 'ID_VENDEDOR'
      ListSource = dsVendedor
      TabOrder = 1
    end
  end
  object RgRel: TRadioGroup
    Left = 2
    Top = 61
    Width = 615
    Height = 46
    Caption = 'Relat'#243'rio  por: '
    Columns = 3
    Items.Strings = (
      'U'#237'nico Vendedor'
      'Todos Vendedores'
      'Vendedor Sem Vendas no Per'#237'odo')
    TabOrder = 3
    OnClick = RgRelClick
  end
  object edTotalComissao: TDBEdit
    Left = 530
    Top = 150
    Width = 121
    Height = 23
    DataField = 'TotalComissao'
    DataSource = dsRelVendas
    Enabled = False
    TabOrder = 4
    Visible = False
  end
  object dsRelVendas: TDataSource
    DataSet = cdsRelVendas
    Left = 240
    Top = 16
  end
  object cdsRelVendas: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspRelVendas'
    Left = 208
    Top = 16
    object cdsRelVendasID: TIntegerField
      FieldName = 'ID'
    end
    object cdsRelVendasDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object cdsRelVendasID_VENDEDOR: TIntegerField
      FieldName = 'ID_VENDEDOR'
    end
    object cdsRelVendasVALOR_VENDA: TBCDField
      FieldName = 'VALOR_VENDA'
      DisplayFormat = '###,##0.000'
      EditFormat = '###,##0.000'
      Precision = 12
      Size = 3
    end
    object cdsRelVendasVALOR_DESCONTO: TBCDField
      FieldName = 'VALOR_DESCONTO'
      DisplayFormat = '###,##0.000'
      EditFormat = '###,##0.000'
      Precision = 12
      Size = 3
    end
    object cdsRelVendasVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = '###,##0.000'
      EditFormat = '###,##0.000'
      Precision = 12
      Size = 3
    end
    object cdsRelVendasComissao: TFMTBCDField
      FieldName = 'Comissao'
      ReadOnly = True
      DisplayFormat = '###,##0.000'
      EditFormat = '###,##0.000'
      Precision = 38
      Size = 4
    end
    object cdsRelVendasTotalComissao: TAggregateField
      FieldName = 'TotalComissao'
      Active = True
      currency = True
      DisplayName = ''
      DisplayFormat = '###,##0.000'
      Expression = 'sum(Comissao)'
    end
  end
  object dspRelVendas: TDataSetProvider
    DataSet = adoRelVendas
    Left = 176
    Top = 16
  end
  object adoRelVendas: TADOQuery
    Connection = dmConexao.Conexao
    CursorType = ctStatic
    DataSource = dsRelVendas
    Parameters = <>
    SQL.Strings = (
      'WITH VendasComComissao AS ('
      '    SELECT '
      '        ID_VENDEDOR,'
      '        SUM(VALOR_TOTAL) AS TOTAL_VENDAS,'
      
        '        ROW_NUMBER() OVER (ORDER BY SUM(VALOR_TOTAL - VALOR_DESC' +
        'ONTO) ASC) AS RankingMenorValor,'
      
        '        ROW_NUMBER() OVER (ORDER BY SUM(VALOR_TOTAL - VALOR_DESC' +
        'ONTO) DESC) AS RankingMaiorValor'
      '    FROM VENDA'
      '    GROUP BY ID_VENDEDOR'
      '),'
      'Comissao AS ('
      '    SELECT '
      '        ID_VENDEDOR,'
      '        CASE '
      '            WHEN RankingMenorValor = 1 THEN 0.05'
      '            WHEN RankingMenorValor = 2 THEN 0.1'
      '            ELSE 0'
      '        END AS TaxaComissaoMenorValor,'
      '        CASE '
      
        '            WHEN RankingMaiorValor = 1 THEN (0.1 * TOTAL_VENDAS)' +
        ' + (0.2 * (0.1 * TOTAL_VENDAS))'
      '            ELSE 0'
      '        END AS ValorComissaoMaiorValor'
      '    FROM VendasComComissao'
      ')'
      'SELECT '
      '    V.ID,'
      '    V.DATA,'
      '    V.ID_VENDEDOR,'
      '    V.VALOR_VENDA,'
      '    V.VALOR_DESCONTO,'
      '    V.VALOR_TOTAL,'
      '    CASE '
      
        '        WHEN C.TaxaComissaoMenorValor > 0 THEN V.VALOR_TOTAL * C' +
        '.TaxaComissaoMenorValor'
      
        '        WHEN C.ValorComissaoMaiorValor > 0 THEN C.ValorComissaoM' +
        'aiorValor'
      '        ELSE 0'
      '    END AS Comissao'
      'FROM VENDA V'
      'LEFT JOIN Comissao C ON V.ID_VENDEDOR = C.ID_VENDEDOR;')
    Left = 144
    Top = 16
  end
  object adoVendedor: TADOQuery
    Connection = dmConexao.Conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select distinct ID_VENDEDOR'
      'from VENDA')
    Left = 320
    Top = 16
  end
  object DpVendedor: TDataSetProvider
    DataSet = adoVendedor
    Left = 352
    Top = 16
  end
  object cdsVendedor: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    Params = <>
    ProviderName = 'DpVendedor'
    Left = 384
    Top = 16
    object cdsVendedorID_VENDEDOR: TIntegerField
      FieldName = 'ID_VENDEDOR'
    end
  end
  object dsVendedor: TDataSource
    DataSet = cdsVendedor
    Left = 416
    Top = 16
  end
  object cdsComissaoVendedor: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 480
    Top = 8
    object cdsComissaoVendedorID_VENDEDOR: TIntegerField
      FieldName = 'ID_VENDEDOR'
    end
    object cdsComissaoVendedorCOMISSAO: TFMTBCDField
      FieldName = 'COMISSAO'
    end
  end
  object dsComissaoVendedor: TDataSource
    DataSet = cdsComissaoVendedor
    Left = 520
    Top = 8
  end
end
