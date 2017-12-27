unit Unit_RetiradaCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,Unit_Biblioteca;

type
  TFrm_RetiradaCaixa = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    Bt_Ok: TBitBtn;
    Bt_Cancelar: TBitBtn;
    C_Descricao: TEdit;
    C_Valor: TEdit;
    procedure C_ValorExit(Sender: TObject);
    procedure C_ValorKeyPress(Sender: TObject; var Key: Char);
    procedure C_ValorKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Bt_CancelarClick(Sender: TObject);
    procedure Bt_OkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_RetiradaCaixa: TFrm_RetiradaCaixa;

implementation

{$R *.dfm}

procedure TFrm_RetiradaCaixa.Bt_CancelarClick(Sender: TObject);
begin
    If Application.MessageBox('Deseja Realmente Cancelar?','Sair',MB_ICONQUESTION+MB_YESNO) = 6
      Then Close;
end;

procedure TFrm_RetiradaCaixa.Bt_OkClick(Sender: TObject);
var cod:movimentacao;
begin
    if Saque
      Then Begin
               if VerificaPagarContaAvista(C_Valor.Text)
                 Then Begin
                          cod.Descricao:='Saque: '+C_Descricao.Text;
                          cod.Valor:='-'+C_Valor.Text;
                          cod.Data:=Date;
                          cod.Hora:=Time;
                          CadastraMovimentacaoCaixa(cod,V_MovimentacaoCaixa);
                          DescontaPagamento(C_Valor.Text);
                          ShowMessage('Saque Confirmado.');
                          Close;
                       End
                  Else ShowMessage('Saldo Insuficiente para Retirada');
           End
      Else Begin
               cod.Descricao:='Deposito: '+C_Descricao.Text;
               cod.Valor:='+'+C_Valor.Text;
               cod.Data:=Date;
               cod.Hora:=Time;
               CadastraMovimentacaoCaixa(cod,V_MovimentacaoCaixa);
               RecebePagamento(C_Valor.Text);
               ShowMessage('Deposito Confirmado.');
               Close;
           End;
end;

procedure TFrm_RetiradaCaixa.C_ValorExit(Sender: TObject);
begin
    C_Valor.Text:=ArredondaNumero(C_Valor.Text);
end;

procedure TFrm_RetiradaCaixa.C_ValorKeyPress(Sender: TObject; var Key: Char);
begin
    Key:=VerificaTeclaNumeroReal(C_Valor.Text,Key);
end;

procedure TFrm_RetiradaCaixa.C_ValorKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if C_Valor.Text=''
      Then C_Valor.Text:=zero;
end;

procedure TFrm_RetiradaCaixa.FormCreate(Sender: TObject);
begin
    if saque
      Then GroupBox1.Caption:='Dados para Saque'
      Else GroupBox1.Caption:='Dados para Deposito';
end;

end.
