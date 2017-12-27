unit Unit_Caixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Unit_Biblioteca, Vcl.Buttons;

type
  TFrm_Caixa = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    StringGrid1: TStringGrid;
    Panel2: TPanel;
    Label1: TLabel;
    C_TotalLiquido: TEdit;
    Bt_Saque: TBitBtn;
    Bt_Deposito: TBitBtn;
    procedure FormCreate(Sender: TObject);
    Procedure AtualizaGridMovimentacao;
    procedure Bt_SaqueClick(Sender: TObject);
    procedure Bt_DepositoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Caixa: TFrm_Caixa;

implementation

{$R *.dfm}

uses Unit_RetiradaCaixa;

procedure TFrm_Caixa.Bt_DepositoClick(Sender: TObject);
begin
    Saque:=false;
    Application.CreateForm(TFrm_RetiradaCaixa,Frm_RetiradaCaixa);
    Frm_RetiradaCaixa.ShowModal;

    AtualizaGridMovimentacao;
    C_TotalLiquido.Text:='R$'+V_Caixa;
end;

procedure TFrm_Caixa.Bt_SaqueClick(Sender: TObject);
begin
    Saque:=True;
    Application.CreateForm(TFrm_RetiradaCaixa,Frm_RetiradaCaixa);
    Frm_RetiradaCaixa.ShowModal;

    AtualizaGridMovimentacao;
    C_TotalLiquido.Text:='R$'+V_Caixa;
end;

procedure TFrm_Caixa.FormCreate(Sender: TObject);
begin
    lin:=1;
    StringGrid1.Cells[0,0]:='Descrição';
    StringGrid1.Cells[1,0]:='Valor';
    StringGrid1.Cells[2,0]:='Data';
    StringGrid1.Cells[3,0]:='Hora';

    C_TotalLiquido.Text:='R$'+V_Caixa;
    AtualizaGridMovimentacao;
end;

Procedure TFrm_Caixa.AtualizaGridMovimentacao;
var i,linha:integer;
  Begin
      linha:=1;
      StringGrid1.RowCount:=Length(V_MovimentacaoCaixa)+1;
      For i := length(V_MovimentacaoCaixa)-1 downto 0 do
        Begin
            StringGrid1.Cells[0,linha]:=V_MovimentacaoCaixa[i].Descricao;
            StringGrid1.Cells[1,linha]:=ArredondaNumero(V_MovimentacaoCaixa[i].Valor);
            StringGrid1.Cells[2,linha]:=DateToStr(V_MovimentacaoCaixa[i].Data);
            StringGrid1.Cells[3,linha]:=TimeToStr(V_MovimentacaoCaixa[i].Hora);
            inc(linha);
        End;

  End;

end.
