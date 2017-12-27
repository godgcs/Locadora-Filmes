unit Unit_Filmes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.Grids, Unit_Biblioteca;

type
  TFrm_Filmes = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    StringGrid1: TStringGrid;
    TabSheet2: TTabSheet;
    StringGrid2: TStringGrid;
    TabSheet3: TTabSheet;
    StringGrid3: TStringGrid;
    TabSheet4: TTabSheet;
    StringGrid4: TStringGrid;
    TabSheet5: TTabSheet;
    StringGrid5: TStringGrid;
    TabSheet6: TTabSheet;
    StringGrid6: TStringGrid;
    TabSheet7: TTabSheet;
    StringGrid7: TStringGrid;
    TabSheet8: TTabSheet;
    StringGrid8: TStringGrid;
    TabSheet9: TTabSheet;
    StringGrid9: TStringGrid;
    TabSheet10: TTabSheet;
    StringGrid10: TStringGrid;
    TabSheet11: TTabSheet;
    StringGrid11: TStringGrid;
    TabSheet12: TTabSheet;
    StringGrid12: TStringGrid;
    TabSheet13: TTabSheet;
    StringGrid13: TStringGrid;
    procedure Bt_SairClick(Sender: TObject);
    Procedure AtualizaGridFilmes;
    procedure PageControl1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    Procedure AtualizaTodosGrids(Tabela:TStringGrid;TipoFilme:String);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid3SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid4SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid5SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid6SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid7SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid8SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid9SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid10SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid11SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid12SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid13SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1DblClick(Sender: TObject);
    Procedure EditarFilmes(Tabela:TStringGrid);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Filmes: TFrm_Filmes;

implementation

{$R *.dfm}

uses Unit_CadastroFilme, Unit_EditarFilme;

procedure TFrm_Filmes.Bt_SairClick(Sender: TObject);
begin
    Close;
end;

procedure TFrm_Filmes.FormCreate(Sender: TObject);
begin
    PageControl1.ActivePageIndex:=0;
    AtualizaGridFilmes;
end;

procedure TFrm_Filmes.PageControl1Change(Sender: TObject);
begin
    AtualizaGridFilmes;
end;

procedure TFrm_Filmes.StringGrid10SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
    ind:=ARow;
end;

procedure TFrm_Filmes.StringGrid11SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
    ind:=ARow;
end;

procedure TFrm_Filmes.StringGrid12SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
    ind:=ARow;
end;

procedure TFrm_Filmes.StringGrid13SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
    ind:=ARow;
end;

procedure TFrm_Filmes.StringGrid1DblClick(Sender: TObject);
begin
    If lin>0
      Then Begin
               case PageControl1.ActivePageIndex of
               0:EditarFilmes(StringGrid1);
               1:EditarFilmes(StringGrid2);
               2:EditarFilmes(StringGrid3);
               3:EditarFilmes(StringGrid4);
               4:EditarFilmes(StringGrid5);
               5:EditarFilmes(StringGrid6);
               6:EditarFilmes(StringGrid7);
               7:EditarFilmes(StringGrid8);
               8:EditarFilmes(StringGrid9);
               9:EditarFilmes(StringGrid10);
               10:EditarFilmes(StringGrid10);
               11:EditarFilmes(StringGrid11);
               12:EditarFilmes(StringGrid12);
               13:EditarFilmes(StringGrid13);
               end;
           End
      Else Begin
               ShowMessage('Filme não selecionado. Por favor clique no Filme');
           End;
end;

Procedure TFrm_Filmes.EditarFilmes(Tabela:TStringGrid);
var cod:integer;
  Begin
       Editar_Cadastro:=True;
       Cod:=StrToInt(Tabela.Cells[0,lin]);
       ind:=RetornaIndiceFilme(cod);
       Application.CreateForm(TFrm_EditarFilme,Frm_EditarFilme);
       Frm_EditarFilme.ShowModal;

       AtualizaGridFilmes;
  End;

procedure TFrm_Filmes.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
    lin:=ARow;
end;

procedure TFrm_Filmes.StringGrid2SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
    lin:=ARow;
end;

procedure TFrm_Filmes.StringGrid3SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
    lin:=ARow;
