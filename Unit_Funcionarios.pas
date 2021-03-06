unit Unit_Funcionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons,
  Vcl.Grids, Vcl.ExtCtrls, Unit_Biblioteca;

type
  TFrm_Funcionarios = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    StringGrid1: TStringGrid;
    Bt_Pesquisar: TBitBtn;
    C_Codigo: TMaskEdit;
    Panel2: TPanel;
    Bt_Cadastrar: TBitBtn;
    Bt_Excluir: TBitBtn;
    Bt_Fechar: TBitBtn;
    Bt_Editar: TBitBtn;
    procedure Bt_CadastrarClick(Sender: TObject);
    procedure Bt_EditarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Bt_FecharClick(Sender: TObject);
    Procedure AtualizaGridFuncionarios;
    Function RetornaLinhaGrid(cod:integer):integer;
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Bt_PesquisarClick(Sender: TObject);
    procedure Bt_ExcluirClick(Sender: TObject);
    procedure C_CodigoKeyPress(Sender: TObject; var Key: Char);
    procedure AtivaBotoes;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Funcionarios: TFrm_Funcionarios;

implementation

{$R *.dfm}

uses Unit_CadastroFuncionario;

Procedure TFrm_Funcionarios.AtualizaGridFuncionarios;
var i,linha:integer;
  Begin
      linha:=1;
      StringGrid1.RowCount:=Qtd_Funcionarios_Ativo+1;
      For i := 0 to Length(V_Funcionario)-1 do
        Begin
            if V_Funcionario[i].Ativo
              Then Begin
                      StringGrid1.Cells[0,linha]:=IntToStr(V_Funcionario[i].Codigo);
                      StringGrid1.Cells[1,linha]:=V_Funcionario[i].Nome;
                      StringGrid1.Cells[2,linha]:=V_Funcionario[i].Telefone;
                      StringGrid1.Cells[3,linha]:=V_Funcionario[i].Email;
                      StringGrid1.Cells[4,linha]:=V_Funcionario[i].Login;
                      StringGrid1.Cells[5,linha]:=V_Funcionario[i].Senha;
                      inc(linha);
                   End;
        End;
      FinalizaVetores;
      AtivaBotoes;
  End;

procedure TFrm_Funcionarios.Bt_CadastrarClick(Sender: TObject);
begin
    Editar_Cadastro:=false;
    Application.CreateForm(TFrm_CadastroFuncionario,Frm_CadastroFuncionario);
    Frm_CadastroFuncionario.ShowModal;
    AtualizaGridFuncionarios;
end;

procedure TFrm_Funcionarios.Bt_EditarClick(Sender: TObject);
var cod:integer;
begin
    If lin>0
      Then Begin
              Editar_Cadastro:=True;
              Cod:=StrToInt(StringGrid1.Cells[0,lin]);
              ind:=RetornaIndiceVendedor(cod);
              Application.CreateForm(TFrm_CadastroFuncionario,Frm_CadastroFuncionario);
              Frm_CadastroFuncionario.ShowModal;

              AtualizaGridFuncionarios;
           End
      Else Begin
               ShowMessage('Funcionario n�o selecionado. Por favor clique no Funcionario');
           End;
end;

procedure TFrm_Funcionarios.Bt_ExcluirClick(Sender: TObject);
var Cod:Integer;
begin
    If lin>0
      Then Begin
               Cod:=StrToInt(StringGrid1.Cells[0,lin]);
               If (Application.MessageBox(Pchar('Deseja realmente Excluir o Funcionario ' + IntToStr(cod) + '?'),'Excluir Funcionario',36)=6)
                  Then Begin
                           Cod:=StrToInt(StringGrid1.Cells[0,lin]);
                           ExcluiFuncionario(cod);
                           ShowMessage('Funcionario Excluido com Sucesso');

                           AtualizaGridFuncionarios;
                       End;
           End
      Else Begin
               ShowMessage('Funcionario n�o selecionado. Por favor clique no Funcionario');
           End;
end;

procedure TFrm_Funcionarios.Bt_FecharClick(Sender: TObject);
begin
    Close;
end;

procedure TFrm_Funcionarios.Bt_PesquisarClick(Sender: TObject);
var Selecao: TGridRect;
    cod:integer;
begin
    if C_Codigo.Text<>''
    Then Begin
            cod:=StrToInt(C_Codigo.Text);
            StringGrid1.SetFocus;
            cod:=RetornaLinhaGrid(cod);
            Selecao.Left:= 0; // coluna inicial
            Selecao.Right:= 5; // coluna final
            Selecao.Top:= cod; // linha inicial
            Selecao.Bottom:= cod; // linha final
            StringGrid1.Selection:= Selecao;
            lin:=cod;
         End
    Else Begin
             ShowMessage('Por Favor insira o codigo do Funcionario');
         End;
end;

procedure TFrm_Funcionarios.C_CodigoKeyPress(Sender: TObject; var Key: Char);
begin
    Key:=VerificaTeclaNumeroInteiro(C_Codigo.Text,Key);
end;

Function TFrm_Funcionarios.RetornaLinhaGrid(cod:integer):integer;
var i,a:integer;
  Begin
      Result:=0;
      for i := 1 to Qtd_Funcionarios_Ativo do
        Begin
            a:=StrToInt(StringGrid1.Cells[0,i]);
            if cod = a
              Then Begin
                       Result:=i;
                       Break;
                   End;
        End;
      if Result=0
        Then ShowMessage('Codigo de Funcionario n�o Encontrado');
End;

procedure TFrm_Funcionarios.FormCreate(Sender: TObject);
begin
    StringGrid1.Cells[0,0]:='Codigo';
    StringGrid1.Cells[1,0]:='Nome';
    StringGrid1.Cells[2,0]:='Telefone';
    StringGrid1.Cells[3,0]:='Email';
    StringGrid1.Cells[4,0]:='Login';
    StringGrid1.Cells[5,0]:='Senha';
    AtualizaGridFuncionarios;
    lin:=0;
end;

procedure TFrm_Funcionarios.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
    lin:=ARow;
end;

procedure TFrm_Funcionarios.AtivaBotoes;
  Begin
      if Qtd_Funcionarios_Ativo=0
      Then Begin
               Bt_Editar.Enabled:=false;
               Bt_Excluir.Enabled:=false;
           End
      Else Begin
               Bt_Editar.Enabled:=True;
               Bt_Excluir.Enabled:=True;
           End;
  End;

end.
