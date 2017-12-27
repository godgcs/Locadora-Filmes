unit Unit_Relatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Unit_Biblioteca,
  Vcl.Buttons, Data.DB, JvMemoryDataset, frxClass, frxDBSet, frxExportPDF,
  VCLTee.TeEngine, VCLTee.Series, VCLTee.TeeProcs, VCLTee.Chart, VCLTee.DBChart,
  Vcl.Grids, Vcl.DBGrids, VCLTee.TeeDBCrossTab;

type
  TFrm_Relatorio = class(TForm)
    frxPDFExport: TfrxPDFExport;
    JvMemoryDataClientes: TJvMemoryData;
    JvMemoryDataClientesCodigo: TIntegerField;
    JvMemoryDataClientesNome: TStringField;
    JvMemoryDataClientesCPF: TStringField;
    JvMemoryDataClientesSexo: TStringField;
    JvMemoryDataClientesEstCivil: TStringField;
    JvMemoryDataClientesDataNascimento: TStringField;
    JvMemoryDataClientesCidade: TStringField;
    JvMemoryDataClientesBairro: TStringField;
    JvMemoryDataClientesLagradouro: TStringField;
    JvMemoryDataClientesNum: TStringField;
    JvMemoryDataClientesTelefone: TStringField;
    JvMemoryDataClientesEmail: TStringField;
    DataSourceClientes: TDataSource;
    frxDBDatasetFilmes: TfrxDBDataset;
    frxReportFilme: TfrxReport;
    JvMemoryDataFilme: TJvMemoryData;
    DataSourceFilme: TDataSource;
    JvMemoryDataFilmeDescricao: TStringField;
    JvMemoryDataFilmeCodigoCategoria: TIntegerField;
    JvMemoryDataFilmeTipoFilme: TStringField;
    JvMemoryDataFilmePreco: TStringField;
    JvMemoryDataFilmeAudio: TStringField;
    JvMemoryDataFilmeExemplarDisponivel: TStringField;
    JvMemoryDataFilmeExemplarLucro: TStringField;
    JvMemoryDataFilmeCodigoFilme: TStringField;
    frxReportClientes: TfrxReport;
    frxDBDatasetPagarFilme: TfrxDBDataset;
    frxReportPagarFilme: TfrxReport;
    JvMemoryDataPagarFilme: TJvMemoryData;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField4: TStringField;
    DataSourcePagarFilme: TDataSource;
    JvMemoryDataPagarFilmePrecoFilme: TStringField;
    JvMemoryDataPagarFilmeRestanteLocacao: TStringField;
    frxReportLocacoes: TfrxReport;
    JvMemoryDataLocacoes: TJvMemoryData;
    DataSourceLocacoes: TDataSource;
    JvMemoryDataLocacoesCodigoLocacao: TIntegerField;
    JvMemoryDataLocacoesCodigoCliente: TIntegerField;
    JvMemoryDataLocacoesFuncionario: TStringField;
    JvMemoryDataLocacoesParcelas: TStringField;
    JvMemoryDataLocacoesEntrada: TStringField;
    JvMemoryDataLocacoesTotal: TStringField;
    JvMemoryDataLocacoesDataEmprestimo: TStringField;
    JvMemoryDataLocacoesDataLimiteDevolucao: TStringField;
    JvMemoryDataLocacoesCodigoCategoria: TIntegerField;
    JvMemoryDataLocacoesDataDevolvida: TStringField;
    JvMemoryDataLocacoesDevolvido: TStringField;
    JvMemoryDataLocacoesCodigoFilme: TStringField;
    frxDBDatasetLocacoes: TfrxDBDataset;
    frxDBDatasetClientes: TfrxDBDataset;
    frxReportContasAReceber: TfrxReport;
    JvMemoryDataContasAReceber: TJvMemoryData;
    DataSourceContasAReceber: TDataSource;
    frxDBDatasetContasAReceber: TfrxDBDataset;
    JvMemoryDataContasAReceberCodigoContaReceber: TIntegerField;
    JvMemoryDataContasAReceberCodigoCliente: TIntegerField;
    JvMemoryDataContasAReceberNumParcela: TIntegerField;
    JvMemoryDataContasAReceberDataVencimento: TStringField;
    JvMemoryDataContasAReceberValor: TStringField;
    JvMemoryDataContasAReceberDataPaga: TStringField;
    JvMemoryDataContasAReceberHoraPaga: TStringField;
    frxReportContasAPagar: TfrxReport;
    JvMemoryDataContasAPagar: TJvMemoryData;
    IntegerField1: TIntegerField;
    IntegerField3: TIntegerField;
    StringField3: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    DataSourceContasAPagar: TDataSource;
    frxDBDatasetContasAPagar: TfrxDBDataset;
    JvMemoryDataMovimentacaoCaixa: TJvMemoryData;
    DataSourceMovimentacaoCaixa: TDataSource;
    frxReportMovimentacaoCaixa: TfrxReport;
    frxDBDatasetMovimentacaoCaixa: TfrxDBDataset;
    JvMemoryDataMovimentacaoCaixaDescricao: TStringField;
    JvMemoryDataMovimentacaoCaixaValor: TStringField;
    JvMemoryDataMovimentacaoCaixaData: TStringField;
    JvMemoryDataMovimentacaoCaixaHora: TStringField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label14: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    C_ClienteFiltro: TComboBox;
    C_ClienteCodigo1: TComboBox;
    C_ClienteCodigo2: TComboBox;
    C_ClienteSexo: TComboBox;
    Bt_ClienteGerar: TBitBtn;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label7: TLabel;
    C_FilmeCodigo1: TComboBox;
    C_FilmeCodigo2: TComboBox;
    Bt_FilmeGerar: TBitBtn;
    TabSheet3: TTabSheet;
    Panel3: TPanel;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    Label6: TLabel;
    Bt_PagarFilmeGerar: TBitBtn;
    C_PagarFilmeCodigo1: TComboBox;
    C_PagarFilmeCodigo2: TComboBox;
    TabSheet4: TTabSheet;
    Panel4: TPanel;
    GroupBox4: TGroupBox;
    Label12: TLabel;
    Label15: TLabel;
    C_LocacaoFiltro: TComboBox;
    C_LocacaoFuncionario: TComboBox;
    Bt_LocacoesGerar: TBitBtn;
    TabSheet5: TTabSheet;
    Panel5: TPanel;
    GroupBox5: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label8: TLabel;
    C_ContaReceberFiltro: TComboBox;
    C_ContaReceberCodigo1: TComboBox;
    C_ContaReceberCodigo2: TComboBox;
    Bt_ContaReceberGerar: TBitBtn;
    C_ContaReceberData1: TDateTimePicker;
    C_ContaReceberData2: TDateTimePicker;
    TabSheet6: TTabSheet;
    Panel6: TPanel;
    GroupBox6: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    C_ContasAPagarFiltro: TComboBox;
    C_ContasAPagarCodigo1: TComboBox;
    C_ContasAPagarCodigo2: TComboBox;
    Bt_ContasAPagarGerar: TBitBtn;
    C_ContasAPagarData1: TDateTimePicker;
    C_ContasAPagarData2: TDateTimePicker;
    TabSheet7: TTabSheet;
    Panel7: TPanel;
    GroupBox7: TGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    Bt_MovimentacaoCaixaGerar: TBitBtn;
    C_MovimentacaoCaixaData1: TDateTimePicker;
    C_MovimentacaoCaixaData2: TDateTimePicker;
    TabSheet8: TTabSheet;
    PageControl2: TPageControl;
    TabSheet9: TTabSheet;
    Chart1: TChart;
    GroupBox8: TGroupBox;
    Label23: TLabel;
    Label26: TLabel;
    Bt_GraficosGerar: TBitBtn;
    C_GraficosData1: TDateTimePicker;
    C_GraficosData2: TDateTimePicker;
    TabSheet10: TTabSheet;
    GroupBox9: TGroupBox;
    Label27: TLabel;
    Label28: TLabel;
    Bt_GerarRelatorioLinha: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Chart2: TChart;
    Series1: TPieSeries;
    Series2: TLineSeries;

    procedure GravaDadosClientes;
    Procedure GravaDadosFilmes;
    Procedure GravaDadosPagarFilmes;
    Procedure GravaDadosLocacoes;
    Procedure GravaDadosContasAReceber;
    Procedure GravaDadosContasAPagar;
    Procedure GravaDadosMovimentacaoCaixa;
    Procedure GravaDadosGraficoPizza;
    Procedure GravaDadosGraficoLinha;

    Procedure GeraRelatorioClientes;
    Procedure GeraRelatorioFilmes;
    Procedure GeraRelatorioPagarFilmes;
    Procedure GeraRelatorioLocacoes;
    Procedure GeraRelatorioContasAReceber;
    Procedure GeraRelatorioContasAPagar;
    Procedure GeraRelatorioMovimentacaoCaixa;

    procedure C_ClienteFiltroSelect(Sender: TObject);
    procedure C_ClienteCodigo1Select(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Bt_ClienteGerarClick(Sender: TObject);
    procedure C_ClienteCodigo2Select(Sender: TObject);
    procedure Bt_FilmeGerarClick(Sender: TObject);
    procedure C_FilmeCodigo2Select(Sender: TObject);
    procedure C_PagarFilmeCodigo1Select(Sender: TObject);
    procedure C_PagarFilmeCodigo2Select(Sender: TObject);
    procedure Bt_PagarFilmeGerarClick(Sender: TObject);
    procedure C_LocacaoFiltroSelect(Sender: TObject);
    procedure C_LocacaoFuncionarioSelect(Sender: TObject);
    procedure Bt_LocacoesGerarClick(Sender: TObject);
    procedure C_FilmeCodigo1Select(Sender: TObject);
    procedure C_ContaReceberFiltroSelect(Sender: TObject);
    procedure C_ContaReceberCodigo1Select(Sender: TObject);
    procedure Bt_ContaReceberGerarClick(Sender: TObject);
    procedure C_ContaReceberCodigo2Select(Sender: TObject);
    procedure C_ContasAPagarFiltroSelect(Sender: TObject);
    procedure C_ContasAPagarCodigo1Select(Sender: TObject);
    procedure C_ContasAPagarCodigo2Select(Sender: TObject);
    procedure Bt_ContasAPagarGerarClick(Sender: TObject);
    procedure Bt_MovimentacaoCaixaGerarClick(Sender: TObject);
    procedure Bt_GraficosGerarClick(Sender: TObject);
    procedure Bt_GerarRelatorioLinhaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Relatorio: TFrm_Relatorio;

implementation

{$R *.dfm}

procedure TFrm_Relatorio.Bt_MovimentacaoCaixaGerarClick(Sender: TObject);
begin
    GravaDadosMovimentacaoCaixa;
    GeraRelatorioMovimentacaoCaixa;
    ShowMessage('Relatorio Emitido com Sucesso');
    Close;
end;

procedure TFrm_Relatorio.Bt_GerarRelatorioLinhaClick(Sender: TObject);
begin
    GravaDadosGraficoLinha;
    Chart2.Visible:=true;
    Bt_GerarRelatorioLinha.Enabled:=False;
end;

procedure TFrm_Relatorio.Bt_ClienteGerarClick(Sender: TObject);
begin
    GravaDadosClientes;
    GeraRelatorioClientes;
    ShowMessage('Relatorio Emitido com Sucesso');
    Close;
end;

procedure TFrm_Relatorio.Bt_ContaReceberGerarClick(Sender: TObject);
begin
    GravaDadosContasAReceber;
    GeraRelatorioContasAReceber;
    ShowMessage('Relatorio Emitido com Sucesso');
    Close;
end;

procedure TFrm_Relatorio.Bt_ContasAPagarGerarClick(Sender: TObject);
begin
    GravaDadosContasAPagar;
    GeraRelatorioContasAPagar;
    ShowMessage('Relatorio Emitido com Sucesso');
    Close;
end;

procedure TFrm_Relatorio.Bt_FilmeGerarClick(Sender: TObject);
begin
    GravaDadosFilmes;
    GeraRelatorioFilmes;
    ShowMessage('Relatorio Emitido com Sucesso');
    Close;
end;

procedure TFrm_Relatorio.Bt_GraficosGerarClick(Sender: TObject);
begin
    GravaDadosGraficoPizza;
    Chart1.Visible:=true;
    Bt_GraficosGerar.Enabled:=False;
    //
end;

procedure TFrm_Relatorio.Bt_LocacoesGerarClick(Sender: TObject);
begin
    GravaDadosLocacoes;
    GeraRelatorioLocacoes;
    ShowMessage('Relatorio Emitido com Sucesso');
    Close;
end;

procedure TFrm_Relatorio.Bt_PagarFilmeGerarClick(Sender: TObject);
begin
    GravaDadosPagarFilmes;
    GeraRelatorioPagarFilmes;
    ShowMessage('Relatorio Emitido com Sucesso');
    Close;
end;

procedure TFrm_Relatorio.C_ClienteCodigo1Select(Sender: TObject);
var i:integer;
begin
    C_ClienteCodigo2.Clear;
    if C_ClienteCodigo1.Text<>''
      Then Begin
               C_ClienteCodigo2.Enabled:=true;
               for i := 0 to length(V_Cliente)-1 do
                 Begin
                     if V_Cliente[i].Codigo>=StrToInt(C_ClienteCodigo1.Text)
                       Then Begin
                                if V_Cliente[i].Ativo
                                  Then C_ClienteCodigo2.Items.Add(IntToStr(V_Cliente[i].Codigo));
                            End;
                 End;
           End;
end;

procedure TFrm_Relatorio.C_ClienteCodigo2Select(Sender: TObject);
begin
    Bt_ClienteGerar.Enabled:=true;
end;

procedure TFrm_Relatorio.C_ClienteFiltroSelect(Sender: TObject);
var i:integer;
begin
    if C_ClienteFiltro.ItemIndex=0
      Then Begin
               C_ClienteCodigo1.Enabled:=true;
               C_ClienteCodigo1.Clear;
               for i := 0 to length(V_Cliente)-1 do
                 Begin
                     if V_Cliente[i].Ativo
                       Then C_ClienteCodigo1.Items.Add(IntToStr(V_Cliente[i].Codigo));
                 End;
               C_ClienteCodigo2.Enabled:=false;
               C_ClienteCodigo2.Clear;
               C_ClienteCodigo2.ItemIndex:=-1;
               C_ClienteSexo.Enabled:=false;
               C_ClienteSexo.ItemIndex:=-1;
               Bt_ClienteGerar.Enabled:=false;
           End
      Else Begin
               if C_ClienteFiltro.ItemIndex=1
                 Then Begin
                          C_ClienteCodigo1.Enabled:=false;
                          C_ClienteCodigo1.ItemIndex:=-1;
                          C_ClienteCodigo2.Enabled:=false;
                          C_ClienteCodigo2.ItemIndex:=-1;
                          C_ClienteSexo.Enabled:=True;
                          Bt_ClienteGerar.Enabled:=false;
                      End;
           End;
end;

procedure TFrm_Relatorio.C_ContaReceberCodigo1Select(Sender: TObject);
var i,j,k:integer;
    achou:boolean;
begin
    C_ContaReceberCodigo2.Clear;
    if C_ContaReceberCodigo1.Text<>''
      Then Begin
               C_ContaReceberCodigo2.Enabled:=true;
               {for i := 0 to length(V_NotaAReceber)-1 do
                 Begin
                     if V_NotaAReceber[i].Codigo>=StrToInt(C_ContaReceberCodigo1.Text)
                       Then Begin
                                for j := 0 to length(V_NotaAReceber[i].Parcelas)-1 do
                                  Begin
                                      if not(V_NotaAReceber[i].Parcelas[j].Paga)
                                        Then Begin
                                                 C_ContaReceberCodigo2.Items.Add(IntToStr(V_NotaAReceber[i].Codigo));
                                                 Break;
                                             End;
                                  End;
                            End;
                 End; }
               for i := 0 to Length(V_Cliente)-1 do
                 Begin
                     achou:=false;
                     if V_Cliente[i].Codigo>=StrToInt(C_ContaReceberCodigo1.Text)
                       Then Begin
                               for j := 0 to length(V_NotaAReceber)-1 do
                                 Begin
                                     if V_NotaAReceber[j].CodigoCliente=V_Cliente[i].Codigo
                                       Then Begin
                                                for k := 0 to length(V_NotaAReceber[j].Parcelas)-1 do
                                                  Begin
                                                      if not(V_NotaAReceber[j].Parcelas[k].Paga)
                                                        Then Begin
                                                                 C_ContaReceberCodigo2.Items.Add(IntToStr(V_Cliente[i].Codigo));
                                                                 achou:=true;
                                                             End;
                                                      if achou then Break;

                                                  End;
                                                if achou then Break;
                                            End;
                                 End;
                            End;
                 End;

           End;
end;

procedure TFrm_Relatorio.C_ContaReceberCodigo2Select(Sender: TObject);
begin
    Bt_ContaReceberGerar.Enabled:=true;
end;

procedure TFrm_Relatorio.C_ContaReceberFiltroSelect(Sender: TObject);
var i,j,k:integer;
    achou:boolean;
begin
    if C_ContaReceberFiltro.ItemIndex=0
      Then Begin
               C_ContaReceberCodigo1.Enabled:=true;
               C_ContaReceberCodigo1.Clear;
               for i := 0 to Length(V_Cliente)-1 do
                 Begin
                     achou:=false;
                     for j := 0 to length(V_NotaAReceber)-1 do
                       Begin
                           if V_NotaAReceber[j].CodigoCliente=V_Cliente[i].Codigo
                             Then Begin
                                      for k := 0 to length(V_NotaAReceber[j].Parcelas)-1 do
                                        Begin
                                            if not(V_NotaAReceber[j].Parcelas[k].Paga)
                                              Then Begin
                                                       C_ContaReceberCodigo1.Items.Add(IntToStr(V_Cliente[i].Codigo));
                                                       achou:=true;
                                                   End;
                                            if achou then Break;

                                        End;
                                      if achou then Break;
                                  End;
                       End;
                 End;

               C_ContaReceberCodigo2.Enabled:=false;
               C_ContaReceberCodigo2.Clear;
               C_ContaReceberData1.Enabled:=false;
               C_ContaReceberData2.Enabled:=false;
               Bt_ContaReceberGerar.Enabled:=false;
           End
      Else Begin
               if C_ContaReceberFiltro.ItemIndex=1
                 Then Begin
                          C_ContaReceberCodigo1.Enabled:=false;
                          C_ContaReceberCodigo1.ItemIndex:=-1;
                          C_ContaReceberCodigo2.Enabled:=false;
                          C_ContaReceberCodigo2.ItemIndex:=-1;
                          C_ContaReceberData1.Enabled:=True;
                          C_ContaReceberData2.Enabled:=True;
                          Bt_ContaReceberGerar.Enabled:=True;
                      End;
           End;
end;

procedure TFrm_Relatorio.C_ContasAPagarCodigo1Select(Sender: TObject);
var i,j:integer;
begin
    C_ContasAPagarCodigo2.Clear;
    if C_ContasAPagarCodigo1.Text<>''
      Then Begin
               C_ContasAPagarCodigo2.Enabled:=true;
               for i := 0 to length(V_NotaAPagar)-1 do
                 Begin
                     if V_NotaAPagar[i].Codigo>=StrToInt(C_ContasAPagarCodigo1.Text)
                       Then Begin
                                for j := 0 to length(V_NotaAPagar[i].Parcelas)-1 do
                                  Begin
                                      if not(V_NotaAPagar[i].Parcelas[j].Paga)
                                        Then Begin
                                                 C_ContasAPagarCodigo2.Items.Add(IntToStr(V_NotaAPagar[i].Codigo));
                                                 Break;
                                             End;
                                  End;
                            End;
                 End;
           End;
end;

procedure TFrm_Relatorio.C_ContasAPagarCodigo2Select(Sender: TObject);
begin
    Bt_ContasAPagarGerar.Enabled:=true;
end;

procedure TFrm_Relatorio.C_ContasAPagarFiltroSelect(Sender: TObject);
var i,j:integer;
begin
    if C_ContasAPagarFiltro.ItemIndex=0
      Then Begin
               C_ContasAPagarCodigo1.Enabled:=true;
               C_ContasAPagarCodigo1.Clear;
               for i := 0 to length(V_NotaAPagar)-1 do
                 Begin
                     for j := 0 to length(V_NotaAPagar[i].Parcelas)-1 do
                       Begin
                           if not(V_NotaAPagar[i].Parcelas[j].Paga)
                             Then Begin
                                      C_ContasAPagarCodigo1.Items.Add(IntToStr(V_NotaAPagar[i].Codigo));
                                      Break;
                                  End;
                       End;
                 End;
               C_ContasAPagarCodigo2.Enabled:=false;
               C_ContasAPagarCodigo2.Clear;
               C_ContasAPagarData1.Enabled:=false;
               C_ContasAPagarData2.Enabled:=false;
               Bt_ContasAPagarGerar.Enabled:=false;
           End
      Else Begin
               if C_ContasAPagarFiltro.ItemIndex=1
                 Then Begin
                          C_ContasAPagarCodigo1.Enabled:=false;
                          C_ContasAPagarCodigo1.ItemIndex:=-1;
                          C_ContasAPagarCodigo2.Enabled:=false;
                          C_ContasAPagarCodigo2.ItemIndex:=-1;
                          C_ContasAPagarData1.Enabled:=True;
                          C_ContasAPagarData2.Enabled:=True;
                          Bt_ContasAPagarGerar.Enabled:=True;
                      End;
           End;
end;

procedure TFrm_Relatorio.C_FilmeCodigo1Select(Sender: TObject);
var i:integer;
begin
    C_FilmeCodigo2.Clear;
    if C_FilmeCodigo1.Text<>''
      Then Begin
               C_FilmeCodigo2.Enabled:=true;
               for i := 0 to length(V_Filme)-1 do
                 Begin
                     if V_Filme[i].Codigo>=StrToInt(C_FilmeCodigo1.Text)
                       Then Begin
                                C_FilmeCodigo2.Items.Add(IntToStr(V_Filme[i].Codigo));
                            End;
                 End;
           End;
end;

procedure TFrm_Relatorio.C_FilmeCodigo2Select(Sender: TObject);
begin
    Bt_FilmeGerar.Enabled:=true;
end;

procedure TFrm_Relatorio.C_LocacaoFiltroSelect(Sender: TObject);
begin
    if C_LocacaoFiltro.ItemIndex=2
      Then Begin
               C_LocacaoFuncionario.Enabled:=true;
           End
      Else Begin
               if C_LocacaoFiltro.ItemIndex=1
                 Then Begin
                          Bt_LocacoesGerar.Enabled:=True;
                      End
                 Else Begin
                          if C_LocacaoFiltro.ItemIndex=0
                            Then Begin
                                     Bt_LocacoesGerar.Enabled:=True;
                                 End;

                      End;
           End;
end;

procedure TFrm_Relatorio.C_LocacaoFuncionarioSelect(Sender: TObject);
begin
    Bt_LocacoesGerar.Enabled:=true;
end;

procedure TFrm_Relatorio.C_PagarFilmeCodigo1Select(Sender: TObject);
var i:integer;
begin
    C_PagarFilmeCodigo2.Clear;
    if C_PagarFilmeCodigo1.Text<>''
      Then Begin
               C_PagarFilmeCodigo2.Enabled:=true;
               for i := 0 to length(V_Filme)-1 do
                 Begin
                     if V_Filme[i].Codigo >= StrToInt(C_PagarFilmeCodigo1.Text)
                       Then Begin
                                C_PagarFilmeCodigo2.Items.Add(IntToStr(V_Filme[i].Codigo));
                            End;
                 End;
           End;
end;

procedure TFrm_Relatorio.C_PagarFilmeCodigo2Select(Sender: TObject);
begin
    Bt_PagarFilmeGerar.Enabled:=true;
end;

procedure TFrm_Relatorio.FormCreate(Sender: TObject);
var i: Integer;
begin
    PageControl1.TabIndex:=0;
    PageControl2.TabIndex:=0;
    for i := 0 to Length(V_Filme)-1 do
      Begin
          if V_Filme[i].Ativo
            Then Begin
                     C_FilmeCodigo1.Items.Add(IntToStr(V_Filme[i].Codigo));
                     C_PagarFilmeCodigo1.Items.Add(IntToStr(V_Filme[i].Codigo));
                 End;
      End;

    C_LocacaoFuncionario.Items.Add('GERENTE');
    for i := 0 to length(V_Funcionario)-1 do
      Begin
          if V_Funcionario[i].Ativo
            Then Begin
                     C_LocacaoFuncionario.Items.Add(V_funcionario[i].Login);
                 End;
      End;
end;

Procedure TFrm_Relatorio.GravaDadosClientes;
var i: integer;
    Cliente:Clientes;
    validacao :boolean;
  Begin
      JvMemoryDataClientes.Active:=True;
      for i := Length(V_Cliente)-1 downto 0 do
        Begin
            validacao:=false;
            Cliente:=RetornaClienteEditar(i);
            if Cliente.Ativo
              Then Begin
                      if C_ClienteFiltro.ItemIndex=0
                        Then Begin
                                 if (Cliente.Codigo>=StrToInt(C_ClienteCodigo1.Text)) and
                                 (Cliente.Codigo<=StrToInt(C_ClienteCodigo2.Text))
                                   Then validacao:=true
                             End
                        Else Begin
                                 if  C_ClienteFiltro.ItemIndex=1
                                   Then Begin
                                            if Cliente.Sexo=C_ClienteSexo.Text
                                              Then validacao:=true
                                        End;
                             End;
                      if Validacao
                        Then Begin
                                 JvMemoryDataClientes.Insert;
                                 JvMemoryDataClientes.FieldByName('Codigo').AsInteger := Cliente.Codigo;
                                 JvMemoryDataClientes.FieldByName('Nome').AsSTring := Cliente.Nome;
                                 JvMemoryDataClientes.FieldByName('CPF').AsSTring := Cliente.CPF;
                                 JvMemoryDataClientes.FieldByName('Sexo').AsSTring := Cliente.Sexo;
                                 JvMemoryDataClientes.FieldByName('EstCivil').AsSTring := Cliente.EstCivil;
                                 JvMemoryDataClientes.FieldByName('DataNascimento').AsSTring := Cliente.DataNascimento;
                                 JvMemoryDataClientes.FieldByName('Cidade').AsSTring := Cliente.Cidade;
                                 JvMemoryDataClientes.FieldByName('Bairro').AsSTring := Cliente.Bairro;
                                 JvMemoryDataClientes.FieldByName('Lagradouro').AsSTring := Cliente.Lagradouro;
                                 JvMemoryDataClientes.FieldByName('Num').AsSTring := Cliente.Num;
                                 JvMemoryDataClientes.FieldByName('Telefone').AsSTring := Cliente.Telefone;
                                 JvMemoryDataClientes.FieldByName('Email').AsSTring := Cliente.Email;
                             End;
                   End;
        End;
  End;

Procedure TFrm_Relatorio.GravaDadosFilmes;
var i,j: integer;
    Filme:Filmes;
  Begin
      JvMemoryDataFilme.Active:=True;
      for i := Length(V_Filme)-1 downto 0 do
        Begin
            Filme:=RetornaFilmeEditar(i,V_Filme);
            if Filme.Ativo
              Then Begin
                       for j := Length(V_Filme[i].Exemplar)-1 downto 0 do
                         Begin
                             JvMemoryDataFilme.Insert;
                             JvMemoryDataFilme.FieldByName('CodigoFilme').AsSTring := intToSTr(Filme.Codigo)+'-'+intToSTr(Filme.Exemplar[j].SubCodigo);
                             JvMemoryDataFilme.FieldByName('Descricao').AsSTring := Filme.Descricao;
                             if Filme.Exemplar[j].Disponivel
                               Then JvMemoryDataFilme.FieldByName('ExemplarDisponivel').AsSTring := 'Disponivel'
                               Else JvMemoryDataFilme.FieldByName('ExemplarDisponivel').AsSTring := 'Indisponivel';
                             JvMemoryDataFilme.FieldByName('ExemplarLucro').AsSTring := Filme.Exemplar[j].Lucro;
                             JvMemoryDataFilme.FieldByName('CodigoCategoria').AsInteger := Filme.CodigoCategoria;
                             JvMemoryDataFilme.FieldByName('TipoFilme').AsSTring := Filme.TipoFilme;
                             JvMemoryDataFilme.FieldByName('Preco').AsSTring := Filme.Preco;
                             JvMemoryDataFilme.FieldByName('Audio').AsSTring := Filme.Audio;
                         End;
                   End;
        End;
  End;

Procedure TFrm_Relatorio.GravaDadosPagarFilmes;
var i,j,k: integer;
    Filme:Filmes;
    Categoria:Categorias;
    Restante,Divisao:string;
    inteiro:integer;
  Begin
      JvMemoryDataPagarFilme.Active:=True;
      for i := Length(V_Filme)-1 downto 0 do
        Begin
            Filme:=RetornaFilmeEditar(i,V_Filme);
            if Filme.Ativo
              Then Begin
                       for j := Length(V_Filme[i].Exemplar)-1 downto 0 do
                         Begin
                             JvMemoryDataPagarFilme.Insert;
                             JvMemoryDataPagarFilme.FieldByName('CodigoFilme').AsSTring := intToSTr(Filme.Codigo)+'-'+intToSTr(Filme.Exemplar[j].SubCodigo);
                             JvMemoryDataPagarFilme.FieldByName('Descricao').AsSTring := Filme.Descricao;
                             JvMemoryDataPagarFilme.FieldByName('ExemplarLucro').AsSTring := ArredondaNumero(Filme.Exemplar[j].Lucro);
                             JvMemoryDataPagarFilme.FieldByName('PrecoFilme').AsSTring := ArredondaNumero(Filme.Preco);
                             Restante:=ArredondaNumero(FloatToStr(StrToFloat(Filme.Preco)-StrToFloat(Filme.Exemplar[j].Lucro)));
                             if StrToFloat(restante)<=0
                               Then Restante:='Filme Pago'
                               Else Begin
                                        ind:=RetornaIndiceCategoria(filme.CodigoCategoria);
                                        Categoria:=RetornaCategoriaEditar(ind);
                                        Divisao:=ArredondaNumero(FloatToSTr(StrToFloat(Restante)/StrToFloat(Categoria.PrecoLocacao)));
                                        k:=pos(',',divisao);  //verifico decimal
                                        if k=0
                                          Then inteiro:=StrToInt(Divisao)
                                          Else Begin
                                                   inteiro:=StrToInt(copy(divisao,1,k-1))+1;
                                                   Restante:=IntToStr(inteiro);
                                               End;
                                    End;
                             JvMemoryDataPagarFilme.FieldByName('RestanteLocacao').AsSTring := Restante;
                         End;
                   End;
        End;
  End;

Procedure TFrm_Relatorio.GravaDadosLocacoes;
var i,j: integer;
    Locacao:NotasLocacao;
    Validacao :boolean;
  Begin

      JvMemoryDataLocacoes.Active:=True;
      for i := Length(V_NotaLocacao)-1 downto 0 do
        Begin
            Validacao:=false;
            Locacao:=RetornaLocaçãoEditar(i);
            if C_LocacaoFiltro.ItemIndex=0
              Then Begin
                       if V_NotaLocacao[i].QtdParcela=0
                        Then Begin
                                 validacao:=True;
                             End;
                   End
              Else Begin
                       if C_LocacaoFiltro.ItemIndex=1
                         Then Begin
                                  if V_NotaLocacao[i].QtdParcela<>0
                                    Then Begin
                                             Validacao:=True;
                                         End;
                              End
                         Else Begin
                                   if C_LocacaoFiltro.ItemIndex=2
                                     Then Begin
                                              if C_LocacaoFuncionario.Text='GERENTE'
                                                Then Begin
                                                         if V_NotaLocacao[i].Funcionario='GERENTE'
                                                           Then Validacao:=true;
                                                     End
                                                Else Begin
                                                         for j := 0 to Length(V_Funcionario)-1 do
                                                           Begin
                                                               if C_LocacaoFuncionario.Text=V_funcionario[j].Login
                                                                 Then Begin
                                                                          if V_NotaLocacao[i].Funcionario=V_funcionario[j].Login
                                                                            Then validacao:=true;
                                                                      End;
                                                           End;
                                                     End;
                                          End;
                              End;
                   End;
            if Validacao
              Then Begin
                       for j := 0 to length(Locacao.Filme)-1 do
                         Begin
                             JvMemoryDataLocacoes.Insert;
                             JvMemoryDataLocacoes.FieldByName('CodigoLocacao').AsInteger := Locacao.Codigo;
                             JvMemoryDataLocacoes.FieldByName('CodigoCliente').AsInteger := Locacao.CodigoCliente;
                             JvMemoryDataLocacoes.FieldByName('Funcionario').AsSTring := Locacao.Funcionario;
                             if Locacao.QtdParcela=0
                               Then JvMemoryDataLocacoes.FieldByName('Parcelas').AsSTring := 'A Vista'
                               Else JvMemoryDataLocacoes.FieldByName('Parcelas').AsSTring := intToSTr(Locacao.QtdParcela);
                             JvMemoryDataLocacoes.FieldByName('Entrada').AsSTring := Locacao.Entrada;
                             JvMemoryDataLocacoes.FieldByName('Total').AsSTring := Locacao.Total;
                             JvMemoryDataLocacoes.FieldByName('DataEmprestimo').AsSTring := DateToSTr(Locacao.Data);
                             JvMemoryDataLocacoes.FieldByName('DataLimiteDevolucao').AsSTring := DateToSTr(Locacao.DataDevolucao);
                             //Filmes---------------
                             JvMemoryDataLocacoes.FieldByName('CodigoFilme').AsSTring := Locacao.Filme[j].CodigoFilme;
                             JvMemoryDataLocacoes.FieldByName('CodigoCategoria').AsInteger := Locacao.Filme[j].CodigoCategoria;
                             if Locacao.Filme[j].DataDevolvida<StrToDate('01/01/1990')
                               Then JvMemoryDataLocacoes.FieldByName('DataDevolvida').AsSTring := '        -'
                               Else JvMemoryDataLocacoes.FieldByName('DataDevolvida').AsSTring := DateToStr(Locacao.Filme[j].DataDevolvida);
                             if Locacao.Filme[j].Devolvido
                               Then JvMemoryDataLocacoes.FieldByName('Devolvido').AsSTring := 'Sim'
                               Else JvMemoryDataLocacoes.FieldByName('Devolvido').AsSTring := 'Não';
                             //----------------
                         End;
                   End;
        End;
  End;

Procedure TFrm_Relatorio.GravaDadosContasAReceber;
var i,j: integer;
    Validacao :boolean;
  Begin
      JvMemoryDataContasAReceber.Active:=True;
      for i := Length(V_NotaAReceber)-1 downto 0 do
        Begin
            for j := length(V_NotaAReceber[i].Parcelas)-1 downto 0 do
              Begin
                  Validacao:=false;
                  if C_ContaReceberFiltro.ItemIndex=0
                    Then Begin
                             if (V_NotaAReceber[i].CodigoCliente>=StrToInt(C_ContaReceberCodigo1.Text)) and
                                (V_NotaAReceber[i].CodigoCliente<=StrToInt(C_ContaReceberCodigo2.Text))
                                 Then validacao:=True;
                         End
                    Else Begin
                             if C_ContaReceberFiltro.ItemIndex=1
                               Then Begin
                                        if (V_NotaAReceber[i].Parcelas[j].DataVencimento>=C_ContaReceberData1.Date) and
                                           (V_NotaAReceber[i].Parcelas[j].DataVencimento<=C_ContaReceberData2.Date)
                                            Then validacao:=True;
                                    End;
                         End;
                  if Validacao
                    Then Begin
                             if not(V_NotaAReceber[i].Parcelas[j].Paga)
                               Then Begin
                                        JvMemoryDataContasAReceber.Insert;
                                        JvMemoryDataContasAReceber.FieldByName('CodigoContaReceber').AsInteger := V_NotaAReceber[i].Codigo;
                                        JvMemoryDataContasAReceber.FieldByName('CodigoCliente').AsInteger := V_NotaAReceber[i].CodigoCliente;
                                        //Parcelas-----------------
                                        JvMemoryDataContasAReceber.FieldByName('NumParcela').AsInteger := V_NotaAReceber[i].Parcelas[j].NumParcela;
                                        JvMemoryDataContasAReceber.FieldByName('DataVencimento').AsSTring := DateToSTr(V_NotaAReceber[i].Parcelas[j].DataVencimento);
                                        JvMemoryDataContasAReceber.FieldByName('Valor').AsSTring := V_NotaAReceber[i].Parcelas[j].Valor;
                                        JvMemoryDataContasAReceber.FieldByName('DataPaga').AsSTring := '        -'; //como ainda não foi paga vou declarar direto que é vazio
                                        JvMemoryDataContasAReceber.FieldByName('HoraPaga').AsSTring := '        -'; //como ainda não foi paga vou declarar direto que é vazio
                                   End;
                         End;
                   End;
        End;
  End;

Procedure TFrm_Relatorio.GravaDadosContasAPagar;
var i,j: integer;
    Validacao :boolean;
  Begin
      JvMemoryDataContasAPagar.Active:=True;
      for i := Length(V_NotaAPagar)-1 downto 0 do
        Begin
            for j := length(V_NotaAPagar[i].Parcelas)-1 downto 0 do
              Begin
                  Validacao:=false;
                  if C_ContasAPagarFiltro.ItemIndex=0
                    Then Begin
                             if (V_NotaAPagar[i].Codigo>=StrToInt(C_ContasAPagarCodigo1.Text)) and
                                (V_NotaAPagar[i].Codigo<=StrToInt(C_ContasAPagarCodigo2.Text))
                                 Then validacao:=True;
                         End
                    Else Begin
                             if C_ContasAPagarFiltro.ItemIndex=1
                               Then Begin
                                        if (V_NotaAPagar[i].Parcelas[j].DataVencimento>=C_ContaReceberData1.Date) and
                                           (V_NotaAPagar[i].Parcelas[j].DataVencimento<=C_ContaReceberData2.Date)
                                            Then validacao:=True;
                                    End;
                         End;
                  if Validacao
                    Then Begin
                             if not(V_NotaAPagar[i].Parcelas[j].Paga)
                               Then Begin
                                        JvMemoryDataContasAPagar.Insert;
                                        JvMemoryDataContasAPagar.FieldByName('CodigoContasAPagar').AsInteger := V_NotaAPagar[i].Codigo;
                                        //Parcelas-----------------
                                        JvMemoryDataContasAPagar.FieldByName('NumParcela').AsInteger := V_NotaAPagar[i].Parcelas[j].NumParcela;
                                        JvMemoryDataContasAPagar.FieldByName('DataVencimento').AsSTring := DateToSTr(V_NotaAPagar[i].Parcelas[j].DataVencimento);
                                        JvMemoryDataContasAPagar.FieldByName('Valor').AsSTring := V_NotaAPagar[i].Parcelas[j].Valor;
                                        JvMemoryDataContasAPagar.FieldByName('DataPaga').AsSTring := '        -'; //como ainda não foi paga vou declarar direto que é vazio
                                        JvMemoryDataContasAPagar.FieldByName('HoraPaga').AsSTring := '        -'; //como ainda não foi paga vou declarar direto que é vazio
                                   End;
                         End;
                   End;
        End;
  End;

Procedure TFrm_Relatorio.GravaDadosMovimentacaoCaixa;
var i: integer;
  Begin
      JvMemoryDataMovimentacaoCaixa.Active:=True;
      for i := Length(V_MovimentacaoCaixa)-1 downto 0 do
        Begin
            if (V_MovimentacaoCaixa[i].Data>=C_MovimentacaoCaixaData1.Date) and
               (V_MovimentacaoCaixa[i].Data<=C_MovimentacaoCaixaData2.Date)
              Then Begin
                       JvMemoryDataMovimentacaoCaixa.Insert;
                       JvMemoryDataMovimentacaoCaixa.FieldByName('Descricao').AsSTring := V_MovimentacaoCaixa[i].Descricao;
                       JvMemoryDataMovimentacaoCaixa.FieldByName('Valor').AsSTring := V_MovimentacaoCaixa[i].Valor;
                       JvMemoryDataMovimentacaoCaixa.FieldByName('Data').AsSTring := DateToSTr(V_MovimentacaoCaixa[i].Data);
                       JvMemoryDataMovimentacaoCaixa.FieldByName('Hora').AsSTring := TimeToStr(V_MovimentacaoCaixa[i].Hora);
                   End;
        End;
  End;

Procedure TFrm_Relatorio.GravaDadosGraficoPizza;
type RelatorioPizza = Record
                       Nome:String;
                       qtd:integer;
     End;
var i,j: integer;
    Validacao : boolean;
    Qtd_Locacoes : array of RelatorioPizza;
    cor:TColor;
  Begin
      Setlength(Qtd_Locacoes,1);
      Qtd_Locacoes[0].Nome:='GERENTE';
      Qtd_Locacoes[0].qtd:=0;
      for i := 0 to length(V_Funcionario)-1 do
        Begin
            if V_Funcionario[i].Ativo
              Then Begin
                       Setlength(Qtd_Locacoes,length(Qtd_Locacoes)+1);
                       Qtd_Locacoes[length(Qtd_Locacoes)-1].Nome:=V_Funcionario[i].Login;
                       Qtd_Locacoes[length(Qtd_Locacoes)-1].qtd:=0;
                   End;
        End;

      for i := 0 to Length(V_NotaLocacao)-1 do
        Begin
            Validacao:=false;
            if (V_NotaLocacao[i].Data>=C_GraficosData1.Date) and
               (V_NotaLocacao[i].Data<=C_GraficosData2.Date)
               Then validacao:=True;
            if Validacao
              Then Begin
                       for j := 0 to length(Qtd_Locacoes)-1 do
                         Begin
                             if Qtd_Locacoes[j].Nome=V_NotaLocacao[i].Funcionario
                               Then Begin
                                        inc(Qtd_Locacoes[j].qtd);
                                        Break;
                                    End;
                         End;
                   End;
        End;
      for i := 0 to length(Qtd_Locacoes)-1 do
        Begin
            cor:=RGB(Random(255),Random(255),Random(255));
            Chart1.Series[0].Add(Qtd_Locacoes[i].qtd,Qtd_Locacoes[i].Nome,cor);
        End;
  End;

Procedure TFrm_Relatorio.GravaDadosGraficoLinha;
type RelatorioLinha = Record
                       Dia:TDate;
                       qtd:integer;
     End;
var i,j: integer;
    Validacao : boolean;
    Qtd_Locacoes : array of RelatorioLinha;
    cor:TColor;
  Begin
      Setlength(Qtd_Locacoes,0);

      For i := 0 to length(V_NotaLocacao)-1 do
        Begin
            if length(Qtd_Locacoes)=0
              Then Begin
                       SetLength(Qtd_Locacoes,1);
                       Qtd_Locacoes[0].Dia:=V_NotaLocacao[i].Data;
                       Qtd_Locacoes[0].qtd:=1;
                   End
              Else Begin
                       Validacao:=false;
                       for j := 0 to length(Qtd_Locacoes)-1 do
                         Begin
                             if V_NotaLocacao[i].Data=Qtd_Locacoes[j].Dia
                              Then Begin
                                       ind:=j;
                                       Validacao:=True;
                                       Break;
                                   End;
                         End;
                       if not(Validacao)
                         Then Begin
                                  SetLength(Qtd_Locacoes,length(Qtd_Locacoes)+1);
                                  Qtd_Locacoes[Length(Qtd_Locacoes)-1].Dia:=V_NotaLocacao[i].Data;
                                  Qtd_Locacoes[Length(Qtd_Locacoes)-1].qtd:=1;
                              End
                         Else Begin
                                  inc(Qtd_Locacoes[ind].qtd);
                              End;
                   End;
        End;
      for i := 0 to length(Qtd_Locacoes)-1 do
        Begin
            cor:=RGB(Random(255),Random(255),Random(255));
            Chart2.Series[0].Add(Qtd_Locacoes[i].qtd,DateToStr(Qtd_Locacoes[i].Dia),cor);
        End;
  End;

Procedure TFrm_Relatorio.GeraRelatorioClientes;
var data,hora:String;
  Begin
      //frxReportClientes.ShowReport(True);
      data:=FormatDateTime ('dd-mm-yyyy',now);
      hora:=FormatDateTime('hh-nn',now);
      frxPDFExport.FileName :='Clientes_'+data+'_'+Hora+'.pdf';
      frxPDFExport.DefaultPath := 'C:\Relatorios\RelatoriosEmpresariais';
      frxPDFExport.ShowDialog := False;
      frxPDFExport.ShowProgress := False;
      frxPDFExport.OverwritePrompt := False;
      frxReportClientes.PrepareReport();
      frxReportClientes.Export(frxPDFExport);
  End;

Procedure TFrm_Relatorio.GeraRelatorioFilmes;
var data,hora:String;
  Begin
      //frxReportFilme.ShowReport(True);
      data:=FormatDateTime ('dd-mm-yyyy',now);
      hora:=FormatDateTime('hh-nn',now);
      frxPDFExport.FileName :='Filmes_'+data+'_'+Hora+'.pdf';
      frxPDFExport.DefaultPath := 'C:\Relatorios\RelatoriosEmpresariais';
      frxPDFExport.ShowDialog := False;
      frxPDFExport.ShowProgress := False;
      frxPDFExport.OverwritePrompt := False;
      frxReportFilme.PrepareReport();
      frxReportFilme.Export(frxPDFExport);
  End;

Procedure TFrm_Relatorio.GeraRelatorioPagarFilmes;
var data,hora:String;
  Begin
      //frxReportPagarFilme.ShowReport(True);
      data:=FormatDateTime ('dd-mm-yyyy',now);
      hora:=FormatDateTime('hh-nn',now);
      frxPDFExport.FileName :='RestantePagarFilmes_'+data+'_'+Hora+'.pdf';
      frxPDFExport.DefaultPath := 'C:\Relatorios\RelatoriosEmpresariais';
      frxPDFExport.ShowDialog := False;
      frxPDFExport.ShowProgress := False;
      frxPDFExport.OverwritePrompt := False;
      frxReportPagarFilme.PrepareReport();
      frxReportPagarFilme.Export(frxPDFExport);
  End;

Procedure TFrm_Relatorio.GeraRelatorioLocacoes;
var data,hora:String;
  Begin
      //frxReportLocacoes.ShowReport(True);
      data:=FormatDateTime ('dd-mm-yyyy',now);
      hora:=FormatDateTime('hh-nn',now);
      frxPDFExport.FileName :='Locacoes_'+data+'_'+Hora+'.pdf';
      frxPDFExport.DefaultPath := 'C:\Relatorios\RelatoriosEmpresariais';
      frxPDFExport.ShowDialog := False;
      frxPDFExport.ShowProgress := False;
      frxPDFExport.OverwritePrompt := False;
      frxReportLocacoes.PrepareReport();
      frxReportLocacoes.Export(frxPDFExport);
  End;

Procedure TFrm_Relatorio.GeraRelatorioContasAReceber;
var data,hora:String;
  Begin
      //frxReportContasAReceber.ShowReport(True);
      data:=FormatDateTime ('dd-mm-yyyy',now);
      hora:=FormatDateTime('hh-nn',now);
      frxPDFExport.FileName :='ContasAReceber_'+data+'_'+Hora+'.pdf';
      frxPDFExport.DefaultPath := 'C:\Relatorios\RelatoriosEmpresariais';
      frxPDFExport.ShowDialog := False;
      frxPDFExport.ShowProgress := False;
      frxPDFExport.OverwritePrompt := False;
      frxReportContasAReceber.PrepareReport();
      frxReportContasAReceber.Export(frxPDFExport);
  End;

Procedure TFrm_Relatorio.GeraRelatorioContasAPagar;
var data,hora:String;
  Begin
      //frxReportContasAPagar.ShowReport(True);
      data:=FormatDateTime ('dd-mm-yyyy',now);
      hora:=FormatDateTime('hh-nn',now);
      frxPDFExport.FileName :='ContasAPagar_'+data+'_'+Hora+'.pdf';
      frxPDFExport.DefaultPath := 'C:\Relatorios\RelatoriosEmpresariais';
      frxPDFExport.ShowDialog := False;
      frxPDFExport.ShowProgress := False;
      frxPDFExport.OverwritePrompt := False;
      frxReportContasAPagar.PrepareReport();
      frxReportContasAPagar.Export(frxPDFExport);
  End;

Procedure TFrm_Relatorio.GeraRelatorioMovimentacaoCaixa;
var data,hora:String;
  Begin
      //frxReportMovimentacaoCaixa.ShowReport(True);
      data:=FormatDateTime ('dd-mm-yyyy',now);
      hora:=FormatDateTime('hh-nn',now);
      frxPDFExport.FileName :='MovimentacaoCaixa_'+data+'_'+Hora+'.pdf';
      frxPDFExport.DefaultPath := 'C:\Relatorios\RelatoriosEmpresariais';
      frxPDFExport.ShowDialog := False;
      frxPDFExport.ShowProgress := False;
      frxPDFExport.OverwritePrompt := False;
      frxReportMovimentacaoCaixa.PrepareReport();
      frxReportMovimentacaoCaixa.Export(frxPDFExport);
  End;

end.
