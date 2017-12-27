unit Unit_CadastroFilme;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Unit_Biblioteca;

type
  TFrm_CadastroFilme = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label14: TLabel;
    C_Codigo: TEdit;
    Panel2: TPanel;
    Bt_Ok: TBitBtn;
    Bt_Cancelar: TBitBtn;
    Label_Cadastro: TLabel;
    Label1: TLabel;
    C_Descricao: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    C_Audio: TComboBox;
    C_Quantidade: TEdit;
    C_CodigoCategoria: TComboBox;
    Label6: TLabel;
    C_TipoFilme: TComboBox;
    procedure Bt_CancelarClick(Sender: TObject);
    procedure Bt_OkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure C_QuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure C_QuantidadeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_CadastroFilme: TFrm_CadastroFilme;

implementation

{$R *.dfm}

procedure TFrm_CadastroFilme.Bt_CancelarClick(Sender: TObject);
begin
    If Application.MessageBox('Deseja Realmente Cancelar?','Sair',MB_ICONQUESTION+MB_YESNO) = 6
      Then Close;
end;

procedure TFrm_CadastroFilme.Bt_OkClick(Sender: TObject);
var cod:Filmes;
begin
    If Application.MessageBox('Deseja Confirmar o Cadastro do Filme?','Cadastrar Filme',36)=6
      Then Begin
               cod.Codigo:=StrToInt(C_Codigo.Text);
               cod.Descricao:=C_Descricao.Text;
               cod.QtdExemplar:=StrToInt(C_Quantidade.Text);
               cod.QtdDisponivel:=cod.QtdExemplar;
               cod.CodigoCategoria:=StrToInt(C_CodigoCategoria.Text);
               cod.TipoFilme:=C_TipoFilme.Text;
               cod.Preco:=V_TempNotaEntrada.Filme[cont].PrecoCusto;
               cod.Audio:=C_Audio.Text;
               cod.Ativo:=True;
               {Não vou fazer verificação de repetição de filme, pois pode acontecer de um filme igual ser comprado de 2 fornecedores
                e então eu teria de alterar toda a estrutura que usei no sistema para trabalhar}
               {ind:=VerificaFilme(C_Descricao.text);
                If ind<0
                   Then Begin}
                            cod:=PreCadastraFilme(cod);
                            CadastraFilme(Cod,V_Filme);
                            inc(Qtd_Filme_Ativo);
                            ShowMessage('Cadastro de Filme Realizado com Sucesso');
                            //
                            Close;
                        {End
                   Else Begin
                            If not(V_Filme[ind].Ativo)
                              Then Begin
                                        If (Application.MessageBox('Filme já cadastrado e está desativado.' +#13+ 'Deseja reativa-lo?','Filme já Cadastrado',36)=6)
                                          Then Begin
                                                   V_Filme[ind].Ativo:=True;
                                                   inc(Qtd_Filme_Ativo);
                                                   Close;
                                               End
                                          Else Begin
                                                   ShowMessage('Filme já está Cadastrado');
                                                   C_Descricao.Clear;
                                                   C_Descricao.SetFocus;
                                               End;
                                   End
                              Else Begin
                                       ShowMessage('Filme já está Cadastrado');
                                       C_Descricao.Clear;
                                       C_Descricao.SetFocus;
                                   End;
                        End;}

           End;
end;

procedure TFrm_CadastroFilme.C_QuantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
    Key:=VerificaTeclaNumeroInteiro(C_Quantidade.Text,Key);
end;

procedure TFrm_CadastroFilme.C_QuantidadeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if C_Quantidade.Text=''
      Then C_Quantidade.Text:='0';
end;

procedure TFrm_CadastroFilme.FormCreate(Sender: TObject);
var cod:Filmes;
begin
    C_Codigo.Text:=IntToStr(Length(V_Filme)+1);
    C_Descricao.Text:=V_TempNotaEntrada.Filme[cont].Descricao;
    C_Quantidade.Text:=IntToStr(V_TempNotaEntrada.Filme[cont].Quantidade);
    Bt_Cancelar.Visible:=false;
end;

procedure TFrm_CadastroFilme.FormShow(Sender: TObject);
var i:integer;
begin
    C_CodigoCategoria.Clear;
    for i := 0 to Length(V_Categoria)-1 do
      Begin
          if V_Categoria[i].Ativo
            Then C_CodigoCategoria.Items.Add(IntToStr(V_Categoria[i].Codigo){ + ' - ' + V_Categoria[i].Nome});
      End;
end;

end.
