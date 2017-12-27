unit Unit_PagamentoEntradaFilme;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Unit_Biblioteca, Data.DB,
  frxClass, Datasnap.DBClient, Vcl.DBCtrls, JvMemoryDataset, frxDBSet,
  frxExportPDF, DateUtils;

type
  TFrm_PagamentoEntradaFilme = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label15: TLabel;
    Label14: TLabel;
    Label13: TLabel;
    Label17: TLabel;
    C_Frete: TEdit;
    C_Imposto: TEdit;
    C_CNPJ: TMaskEdit;
    C_Fornecedor: TEdit;
    RadioGroup1: TRadioGroup;
    Bt_FormaPagamento: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    C_TotalAVista: TEdit;
    TabSheet2: TTabSheet;
    Label8: TLabel;
    Label9: TLabel;
    C_ParcelasAPrazo: TComboBox;
    C_EntradaAPrazo: TEdit;
    JvMemoryData1: TJvMemoryData;
    DataSource1: TDataSource;
    JvMemoryData1PreçoCusto: TStringField;
    JvMemoryData1Descrição: TStringField;
    JvMemoryData1Quantidade: TIntegerField;
    JvMemoryData1Total: TStringField;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    StringGrid1: TStringGrid;
    JvMemoryData1Frete: TStringField;
    JvMemoryData1Imposto: TStringField;
    JvMemoryData1Fornecedor: TStringField;
    JvMemoryData1CNPJ: TStringField;
    frxPDFExport1: TfrxPDFExport;
    JvMemoryData1TotalCompra: TStringField;
    JvMemoryData1NomeEmpresa: TStringField;
    JvMemoryData1CNPJEmpresa: TStringField;
    Bt_FinalizarAVista: TBitBtn;
    Bt_AcrescentarFilmes: TBitBtn;
    Label3: TLabel;
    C_CaixaDisponivelAVista: TEdit;
    StringGrid2: TStringGrid;
    Bt_FinalizarAPrazo: TBitBtn;
    Label10: TLabel;
    C_TotalAPrazo: TEdit;
    C_CaixaDisponivelAPrazo: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    C_CodigoFornecedor: TEdit;
    Label5: TLabel;
    C_CodigoEntrada: TEdit;
    JvMemoryData1CodigoFornecedor: TIntegerField;
    JvMemoryData1CodigoEntrada: TIntegerField;
    procedure Bt_FormaPagamentoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure C_EntradaAPrazoKeyPress(Sender: TObject; var Key: Char);
    procedure C_DinheiroAPrazoKeyPress(Sender: TObject; var Key: Char);
    Procedure AtualizaGridPagamentoEntradaFilme;
    Procedure AtualizaGridParcelas;
    procedure GravaDadosMemoriaVirtual;
    procedure GeraRelatorio;
    procedure Bt_AcrescentarFilmesClick(Sender: TObject);
    procedure C_ParcelasAPrazoSelect(Sender: TObject);
    procedure C_EntradaAPrazoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_FinalizarAPrazoClick(Sender: TObject);
    procedure Bt_FinalizarAVistaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_PagamentoEntradaFilme: TFrm_PagamentoEntradaFilme;
  Total:String;
  parcela:Integer;

implementation

{$R *.dfm}

procedure TFrm_PagamentoEntradaFilme.Bt_AcrescentarFilmesClick(Sender: TObject);
begin
    Close;
end;

procedure TFrm_PagamentoEntradaFilme.Bt_FinalizarAPrazoClick(Sender: TObject);
var Datas,ValorParcela:String;
    i:integer;
    cod:NotasAPagar;
    cod2:Movimentacao;
begin
    Datas:='';
    For i := 1 to parcela do     //PEGO TODAS AS DATAS
      Begin
          Datas:=Datas+StringGrid2.Cells[1,i]+'-';   //Concatenação das datas das parcelas
      End;
    ValorParcela:=StringGrid2.Cells[2,1];

    If C_ParcelasAPrazo.Text<>''
      Then Begin
               V_TempNotaEntrada.QtdParcela:=Parcela;
               V_TempNotaEntrada.Entrada:=C_EntradaAPrazo.Text;
               if VerificaPagarContaAvista(V_TempNotaEntrada.Entrada)
                 Then Begin
                         If(Application.MessageBox('Deseja Confirmar a Emissão da Nota?','Confirmar Nota',36)=6)
                           Then Begin
                                    GeraRelatorio;
                                    DescontaPagamento(V_TempNotaEntrada.Entrada);

                                    If StrToFloat(V_TempNotaEntrada.Entrada)>0
                                      Then Begin
                                               cod2.Descricao:='Pagamento de Entrada "Nota de Entrada"';
                                               cod2.Valor:='-'+V_TempNotaEntrada.Entrada;
                                               cod2.Data:=Date;
                                               cod2.Hora:=Time;
                                               CadastraMovimentacaoCaixa(cod2,V_MovimentacaoCaixa);
                                           End;

                                    ConfirmaPagamento:=True;
                                    CadastraNotaEntrada(V_TempNotaEntrada,V_NotaEntrada);
                                    inc(Qtd_NotaEntrada);

                                    cod:=PreCadastraContaAPagar(V_TempNotaEntrada,Datas,ValorParcela);
                                    CadastraContaAPagar(cod,V_NotaAPagar);
                                    //Qtd_NotaAPagar_Ativo:=Qtd_NotaAPagar_Ativo+V_TempNotaEntrada.QtdParcela;
                                    ShowMessage('Nota Fical Emitida com Sucesso');

                                    Close;
                                End;
                      End
                 Else Begin
                          ShowMessage('Saldo Insuficiente para pagar À Vista');
                      End;
           End
      Else ShowMessage('Por favor selecione quantas parcelas.');
