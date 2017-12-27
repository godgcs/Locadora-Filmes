unit Unit_PagamentoLocacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, frxClass, frxExportPDF,
  frxDBSet, Data.DB, JvMemoryDataset, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Unit_Biblioteca, DateUtils;

type
  TFrm_PagamentoLocacao = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    StringGrid1: TStringGrid;
    RadioGroup1: TRadioGroup;
    Bt_FormaPagamento: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    C_TotalAVista: TEdit;
    Bt_FinalizarAVista: TBitBtn;
    C_DinheiroAVista: TEdit;
    TabSheet2: TTabSheet;
    C_ParcelasAPrazo: TComboBox;
    C_EntradaAPrazo: TEdit;
    Bt_FinalizarAPrazo: TBitBtn;
    C_TotalAPrazo: TEdit;
    C_DinheiroAPrazo: TEdit;
    Bt_AcrescentarFilmes: TBitBtn;
    DataSource1: TDataSource;
    JvMemoryData1: TJvMemoryData;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    Label13: TLabel;
    Label17: TLabel;
    Label14: TLabel;
    C_CPF: TMaskEdit;
    C_CodigoCliente: TEdit;
    Label4: TLabel;
    C_CodigoLocacao: TEdit;
    C_Cliente: TEdit;
    C_TrocoAVista: TEdit;
    C_TrocoAPrazo: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    Label8: TLabel;
    StringGrid2: TStringGrid;
    Label2: TLabel;
    Label9: TLabel;
    Label6: TLabel;
    JvMemoryData1CodigoCategoria: TIntegerField;
    JvMemoryData1Valor: TStringField;
    JvMemoryData1CodigoLocacao: TIntegerField;
    JvMemoryData1CodigoCliente: TIntegerField;
    JvMemoryData1Cliente: TStringField;
    JvMemoryData1CPFCliente: TStringField;
    JvMemoryData1Total: TStringField;
    JvMemoryData1NomeEmpresa: TStringField;
    JvMemoryData1CNPJEmpresa: TStringField;
    JvMemoryData1DescricaoFilme: TStringField;
    JvMemoryData1CodigoFilme: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure AtualizaGridLocacoes;
    Procedure AtualizaGridParcelas;
    Procedure GeraRelatorio;
    Procedure RealizaContasAPrazo;
    procedure Bt_FormaPagamentoClick(Sender: TObject);
    procedure GravaDadosMemoriaVirtual;
    procedure Bt_FinalizarAPrazoClick(Sender: TObject);
    procedure Bt_FinalizarAVistaClick(Sender: TObject);
    procedure C_ParcelasAPrazoSelect(Sender: TObject);
    procedure C_EntradaAPrazoKeyPress(Sender: TObject; var Key: Char);
    procedure C_DinheiroAPrazoKeyPress(Sender: TObject; var Key: Char);
    procedure C_EntradaAPrazoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure C_DinheiroAPrazoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure C_EntradaAPrazoExit(Sender: TObject);
    procedure C_DinheiroAPrazoExit(Sender: TObject);
    procedure C_DinheiroAVistaExit(Sender: TObject);
    procedure C_DinheiroAVistaKeyPress(Sender: TObject; var Key: Char);
    procedure C_DinheiroAVistaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_AcrescentarFilmesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_PagamentoLocacao: TFrm_PagamentoLocacao;
  parcela:integer;

implementation

{$R *.dfm}

procedure TFrm_PagamentoLocacao.Bt_AcrescentarFilmesClick(Sender: TObject);
begin
    Close;
end;

procedure TFrm_PagamentoLocacao.Bt_FinalizarAPrazoClick(Sender: TObject);
var Datas,ValorParcela:String;
    i:integer;
    cod:NotasAReceber;
    cod2:Movimentacao;
