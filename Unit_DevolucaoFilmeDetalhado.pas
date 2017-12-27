unit Unit_DevolucaoFilmeDetalhado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.ExtCtrls, Unit_Biblioteca;

type
  TFrm_DevolucaoFilmeDetalhada = class(TForm)
    Panel1: TPanel;
    Label16: TLabel;
    GroupBox1: TGroupBox;
    Label13: TLabel;
    Label17: TLabel;
    Label14: TLabel;
    Label4: TLabel;
    C_CPF: TMaskEdit;
    C_CodigoCliente: TEdit;
    C_CodigoLocacao: TEdit;
    C_Cliente: TEdit;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    C_CodigoFilme: TEdit;
    Bt_Devolvido: TBitBtn;
    Panel2: TPanel;
    Bt_Fechar: TBitBtn;
    C_Filme: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure Bt_DevolvidoClick(Sender: TObject);
    Procedure AtualizaFilme;
    procedure C_FilmeSelect(Sender: TObject);
    procedure Bt_FecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_DevolucaoFilmeDetalhada: TFrm_DevolucaoFilmeDetalhada;


implementation

{$R *.dfm}

uses Unit_PagamentoMulta;

procedure TFrm_DevolucaoFilmeDetalhada.Bt_FecharClick(Sender: TObject);
begin
    ConfirmaPagamento:=false;
    if StrToFloat(Multa)>0
      Then Begin
               Application.CreateForm(TFrm_PagamentoMulta,Frm_PagamentoMulta);
               Frm_PagamentoMulta.ShowModal;
               if ConfirmaPagamento
                 Then Begin
                          GravaDevolucaoNotaFilme(V_TempNotaLocacao);
                      End;
           End
      Else Begin
               GravaDevolucaoNotaFilme(V_TempNotaLocacao);
           End;
    Close;
end;

procedure TFrm_DevolucaoFilmeDetalhada.Bt_DevolvidoClick(Sender: TObject);
var i,j,codigo,SubCodigo:integer;
begin
    For i := 0 to Length(V_TempNotaLocacao.Filme)-1 do
      Begin
          j:=pos('-',V_TempNotaLocacao.Filme[i].CodigoFilme);
          codigo:=StrToInt(Copy(V_TempNotaLocacao.Filme[i].CodigoFilme,1,j-1));
          Subcodigo:=StrToInt(Copy(V_TempNotaLocacao.Filme[i].CodigoFilme,j+1,length(V_TempNotaLocacao.Filme[i].CodigoFilme)));
          if V_TempNotaLocacao.Filme[i].CodigoFilme=C_CodigoFilme.Text
            Then Begin
                     V_TempNotaLocacao.Filme[i].Devolvido:=True;
                     V_TempNotaLocacao.Filme[i].DataDevolvida:=Date;
                     GravaDevolucaoExemplarFilme(codigo,SubCodigo);
                     Multa:=FloatToSTr(StrToFloat(Multa)+StrToFloat(CalculaMultaDevolucao(V_TempNotaLocacao.DataDevolucao,V_TempNotaLocacao.Filme[i].CodigoCategoria)));
                 End;
      End;
    AtualizaFilme;
end;

procedure TFrm_DevolucaoFilmeDetalhada.C_FilmeSelect(Sender: TObject);
var i,j:integer;
begin
    For i := 0 to Length(V_TempNotaLocacao.Filme)-1 do
      Begin
          j:=pos(' ',C_Filme.Text);
          C_CodigoFilme.Text:=Copy(C_Filme.Text,1,j-1);
      End;
end;

procedure TFrm_DevolucaoFilmeDetalhada.FormCreate(Sender: TObject);
var Cliente:Clientes;
begin
    Multa:=Zero;
    C_CodigoLocacao.Text:=intToSTr(V_TempNotaLocacao.Codigo);
    C_CodigoCliente.Text:=intToSTr(V_TempNotaLocacao.CodigoCliente);

    ind:=RetornaIndiceCliente(V_TempNotaLocacao.CodigoCliente);
    Cliente:=RetornaClienteEditar(ind);
    C_Cliente.Text:=Cliente.Nome;
    C_CPF.Text:=Cliente.CPF;
    C_CodigoLocacao.Text:=intToSTr(V_TempNotaLocacao.Codigo);

    AtualizaFilme;
end;

Procedure TFrm_DevolucaoFilmeDetalhada.AtualizaFilme;
var i,j,codigo:integer;
    Filme:Filmes;
  Begin
       C_Filme.Clear;
       For i := 0 to length(V_TempNotaLocacao.Filme)-1 do
         Begin
             if not(V_TempNotaLocacao.Filme[i].Devolvido)
               Then Begin
                        j:=pos('-',V_TempNotaLocacao.Filme[i].CodigoFilme);
                        codigo:=StrToInt(Copy(V_TempNotaLocacao.Filme[i].CodigoFilme,1,j-1));
                        ind:=RetornaIndiceFilme(codigo);
                        Filme:=RetornaFilmeEditar(ind,V_Filme);
                        C_Filme.Items.Add(V_TempNotaLocacao.Filme[i].CodigoFilme+' '+Filme.Descricao);
                    End;
         End;
       C_CodigoFilme.Clear;
  End;
end.
