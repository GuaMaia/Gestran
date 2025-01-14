unit URelVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFrame_Relatorio, Data.DB,
  Data.Win.ADODB, Datasnap.Provider, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls,System.StrUtils,ShlObj;

type
  TFRelVendas = class(TForm)
    dsRelVendas: TDataSource;
    cdsRelVendas: TClientDataSet;
    cdsRelVendasID: TIntegerField;
    cdsRelVendasDATA: TDateTimeField;
    cdsRelVendasID_VENDEDOR: TIntegerField;
    cdsRelVendasVALOR_VENDA: TBCDField;
    cdsRelVendasVALOR_DESCONTO: TBCDField;
    cdsRelVendasVALOR_TOTAL: TBCDField;
    cdsRelVendasComissao: TFMTBCDField;
    dspRelVendas: TDataSetProvider;
    adoRelVendas: TADOQuery;
    FFrame_Relatorio1: TFFrame_Relatorio;
    pnlData: TPanel;
    Label5: TLabel;
    Label1: TLabel;
    edDataIni: TMaskEdit;
    edDataFim: TMaskEdit;
    pnlvendedor: TPanel;
    EdMes: TMaskEdit;
    Label2: TLabel;
    adoVendedor: TADOQuery;
    DpVendedor: TDataSetProvider;
    cdsVendedor: TClientDataSet;
    dsVendedor: TDataSource;
    Label3: TLabel;
    CbVendedor: TDBLookupComboBox;
    RgRel: TRadioGroup;
    cdsRelVendasTotalComissao: TAggregateField;
    edTotalComissao: TDBEdit;
    cdsComissaoVendedor: TClientDataSet;
    dsComissaoVendedor: TDataSource;
    cdsComissaoVendedorID_VENDEDOR: TIntegerField;
    cdsComissaoVendedorCOMISSAO: TFMTBCDField;
    cdsVendedorID_VENDEDOR: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure FFrame_Relatorio1btSairClick(Sender: TObject);
    procedure RgRelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FFrame_Relatorio1btexportarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AjustaFiltro(iTipo : Integer );
    function ValidaCampos : Boolean;
    procedure GerarRelatorioPDF;
  end;

var
  FRelVendas: TFRelVendas;

implementation

{$R *.dfm}

uses UConexao, Uprinc, URelFort;

procedure TFRelVendas.AjustaFiltro(iTipo: Integer);
begin
  pnlvendedor.Visible := False;
  pnlData.Visible := False;

  //Un�co vendedor
  if iTipo = 0  then
    pnlvendedor.Visible := True
  else
  if iTipo >= 1 then
    pnlData.Visible := True;

end;

procedure TFRelVendas.FFrame_Relatorio1btexportarClick(Sender: TObject);
var
  DownloadsFolderPath: string;
  Path: array [0..MAX_PATH] of Char;