begin
    Datas:='';
    for i := 1 to parcela do     //PEGO TODAS AS DATAS
      Begin
          Datas:=Datas+StringGrid2.Cells[1,i]+'-';   //Concatenação das datas das parcelas
      End;
    ValorParcela:=StringGrid2.Cells[2,1];

    if C_ParcelasAPrazo.Text<>''
      Then Begin
               If(Application.MessageBox('Deseja Confirmar a Emissão da Nota?','Confirmar Nota',36)=6)
                 Then Begin
                          GeraRelatorio;

                          V_TempNotaLocacao.QtdParcela:=Parcela;
                          V_TempNotaLocacao.Entrada:=C_EntradaAPrazo.Text;
                          V_TempNotaLocacao.Multa:=Zero;
                          V_TempNotaLocacao.DataDevolucao:=V_TempNotaLocacao.Data+3;
                          V_TempNotaLocacao.Funcionario:=Vendedor_Ativo;
                          //Verifica Dia Locacao PRAZO 3 DIAS
                          if dayofweek(V_TempNotaLocacao.DataDevolucao)=1
                            Then V_TempNotaLocacao.DataDevolucao:=IncDay(V_TempNotaLocacao.DataDevolucao)
                            Else V_TempNotaLocacao.DataDevolucao:= V_TempNotaLocacao.DataDevolucao;
                          //
                          RecebePagamento(C_EntradaAPrazo.Text);
                          If StrToFloat(C_EntradaAPrazo.Text)>0
                            Then Begin
                                     cod2.Descricao:='Recebimento Locação A Prazo';
                                     cod2.Valor:='+'+C_EntradaAPrazo.Text;
                                     cod2.Data:=date;
                                     cod2.Hora:=time;
                                     CadastraMovimentacaoCaixa(cod2,V_MovimentacaoCaixa);
                                 End;
                          ConfirmaPagamento:=True;
                          CadastraLocacao(V_TempNotaLocacao,V_NotaLocacao);
                          inc(Qtd_Locacao_Ativo);

                          GravaVetorOriginal;
                          cod:=PreCadastraContaAReceber(V_TempNotaLocacao,Datas,ValorParcela);
                          CadastraContaAReceber(cod,V_NotaAReceber);
                          //Qtd_NotaAReceber_Ativo:=Qtd_NotaAReceber_Ativo+V_TempNotaLocacao.QtdParcela;
                          ShowMessage('Nota Fical Emitida com Sucesso');

                          Close;
                      End;
           End;
end;

procedure TFrm_PagamentoLocacao.Bt_FinalizarAVistaClick(Sender: TObject);
var cod:Movimentacao;
begin
    If(Application.MessageBox('Deseja Confirmar a Emissão da Nota?','Confirmar Nota',36)=6)
      Then Begin
               GeraRelatorio;

               V_TempNotaLocacao.QtdParcela:=0;
               V_TempNotaLocacao.Entrada:=Zero;
               V_TempNotaLocacao.Multa:=Zero;
               V_TempNotaLocacao.DataDevolucao:=V_TempNotaLocacao.Data+3;
               V_TempNotaLocacao.Funcionario:=Vendedor_Ativo;
               //Verifica Dia Locacao PRAZO 3 DIAS
               if dayofweek(V_TempNotaLocacao.DataDevolucao)=1
                 Then V_TempNotaLocacao.DataDevolucao:=IncDay(V_TempNotaLocacao.DataDevolucao)
                 Else V_TempNotaLocacao.DataDevolucao:= V_TempNotaLocacao.DataDevolucao;
               //
               RecebePagamento(V_TempNotaLocacao.Total);

               cod.Descricao:='Recebimento Locação A Vista';
               cod.Valor:='+'+V_TempNotaLocacao.Total;
               cod.Data:=date;
               cod.Hora:=time;
               CadastraMovimentacaoCaixa(cod,V_MovimentacaoCaixa);

               ConfirmaPagamento:=True;
               CadastraLocacao(V_TempNotaLocacao,V_NotaLocacao);
               inc(Qtd_Locacao_Ativo);

               GravaVetorOriginal;

               ShowMessage('Nota Fical Emitida com Sucesso');

               Close;
           End;
end;

procedure TFrm_PagamentoLocacao.Bt_FormaPagamentoClick(Sender: TObject);
begin
    Case RadioGroup1.ItemIndex of
      0:Begin
            PageControl1.Visible:=True;
            PageControl1.Pages[0].TabVisible:=True;
            PageControl1.Pages[1].TabVisible:=False;
            C_TotalAVista.Text:=V_TempNotaLocacao.Total;
        End;
      1:Begin
            PageControl1.Visible:=True;
            PageControl1.Pages[0].TabVisible:=False;
            PageControl1.Pages[1].TabVisible:=True;
            C_TotalAPrazo.Text:=Zero;

            StringGrid2.Cells[0,0]:='Parcelas';
            StringGrid2.Cells[1,0]:='Data';
            StringGrid2.Cells[2,0]:='Valor (R$)';
        End;
    End;
end;

procedure TFrm_PagamentoLocacao.C_DinheiroAPrazoExit(Sender: TObject);
begin
    C_DinheiroAPrazo.Text:=ArredondaNumero(C_DinheiroAPrazo.Text);
end;

procedure TFrm_PagamentoLocacao.C_DinheiroAPrazoKeyPress(Sender: TObject;
  var Key: Char);
begin
    Key:=VerificaTeclaNumeroReal(C_DinheiroAPrazo.Text,Key);
end;

procedure TFrm_PagamentoLocacao.C_DinheiroAPrazoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if C_DinheiroAPrazo.Text=''
      Then C_DinheiroAPrazo.Text:=zero;

    RealizaContasAPrazo;
end;

