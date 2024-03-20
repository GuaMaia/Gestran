unit URelFort;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Data.DB, Datasnap.DBClient;

type
  TFRelFort = class(TForm)
    RelUnicoVend: TRLReport;
    RLBand2: TRLBand;
    RLLabel7: TRLLabel;
    RLSystemInfo4: TRLSystemInfo;
    RLSystemInfo5: TRLSystemInfo;
    RLSystemInfo6: TRLSystemInfo;
    lblunivend: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel4: TRLLabel;
    RLBand5: TRLBand;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText1: TRLDBText;
    RLBand1: TRLBand;
    RLLabel5: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel1: TRLLabel;
    RLDBText2: TRLDBText;
    lblTotalUni: TRLLabel;
    RelTodoVend: TRLReport;
    RLBand3: TRLBand;
    lblTitulo: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RLLabel14: TRLLabel;
    RLGroup1: TRLGroup;
    RLBand7: TRLBand;
    RLLabel8: TRLLabel;
    RLDBText7: TRLDBText;
    RLBand4: TRLBand;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel13: TRLLabel;
    RLDBText3: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLBand6: TRLBand;
    RLBand8: TRLBand;
    RLLabel15: TRLLabel;
    lblTotalVendComi: TRLLabel;
    RLLabel16: TRLLabel;
    cdsComissaoVendedor: TClientDataSet;
    cdsComissaoVendedorID_VENDEDOR: TIntegerField;
    cdsComissaoVendedorCOMISSAO: TFMTBCDField;
    RLLabel17: TRLLabel;
    lblperiododata: TRLLabel;
    procedure RLGroup1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FRelFort: TFRelFort;

implementation

{$R *.dfm}

uses URelVendas;

procedure TFRelFort.FormCreate(Sender: TObject);
begin
  cdsComissaoVendedor.CreateDataSet;
  cdsComissaoVendedor.Open;
end;

procedure TFRelFort.FormDestroy(Sender: TObject);
begin
  cdsComissaoVendedor.Close;
end;

procedure TFRelFort.RLGroup1BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  if cdsComissaoVendedor.Locate('ID_VENDEDOR',RLDBText7.DataSet.FieldByName('ID_VENDEDOR').AsInteger,[]) then
    RLLabel17.Caption := FormatFloat('###,##0.000', cdsComissaoVendedorCOMISSAO.AsCurrency) ;
end;

end.