begin
  if ValidaCampos = False then
    Abort;

  // prepara o consulta
 with adoRelVendas do
  begin
    close;
    sql.Clear;
    sql.Add('WITH VendasComComissao AS ( ');
    sql.Add(' SELECT  ');
    sql.Add(' ID_VENDEDOR,SUM(VALOR_TOTAL) AS TOTAL_VENDAS, ');
    sql.Add(' ROW_NUMBER() OVER (ORDER BY SUM(VALOR_TOTAL - VALOR_DESCONTO) ASC) AS RankingMenorValor, ');
    sql.Add(' ROW_NUMBER() OVER (ORDER BY SUM(VALOR_TOTAL - VALOR_DESCONTO) DESC) AS RankingMaiorValor ');
    sql.Add(' FROM VENDA ');
    sql.Add(' GROUP BY ID_VENDEDOR), ');
    sql.Add(' Comissao AS ( ');
    sql.Add(' SELECT ID_VENDEDOR, ');
    sql.Add(' CASE ');
    sql.Add('  WHEN RankingMenorValor = 1 THEN 0.05 ');
    sql.Add('  WHEN RankingMenorValor = 2 THEN 0.1 ');
    sql.Add('   ELSE 0 ');
    sql.Add(' END AS TaxaComissaoMenorValor, ');
    sql.Add('  CASE ');
    sql.Add(' WHEN RankingMaiorValor = 1 THEN (0.1 * TOTAL_VENDAS) + (0.2 * (0.1 * TOTAL_VENDAS)) ');
    sql.Add('  ELSE 0 ');
    sql.Add(' END AS ValorComissaoMaiorValor ');
    sql.Add(' FROM VendasComComissao) ');
    sql.Add(' SELECT V.ID,V.DATA,V.ID_VENDEDOR, ');
    sql.Add(' V.VALOR_VENDA,V.VALOR_DESCONTO,V.VALOR_TOTAL, ');
    sql.Add(' CASE ');
    sql.Add(' WHEN C.TaxaComissaoMenorValor > 0 THEN V.VALOR_TOTAL * C.TaxaComissaoMenorValor ');
    sql.Add(' WHEN C.ValorComissaoMaiorValor > 0 THEN C.ValorComissaoMaiorValor ');
    sql.Add(' ELSE 0 ');
    sql.Add(' END AS Comissao ');
    sql.Add(' FROM VENDA V ');
    sql.Add(' LEFT JOIN Comissao C ON V.ID_VENDEDOR = C.ID_VENDEDOR ');
    sql.Add(' where 1=1 ' );


    if RgRel.ItemIndex = 0 then
    begin
      sql.Add(' and V.ID_VENDEDOR =  ' + CbVendedor.Text );
      sql.Add(' and  MONTH(V.DATA) =  ' + Copy(EdMes.Text,1,2) );
      sql.Add(' AND YEAR(V.DATA) =  ' + Copy(EdMes.Text,4,4) );

     SQL.Add(' ORDER BY V.DATA');
    end
    else
    if RgRel.ItemIndex >= 1 then
    begin
      if RgRel.ItemIndex = 1 then
        SQL.Add(' AND V.DATA BETWEEN :DataInicial AND :DataFinal')
      else
        SQL.Add(' AND V.DATA NOT BETWEEN :DataInicial AND :DataFinal');

      Parameters.ParamByName('DataInicial').Value := StrToDate(edDataIni.Text);
      Parameters.ParamByName('DataFinal').Value := StrToDate(edDataFim.Text);

      SQL.Add(' ORDER BY V.ID_VENDEDOR, V.DATA');
    end;

    Open;
  end;

  cdsRelVendas.Close;
  cdsRelVendas.Open;

  cdsComissaoVendedor.EmptyDataSet;

  if cdsRelVendas.RecordCount = 0 then
  begin
    Application.MessageBox('N�o h� dados a imprimir !','Aten��o',MB_ICONEXCLAMATION);
    Abort;
  end
  else
  begin
     SHGetFolderPath(0, CSIDL_MYDOCUMENTS, 0, SHGFP_TYPE_CURRENT, @Path[0]);
     DownloadsFolderPath := IncludeTrailingPathDelimiter(Path) + 'Desktop';

    if RgRel.ItemIndex = 0 then
    begin
      try
         Application.CreateForm(TFRelFort,FRelFort);
         FRelFort.lblTotalUni.Caption := edTotalComissao.Text; // MOSTAR A SOMA DA COMISS�O
         FRelFort.lblunivend.Caption  := 'VENDEDOR 0' + CbVendedor.Text; // DEMONSTRA O VENDEDOR
         FRelFort.RelUnicoVend.SaveToFile(DownloadsFolderPath);
         FRelFort.RelUnicoVend.Print;


     finally
          FreeAndNil(FRelFort);
     end;
    end
    else
    if RgRel.ItemIndex >= 1 then
    begin
     ///faz a soma da comissao , pois o campo comiss�o nao � campo de tabela
      cdsRelVendas.First;

      while cdsRelVendas.Eof = False do
      begin
        if not cdsComissaoVendedor.Locate('ID_VENDEDOR',cdsRelVendasID_VENDEDOR.AsInteger,[]) then
        begin
          cdsComissaoVendedor.Insert;
          cdsComissaoVendedorID_VENDEDOR.AsInteger := cdsRelVendasID_VENDEDOR.AsInteger;
          cdsComissaoVendedorCOMISSAO.AsCurrency   := cdsRelVendasComissao.AsCurrency;
          cdsComissaoVendedor.Post;
        end
        else
        begin
          cdsComissaoVendedor.Edit;
          cdsComissaoVendedorCOMISSAO.AsCurrency   := cdsComissaoVendedorCOMISSAO.AsCurrency + cdsRelVendasComissao.AsCurrency;
          cdsComissaoVendedor.Post;
        end;


        cdsRelVendas.Next;
      end;


      try
         Application.CreateForm(TFRelFort,FRelFort);
         FRelFort.lblTotalVendComi.Caption := edTotalComissao.Text; // MOSTAR A SOMA DA COMISS�O


         if RgRel.ItemIndex = 1 then
         begin
            FRelFort.lblperiododata.Caption := edDataIni.Text + ' AT� ' + edDataFim.Text;
            FRelFort.lblTitulo.Caption := 'Relat�rio de Vendas - Todos Vendedores';
         end
         else
         begin
            FRelFort.lblperiododata.Caption := '';
            FRelFort.lblTitulo.Caption := 'Relat�rio de Vendas - Vendedor Sem Vendas no Per�odo';
         end;

         FRelFort.cdsComissaoVendedor.Data := cdsComissaoVendedor.Data;
         FRelFort.RelTodoVend.SaveToFile(DownloadsFolderPath );
         FRelFort.RelTodoVend.Print;

     finally
          FreeAndNil(FRelFort);
     end;

    end;

  end;
