unit Unit_CadastroFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.ExtCtrls, Unit_Biblioteca;

type
  TFrm_CadastroFornecedor = class(TForm)
    Panel1: TPanel;
    Label_Cadastro: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    C_Nome: TEdit;
    C_RazaoSocial: TEdit;
    C_CNPJ: TMaskEdit;
    C_TelEmpresa: TMaskEdit;
    C_EmailEmpresa: TEdit;
    C_InscricaoEstadual: TMaskEdit;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    C_Cidade: TEdit;
    C_Bairro: TEdit;
    C_Num: TEdit;
    C_Lagradouro: TEdit;
    Panel2: TPanel;
    Bt_Ok: TBitBtn;
    Bt_Cancelar: TBitBtn;
    Label2: TLabel;
    C_Codigo: TEdit;
    procedure Bt_CancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Bt_OkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_CadastroFornecedor: TFrm_CadastroFornecedor;

implementation

{$R *.dfm}

procedure TFrm_CadastroFornecedor.Bt_CancelarClick(Sender: TObject);
begin
    If Application.MessageBox('Deseja Realmente Cancelar?','Sair',MB_ICONQUESTION+MB_YESNO) = 6
      Then Close;
end;

procedure TFrm_CadastroFornecedor.Bt_OkClick(Sender: TObject);
var cod:Fornecedores;
begin
    cod.Codigo:=StrToInt(C_Codigo.text);
    cod.Nome:=C_Nome.Text;
    cod.RazSocial:=C_RazaoSocial.Text;
    cod.InscEstadual:=C_InscricaoEstadual.Text;
    cod.CNPJ:=C_CNPJ.Text;
    cod.TelEmpresa:=C_TelEmpresa.Text;
    cod.Email:=C_EmailEmpresa.Text;
    cod.Cidade:=C_Cidade.Text;
    cod.Bairro:=C_Bairro.Text;
    cod.Lagradouro:=C_Lagradouro.Text;
    cod.Num:=C_Num.Text;
    cod.Ativo:=True;
    if Editar_Cadastro
      Then Begin
               If(Application.MessageBox('Deseja Confirmar a edição do Fornecedor?','Confirmar Edição',36)=6)
                  Then Begin
                           CadastraFornecedor(Cod,V_Fornecedor);
                           ShowMessage('Edição de Fornecedor Realizado com Sucesso');
                           //
                           Close;
                       End;
           End
      Else Begin
               If(Application.MessageBox('Deseja Confirmar o Cadastro do Fornecedor?','Confirmar Cadastro',36)=6)
                  Then Begin
                           ind:=VerificaFornecedor(C_CNPJ.text);
                           If ind<0
                             Then Begin
                                      CadastraFornecedor(Cod,V_Fornecedor);
                                      inc(Qtd_Fornecedor_Ativo);
                                      ShowMessage('Cadastro de Fornecedor Realizado com Sucesso');
                                      //
                                      Close;
                                  End
                             Else Begin
                                      If not(V_Fornecedor[ind].Ativo)
                                        Then Begin
                                                  If (Application.MessageBox('Fornecedor já cadastrado e está desativado.' +#13+ 'Deseja reativa-lo?','Fornecedor já Cadastrado',36)=6)
                                                    Then Begin
                                                             V_Fornecedor[ind].Ativo:=True;
                                                             inc(Qtd_Fornecedor_Ativo);
                                                             Close;
                                                         End
                                                    Else Begin
                                                             ShowMessage('Fornecedor já está Cadastrado');
                                                             C_Nome.Clear;
                                                             C_Nome.SetFocus;
                                                         End;
                                             End
                                        Else Begin
                                                 ShowMessage('Fornecedor já está Cadastrado');
                                                 C_Nome.Clear;
                                                 C_Nome.SetFocus;
                                             End;
                                  End;
                  End;
      End;
end;

procedure TFrm_CadastroFornecedor.FormCreate(Sender: TObject);
var cod:Fornecedores;
begin
    If Editar_Cadastro
      Then Begin
               Label_Cadastro.Caption:= 'Editar Fornecedor';
               Cod:=RetornaFornecedorEditar(ind);

               C_Codigo.text:=IntToStr(cod.Codigo);
               C_Nome.text:=cod.Nome;
               C_RazaoSocial.Text:=cod.RazSocial;
               C_InscricaoEstadual.text:=cod.InscEstadual;
               C_CNPJ.text:=cod.CNPJ;
               C_TelEmpresa.text:=cod.TelEmpresa;
               C_EmailEmpresa.text:=cod.Email;
               C_Cidade.text:=cod.Cidade;
               C_Bairro.Text:=cod.Bairro;
               C_Lagradouro.Text:=cod.Lagradouro;
               C_Num.Text:=cod.Num;
               Cod.Ativo:=True;
           End
      Else Begin
               Label_Cadastro.Caption:= 'Cadastro de Fornecedor';
               C_Codigo.Text:=IntToStr(Length(V_Fornecedor)+1);
           End;
end;

end.
