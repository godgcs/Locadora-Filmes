unit Unit_CadastroCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.ExtCtrls, Unit_Biblioteca;

type
  TFrm_CadastroCliente = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    Label14: TLabel;
    C_Nome: TEdit;
    C_CPF: TMaskEdit;
    C_Codigo: TEdit;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    Label9: TLabel;
    C_Cidade: TEdit;
    C_Bairro: TEdit;
    GroupBox3: TGroupBox;
    Panel2: TPanel;
    Bt_Ok: TBitBtn;
    Bt_Cancelar: TBitBtn;
    Label_Cadastro: TLabel;
    Label13: TLabel;
    C_Sexo: TComboBox;
    Label6: TLabel;
    Label18: TLabel;
    C_Tel: TMaskEdit;
    C_Email: TEdit;
    Label3: TLabel;
    C_EstadoCivil: TEdit;
    Label5: TLabel;
    C_DataNascimento: TMaskEdit;
    Label7: TLabel;
    C_Lagradouro: TEdit;
    Label10: TLabel;
    C_Num: TEdit;
    procedure Bt_CancelarClick(Sender: TObject);
    procedure Bt_OkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_CadastroCliente: TFrm_CadastroCliente;


implementation

{$R *.dfm}

procedure TFrm_CadastroCliente.Bt_CancelarClick(Sender: TObject);
begin
    If Application.MessageBox('Deseja Realmente Cancelar?','Sair',MB_ICONQUESTION+MB_YESNO) = 6
      Then Close;
end;

procedure TFrm_CadastroCliente.Bt_OkClick(Sender: TObject);
var cod:Clientes;
    ind:integer;
begin
    Cod.Codigo:=StrToInt(C_Codigo.Text);
    Cod.Nome:=C_nome.Text;
    Cod.CPF:=C_CPF.Text;
    Cod.Sexo:=C_Sexo.Text;
    Cod.EstCivil:=C_EstadoCivil.Text;
    Cod.DataNascimento:=C_DataNascimento.Text;
    Cod.Cidade:=C_Cidade.Text;
    Cod.Bairro:=C_Bairro.Text;
    Cod.Lagradouro:=C_Lagradouro.Text;
    Cod.Num:=C_Num.Text;
    Cod.Telefone:=C_Tel.Text;
    Cod.Email:=C_Email.Text;
    Cod.Ativo:=True;
    if Editar_Cadastro
      Then Begin
               If(Application.MessageBox('Deseja confirmar a edição do Cliente?','Aviso',36)=6)
                  Then Begin
                           CadastraCliente(Cod,V_Cliente);
                           ShowMessage('Edição de Cliente realizado com Sucesso');
                           //
                           Close;
                       End;
           End
      Else Begin
               If(Application.MessageBox('Deseja confirmar o cadastro do Cliente?','Aviso',36)=6)
                  Then Begin
                           ind:=VerificaCliente(C_CPF.text);
                           If ind<0
                             Then Begin
                                      CadastraCliente(Cod,V_Cliente);
                                      inc(Qtd_Cliente_Ativo);
                                      ShowMessage('Cadastro de Cliente realizado com Sucesso');
                                      //
                                      Close;
                                  End
                             Else Begin
                                      If not(V_Cliente[ind].Ativo)
                                        Then Begin
                                                  If (Application.MessageBox('Cliente já cadastrado e está desativado.' +#13+ 'Deseja reativalo?','Cliente já cadastrado',36)=6)
                                                    Then Begin
                                                             V_Cliente[ind].Ativo:=True;
                                                             inc(Qtd_Cliente_Ativo);
                                                             Close;
                                                         End
                                                    Else Begin
                                                             ShowMessage('Cliente já está cadastrado');
                                                             C_CPF.Clear;
                                                             C_CPF.SetFocus;
                                                         End;
                                             End
                                        Else Begin
                                                 ShowMessage('Cliente já está cadastrado');
                                                 C_Nome.Clear;
                                                 C_Nome.SetFocus;
                                             End;
                                  End;
                       End;
           End;
      //FinalizaVetores;
end;

procedure TFrm_CadastroCliente.FormCreate(Sender: TObject);
var cod:Clientes;
begin
    If Editar_Cadastro
      Then Begin
               Label_Cadastro.Caption:= 'Editar Cliente';
               Cod:=RetornaClienteEditar(ind);

               C_Codigo.text:=IntToStr(cod.Codigo);
               C_Nome.text:=cod.Nome;
               C_CPF.text:=cod.CPF;
               C_Sexo.ItemIndex:=C_Sexo.Items.IndexOf(cod.Sexo);
               C_EstadoCivil.text:=cod.EstCivil;
               C_DataNascimento.text:=cod.DataNascimento;
               C_Cidade.text:=cod.Cidade;
               C_Bairro.text:=cod.Bairro;
               C_Lagradouro.text:=cod.Lagradouro;
               C_Num.text:=cod.Num;
               C_Tel.text:=cod.Telefone;
               C_Email.text:=cod.Email;
           End
      Else Begin
               Label_Cadastro.Caption:= 'Cadastro de Cliente';
               C_Codigo.Text:=IntToStr(Length(V_Cliente)+1);
           End;
end;

end.