end;

procedure TFrm_Filmes.StringGrid4SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
    lin:=ARow;
end;

procedure TFrm_Filmes.StringGrid5SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
    lin:=ARow;
end;

procedure TFrm_Filmes.StringGrid6SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
    lin:=ARow;
end;

procedure TFrm_Filmes.StringGrid7SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
    lin:=ARow;
end;

procedure TFrm_Filmes.StringGrid8SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
    lin:=ARow;
end;

procedure TFrm_Filmes.StringGrid9SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
    lin:=ARow;
end;

Procedure TFrm_Filmes.AtualizaGridFilmes;
var i,linha:integer;
  Begin
      linha:=1;
      case PageControl1.ActivePageIndex of
      0:Begin
            StringGrid1.RowCount:=linha;
            StringGrid1.Cells[0,0]:='Codigo';
            StringGrid1.Cells[1,0]:='Descrição';
            StringGrid1.Cells[2,0]:='Quantidade';
            StringGrid1.Cells[3,0]:='Disponiveis';
            StringGrid1.Cells[4,0]:='Classificação';
            For i := 0 to Length(V_Filme)-1 do
              Begin
                  if V_Filme[i].Ativo
                    Then Begin
                            StringGrid1.RowCount:=Qtd_Filme_Ativo+1;
                            StringGrid1.Cells[0,linha]:=IntToStr(V_Filme[i].Codigo);
                            StringGrid1.Cells[1,linha]:=V_Filme[i].Descricao;
                            StringGrid1.Cells[2,linha]:=IntToStr(V_Filme[i].QtdExemplar);
                            StringGrid1.Cells[3,linha]:=IntToStr(V_Filme[i].QtdDisponivel);
                            StringGrid1.Cells[4,linha]:=V_Filme[i].TipoFilme;
                            inc(linha);
                         End;
              End;
        End;
      1:AtualizaTodosGrids(StringGrid2,'Ação');
      2:AtualizaTodosGrids(StringGrid3,'Aventura');
      3:AtualizaTodosGrids(StringGrid4,'Animação');
      4:AtualizaTodosGrids(StringGrid5,'Comédia');
      5:AtualizaTodosGrids(StringGrid6,'Clássico');
      6:AtualizaTodosGrids(StringGrid7,'Documentário');
      7:AtualizaTodosGrids(StringGrid8,'Drama');
      8:AtualizaTodosGrids(StringGrid9,'Ficção Científica');
      9:AtualizaTodosGrids(StringGrid10,'Musica');
      10:AtualizaTodosGrids(StringGrid11,'Romance');
      11:AtualizaTodosGrids(StringGrid12,'Terror');
      12:AtualizaTodosGrids(StringGrid13,'Suspense');
      End; //fim case
  End;

Procedure TFrm_Filmes.AtualizaTodosGrids(Tabela:TStringGrid;TipoFilme:String);
var i,linha:integer;
  Begin
      linha:=1;
      Tabela.RowCount:=linha;
      Tabela.Cells[0,0]:='Codigo';
      Tabela.Cells[1,0]:='Descrição';
      Tabela.Cells[2,0]:='Quantidade';
      Tabela.Cells[3,0]:='Disponiveis';
      Tabela.Cells[4,0]:='Preço';
      For i := 0 to Length(V_Filme)-1 do
              Begin
                  if V_Filme[i].Ativo
                    Then Begin
                            if V_Filme[i].TipoFilme=TipoFilme
                              Then Begin
                                      Tabela.RowCount:=linha+1;
                                      Tabela.Cells[0,linha]:=IntToStr(V_Filme[i].Codigo);
                                      Tabela.Cells[1,linha]:=V_Filme[i].Descricao;
                                      Tabela.Cells[2,linha]:=IntToStr(V_Filme[i].QtdExemplar);
                                      Tabela.Cells[3,linha]:=IntToStr(V_Filme[i].QtdDisponivel);
                                      Tabela.Cells[4,linha]:='R$ ' + RetornaPrecoLocacaoCategoria(V_Filme[i].CodigoCategoria);
                                      inc(linha);
                              End;
                         End;
              End;
  End;

end.