procedure TFrm_PagamentoLocacao.C_DinheiroAVistaExit(Sender: TObject);
begin
    C_DinheiroAVista.Text:=ArredondaNumero(C_DinheiroAVista.Text);
end;

procedure TFrm_PagamentoLocacao.C_DinheiroAVistaKeyPress(Sender: TObject;
  var Key: Char);
begin
    Key:=VerificaTeclaNumeroReal(C_DinheiroAVista.Text,Key);
end;

procedure TFrm_PagamentoLocacao.C_DinheiroAVistaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if C_DinheiroAVista.Text=''
      Then C_DinheiroAVista.Text:=zero;
    if C_DinheiroAVista.Text<>zero
      Then Begin
               C_TrocoAVista.Text:=ArredondaNumero(FloatToSTr(StrToFloat(C_DinheiroAVista.Text)-StrToFloat(C_TotalAVista.Text)));
           End;
end;

procedure TFrm_PagamentoLocacao.C_EntradaAPrazoExit(Sender: TObject);
begin
    C_EntradaAPrazo.Text:=ArredondaNumero(C_EntradaAPrazo.Text);
end;

procedure TFrm_PagamentoLocacao.C_EntradaAPrazoKeyPress(Sender: TObject;
  var Key: Char);
begin
    Key:=VerificaTeclaNumeroReal(C_EntradaAPrazo.Text,Key);
end;

procedure TFrm_PagamentoLocacao.C_EntradaAPrazoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if C_EntradaAPrazo.Text=''
      Then C_EntradaAPrazo.Text:=zero;
    C_TotalAPrazo.Text:=ArredondaNumero(C_EntradaAPrazo.Text);
    if C_EntradaAPrazo.Text<>''
      Then RealizaContasAPrazo;
end;

procedure TFrm_PagamentoLocacao.C_ParcelasAPrazoSelect(Sender: TObject);
begin
    if C_ParcelasAPrazo.Text='1x - Sem Juros'
        Then Begin
                 parcela:=1;
             End
        Else Begin
                 if C_ParcelasAPrazo.Text='2x - Sem Juros'
                   Then Begin
                            parcela:=2;
                        End
                   Else Begin
                            if C_ParcelasAPrazo.Text='3x - Sem Juros'
                              Then Begin
                                       parcela:=3;
                                   End;
                        End;
             End;
    AtualizaGridParcelas;
    RealizaContasAPrazo;
end;

procedure TFrm_PagamentoLocacao.FormCreate(Sender: TObject);
var Cliente:Clientes;
begin
    C_CodigoLocacao.Text:=IntToStr(V_TempNotaLocacao.Codigo);
    C_CodigoCliente.Text:=IntToSTr(V_TempNotaLocacao.CodigoCliente);
    ind:=RetornaIndiceCliente(V_TempNotaLocacao.CodigoCliente);
    Cliente:=RetornaClienteEditar(ind);
    C_Cliente.Text:=Cliente.Nome;
    C_CPF.Text:=Cliente.CPF;
    GravaDadosMemoriaVirtual;
    AtualizaGridLocacoes;
end;

procedure TFrm_PagamentoLocacao.GravaDadosMemoriaVirtual;
var i,j,codigo: integer;
    Categoria:Categorias;
    Filme:Filmes;
  Begin
      JvMemoryData1.Active:=True;
      //JvMemoryData1.Edit;
      //JvMemoryData1.Insert;
      for i := Temp_Qtd_Filmes-1 Downto 0 do
        Begin
            JvMemoryData1.Insert;
            JvMemoryData1.FieldByName('CodigoFilme').AsSTring := V_TempNotaLocacao.Filme[i].CodigoFilme;
            j:=pos('-',V_TempNotaLocacao.Filme[i].CodigoFilme);
            Codigo:=StrToInt(Copy(V_TempNotaLocacao.Filme[i].CodigoFilme,1,j-1));
            ind:=RetornaIndiceFilme(Codigo);
            Filme:=RetornaFilmeEditar(ind,CopiaFilme);
            JvMemoryData1.FieldByName('DescricaoFilme').AsSTring := Filme.Descricao;
            JvMemoryData1.FieldByName('CodigoCategoria').AsInteger := V_TempNotaLocacao.Filme[i].CodigoCategoria;
            ind:=RetornaIndiceCategoria(V_TempNotaLocacao.Filme[i].CodigoCategoria);
            Categoria:=RetornaCategoriaEditar(ind);
            JvMemoryData1.FieldByName('Valor').AsSTring :=Categoria.PrecoLocacao;

            JvMemoryData1.FieldByName('CodigoLocacao').AsInteger := V_TempNotaLocacao.Codigo;
            JvMemoryData1.FieldByName('CodigoCliente').AsInteger := V_TempNotaLocacao.CodigoCliente;
            JvMemoryData1.FieldByName('Cliente').AsSTring := C_Cliente.Text;
            JvMemoryData1.FieldByName('CPFCliente').AsSTring := C_CPF.Text;
            JvMemoryData1.FieldByName('Total').AsSTring := V_TempNotaLocacao.Total;
            JvMemoryData1.FieldByName('NomeEmpresa').AsSTring := V_Empresa.NomeEmpresa;
            JvMemoryData1.FieldByName('CNPJEmpresa').AsSTring := V_Empresa.CNPJ;
        End;

      //JvMemoryData1.Insert;

  End;

