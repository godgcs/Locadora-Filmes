unit Unit_LocacaoFilme;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons,
  Vcl.Grids, Vcl.ExtCtrls, Unit_Biblioteca;

type
  TFrm_LocacaoFilme = class(TForm)
    Panel1: TPanel;
    Label16: TLabel;
    GroupBox1: TGroupBox;
    Label13: TLabel;
    Label17: TLabel;
    C_Cliente: TComboBox;
    StringGrid1: TStringGrid;
    Bt_MaisFilme: TBitBtn;
    Bt_Excluir: TBitBtn;
    Bt_EditarFilme: TBitBtn;
    Panel2: TPanel;
    Bt_Ok: TBitBtn;
    Bt_Cancelar: TBitBtn;
    C_CPF: TMaskEdit;
    Label14: TLabel;
    C_CodigoCliente: TEdit;
    procedure Bt_CancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure C_ClienteSelect(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Bt_MaisFilmeClick(Sender: TObject);
    procedure AtualizaGridFilmes;
    procedure Bt_EditarFilmeClick(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Bt_ExcluirClick(Sender: TObject);
    procedure C_CodigoClienteKeyPress(Sender: TObject; var Key: Char);
    procedure C_CodigoClienteKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_OkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_LocacaoFilme: TFrm_LocacaoFilme;
  Total:String;

implementation

{$R *.dfm}

uses Unit_AcrescentarFilmeLocacao, Unit_PagamentoLocacao;

procedure TFrm_LocacaoFilme.Bt_CancelarClick(Sender: TObject);
begin
    if Application.MessageBox('Deseja Realmente Cancelar?','Cancelar',36)=6
      Then Begin
               Close;
           End;
end;

procedure TFrm_LocacaoFilme.Bt_EditarFilmeClick(Sender: TObject);
begin
    if (Temp_Qtd_Filmes>0)and(lin>0)and(lin<Temp_Qtd_Filmes+1)
      Then Begin
               Editar_Cadastro:=True;
               ConfirmaAlteracao:=False;
               Application.CreateForm(TFrm_AcrescentarFilmeLocacao,Frm_AcrescentarFilmeLocacao);
               Frm_AcrescentarFilmeLocacao.ShowModal;

               AtualizaGridFilmes;
           End
      Else Begin
               ShowMessage('Filme não selecionado. Por favor clique no Filme');
           End;
end;

procedure TFrm_LocacaoFilme.Bt_ExcluirClick(Sender: TObject);
var i,codigo,exemplar,NumCategoria:integer;
    cod:string;
    Categoria:Categorias;
begin
    if (Temp_Qtd_Filmes>0)and(lin>0)and(lin<Temp_Qtd_Filmes+1)
      Then Begin
               If (Application.MessageBox(Pchar('Deseja realmente Excluir o Filme ' + StringGrid1.Cells[0,lin] + ' da Nota ?'),'Excluir Filme da Nota',36)=6)
                  Then Begin
                           cod:=StringGrid1.Cells[0,lin];
                           i:=pos('-',cod);
                           codigo:=RetornaIndiceFilme(StrToInt(copy(cod,1,i-1)));
                           Exemplar:=RetornaIndiceExemplar(codigo,StrToInt(copy(cod,i+1,length(cod))));
                           inc(CopiaFilme[codigo].QtdDisponivel);
                           CopiaFilme[codigo].Exemplar[exemplar].Disponivel:=True;

                           NumCategoria:=RetornaIndiceCategoria(V_TempNotaLocacao.Filme[lin-1].CodigoCategoria);
                           Categoria:=RetornaCategoriaEditar(NumCategoria);
                           CopiaFilme[codigo].Exemplar[Exemplar].Lucro:=ArredondaNumero(FloatToStr(StrToFloat(CopiaFilme[ind].Exemplar[Exemplar].Lucro)-StrToFloat(Categoria.PrecoLocacao)));

                           for i := lin to Temp_Qtd_Filmes-1 do
                             Begin
                                 V_TempNotaLocacao.Filme[i-1]:=V_TempNotaLocacao.Filme[i];
                             End;
                           SetLength(V_TempNotaLocacao.Filme,Length(V_TempNotaLocacao.Filme)-1);
                           dec(Temp_Qtd_Filmes);

                       End;
           End
      Else Begin
               ShowMessage('Filme não selecionado. Por favor clique no Filme');
           End;
      AtualizaGridFilmes;
end;

procedure TFrm_LocacaoFilme.Bt_MaisFilmeClick(Sender: TObject);
begin
    Editar_Cadastro:=false;
    Application.CreateForm(TFrm_AcrescentarFilmeLocacao,Frm_AcrescentarFilmeLocacao);
    Frm_AcrescentarFilmeLocacao.ShowModal;

    AtualizaGridFilmes;
end;

procedure TFrm_LocacaoFilme.Bt_OkClick(Sender: TObject);
begin
    if (C_Cliente.Text<>'')and(C_CodigoCliente.Text<>'')
      Then Begin
               if Temp_Qtd_Filmes>0
                 Then Begin
                          If(Application.MessageBox('Confirmar Filmes para Locação?','Confirmar Locação',36)=6)
                            Then Begin
                                     V_TempNotaLocacao.CodigoCliente:=StrToInt(C_CodigoCliente.Text);
                                     V_TempNotaLocacao.Total:=ArredondaNumero(Total);
                                     V_TempNotaLocacao.Codigo:=Length(V_NotaLocacao)+1;

                                     ConfirmaPagamento:=false;
                                     Application.CreateForm(TFrm_PagamentoLocacao,Frm_PagamentoLocacao);
                                     Frm_PagamentoLocacao.ShowModal;

                                     if ConfirmaPagamento
                                       Then Begin
                                                Close;
                                            End;
                                 End;
                      End
                 Else Begin
                          ShowMessage('Adicione Filmes para Locação');
                      End;
           End
      Else Begin
               ShowMessage('Preencha todos os Campos Corretamente');
           End;
end;

procedure TFrm_LocacaoFilme.C_ClienteSelect(Sender: TObject);
var Cliente:Clientes;
    Codigo,ind,i:Integer;

begin
    i:=pos('-',C_Cliente.Text);
    codigo:=StrToInt(Copy(C_Cliente.Text,1,i-2));
    C_CodigoCliente.Text:=IntToStr(Codigo);

    ind:=RetornaIndiceCliente(codigo);
    Cliente:=RetornaClienteEditar(ind);
    C_CPF.Text:=Cliente.CPF;
end;

procedure TFrm_LocacaoFilme.C_CodigoClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
    Key:=VerificaTeclaNumeroInteiro(C_CodigoCliente.Text,Key);
end;

procedure TFrm_LocacaoFilme.C_CodigoClienteKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var ind,codigo:integer;
    Cliente:Clientes;
begin
    if (C_CodigoCliente.Text<>'')
      Then Begin
               codigo:=StrToInt(C_CodigoCliente.Text);
               ind:=RetornaIndiceCliente(codigo);
               if ind>=0
                 Then Begin
                          Cliente:=RetornaClienteEditar(ind);
                          if Cliente.Ativo
                            Then Begin
                                     C_Cliente.ItemIndex:=C_Cliente.Items.IndexOf(intToStr(Cliente.Codigo)+' - '+Cliente.Nome);
                                     C_CPF.Text:=Cliente.CPF;
                                 End
                            Else Begin
                                     C_Cliente.ItemIndex:=-1;
                                     C_CPF.Text:='';
                                 End;
                      End
                 Else Begin
                          C_Cliente.ItemIndex:=-1;
                          C_CPF.Text:='';
                      End;
           End;
end;

procedure TFrm_LocacaoFilme.FormCreate(Sender: TObject);
begin
    lin:=1;
    CarregaCopiaTemporariaFilmes;   //Faz uma copia de todos os filmes para poder fazer modificações livremente
    Temp_Qtd_Filmes:=0;
    SetLength(V_TempNotaLocacao.Filme,0);  //vetor temporario da nota

    StringGrid1.Cells[0,0]:='Codigo';
    StringGrid1.Cells[1,0]:='Descrição';
    StringGrid1.Cells[2,0]:='Valor (R$)';
    AtualizaGridFilmes;
end;

procedure TFrm_LocacaoFilme.AtualizaGridFilmes;
var i,j,linha,ind,codigo:integer;
    Filme:Filmes;
    Categoria:Categorias;
  Begin
      linha:=1;
      Total:=zero;
      StringGrid1.RowCount:=Temp_Qtd_Filmes+2;
      For i := 0 to Length(V_TempNotaLocacao.Filme)-1 do
        Begin
            StringGrid1.Cells[0,linha]:=V_TempNotaLocacao.Filme[i].CodigoFilme;

            j:=pos('-',V_TempNotaLocacao.Filme[i].CodigoFilme);
            Codigo:=StrToInt(Copy(V_TempNotaLocacao.Filme[i].CodigoFilme,1,j-1));
            ind:=RetornaIndiceFilme(Codigo);
            Filme:=RetornaFilmeEditar(ind,V_Filme);
            StringGrid1.Cells[1,linha]:=Filme.Descricao;

            ind:=RetornaIndiceCategoria(Filme.CodigoCategoria);
            Categoria:=RetornaCategoriaEditar(ind);
            StringGrid1.Cells[2,linha]:='R$ ' + Categoria.PrecoLocacao;
            Total:=FloatToStr(StrToFloat(Total)+StrToFloat(Categoria.PrecoLocacao));
            inc(linha);
        End;
      StringGrid1.Cells[0,linha]:='Total da Nota';
      StringGrid1.Cells[1,linha]:='';
      StringGrid1.Cells[2,linha]:='R$ ' + ArredondaNumero(Total);
      if Temp_Qtd_Filmes=0
        Then Begin
                 Bt_Excluir.Enabled:=false;
                 Bt_EditarFilme.Enabled:=false;
             End
        Else Begin
                 Bt_Excluir.Enabled:=true;
                 Bt_EditarFilme.Enabled:=true;
             End;

  End;

procedure TFrm_LocacaoFilme.FormShow(Sender: TObject);
var i :Integer;
begin
    C_Cliente.Items.Clear;
    for i := 0 to Length(V_Cliente)-1 do
      Begin
          if V_Cliente[i].Ativo
            Then C_Cliente.Items.Add(IntToStr(V_Cliente[i].Codigo)+' - '+V_Cliente[i].Nome);
      End;
    C_CodigoCliente.SetFocus;
end;

procedure TFrm_LocacaoFilme.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
    lin:=ARow;
end;

end.
