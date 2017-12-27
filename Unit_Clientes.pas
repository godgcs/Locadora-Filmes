unit Unit_Clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons,
  Vcl.Grids, Vcl.ExtCtrls, Unit_Biblioteca;

type
  TFrm_Clientes = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    StringGrid1: TStringGrid;
    Bt_Pesquisar: TBitBtn;
    C_Codigo: TMaskEdit;
    Panel2: TPanel;
    Bt_Cadastrar: TBitBtn;
    Bt_Excluir: TBitBtn;
    Bt_Fechar: TBitBtn;
    Bt_Editar: TBitBtn;
    Label2: TLabel;
    procedure Bt_CadastrarClick(Sender: TObject);
    procedure Bt_FecharClick(Sender: TObject);
    procedure Bt_EditarClick(Sender: TObject);
    Procedure AtualizaGridClientes;
    procedure FormCreate(Sender: TObject);
    procedure Bt_ExcluirClick(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Bt_PesquisarClick(Sender: TObject);
    procedure C_CodigoKeyPress(Sender: TObject; var Key: Char);
    procedure AtivaBotoes;
    Function RetornaLinhaGrid(cod:integer):integer;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Clientes: TFrm_Clientes;

implementation

{$R *.dfm}

uses Unit_CadastroCliente;


Procedure TFrm_Clientes.AtualizaGridClientes;
var i,linha:integer;
  Begin
      linha:=1;
      StringGrid1.RowCount:=Qtd_Cliente_Ativo+1;
      For i := 0 to Length(V_Cliente)-1 do
        Begin
            if V_Cliente[i].Ativo
              Then Begin
                      StringGrid1.Cells[0,linha]:=IntToStr(V_Cliente[i].Codigo);
                      StringGrid1.Cells[1,linha]:=V_Cliente[i].Nome;
                      StringGrid1.Cells[2,linha]:=V_Cliente[i].CPF;
                      StringGrid1.Cells[3,linha]:=V_Cliente[i].Telefone;
                      StringGrid1.Cells[4,linha]:=V_Cliente[i].DataNascimento;
                      StringGrid1.Cells[5,linha]:=V_Cliente[i].Email;
                      inc(linha);
                   End;
        End;
      //FinalizaVetores;
      AtivaBotoes;
  End;

procedure TFrm_Clientes.Bt_CadastrarClick(Sender: TObject);
begin
    Editar_Cadastro:=False;
    Application.CreateForm(TFrm_CadastroCliente,Frm_CadastroCliente);
    Frm_CadastroCliente.ShowModal;
    AtualizaGridClientes;
end;

procedure TFrm_Clientes.Bt_EditarClick(Sender: TObject);
var cod:integer;
begin
    If lin>0
      Then Begin
               Editar_Cadastro:=True;
               Cod:=StrToInt(StringGrid1.Cells[0,lin]);
               ind:=RetornaIndiceCliente(cod);
               Application.CreateForm(TFrm_CadastroCliente,Frm_CadastroCliente);
               Frm_CadastroCliente.ShowModal;

               AtualizaGridClientes;
           End
      Else Begin
               ShowMessage('Cliente não selecionado. Por favor clique no Cliente');
           End;
end;

procedure TFrm_Clientes.Bt_ExcluirClick(Sender: TObject);
var Cod:Integer;
begin
    If lin>0
      Then Begin
               Cod:=StrToInt(StringGrid1.Cells[0,lin]);
               If (Application.MessageBox(Pchar('Deseja realmente Excluir o Cliente ' + IntToStr(cod) + '?'),'Excluir Cliente',36)=6)
                  Then Begin
                           Cod:=StrToInt(StringGrid1.Cells[0,lin]);
                           ExcluiCliente(cod);
                           ShowMessage('Cliente Excluido com Sucesso');

                           AtualizaGridClientes;
                       End;
           End
      Else Begin
               ShowMessage('Cliente não selecionado. Por favor clique no cliente');
           End;
end;

procedure TFrm_Clientes.Bt_FecharClick(Sender: TObject);
begin
    Close;
end;

procedure TFrm_Clientes.Bt_PesquisarClick(Sender: TObject);
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
             ShowMessage('Por Favor insira o codigo do Cliente');
         End;

end;

procedure TFrm_Clientes.C_CodigoKeyPress(Sender: TObject; var Key: Char);
begin
    Key:=VerificaTeclaNumeroInteiro(C_Codigo.Text,Key);
end;

Function TFrm_Clientes.RetornaLinhaGrid(cod:integer):integer;
var i,a:integer;
  Begin
      Result:=0;
      for i := 1 to Qtd_Cliente_Ativo do
        Begin
            a:=StrToInt(StringGrid1.Cells[0,i]);
            if cod = a
              Then Begin
                       Result:=i;
                       Break;
                   End;
        End;
      if Result=0
        Then ShowMessage('Codigo de Cliente não encontrado');
End;

procedure TFrm_Clientes.FormCreate(Sender: TObject);
begin
    StringGrid1.Cells[0,0]:='Codigo';
    StringGrid1.Cells[1,0]:='Nome';
    StringGrid1.Cells[2,0]:='CPF';
    StringGrid1.Cells[3,0]:='Tel';
    StringGrid1.Cells[4,0]:='Data Nasc.';
    StringGrid1.Cells[5,0]:='Email';
    AtualizaGridClientes;
    lin:=0;
end;

procedure TFrm_Clientes.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
    lin:=ARow;
end;

procedure TFrm_Clientes.AtivaBotoes;
  Begin
      if Qtd_Cliente_Ativo=0
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