procedure TFrm_PagamentoLocacao.AtualizaGridLocacoes;
var i,j,codigo:integer;
    Filme:Filmes;
    Categoria:Categorias;
  Begin
      StringGrid1.RowCount:=Temp_Qtd_Filmes+2;
      StringGrid1.Cells[0,0]:='Codigo';
      StringGrid1.Cells[1,0]:='Descrição';
      StringGrid1.Cells[2,0]:='Valor Locação';

      for i := 1 to Temp_Qtd_Filmes do
        Begin
            StringGrid1.Cells[0,i]:=V_TempNotaLocacao.Filme[i-1].CodigoFilme;

              j:=pos('-',V_TempNotaLocacao.Filme[i-1].CodigoFilme);
              Codigo:=StrToInt(Copy(V_TempNotaLocacao.Filme[i-1].CodigoFilme,1,j-1));
              ind:=RetornaIndiceFilme(Codigo);
              Filme:=RetornaFilmeEditar(ind,CopiaFilme);
            StringGrid1.Cells[1,i]:=Filme.Descricao;

              ind:=RetornaIndiceCategoria(V_TempNotaLocacao.Filme[i-1].CodigoCategoria);
              Categoria:=RetornaCategoriaEditar(ind);
            StringGrid1.Cells[2,i]:=Categoria.PrecoLocacao;
        End;
      StringGrid1.Cells[0,Temp_Qtd_Filmes+1]:='Total';
      StringGrid1.Cells[1,Temp_Qtd_Filmes+1]:='';
      StringGrid1.Cells[2,Temp_Qtd_Filmes+1]:=V_TempNotaLocacao.Total;
  End;

Procedure TFrm_PagamentoLocacao.AtualizaGridParcelas;
var ValorParcela:string;
    i:integer;
    Data,ProxPagamento:TDate;
  Begin
      StringGrid2.RowCount:=parcela+1;
      ValorParcela:=FloatToStr((StrToFloat(V_TempNotaLocacao.Total)-StrToFloat(C_EntradaAPrazo.Text))/parcela);
      ValorParcela:=ArredondaNumero(ValorParcela);
      Data:=Date;
      for i := 1 to parcela do
        Begin
            Data:=IncMonth(Data);
            if dayofweek(Data)=1
              Then ProxPagamento:=IncDay(Data)
              Else ProxPagamento:=data;

            StringGrid2.Cells[0,i]:=IntToStr(i)+'x - Sem Juros';
            StringGrid2.Cells[1,i]:=DateToStr(ProxPagamento);
            StringGrid2.Cells[2,i]:=ValorParcela;
        End;
  End;

Procedure TFrm_PagamentoLocacao.GeraRelatorio;
var data,hora:String;
  Begin
      V_TempNotaLocacao.Data:=Date;
      V_TempNotaLocacao.Hora:=FormatDateTime('hh:nn',now);
      data:=FormatDateTime ('dd-mm-yyyy',now);
      hora:=FormatDateTime('hh-nn',now);
      frxPDFExport1.FileName := data+'_'+Hora+'.pdf';
      frxPDFExport1.DefaultPath := 'C:\Relatorios\Locação\';
      frxPDFExport1.ShowDialog := False;
      frxPDFExport1.ShowProgress := False;
      frxPDFExport1.OverwritePrompt := False;
      FrxReport1.PrepareReport();
      FrxReport1.Export(frxPDFExport1);
  End;

Procedure TFrm_PagamentoLocacao.RealizaContasAPrazo;
  Begin
      if C_ParcelasAPrazo.Text<>''
        Then Begin
                 AtualizaGridParcelas;
                 if C_EntradaAPrazo.Text<>zero
                   Then Begin
                            C_DinheiroAPrazo.Enabled:=True;
                            if C_DinheiroAPrazo.Text<>zero
                              Then Begin
                                       C_TrocoAPrazo.Text:=ArredondaNumero(FloatToSTr(StrToFloat(C_DinheiroAPrazo.Text)-StrToFloat(C_TotalAPrazo.Text)));
                                   End;
                        End
                   Else C_DinheiroAPrazo.Enabled:=False;
             End;
  End;


end.