end;

procedure TFrm_PagamentoEntradaFilme.Bt_FinalizarAVistaClick(Sender: TObject);
var ValorConta:String;
    cod:Movimentacao;
begin
    ValorConta:=V_TempNotaEntrada.Total;
    V_TempNotaEntrada.QtdParcela:=0;
    V_TempNotaEntrada.Entrada:=zero;
    if VerificaPagarContaAvista(ValorConta)
      Then Begin

              If(Application.MessageBox('Deseja Confirmar a Emissão da Nota?','Confirmar Nota',36)=6)
                Then Begin
                         GeraRelatorio;
                         DescontaPagamento(ValorConta);

                         cod.Descricao:='Pagamento A Vista Entrada Filme';
                         cod.Valor:='-'+ValorConta;
                         cod.Data:=Date;
                         cod.Hora:=Time;
                         CadastraMovimentacaoCaixa(cod,V_MovimentacaoCaixa);

                         ConfirmaPagamento:=True;
                         CadastraNotaEntrada(V_TempNotaEntrada,V_NotaEntrada);
                         inc(Qtd_NotaEntrada);

                         ShowMessage('Nota Fical Emitida com Sucesso');

                         Close;
                     End;
           End
      Else Begin
               ShowMessage('Saldo Insuficiente para pagar Avista');
           End;
end;

procedure TFrm_PagamentoEntradaFilme.Bt_FormaPagamentoClick(Sender: TObject);
begin
    Case RadioGroup1.ItemIndex of
      0:Begin
            PageControl1.Visible:=True;
            PageControl1.Pages[0].TabVisible:=True;
            PageControl1.Pages[1].TabVisible:=False;
            C_TotalAVista.Text:=V_TempNotaEntrada.Total;
            C_CaixaDisponivelAVista.Text:=V_Caixa;
        End;
      1:Begin
            PageControl1.Visible:=True;
            PageControl1.Pages[0].TabVisible:=False;
            PageControl1.Pages[1].TabVisible:=True;
            C_TotalAPrazo.Text:=V_TempNotaEntrada.Total;
            C_CaixaDisponivelAPrazo.Text:=V_Caixa;

            StringGrid2.Cells[0,0]:='Parcelas';
            StringGrid2.Cells[1,0]:='Data';
            StringGrid2.Cells[2,0]:='Valor (R$)';
        End;
    End;
end;

procedure TFrm_PagamentoEntradaFilme.C_EntradaAPrazoKeyPress(Sender: TObject;
  var Key: Char);
begin
    Key:=VerificaTeclaNumeroReal(C_EntradaAPrazo.Text,Key);
end;

procedure TFrm_PagamentoEntradaFilme.C_EntradaAPrazoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if C_EntradaAPrazo.Text=''
      Then C_EntradaAPrazo.Text:='0,00';
    if C_ParcelasAPrazo.Text<>''
      Then AtualizaGridParcelas;
end;

procedure TFrm_PagamentoEntradaFilme.C_ParcelasAPrazoSelect(Sender: TObject);
  Begin
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
  End;

