unit Unit_EntradaFilmes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.ExtCtrls,
  Vcl.Mask, Unit_Biblioteca, Vcl.Buttons;

type
  TFrm_EntradaFilmes = class(TForm)
    Panel1: TPanel;
    Label16: TLabel;
    GroupBox1: TGroupBox;
    C_Fornecedor: TComboBox;
    C_Frete: TEdit;
    C_Imposto: TEdit;
    StringGrid1: TStringGrid;
    Bt_MaisFilme: TBitBtn;
    Panel2: TPanel;
    Bt_Ok: TBitBtn;
    Bt_Cancelar: TBitBtn;
    Bt_Excluir: TBitBtn;
    Bt_EditarFilme: TBitBtn;
    Label15: TLabel;
    Label14: TLabel;
    Label13: TLabel;
    Label17: TLabel;
    C_CNPJ: TMaskEdit;
    Label1: TLabel;
    C_CodigoFornecedor: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Bt_MaisFilmeClick(Sender: TObject);
    procedure Bt_CancelarClick(Sender: TObject);
    procedure Bt_ExcluirClick(Sender: TObject);
    procedure Bt_OkClick(Sender: TObject);
    procedure Bt_EditarFilmeClick(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure C_FornecedorSelect(Sender: TObject);
    Procedure AtualizaGridEntradaFilmes;
    procedure C_FreteKeyPress(Sender: TObject; var Key: Char);
    procedure C_ImpostoKeyPress(Sender: TObject; var Key: Char);
    procedure C_FreteKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure C_ImpostoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure C_CodigoFornecedorKeyPress(Sender: TObject; var Key: Char);
    procedure C_CodigoFornecedorKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_EntradaFilmes: TFrm_EntradaFilmes;
  Total:Real;

implementation

{$R *.dfm}

uses Unit_CadastroFilme, Unit_AcrescentarFilmeNota,
  Unit_PagamentoEntradaFilme;

procedure TFrm_EntradaFilmes.Bt_EditarFilmeClick(Sender: TObject);
begin
     If(Temp_Qtd_Filmes>0)and(lin>0)and(lin<Temp_Qtd_Filmes+1)
      Then Begin
              Editar_Cadastro:=True;

              Application.CreateForm(TFrm_AcrescentarFilmeNota,Frm_AcrescentarFilmeNota);
              Frm_AcrescentarFilmeNota.ShowModal;

              AtualizaGridEntradaFilmes;
           End
      Else Begin
               ShowMessage('Produto não selecionado. Por favor clique no Produto');
           End;
end;

procedure TFrm_EntradaFilmes.Bt_ExcluirClick(Sender: TObject);
var i:Integer;
begin
    If(Temp_Qtd_Filmes>0)and(lin>0)and(lin<Temp_Qtd_Filmes+1)
      Then Begin
               If (Application.MessageBox(Pchar('Deseja realmente Excluir o Filme ' + StringGrid1.Cells[0,lin] + ' da Nota ?'),'Excluir Filme da Nota',36)=6)
                  Then Begin
                           for i := lin to Temp_Qtd_Filmes-1 do
                             Begin
                                 V_TempNotaEntrada.Filme[i-1]:=V_TempNotaEntrada.Filme[i];
                             End;
                           SetLength(V_TempNotaEntrada.Filme,Length(V_TempNotaEntrada.Filme)-1);
                           dec(Temp_Qtd_Filmes);
                       End;
           End
      Else Begin
               ShowMessage('Filme não selecionado. Por favor clique no Filme');
           End;
    AtualizaGridEntradaFilmes;
end;

procedure TFrm_EntradaFilmes.Bt_CancelarClick(Sender: TObject);
begin
    If Application.MessageBox('Deseja Realmente Cancelar?','Sair',MB_ICONQUESTION+MB_YESNO) = 6
      Then Close;
end;

procedure TFrm_EntradaFilmes.Bt_MaisFilmeClick(Sender: TObject);
begin
    Editar_Cadastro:=False;
    Application.CreateForm(TFrm_AcrescentarFilmeNota,Frm_AcrescentarFilmeNota);
    Frm_AcrescentarFilmeNota.ShowModal;

    StringGrid1.RowCount:=StringGrid1.RowCount+1;
    AtualizaGridEntradaFilmes;
end;

Procedure TFrm_EntradaFilmes.AtualizaGridEntradaFilmes;
var i,linha:integer;
  Begin
      total:=0;
      linha:=1;
      StringGrid1.RowCount:=Temp_Qtd_Filmes+2;
      For i := 0 to Length(V_TempNotaEntrada.Filme)-1 do
        Begin
            StringGrid1.Cells[0,linha]:=V_TempNotaEntrada.Filme[i].Descricao;
            StringGrid1.Cells[1,linha]:=V_TempNotaEntrada.Filme[i].PrecoCusto;
            StringGrid1.Cells[2,linha]:=IntToSTr(V_TempNotaEntrada.Filme[i].Quantidade);
            StringGrid1.Cells[3,linha]:=FloatToSTr((StrToFloat(V_TempNotaEntrada.Filme[i].PrecoCusto))*(V_TempNotaEntrada.Filme[i].Quantidade));
            Total:=Total+StrToFloat(StringGrid1.Cells[3,linha]);
            inc(linha);
        End;
      Total:=Total+StrToFloat(C_Frete.Text)+StrToFloat(C_Imposto.Text);
      StringGrid1.Cells[0,linha]:='Total da Nota';
      StringGrid1.Cells[1,linha]:='';
      StringGrid1.Cells[2,linha]:='';
      StringGrid1.Cells[3,linha]:=FloatToStr(Total);

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


procedure TFrm_EntradaFilmes.Bt_OkClick(Sender: TObject);
var i:integer;
begin
    cont:=0;
    if (C_Fornecedor.Text<>'')and(C_CodigoFornecedor.Text<>'')
      Then Begin
              if Temp_Qtd_Filmes>0
                Then Begin
                        If(Application.MessageBox('Concluir Produtos da Nota?','Confirmar Produtos',36)=6)
                          Then Begin
                                   V_TempNotaEntrada.CodigoEntrada:=Length(V_NotaEntrada)+1;
                                   V_TempNotaEntrada.CodigoFornecedor:=StrToInt(C_CodigoFornecedor.Text);
                                   V_TempNotaEntrada.Imposto:=C_Imposto.Text;
                                   V_TempNotaEntrada.Frete:=C_Frete.Text;
                                   V_TempNotaEntrada.Total:=ArredondaNumero(FloatToStr(Total));
                                   CadastroFilmeNota:=true;
                                   ConfirmaPagamento:=false;

                                   Application.CreateForm(TFrm_PagamentoEntradaFilme,Frm_PagamentoEntradaFilme);
                                   Frm_PagamentoEntradaFilme.ShowModal;

                                   if ConfirmaPagamento
                                     Then Begin
                                              For i := 1 to Temp_Qtd_Filmes do
                                                Begin
                                                    Editar_Cadastro:=False;
                                                    Application.CreateForm(TFrm_CadastroFilme,Frm_CadastroFilme);
                                                    Frm_CadastroFilme.ShowModal;

                                                    inc(cont);
                                                End;
                                              Close;
                                     End;
                               End;
                     End
                Else Begin
                         ShowMessage('Por Favor Adicione Produtos a Nota Fiscal');
                     End;
           End
      Else Begin
               ShowMessage('Por Favor Preencha todos os Campos');
           End;
end;

procedure TFrm_EntradaFilmes.C_CodigoFornecedorKeyPress(Sender: TObject;
  var Key: Char);
begin
    if not(key in NumerosInteiros)
      Then Begin
               key:=#0;
           End;
end;

procedure TFrm_EntradaFilmes.C_CodigoFornecedorKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var codigo:integer;
    Fornecedor:Fornecedores;
begin
    if (C_CodigoFornecedor.Text<>'')
      Then Begin
               codigo:=StrToInt(C_CodigoFornecedor.Text);
               ind:=RetornaIndiceFornecedor(codigo);
               if ind>=0
                 Then Begin
                          Fornecedor:=RetornaFornecedorEditar(ind);
                          if Fornecedor.Ativo
                            Then Begin
                                     C_Fornecedor.ItemIndex:=C_Fornecedor.Items.IndexOf(intToStr(Fornecedor.Codigo)+' - '+Fornecedor.Nome);
                                     //V_TempNotaEntrada.Fornecedor:=Fornecedor.Nome;
                                     C_CNPJ.Text:=Fornecedor.CNPJ;
                                 End
                            Else Begin
                                     C_Fornecedor.ItemIndex:=-1;
                                     C_CNPJ.Text:='';
                                 End;
                      End
                 Else Begin
                          C_Fornecedor.ItemIndex:=-1;
                          C_CNPJ.Text:='';
                      End;
           End;
end;

procedure TFrm_EntradaFilmes.C_FornecedorSelect(Sender: TObject);
var Fornecedor:Fornecedores;
    i,codigo,ind:integer;
begin
    i:=pos('-',C_Fornecedor.Text);
    codigo:=StrToInt(Copy(C_Fornecedor.Text,1,i-2));
    ind:=RetornaIndiceFornecedor(codigo);
    Fornecedor:=RetornaFornecedorEditar(ind);

    C_CodigoFornecedor.Text:=IntToStr(Codigo);
    C_CNPJ.Text:=Fornecedor.CNPJ;
    //V_TempNotaEntrada.Fornecedor:=Fornecedor.Nome;
end;

procedure TFrm_EntradaFilmes.C_FreteKeyPress(Sender: TObject; var Key: Char);
begin
    Key:=VerificaTeclaNumeroReal(C_Frete.Text,Key);
end;

procedure TFrm_EntradaFilmes.C_FreteKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if C_Frete.Text=''
      Then C_Frete.Text:='0,00';
    AtualizaGridEntradaFilmes;
end;

procedure TFrm_EntradaFilmes.C_ImpostoKeyPress(Sender: TObject; var Key: Char);
begin
    Key:=VerificaTeclaNumeroReal(C_Imposto.Text,Key);
end;

procedure TFrm_EntradaFilmes.C_ImpostoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if C_Imposto.Text=''
      Then C_Imposto.Text:='0,00';
    AtualizaGridEntradaFilmes;
end;

procedure TFrm_EntradaFilmes.FormCreate(Sender: TObject);
var i:integer;
begin
    lin:=0;
    C_Fornecedor.Items.Clear;    //CRIR PROCESSO SEPARADO DEPOIS
    for i := 0 to Length(V_Fornecedor)-1 do
      Begin
          if V_Fornecedor[i].Ativo
            Then C_Fornecedor.Items.Add(IntToStr(V_Fornecedor[i].Codigo)+' - '+V_Fornecedor[i].Nome);
      End;

    Temp_Qtd_Filmes:=0;
    SetLength(V_TempNotaEntrada.Filme,0);   //Toda vez que Abrir irá zerar o Vetor temporario

    StringGrid1.Cells[0,0]:='Descrição';
    StringGrid1.Cells[1,0]:='Preço de Custo';
    StringGrid1.Cells[2,0]:='Quantidade (Uni)';
    StringGrid1.Cells[3,0]:='Total (R$)';
    AtualizaGridEntradaFilmes;
end;

procedure TFrm_EntradaFilmes.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
    lin:=ARow;
end;

end.
