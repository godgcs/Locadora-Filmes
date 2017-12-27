unit Unit_DevolucaoFilme;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids,
  Vcl.ExtCtrls,Unit_Biblioteca;

type
  TFrm_DevolucaoFilme = class(TForm)
    Panel1: TPanel;
    Label16: TLabel;
    StringGrid1: TStringGrid;
    Panel2: TPanel;
    Bt_Cancelar: TBitBtn;
    Bt_Devolver: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure AtualizaGridDevolucao;
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Bt_DevolverClick(Sender: TObject);
    procedure Bt_CancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_DevolucaoFilme: TFrm_DevolucaoFilme;

implementation

{$R *.dfm}

uses Unit_DevolucaoFilmeDetalhado;

procedure TFrm_DevolucaoFilme.Bt_CancelarClick(Sender: TObject);
begin
    Close;
end;

procedure TFrm_DevolucaoFilme.Bt_DevolverClick(Sender: TObject);
var ind:integer;
begin
    if Qtd_Locacao_Ativo>0
      Then Begin
               ind:=RetornaIndiceLocacao(StrToInt(StringGrid1.Cells[0,lin]));
               V_TempNotaLocacao:=RetornaLocaçãoEditar(ind);

               Application.CreateForm(TFrm_DevolucaoFilmeDetalhada,Frm_DevolucaoFilmeDetalhada);
               Frm_DevolucaoFilmeDetalhada.ShowModal;
           End
      Else Begin
               ShowMessage('Locação não selecionada. Por Favor Selecione a Locação.');
           End;
    AtualizaGridDevolucao;
end;

procedure TFrm_DevolucaoFilme.FormCreate(Sender: TObject);
begin
    lin:=1;
    AtualizaGridDevolucao;
    CarregaCopiaTemporariaFilmes;
    StringGrid1.Cells[0,0]:='Codigo Locação';
    StringGrid1.Cells[1,0]:='Codigo Cliente';
    StringGrid1.Cells[2,0]:='Nome Cliente';
    StringGrid1.Cells[3,0]:='Qtd Filmes';
    StringGrid1.Cells[4,0]:='Data Devolução';
    StringGrid1.Cells[5,0]:='Multa';

end;

procedure TFrm_DevolucaoFilme.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
    lin:=ARow;
end;

procedure TFrm_DevolucaoFilme.AtualizaGridDevolucao;
var linha,i,j:integer;
    multa:STring;
    MostrarLocacao:Boolean;
    Cliente:Clientes;
  Begin
      linha:=0;
      Qtd_Locacao_Ativo:=0;
      for i := 0 to Length(V_NotaLocacao)-1 do
        Begin
            Multa:=zero;
            MostrarLocacao:=False;
            For j:=0 to Length(V_NotaLocacao[i].Filme)-1 do
              Begin
                  if not(V_NotaLocacao[i].Filme[j].Devolvido)
                    Then Begin
                             MostrarLocacao:=True;
                             Multa:=FloatToSTr(StrToFloat(Multa)+StrToFloat(CalculaMultaDevolucao(V_NotaLocacao[i].DataDevolucao,V_NotaLocacao[i].Filme[j].CodigoCategoria)));
                          End;
              End;
            Multa:=ArredondaNumero(Multa);
            If MostrarLocacao
                Then Begin
                         inc(linha);
                         inc(Qtd_Locacao_Ativo);
                         StringGrid1.Cells[0,linha]:=intToSTr(V_NotaLocacao[i].Codigo);
                         StringGrid1.Cells[1,linha]:=intToSTr(V_NotaLocacao[i].CodigoCliente);
                         ind:=RetornaIndiceCliente(V_NotaLocacao[i].CodigoCliente);
                         Cliente:=RetornaClienteEditar(ind);
                         StringGrid1.Cells[2,linha]:=Cliente.Nome;
                         StringGrid1.Cells[3,linha]:=intToSTr(Length(V_NotaLocacao[i].Filme));
                         StringGrid1.Cells[4,linha]:=DateToStr(V_NotaLocacao[i].DataDevolucao);
                         V_NotaLocacao[i].Multa:=Multa;
                         StringGrid1.Cells[5,linha]:=V_NotaLocacao[i].Multa;
                     End;
        End;
      StringGrid1.RowCount:=Qtd_Locacao_Ativo+1;
      FinalizaVetores;
  End;

end.