end;

procedure TFRelVendas.FFrame_Relatorio1btSairClick(Sender: TObject);
begin
  Fprinc.FechaForm(Self);
  Fprinc.FormRel := False;
  Fprinc.VerificasAbas;
  Close;
end;

procedure TFRelVendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  cdsRelVendas.Close;
  cdsVendedor.Close;
  cdsComissaoVendedor.Close;
end;

procedure TFRelVendas.FormShow(Sender: TObject);
begin
  FFrame_Relatorio1.pnlNome.Caption := 'Relat�rio de Vendas';
  RgRel.ItemIndex := 0;
  AjustaFiltro(RgRel.ItemIndex);
  pnlvendedor.Left := pnlData.Left;

  // client ira mostrar os vendedor no combox "vendedor"
  cdsVendedor.Open;

  // Client ira soma a comiss�o , pois o campo � calculado
  cdsComissaoVendedor.CreateDataSet;
  cdsComissaoVendedor.Open;
end;

procedure TFRelVendas.GerarRelatorioPDF;
begin
  //
end;

procedure TFRelVendas.RgRelClick(Sender: TObject);
begin
  AjustaFiltro(RgRel.ItemIndex);
end;

function TFRelVendas.ValidaCampos: Boolean;
var iMes : Integer;
begin
  Result := True;

  if RgRel.ItemIndex = 0  then
  begin
    if CbVendedor.Text = '' then
    begin
      Application.MessageBox('Preenchimento obrigat�rio !','Aten��o',MB_ICONEXCLAMATION);
      CbVendedor.SetFocus;
      Result := False;
      Abort;
    end;

    if (EdMes.Text = '  /    ') then
    begin
      Application.MessageBox('Preenchimento obrigat�rio !','Aten��o',MB_ICONEXCLAMATION);
      EdMes.SetFocus;
      Result := False;
      Abort;
    end;

    if Length(Trim(AnsiReplaceStr(EdMes.Text,'/','' ))) <> 6 then
    begin
      Application.MessageBox('M�s inv�lido!','Aten��o',MB_ICONEXCLAMATION);
      EdMes.SetFocus;
      Result := False;
      Abort;
    end;

    iMes := StrToInt( Copy(EdMes.Text,1,2));

    if (iMes < 1) then
    begin
      Application.MessageBox('M�s inv�lido!','Aten��o',MB_ICONEXCLAMATION);
      EdMes.SetFocus;
      Result := False;
      Abort;
    end;

    if  (iMes > 12) then
    begin
      Application.MessageBox('M�s inv�lido!','Aten��o',MB_ICONEXCLAMATION);
      EdMes.SetFocus;
      Result := False;
      Abort;
    end;

  end
  else
  if RgRel.ItemIndex = 1  then
  begin
    if (edDataIni.Text = '  /  /    ') then
    begin
      Application.MessageBox('Preenchimento obrigat�rio !','Aten��o',MB_ICONEXCLAMATION);
      edDataIni.SetFocus;
      Result := False;
      Abort;
    end;

    if Length(Trim(AnsiReplaceStr(edDataIni.Text,'/','' ))) <> 8 then
    begin
      Application.MessageBox('Data inv�lida!','Aten��o',MB_ICONEXCLAMATION);
      edDataIni.SetFocus;
      Result := False;
      Abort;
    end;

    try
      StrToDate(edDataIni.Text);
    except
      on E: Exception do
      begin
        Application.MessageBox('Data inv�lida !','Aten��o',MB_ICONEXCLAMATION);
        edDataIni.SetFocus;
        Result := False;
        Abort;
      end;
    end;

    if (edDataFim.Text = '  /  /    ') then
    begin
      Application.MessageBox('Preenchimento obrigat�rio !','Aten��o',MB_ICONEXCLAMATION);
      edDataFim.SetFocus;
      Result := False;
      Abort;
    end;

    if Length(Trim(AnsiReplaceStr(edDataFim.Text,'/','' ))) <> 8 then
    begin
      Application.MessageBox('Data inv�lida!','Aten��o',MB_ICONEXCLAMATION);
      edDataFim.SetFocus;
      Result := False;
      Abort;
    end;

    try
      StrToDate(edDataFim.Text);
    except
      on E: Exception do
      begin
        Application.MessageBox('Data inv�lida !','Aten��o',MB_ICONEXCLAMATION);
        edDataFim.SetFocus;
        Result := False;
        Abort;
      end;
    end;

    if StrToDate(edDataIni.Text) > StrToDate(edDataFim.Text) then
    begin
      Application.MessageBox('Data Final � maior que a data Inicial !','Aten��o',MB_ICONEXCLAMATION);
      edDataFim.SetFocus;
      Result := False;
      Abort;
    end;
  end;
end;

end.
