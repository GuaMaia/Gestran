unit Uprinc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.CategoryButtons,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.Imaging.jpeg,
  Vcl.Buttons;

type
  TFprinc = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    imgMenu: TImage;
    Tmenu: TSplitView;
    CategoryButtons1: TCategoryButtons;
    ImageList1: TImageList;
    ActionList1: TActionList;
    Pnl_Formulario: TPanel;
    Logo: TImage;
    imUsu: TImage;
    lblNomeUsu: TLabel;
    lblData: TLabel;
    Timer1: TTimer;
    Relatorio: TAction;
    pgMenu: TPageControl;
    procedure FormCreate(Sender: TObject);
    procedure SairExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RelatorioExecute(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
   FormRel : Boolean;
   procedure AbreForm(Formulario: TComponentClass; PageControl: TPageControl = nil);
   procedure FechaForm(Formulario: TForm);
   procedure VerificasAbas;
  end;

var
  Fprinc: TFprinc;

implementation

{$R *.dfm}

uses URelVendas;


procedure TFprinc.AbreForm(Formulario: TComponentClass;
  PageControl: TPageControl);
  var TabSheet: TTabSheet;
   Form: TComponent;
begin
  pgMenu.Visible := True;
  // cria o formulário
  Form := Formulario.Create(Self);

  // muda o valor da variavel do form
  if Formulario = TFRelVendas  then
    FormRel := True;

  if PageControl <> nil then
  begin
    TForm(Form).BorderStyle := bsNone; // retira as bordas
    // cria a 'pagina'
    TabSheet := TTabSheet.Create(Self);
    TabSheet.Caption := TForm(Form).Caption;
    TabSheet.PageControl := pgMenu;

    // Definir o foco na página recém-criada
    pgMenu.TabIndex := pgMenu.PageCount - 1;

    // exibe o formulário
    TForm(Form).Align := alClient;
    TForm(Form).Parent := TabSheet;
    TForm(Form).Show;
  end;

end;

procedure TFprinc.FechaForm(Formulario: TForm);
var
  Parente: TWinControl;
begin
  Parente := Formulario.Parent;
  FreeAndNil(Formulario);

  if (Parente <> nil) and (Parente is TTabSheet) then
    FreeAndNil(Parente);
end;

procedure TFprinc.FormCreate(Sender: TObject);
begin
  Tmenu.Close;
  FormRel := False;
end;

procedure TFprinc.FormShow(Sender: TObject);
begin
  Tmenu.Open;
  pgMenu.Visible := False;
end;

procedure TFprinc.RelatorioExecute(Sender: TObject);
begin
  if Tmenu.Opened then
  begin
    // abre o formulário dentro da pagecontrol
    if FormRel = False then
      AbreForm(TFRelVendas, pgMenu);
  end;
end;

procedure TFprinc.SairExecute(Sender: TObject);
begin
  if Tmenu.Opened then
    Close;
end;

procedure TFprinc.Timer1Timer(Sender: TObject);
begin
  lblData.Caption := FormatDateTime('dd/mm/yyyy hh:nn:ss', Now);
end;

procedure TFprinc.VerificasAbas;
begin
  if FormRel  = False then
    pgMenu.Visible := False;

end;

end.
