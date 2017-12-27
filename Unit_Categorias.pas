unit Unit_Categorias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons,
  Vcl.Grids, Vcl.ExtCtrls, Unit_Biblioteca;

type
  TFrm_Categorias = class(TForm)
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
    Procedure AtualizaGridCategorias;
    procedure FormCreate(Sender: TObject);
    procedure Bt_FecharClick(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Bt_ExcluirClick(Sender: TObject);
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
  Frm_Categorias: TFrm_Categorias;

implementation

{$R *.dfm}

uses Unit_CadastroCategoria;

Procedure TFrm_Categorias.AtualizaGridCategorias;
var i,linha:integer;
  Begin
      linha:=1;
      StringGrid1.RowCount:=Qtd_Categoria_Ativo+1;
      For i := 0 to Length(V_Categoria)-1 do
        Begin
            if V_Categoria[i].Ativo
              Then Begin
                      StringGrid1.Cells[0,linha]:=IntToStr(V_Categoria[i].Codigo);
                      StringGrid1.Cells[1,linha]:=V_Categoria[i].Nome;
                      StringGrid1.Cells[2,linha]:=V_Categoria[i].Descricao;
                      StringGrid1.Cells[3,linha]:=V_Categoria[i].PrecoLocacao;
                      inc(linha);
                   End;
        End;
      FinalizaVetores;
      AtivaBotoes;
  End;

procedure TFrm_Categorias.Bt_CadastrarClick(Sender: TObject);
begin
    Editar_Cadastro:=False;
    Application.CreateForm(TFrm_CadastroCategoria,Frm_CadastroCategoria);
    Frm_CadastroCategoria.ShowModal;

    AtualizaGridCategorias;
end;

procedure TFrm_Categorias.Bt_EditarClick(Sender: TObject);
var cod:integer;
begin
    If lin>0
      Then Begin
               Editar_Cadastro:=True;
               Cod:=StrToInt(StringGrid1.Cells[0,lin]);
               ind:=RetornaIndiceCategoria(cod);
               Application.CreateForm(TFrm_CadastroCategoria,Frm_CadastroCategoria);
               Frm_CadastroCategoria.ShowModal;

               AtualizaGridCategorias;
           End
      Else Begin
                ShowMessage('Categoria não selecionada. Por favor clique na Categoria');
           End;
end;

procedure TFrm_Categorias.Bt_ExcluirClick(Sender: TObject);
var Cod:Integer;
begin
    If lin>0
      Then Begin
               Cod:=StrToInt(StringGrid1.Cells[0,lin]);
               If (Application.MessageBox(Pchar('Deseja realmente Excluir a Categoria? ' + IntToStr(cod) + '?'),'Excluir Categoria',36)=6)
                  Then Begin
                           Cod:=StrToInt(StringGrid1.Cells[0,lin]);
                           ExcluiCategoria(cod);
                           ShowMessage('Cliente Excluido com Sucesso');

                           AtualizaGridCategorias;
                       End;
           End
      Else Begin
               ShowMessage('Cliente não selecionado. Por favor clique no cliente');
           End;
end;

procedure TFrm_Categorias.Bt_FecharClick(Sender: TObject);
begin
    Close;
end;

procedure TFrm_Categorias.Bt_PesquisarClick(Sender: TObject);
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
               ShowMessage('Por Favor insira o codigo da Categoria');
           End;
end;

procedure TFrm_Categorias.C_CodigoKeyPress(Sender: TObject; var Key: Char);
begin
    Key:=VerificaTeclaNumeroInteiro(C_Codigo.Text,Key);
end;

Function TFrm_Categorias.RetornaLinhaGrid(cod:integer):integer;
var i,a:integer;
  Begin
      Result:=0;
      for i := 1 to Qtd_Categoria_Ativo do
        Begin
            a:=StrToInt(StringGrid1.Cells[0,i]);
            if cod = a
              Then Begin
                       Result:=i;
                       Break;
                   End;
        End;
      if Result=0
        Then ShowMessage('Codigo de Categoria não Encontrada');
End;

procedure TFrm_Categorias.FormCreate(Sender: TObject);
begin
    StringGrid1.Cells[0,0]:='Codigo';
    StringGrid1.Cells[1,0]:='Nome';
    StringGrid1.Cells[2,0]:='Descrição';
    StringGrid1.Cells[3,0]:='Preço Locação';
    AtualizaGridCategorias;
    lin:=0;
end;

procedure TFrm_Categorias.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
    lin:=ARow;
end;

procedure TFrm_Categorias.AtivaBotoes;
  Begin
      if Qtd_Categoria_Ativo=0
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
