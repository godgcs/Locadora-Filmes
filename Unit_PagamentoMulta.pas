unit Unit_PagamentoMulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, frxClass, frxExportPDF,
  frxDBSet, Data.DB, JvMemoryDataset, Vcl.Grids, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.Mask, Unit_Biblioteca;

type
  TFrm_PagamentoMulta = class(TForm)
    DataSource1: TDataSource;
    JvMemoryData1: TJvMemoryData;
    JvMemoryData1CodigoLocacao: TIntegerField;
    JvMemoryData1CodigoCliente: TIntegerField;
    JvMemoryData1Cliente: TStringField;
    JvMemoryData1CPFCliente: TStringField;
    JvMemoryData1Total: TStringField;
    JvMemoryData1NomeEmpresa: TStringField;
    JvMemoryData1CNPJEmpresa: TStringField;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label17: TLabel;
    Label14: TLabel;
    Label4: TLabel;
    Label13: TLabel;
    C_CPF: TMaskEdit;
    C_CodigoCliente: TEdit;
    C_CodigoLocacao: TEdit;
    C_Cliente: TEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    C_TotalAVista: TEdit;
    Bt_FinalizarAVista: TBitBtn;
    C_DinheiroAVista: TEdit;
    C_TrocoAVista: TEdit;
    BitBtn1: TBitBtn;
    procedure Bt_FinalizarAVistaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure C_DinheiroAVistaExit(Sender: TObject);
    procedure C_DinheiroAVistaKeyPress(Sender: TObject; var Key: Char);
    procedure C_DinheiroAVistaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure GeraRelatorio;
    procedure GravaDadosMemoriaVirtual;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_PagamentoMulta: TFrm_PagamentoMulta;

implementation

{$R *.dfm}

procedure TFrm_PagamentoMulta.BitBtn1Click(Sender: TObject);
begin
    If(Application.MessageBox('Deseja realmente Cancelar?','Cancelar Pagamento',36)=6)
      Then Begin
               Close;
           End;
end;

procedure TFrm_PagamentoMulta.Bt_FinalizarAVistaClick(Sender: TObject);
var cod:Movimentacao;
begin
    If(Application.MessageBox('Deseja Confirmar a Emissão da Nota?','Confirmar Pagamento',36)=6)
      Then Begin
               GeraRelatorio;

               RecebePagamento(C_TotalAVista.Text);

               cod.Descricao:='Pagamento Multa Locação';
               cod.Valor:='+'+C_TotalAVista.Text;
               cod.Data:=Date;
               cod.Hora:=Time;
               CadastraMovimentacaoCaixa(cod,V_MovimentacaoCaixa);
               ConfirmaPagamento:=True;
               Close;
           End;
end;

procedure TFrm_PagamentoMulta.C_DinheiroAVistaExit(Sender: TObject);
begin
    C_DinheiroAVista.Text:=ArredondaNumero(C_DinheiroAVista.Text);
end;

procedure TFrm_PagamentoMulta.C_DinheiroAVistaKeyPress(Sender: TObject;
  var Key: Char);
begin
    Key:=VerificaTeclaNumeroReal(C_DinheiroAVista.Text,Key);
end;

procedure TFrm_PagamentoMulta.C_DinheiroAVistaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if C_DinheiroAVista.Text=''
      Then C_DinheiroAVista.Text:=zero;
    if C_DinheiroAVista.Text<>zero
      Then Begin
               C_TrocoAVista.Text:=ArredondaNumero(FloatToSTr(StrToFloat(C_DinheiroAVista.Text)-StrToFloat(C_TotalAVista.Text)));
           End;
end;

procedure TFrm_PagamentoMulta.FormCreate(Sender: TObject);
var Cliente:Clientes;
begin
    C_CodigoLocacao.Text:=IntToStr(V_TempNotaLocacao.Codigo);
    C_CodigoCliente.Text:=IntToSTr(V_TempNotaLocacao.CodigoCliente);
    ind:=RetornaIndiceCliente(V_TempNotaLocacao.CodigoCliente);
    Cliente:=RetornaClienteEditar(ind);
    C_Cliente.Text:=Cliente.Nome;
    C_CPF.Text:=Cliente.CPF;
    C_TotalAVista.Text:=ArredondaNumero(Multa);

    GravaDadosMemoriaVirtual;
end;

Procedure TFrm_PagamentoMulta.GeraRelatorio;
var data,hora:String;
  Begin
      data:=FormatDateTime ('dd-mm-yyyy',now);
      hora:=FormatDateTime('hh-nn',now);
      frxPDFExport1.FileName := data+'_'+Hora+'.pdf';
      frxPDFExport1.DefaultPath := 'C:\Relatorios\Multas\';
      frxPDFExport1.ShowDialog := False;
      frxPDFExport1.ShowProgress := False;
      frxPDFExport1.OverwritePrompt := False;
      FrxReport1.PrepareReport();
      FrxReport1.Export(frxPDFExport1);
  End;

procedure TFrm_PagamentoMulta.GravaDadosMemoriaVirtual;
  Begin
      JvMemoryData1.Active:=True;
      //JvMemoryData1.Edit;
      //JvMemoryData1.Insert;
      //for i := Temp_Qtd_Filmes-1 Downto 0 do
       // Begin
            JvMemoryData1.Insert;
            JvMemoryData1.FieldByName('CodigoLocacao').AsInteger := V_TempNotaLocacao.Codigo;
            JvMemoryData1.FieldByName('CodigoCliente').AsInteger := V_TempNotaLocacao.CodigoCliente;
            JvMemoryData1.FieldByName('Cliente').AsSTring := C_Cliente.Text;
            JvMemoryData1.FieldByName('CPFCliente').AsSTring := C_CPF.Text;
            JvMemoryData1.FieldByName('Total').AsSTring := C_TotalAVista.Text;
            JvMemoryData1.FieldByName('NomeEmpresa').AsSTring := V_Empresa.NomeEmpresa;
            JvMemoryData1.FieldByName('CNPJEmpresa').AsSTring := V_Empresa.CNPJ;
       // End;

      //JvMemoryData1.Insert;

  End;

end.