procedure TFrm_PagamentoEntradaFilme.C_DinheiroAPrazoKeyPress(Sender: TObject; var Key: Char);
begin
    if not(key in ['0'..'9',',',#8])
      Then key:=#0;
end;

procedure TFrm_PagamentoEntradaFilme.FormCreate(Sender: TObject);
var Fornecedor:Fornecedores;
begin
    C_CodigoEntrada.Text:=IntToStr(V_TempNotaEntrada.CodigoEntrada);
    C_CodigoFornecedor.Text:=IntToStr(V_TempNotaEntrada.CodigoFornecedor);
    ind:=RetornaIndiceFornecedor(V_TempNotaEntrada.CodigoFornecedor);
    Fornecedor:=RetornaFornecedorEditar(ind);
    C_Fornecedor.Text:=Fornecedor.Nome;
    C_CNPJ.Text:=Fornecedor.CNPJ;
    C_Imposto.Text:=V_TempNotaEntrada.Imposto;
    C_Frete.Text:=V_TempNotaEntrada.Frete;

    GravaDadosMemoriaVirtual;
    AtualizaGridPagamentoEntradaFilme;
end;

procedure TFrm_PagamentoEntradaFilme.GravaDadosMemoriaVirtual;
var i: integer;
  Begin


      JvMemoryData1.Active:=True;
      //JvMemoryData1.Edit;
      //JvMemoryData1.Insert;
      for i := 0 to Temp_Qtd_Filmes-1 do
        Begin
            JvMemoryData1.Insert;
            JvMemoryData1.FieldByName('Descrição').AsSTring := V_TempNotaEntrada.Filme[i].Descricao;
            JvMemoryData1.FieldByName('Preço Custo').AsSTring := V_TempNotaEntrada.Filme[i].PrecoCusto;
            JvMemoryData1.FieldByName('Quantidade').AsInteger := V_TempNotaEntrada.Filme[i].Quantidade;
            JvMemoryData1.FieldByName('Total').AsSTring := FloatToStr(StrToFloat(V_TempNotaEntrada.Filme[i].PrecoCusto)*V_TempNotaEntrada.Filme[i].Quantidade);

            JvMemoryData1.FieldByName('CodigoEntrada').AsInteger := StrToInt(C_CodigoEntrada.Text);
            JvMemoryData1.FieldByName('CodigoFornecedor').AsInteger := StrToInt(C_CodigoFornecedor.Text);
            JvMemoryData1.FieldByName('Fornecedor').AsSTring := C_Fornecedor.Text;
            JvMemoryData1.FieldByName('CNPJ').AsSTring := C_CNPJ.Text;
            JvMemoryData1.FieldByName('Imposto').AsSTring := V_TempNotaEntrada.Imposto;
            JvMemoryData1.FieldByName('Frete').AsSTring := V_TempNotaEntrada.Frete;
            JvMemoryData1.FieldByName('NomeEmpresa').AsSTring := V_Empresa.NomeEmpresa;
            JvMemoryData1.FieldByName('CNPJEmpresa').AsSTring := V_Empresa.CNPJ;
            JvMemoryData1.FieldByName('TotalCompra').AsSTring := V_TempNotaEntrada.Total;
        End;

      //JvMemoryData1.Insert;

  End;

Procedure TFrm_PagamentoEntradaFilme.AtualizaGridParcelas;
var ValorParcela:string;
    i:integer;
    Data,ProxPagamento:TDate;
  Begin
      StringGrid2.RowCount:=parcela+1;
      ValorParcela:=FloatToStr((StrToFloat(C_TotalAPrazo.Text)-StrToFloat(C_EntradaAPrazo.Text))/parcela);
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

Procedure TFrm_PagamentoEntradaFilme.AtualizaGridPagamentoEntradaFilme;
var i :integer;
  Begin
    StringGrid1.RowCount:=Temp_Qtd_Filmes+2;
    StringGrid1.Cells[0,0]:='Descrição';
    StringGrid1.Cells[1,0]:='Preço Custo';
    StringGrid1.Cells[2,0]:='Quantidade';
    StringGrid1.Cells[3,0]:='Total';

    for i := 1 to Temp_Qtd_Filmes do
      Begin
          StringGrid1.Cells[0,i]:=V_TempNotaEntrada.Filme[i-1].Descricao;
          StringGrid1.Cells[1,i]:=V_TempNotaEntrada.Filme[i-1].PrecoCusto;
          StringGrid1.Cells[2,i]:=IntToStr(V_TempNotaEntrada.Filme[i-1].Quantidade);
          StringGrid1.Cells[3,i]:=FloatToStr(V_TempNotaEntrada.Filme[i-1].Quantidade*StrToFloat(V_TempNotaEntrada.Filme[i-1].PrecoCusto));
      End;
    StringGrid1.Cells[0,Temp_Qtd_Filmes+1]:='Total';
    StringGrid1.Cells[1,Temp_Qtd_Filmes+1]:='';
    StringGrid1.Cells[2,Temp_Qtd_Filmes+1]:='';
    StringGrid1.Cells[3,Temp_Qtd_Filmes+1]:=V_TempNotaEntrada.Total;
  End;

Procedure TFrm_PagamentoEntradaFilme.GeraRelatorio;
var data,hora:String;
  Begin
      V_TempNotaEntrada.Data:=Date;
      V_TempNotaEntrada.Hora:=FormatDateTime('hh:nn',now);
      data:=FormatDateTime ('dd-mm-yyyy',now);
      hora:=FormatDateTime('hh-nn',now);
      frxPDFExport1.FileName := data+'_'+Hora+'.pdf';
      frxPDFExport1.DefaultPath := 'C:\Relatorios\EntradaFilmes';
      frxPDFExport1.ShowDialog := False;
      frxPDFExport1.ShowProgress := False;
      frxPDFExport1.OverwritePrompt := False;
      FrxReport1.PrepareReport();
      FrxReport1.Export(frxPDFExport1);
  End;

end.
