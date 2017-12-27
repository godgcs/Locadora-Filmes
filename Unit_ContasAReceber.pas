unit Unit_ContasAReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids,
  Vcl.ExtCtrls, Unit_Biblioteca;

type
  TFrm_ContasAReceber = class(TForm)
    Panel1: TPanel;
    Label_Cadastro: TLabel;
    StringGrid1: TStringGrid;
    Panel2: TPanel;
    Bt_Cancelar: TBitBtn;
    Bt_Receber: TBitBtn;
    procedure Bt_CancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AtualizaGridContas;
    Procedure OrdenaStringGridDatas;
    procedure Bt_ReceberClick(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_ContasAReceber: TFrm_ContasAReceber;

implementation

{$R *.dfm}

procedure TFrm_ContasAReceber.Bt_CancelarClick(Sender: TObject);
begin
    Close;
end;

procedure TFrm_ContasAReceber.Bt_ReceberClick(Sender: TObject);
var codigo,parcela:integer;
    Valor,Mensagem,conta,Multa:String;
    cod:Movimentacao;
begin
    if Lin>0
      Then Begin
               codigo:=StrToInt(StringGrid1.Cells[0,lin]);
               parcela:=StrToInt(StringGrid1.Cells[2,lin][1]);   //como sei q so pode ter 3 parcelar vou ler apenas a primeira posição
               conta:=STringGrid1.Cells[3,lin];
               multa:=STringGrid1.Cells[5,lin];
               valor:=FloatToStr(StrToFloat(conta)+StrToFloat(Multa));
               If multa=zero
                 Then mensagem:='Confirmar Recebimento da '+intToSTr(parcela)+' Parcela da Nota '+IntToStr(codigo)+
                      ' no valor de '+STringGrid1.Cells[3,lin]+'?'
                 Else mensagem:='Confirmar Recebimento da '+intToSTr(parcela)+' Parcela da Nota '+IntToStr(codigo)+
                      ' no valor de '+STringGrid1.Cells[3,lin]+
                      #13+'Com uma multa por atrazo de '+multa+'?'+#13+
                      'Totalizando um valor de '+ArredondaNumero(valor)+'.';
               If Application.MessageBox(PChar(mensagem),'Confirmar Recebimento',36)=6
                 Then Begin
                          //GeraRelatorio;
                          RecebePagamento(Valor);

                          cod.Descricao:='Recebimento Parcela';
                          cod.Valor:='+'+valor;
                          cod.Data:=date;
                          cod.Hora:=time;
                          CadastraMovimentacaoCaixa(cod,V_MovimentacaoCaixa);

                          RecebeParcela(Codigo,parcela);
                          ShowMessage('Recebimento Efetuado');
                          AtualizaGridContas;
                      End;
           End
      Else Begin
               ShowMessage('Conta não selecionada, Por Favor clique na Fatura');
           End;
end;

procedure TFrm_ContasAReceber.FormCreate(Sender: TObject);
begin
    lin:=0;
    StringGrid1.Cells[0,0]:='Codigo da Nota';
    StringGrid1.Cells[1,0]:='Cliente';
    StringGrid1.Cells[2,0]:='N° da Parcela';
    StringGrid1.Cells[3,0]:='Valor da Parcela';
    StringGrid1.Cells[4,0]:='Data de Vencimento';
    StringGrid1.Cells[5,0]:='Multa';

    AtualizaGridContas;
end;

procedure TFrm_ContasAReceber.AtualizaGridContas;
var i,j,linha:integer;
    Cliente:Clientes;
  Begin
      linha:=0;
      StringGrid1.RowCount:=Qtd_NotaAReceber_Ativo+1;
      for i := 0 to Length(V_NotaAReceber)-1 do
        Begin
            ind:=RetornaIndiceCliente(V_NotaAReceber[i].CodigoCliente);
            Cliente:=RetornaClienteEditar(ind);
            For j:=0 to Length(V_NotaAReceber[i].Parcelas)-1 do
              Begin
                  if not(V_NotaAReceber[i].Parcelas[j].Paga)
                    Then Begin
                             inc(linha);
                             StringGrid1.Cells[0,linha]:=intToSTr(V_NotaAReceber[i].Codigo);
                             StringGrid1.Cells[1,linha]:=IntToStr(Cliente.Codigo)+' - '+ Cliente.Nome;
                             StringGrid1.Cells[2,linha]:=intToSTr(V_NotaAReceber[i].Parcelas[j].NumParcela)+'° Parcela';
                             StringGrid1.Cells[3,linha]:=V_NotaAReceber[i].Parcelas[j].Valor;
                             StringGrid1.Cells[4,linha]:=DateToStr(V_NotaAReceber[i].Parcelas[j].DataVencimento);
                             StringGrid1.Cells[5,linha]:=CalculaMultaPagamentos(V_NotaAReceber[i].Parcelas[j].DataVencimento,V_NotaAReceber[i].Parcelas[j].Valor);
                         End;
              End;
        End;
      OrdenaStringGridDatas;
  End;

Procedure TFrm_ContasAReceber.OrdenaStringGridDatas;
var i,j:integer;
    aux2:String;
  Begin
      For j := 1 to StringGrid1.RowCount-2 do //limite menos -1 da linha 0 e -1 da ultima
        Begin
            For i := 1 to StringGrid1.RowCount-2 do
              Begin
                  if StrToDate(StringGrid1.Cells[4,i])>StrToDate(StringGrid1.Cells[4,i+1])
                    Then Begin
                            aux2:=StringGrid1.Cells[0,i];  //0 coluna   Codigo
                            StringGrid1.Cells[0,i]:=StringGrid1.Cells[0,i+1];
                            StringGrid1.Cells[0,i+1]:=aux2;

                            aux2:=StringGrid1.Cells[1,i];  //1 coluna   Cliente
                            StringGrid1.Cells[1,i]:=StringGrid1.Cells[1,i+1];
                            StringGrid1.Cells[1,i+1]:=aux2;

                            aux2:=StringGrid1.Cells[2,i];  //2 coluna   N° Parcela
                            StringGrid1.Cells[2,i]:=StringGrid1.Cells[2,i+1];
                            StringGrid1.Cells[2,i+1]:=aux2;

                            aux2:=StringGrid1.Cells[3,i];  //3 coluna   Valor da Parcela
                            StringGrid1.Cells[3,i]:=StringGrid1.Cells[3,i+1];
                            StringGrid1.Cells[3,i+1]:=aux2;

                            aux2:=StringGrid1.Cells[4,i];  //4 coluna   Data Vencimento
                            StringGrid1.Cells[4,i]:=StringGrid1.Cells[4,i+1];
                            StringGrid1.Cells[4,i+1]:=aux2;

                            aux2:=StringGrid1.Cells[5,i];  //4 coluna   Multa
                            StringGrid1.Cells[5,i]:=StringGrid1.Cells[5,i+1];
                            StringGrid1.Cells[5,i+1]:=aux2;

                        End;
              End;
        End;
  End;


procedure TFrm_ContasAReceber.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
    lin:=ARow;
end;

end.
