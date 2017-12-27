unit Unit_ContasAPagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.ExtCtrls, Unit_Biblioteca,
  Vcl.Buttons;

type
  TFrm_ContasAPagar = class(TForm)
    Panel1: TPanel;
    Label_Cadastro: TLabel;
    StringGrid1: TStringGrid;
    Panel2: TPanel;
    Bt_Cancelar: TBitBtn;
    Bt_Pagar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure AtualizaGridContas;
    Procedure OrdenaStringGridDatas;
    procedure Bt_CancelarClick(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Bt_PagarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_ContasAPagar: TFrm_ContasAPagar;
implementation

{$R *.dfm}

procedure TFrm_ContasAPagar.Bt_CancelarClick(Sender: TObject);
begin
    Close;
end;

procedure TFrm_ContasAPagar.Bt_PagarClick(Sender: TObject);
var codigo,parcela:integer;
    Valor,Mensagem,conta,Multa:String;
    cod:Movimentacao;
begin
    if Lin>0
      Then Begin
               codigo:=StrToInt(StringGrid1.Cells[0,lin]);
               parcela:=StrToInt(StringGrid1.Cells[1,lin][1]);
               conta:=STringGrid1.Cells[2,lin];
               multa:=STringGrid1.Cells[4,lin];
               valor:=FloatToStr(StrToFloat(conta)+StrToFloat(Multa));
                          if VerificaPagarContaAvista(valor)
                            Then Begin
                                     If multa=zero
                                       Then mensagem:='Confirmar Pagamento da '+intToSTr(parcela)+' Parcela da nota '+IntToStr(codigo)+
                                            ' no valor de '+STringGrid1.Cells[2,lin]+'?'
                                       Else mensagem:='Confirmar Pagamento da '+intToSTr(parcela)+' Parcela da nota '+IntToStr(codigo)+
                                            ' no valor de '+STringGrid1.Cells[2,lin]+
                                            #13+' Com uma multa por atrazo de '+multa+'?'+#13+
                                            'Totalizando um valor de '+ArredondaNumero(valor)+'.';
                                     If Application.MessageBox(PChar(mensagem),'Confirmar Pagamento',36)=6
                                       Then Begin
                                                //GeraRelatorio;
                                                DescontaPagamento(Valor);

                                                cod.Descricao:='Pagamento Parcela';
                                                cod.Valor:='-'+valor;
                                                cod.Data:=date;
                                                cod.Hora:=time;
                                                CadastraMovimentacaoCaixa(cod,V_MovimentacaoCaixa);

                                                PagaParcela(Codigo,parcela);
                                                ShowMessage('Pagamento Efetuado');
                                                AtualizaGridContas;
                                            End;
                                 End
                            Else Begin
                                     ShowMessage('Saldo Insuficiente para pagar Avista');
                                 End;
           End
      Else Begin
               ShowMessage('Conta não selecionada, Por Favor clique na Fatura');
           End;
end;

procedure TFrm_ContasAPagar.FormCreate(Sender: TObject);
begin
    lin:=0;
    StringGrid1.Cells[0,0]:='Codigo da Nota';
    StringGrid1.Cells[1,0]:='N° da Parcela';
    StringGrid1.Cells[2,0]:='Valor da Parcela';
    StringGrid1.Cells[3,0]:='Data de Vencimento';
    StringGrid1.Cells[4,0]:='Multa';

    AtualizaGridContas;
end;

procedure TFrm_ContasAPagar.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
    lin:=ARow;
end;

procedure TFrm_ContasAPagar.AtualizaGridContas;
var i,j,linha:integer;
  Begin
      linha:=0;
      StringGrid1.RowCount:=Qtd_NotaAPagar_Ativo+1;
      for i := 0 to Length(V_NotaAPagar)-1 do
        Begin
            For j:=0 to Length(V_NotaAPagar[i].Parcelas)-1 do
              Begin
                  if not(V_NotaAPagar[i].Parcelas[j].Paga)
                    Then Begin
                             inc(linha);
                             StringGrid1.Cells[0,linha]:=intToSTr(V_NotaAPagar[i].Codigo);
                             StringGrid1.Cells[1,linha]:=intToSTr(V_NotaAPagar[i].Parcelas[j].NumParcela)+' Parcela';
                             StringGrid1.Cells[2,linha]:=V_NotaAPagar[i].Parcelas[j].Valor;
                             StringGrid1.Cells[3,linha]:=DateToStr(V_NotaAPagar[i].Parcelas[j].DataVencimento);
                             StringGrid1.Cells[4,linha]:=CalculaMultaPagamentos(V_NotaAPagar[i].Parcelas[j].DataVencimento,V_NotaAPagar[i].Parcelas[j].Valor);
                         End;
              End;
        End;
      OrdenaStringGridDatas;
  End;

Procedure TFrm_ContasAPagar.OrdenaStringGridDatas;
var i,j:integer;
    aux2:String;
  Begin
      For j := 1 to StringGrid1.RowCount-2 do //limite menos -1 da linha 0 e -1 da ultima
        Begin
            For i := 1 to StringGrid1.RowCount-2 do
              Begin
                  if StrToDate(StringGrid1.Cells[3,i])>StrToDate(StringGrid1.Cells[3,i+1])
                    Then Begin
                            aux2:=StringGrid1.Cells[0,i];  //0 coluna   Codigo
                            StringGrid1.Cells[0,i]:=StringGrid1.Cells[0,i+1];
                            StringGrid1.Cells[0,i+1]:=aux2;

                            aux2:=StringGrid1.Cells[1,i];  //1 coluna   N° Parcela
                            StringGrid1.Cells[1,i]:=StringGrid1.Cells[1,i+1];
                            StringGrid1.Cells[1,i+1]:=aux2;

                            aux2:=StringGrid1.Cells[2,i];  //2 coluna   Valor
                            StringGrid1.Cells[2,i]:=StringGrid1.Cells[2,i+1];
                            StringGrid1.Cells[2,i+1]:=aux2;

                            aux2:=StringGrid1.Cells[3,i];  //3 coluna   Data
                            StringGrid1.Cells[3,i]:=StringGrid1.Cells[3,i+1];
                            StringGrid1.Cells[3,i+1]:=aux2;

                            aux2:=StringGrid1.Cells[4,i];  //4 coluna   Multa
                            StringGrid1.Cells[4,i]:=StringGrid1.Cells[4,i+1];
                            StringGrid1.Cells[4,i+1]:=aux2;
                        End;
              End;
        End;
  End;

end.
