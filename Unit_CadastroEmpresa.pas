unit Unit_CadastroEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.ExtCtrls, Unit_Biblioteca;

type
  TFrm_CadastroEmpresa = class(TForm)
    Panel1: TPanel;
    Label10: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    C_NomeEmpresa: TEdit;
    C_RazaoSocial: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    C_CNPJ: TMaskEdit;
    Label6: TLabel;
    C_TelEmpresa: TMaskEdit;
    C_EmailEmpresa: TEdit;
    Label7: TLabel;
    GroupBox3: TGroupBox;
    Panel2: TPanel;
    Bt_Ok: TBitBtn;
    Label11: TLabel;
    C_NomeGerente: TEdit;
    Label8: TLabel;
    C_TelGerente: TMaskEdit;
    GroupBox2: TGroupBox;
    C_InscricaoEstadual: TMaskEdit;
    Label5: TLabel;
    Label9: TLabel;
    C_Cidade: TEdit;
    C_Bairro: TEdit;
    Label12: TLabel;
    C_Num: TEdit;
    Label14: TLabel;
    C_Lagradouro: TEdit;
    Label13: TLabel;
    C_Senha: TEdit;
    Bt_GerenteImportacao: TBitBtn;
    procedure Bt_CancelarClick(Sender: TObject);
    procedure Bt_OkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Bt_GerenteImportacaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_CadastroEmpresa: TFrm_CadastroEmpresa;

implementation

{$R *.dfm}

uses Unit_ImportacaoExportacao;

procedure TFrm_CadastroEmpresa.Bt_CancelarClick(Sender: TObject);
begin
    Close;
end;

procedure TFrm_CadastroEmpresa.Bt_GerenteImportacaoClick(Sender: TObject);
begin
    Application.CreateForm(TFrm_ImportacaoExportacao,Frm_ImportacaoExportacao);
    Frm_ImportacaoExportacao.ShowModal;

    if Empresa_Cadastrada
      Then Close;
end;

procedure TFrm_CadastroEmpresa.Bt_OkClick(Sender: TObject);
var cod:Empresas;
begin
    Empresa_Cadastrada:=True;
    cod.NomeEmpresa:=C_NomeEmpresa.Text;
    cod.RazSocial:=C_RazaoSocial.Text;
    cod.InscEstadual:=C_InscricaoEstadual.Text;
    cod.CNPJ:=C_CNPJ.Text;
    cod.TelEmpresa:=C_TelEmpresa.Text;
    cod.Email:=C_EmailEmpresa.Text;
    cod.Cidade:=C_Cidade.Text;
    cod.Bairro:=C_Bairro.Text;
    cod.Lagradouro:=C_Lagradouro.Text;
    cod.Num:=C_Num.Text;
    cod.NomeGerente:=C_NomeGerente.Text;
    cod.TelGerente:=C_TelGerente.Text;
    cod.Senha:=C_Senha.Text;
    CadastraEmpresa(cod);
    ShowMessage('Empresa Cadastrada com Sucesso');
    Close;
end;

procedure TFrm_CadastroEmpresa.FormCreate(Sender: TObject);
begin
    if Empresa_Cadastrada
      Then Begin
               C_NomeEmpresa.Text:=V_Empresa.NomeEmpresa;
               C_RazaoSocial.Text:=V_Empresa.RazSocial;
               C_InscricaoEstadual.Text:=V_Empresa.InscEstadual;
               C_CNPJ.Text:=V_Empresa.CNPJ;
               C_TelEmpresa.Text:=V_Empresa.TelEmpresa;
               C_EmailEmpresa.Text:=V_Empresa.Email;
               C_Cidade.Text:=V_Empresa.Cidade;
               C_Bairro.Text:=V_Empresa.Bairro;
               C_Lagradouro.Text:=V_Empresa.Lagradouro;
               C_Num.Text:=V_Empresa.Num;
               C_NomeGerente.Text:=V_Empresa.NomeGerente;
               C_TelGerente.Text:=V_Empresa.TelGerente;
               C_Senha.Text:=V_Empresa.Senha;
           End;

end;

end.
