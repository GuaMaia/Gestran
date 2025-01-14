object FRelFort: TFRelFort
  Left = 0
  Top = 0
  Caption = 'FRelFort'
  ClientHeight = 518
  ClientWidth = 860
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object RelUnicoVend: TRLReport
    Left = -6
    Top = 8
    Width = 794
    Height = 1123
    DataSource = FRelVendas.dsRelVendas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand2: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 83
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      Borders.FixedLeft = True
      Borders.FixedTop = True
      Borders.FixedRight = True
      Borders.FixedBottom = True
      object RLLabel7: TRLLabel
        Left = 235
        Top = 47
        Width = 250
        Height = 16
        Alignment = taCenter
        Caption = 'Relat'#243'rio de Vendas - '#218'nico Vendedor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLSystemInfo4: TRLSystemInfo
        Left = 466
        Top = 34
        Width = 247
        Height = 13
        Alignment = taRightJustify
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Info = itPagePreview
        ParentFont = False
        Text = 'P'#225'gina: # / #'
      end
      object RLSystemInfo5: TRLSystemInfo
        Left = 641
        Top = 19
        Width = 72
        Height = 13
        Alignment = taRightJustify
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Info = itHour
        ParentFont = False
        Text = 'Hora: '
      end
      object RLSystemInfo6: TRLSystemInfo
        Left = 642
        Top = 4
        Width = 71
        Height = 14
        Alignment = taRightJustify
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Text = 'Data: '
      end
      object lblunivend: TRLLabel
        Left = 4
        Top = 49
        Width = 126
        Height = 13
        AutoSize = False
        Caption = 'N'#176' do vendedor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel12: TRLLabel
        Left = 159
        Top = 68
        Width = 126
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'valor da Venda'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel2: TRLLabel
        Left = 291
        Top = 69
        Width = 126
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Valor do Desconto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 72
        Top = 68
        Width = 81
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Data'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel3: TRLLabel
        Left = 426
        Top = 68
        Width = 126
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Valor Total'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel1: TRLLabel
        Left = 562
        Top = 68
        Width = 126
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Valor da Comiss'#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand5: TRLBand
      Left = 38
      Top = 121
      Width = 718
      Height = 20
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = False
      Borders.DrawRight = True
      Borders.DrawBottom = True
      Borders.FixedLeft = True
      Borders.FixedRight = True
      Borders.FixedBottom = True
      object RLDBText4: TRLDBText
        Left = 159
        Top = 2
        Width = 126
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'VALOR_VENDA'
        DataSource = FRelVendas.dsRelVendas
        Text = ''
      end
      object RLDBText5: TRLDBText
        Left = 290
        Top = 2
        Width = 126
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'VALOR_DESCONTO'
        DataSource = FRelVendas.dsRelVendas
        Text = ''
      end
      object RLDBText6: TRLDBText
        Left = 426
        Top = 2
        Width = 126
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'VALOR_TOTAL'
        DataSource = FRelVendas.dsRelVendas
        Text = ''
      end
      object RLDBText1: TRLDBText
        Left = 72
        Top = 2
        Width = 81
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataField = 'DATA'
        DataSource = FRelVendas.dsRelVendas
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 562
        Top = 2
        Width = 126
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'Comissao'
        DataSource = FRelVendas.dsRelVendas
        Text = ''
      end
    end
    object RLBand1: TRLBand
      Left = 38
      Top = 141
      Width = 718
      Height = 28
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = False
      Borders.DrawRight = True
      Borders.DrawBottom = True
      Borders.FixedLeft = True
      Borders.FixedRight = True
      Borders.FixedBottom = True
      object RLLabel5: TRLLabel
        Left = 400
        Top = 7
        Width = 126
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Total de Comiss'#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblTotalUni: TRLLabel
        Left = 532
        Top = 6
        Width = 156
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Total de Comiss'#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object RelTodoVend: TRLReport
    Left = 8
    Top = 199
    Width = 794
    Height = 1123
    DataSource = FRelVendas.dsRelVendas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand3: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 83
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      Borders.FixedLeft = True
      Borders.FixedTop = True
      Borders.FixedRight = True
      Borders.FixedBottom = True
      object lblTitulo: TRLLabel
        Left = 225
        Top = 47
        Width = 270
        Height = 16
        Alignment = taCenter
        Caption = 'Relat'#243'rio de Vendas - Todos Vendedores'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 466
        Top = 34
        Width = 247
        Height = 13
        Alignment = taRightJustify
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Info = itPagePreview
        ParentFont = False
        Text = 'P'#225'gina: # / #'
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 641
        Top = 19
        Width = 72
        Height = 13
        Alignment = taRightJustify
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Info = itHour
        ParentFont = False
        Text = 'Hora: '
      end
      object RLSystemInfo3: TRLSystemInfo
        Left = 642
        Top = 4
        Width = 71
        Height = 14
        Alignment = taRightJustify
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Text = 'Data: '
      end
      object RLLabel14: TRLLabel
        Left = 97
        Top = 66
        Width = 81
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Data'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel9: TRLLabel
        Left = 182
        Top = 68
        Width = 126
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'valor da Venda'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel10: TRLLabel
        Left = 316
        Top = 68
        Width = 126
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Valor do Desconto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel11: TRLLabel
        Left = 449
        Top = 68
        Width = 126
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Valor Total'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel13: TRLLabel
        Left = 585
        Top = 68
        Width = 126
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Valor da Comiss'#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblperiododata: TRLLabel
        Left = 8
        Top = 34
        Width = 249
        Height = 13
        AutoSize = False
        Caption = 'Periodo data'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLGroup1: TRLGroup
      Left = 38
      Top = 121
      Width = 718
      Height = 80
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = False
      Borders.DrawRight = True
      Borders.DrawBottom = False
      Borders.FixedLeft = True
      Borders.FixedRight = True
      DataFields = 'ID_VENDEDOR'
      Transparent = False
      BeforePrint = RLGroup1BeforePrint
      object RLBand7: TRLBand
        Left = 1
        Top = 0
        Width = 716
        Height = 25
        BandType = btColumnHeader
        Color = clMedGray
        ParentColor = False
        Transparent = False
        object RLLabel8: TRLLabel
          Left = 6
          Top = 3
          Width = 105
          Height = 20
          AutoSize = False
          Caption = 'VENDEDOR 0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLDBText7: TRLDBText
          Left = 108
          Top = 3
          Width = 126
          Height = 19
          AutoSize = False
          DataField = 'ID_VENDEDOR'
          DataSource = FRelVendas.dsRelVendas
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
          Transparent = False
        end
      end
      object RLBand4: TRLBand
        Left = 1
        Top = 25
        Width = 716
        Height = 20
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = False
        Borders.DrawRight = True
        Borders.DrawBottom = True
        Borders.FixedLeft = True
        Borders.FixedRight = True
        Borders.FixedBottom = True
        object RLDBText3: TRLDBText
          Left = 97
          Top = 3
          Width = 81
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'DATA'
          DataSource = FRelVendas.dsRelVendas
          Text = ''
        end
        object RLDBText8: TRLDBText
          Left = 182
          Top = 3
          Width = 126
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VALOR_VENDA'
          DataSource = FRelVendas.dsRelVendas
          Text = ''
        end
        object RLDBText9: TRLDBText
          Left = 316
          Top = 3
          Width = 126
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VALOR_DESCONTO'
          DataSource = FRelVendas.dsRelVendas
          Text = ''
        end
        object RLDBText10: TRLDBText
          Left = 449
          Top = 3
          Width = 126
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VALOR_TOTAL'
          DataSource = FRelVendas.dsRelVendas
          Text = ''
        end
        object RLDBText11: TRLDBText
          Left = 585
          Top = 3
          Width = 126
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'Comissao'
          DataSource = FRelVendas.dsRelVendas
          Text = ''
        end
      end
      object RLBand6: TRLBand
        Left = 1
        Top = 45
        Width = 716
        Height = 30
        BandType = btSummary
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = False
        Borders.DrawRight = True
        Borders.DrawBottom = True
        Borders.FixedLeft = True
        Borders.FixedRight = True
        Borders.FixedBottom = True
        object RLLabel16: TRLLabel
          Left = 378
          Top = 8
          Width = 188
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Total de Comiss'#227'o por Vendedor'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel17: TRLLabel
          Left = 576
          Top = 8
          Width = 135
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Total de Comiss'#227'o'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object RLBand8: TRLBand
      Left = 38
      Top = 201
      Width = 718
      Height = 28
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = False
      Borders.DrawRight = True
      Borders.DrawBottom = True
      Borders.FixedLeft = True
      Borders.FixedRight = True
      Borders.FixedBottom = True
      object RLLabel15: TRLLabel
        Left = 421
        Top = 7
        Width = 126
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Total de Comiss'#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblTotalVendComi: TRLLabel
        Left = 555
        Top = 6
        Width = 156
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Total de Comiss'#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
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
      DisplayFormat = '###,##0.000'
      EditFormat = '###,##0.000'
    end
  end
end
