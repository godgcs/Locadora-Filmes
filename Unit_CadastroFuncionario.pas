unit Unit_CadastroFuncionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.ExtCtrls, Unit_Biblioteca;

type
  TFrm_CadastroFuncionario = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label14: TLabel;
    C_Nome: TEdit;
    C_Codigo: TEdit;
    Label_Cadastro: TLabel;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    Label9: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    C_Cidade: TEdit;
    C_Bairro: TEdit;
    C_Lagradouro: TEdit;
    C_Num: TEdit;
    Label6: TLabel;
    Label18: TLabel;
    C_Tel: TMaskEdit;
    C_Email: TEdit;
    Panel2: TPanel;
    Bt_Ok: TBitBtn;
    Bt_Cancelar: TBitBtn;
    GroupBox3: TGroupBox;
    C_Senha: TEdit;
    Label3: TLabel;
    C_Login: TEdit;
    Label2: TLabel;
    C_ConfirmarSenha: TEdit;
    Label4: TLabel;
    procedure Bt_CancelarClick(Sender: TObject);
    procedure Bt_OkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_CadastroFuncionario: TFrm_CadastroFuncionario;

implementation

{$R *.dfm}

procedure TFrm_CadastroFuncionario.Bt_CancelarClick(Sender: TObject);
begin
    if Application.MessageBox('Deseja Realmente Cancelar o Cadastro?','Cancelar Cadastro',MB_ICONQUESTION+MB_YESNO)=6
      Then Close;
end;

procedure TFrm_CadastroFuncionario.Bt_OkClick(Sender: TObject);
var cod:Funcionarios;
begin
    //Verificar login vazio implementar
    if C_Senha.Text=C_ConfirmarSenha.Text
      Then Begin
              Cod.Codigo:=StrToInt(C_Codigo.Text);
              Cod.Nome:=C_nome.Text;
              Cod.Telefone:=C_Tel.Text;
              Cod.Email:=C_Email.Text;
              Cod.Cidade:=C_Cidade.Text;
              Cod.Bairro:=C_Bairro.Text;
              Cod.Lagradouro:=C_Lagradouro.Text;
              Cod.Num:=C_Num.Text;
              Cod.Login:=C_Login.Text;
              Cod.Senha:=C_Senha.Text;
              Cod.Ativo:=True;

              if Editar_Cadastro
                Then Begin
                         If(Application.MessageBox('Deseja confirmar a edição do Funcionario?','Aviso',36)=6)
                            Then Begin
                                     CadastraFuncionario(Cod,V_Funcionario);
                                     ShowMessage('Edição de Funcionario realizada com Sucesso');
                                     //
                                     Close;
                                 End;
                     End
                Else Begin
                         If(Application.MessageBox('Deseja confirmar o cadastro do Funcionario?','Aviso',36)=6)
                            Then Begin
                                     CadastraFuncionario(Cod,V_Funcionario);
                                     inc(Qtd_Funcionarios_Ativo);
                                     ShowMessage('Cadastro de Funcionario realizado com Sucesso');
                                     //
                                     Close;
                                 End;
                     End;
           End
      Else Begin
               ShowMessage('As senhas não coincidem, tente novamente');
               C_Senha.Clear;
               C_ConfirmarSenha.Clear;
               C_Senha.SetFocus;
           End;

end;


procedure TFrm_CadastroFuncionario.FormCreate(Sender: TObject);
var cod:Funcionarios;
begin
    If Editar_Cadastro
      Then Begin
               Label_Cadastro.Caption:= 'Editar Funcionario';
               Cod:=RetornaVendedorEditar(ind);

               C_Codigo.text:=IntToStr(cod.Codigo);
               C_Nome.text:=cod.Nome;
               C_Tel.text:=cod.Telefone;
               C_Email.text:=cod.Email;
               C_Cidade.text:=cod.Cidade;
               C_Bairro.text:=cod.Bairro;
               C_Lagradouro.text:=cod.Lagradouro;
               C_Num.text:=cod.Num;
               C_Login.Text:=cod.Login;
               C_Senha.Text:=cod.Senha;
               C_ConfirmarSenha.Text:=cod.Senha;
               Cod.Ativo:=True;
           End
      Else Begin
               Label_Cadastro.Caption:= 'Cadastro de Funcionario';
               C_Codigo.Text:=IntToStr(Length(V_Funcionario)+1);
           End;
end;


end.
