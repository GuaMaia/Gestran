program Candidato_GustavoMaia;

uses
  Vcl.Forms,
  UConexao in 'UConexao.pas' {dmConexao: TDataModule},
  URelVendas in 'URelVendas.pas' {FRelVendas},
  UFrame_Relatorio in '..\Frame\UFrame_Relatorio.pas' {FFrame_Relatorio: TFrame},
  Uprinc in 'Uprinc.pas' {Fprinc},
  URelFort in 'URelFort.pas' {FRelFort};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TFprinc, Fprinc);
  Application.Run;
end.
