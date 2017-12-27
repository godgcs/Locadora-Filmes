unit Unit_EditarFilme;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Grids,Unit_Biblioteca;

type
  TFrm_EditarFilme = class(TForm)
    Panel1: TPanel;
    Label_Cadastro: TLabel;
    GroupBox1: TGroupBox;
    Label14: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    C_Codigo: TEdit;
    C_Descricao: TEdit;
    C_Audio: TComboBox;
    C_CodigoCategoria: TComboBox;
    C_TipoFilme: TComboBox;
    Panel2: TPanel;
    Bt_Ok: TBitBtn;
    Bt_Cancelar: TBitBtn;
    StringGrid1: TStringGrid;
    Bt_Desativar: TBitBtn;
    Bt_Reativar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Bt_DesativarClick(Sender: TObject);
    procedure Bt_ReativarClick(Sender: TObject);
    Procedure AtualizaGridExemplares;
    procedure Bt_CancelarClick(Sender: TObject);
    procedure Bt_OkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_EditarFilme: TFrm_EditarFilme;
  ind2:integer; //vou criar outra variavel para controle de cada exemplar
  //e minha variavel ind global esta com o indice do filme ja atribuido para quando terminar a edição

implementation

{$R *.dfm}

procedure TFrm_EditarFilme.Bt_CancelarClick(Sender: TObject);
begin
    If Application.MessageBox('Deseja Realmente Cancelar?','Sair',MB_ICONQUESTION+MB_YESNO) = 6
      Then Close;
end;

procedure TFrm_EditarFilme.Bt_DesativarClick(Sender: TObject);
begin
    if StringGrid1.Cells[2,ind2]='Sim'
      Then Begin
               if Application.MessageBox(PChar('Deseja Realmente Desativar o Filme '+StringGrid1.Cells[0,ind2]),'Desativar Filme',36)=6
                 Then Begin
                          StringGrid1.Cells[2,ind2]:='Não'
                      End;
           End
      Else Begin
               ShowMessage('Filme já está desativado. Por favor Selecione outro.')
           End;

end;

procedure TFrm_EditarFilme.Bt_OkClick(Sender: TObject);
var Filme:Filmes;
    i:integer;
begin
    If(Application.MessageBox('Deseja confirmar a edição do Filme?','Aviso',36)=6)
      Then Begin
               Filme.QtdExemplar:=0;
               Filme.QtdDisponivel:=0;
               Filme.Ativo:=False;   //se nenhum dos exemplares estiver ativo o filme sera excluido altomaticamente
               //Filme.Codigo:=C_Codigo.Text

               SetLength(Filme.Exemplar,StringGrid1.RowCount-1);

               for i := 1 to StringGrid1.RowCount-1 do
                 Begin
                     //Filme.Exemplar[i].SubCodigo
                     //Filme.Exemplar[i].Disponivel
                     //Filme.Exemplar[i].Lucro
                     if StringGrid1.Cells[2,i]='Sim'
                       Then Begin
                                Filme.Ativo:=true;
                                Filme.Exemplar[i-1].Ativo:=True;
                                inc(Filme.QtdExemplar);
                                if StringGrid1.Cells[1,i]='Sim'
                                  Then Begin
                                           inc(Filme.QtdDisponivel)
                                       End;
                            End
                       Else Filme.Exemplar[i-1].Ativo:=False;
                 End;

               Filme.Descricao:=C_Descricao.Text;
               Filme.CodigoCategoria:=StrToInt(C_CodigoCategoria.Text);
               Filme.TipoFilme:=C_TipoFilme.Text;
               Filme.Audio:=C_Audio.Text;
               Editar_Cadastro:=True;

               CadastraFilme(Filme,V_Filme);

               ShowMessage('Filme Editado com Sucesso');
               Close;
           End;
end;

procedure TFrm_EditarFilme.Bt_ReativarClick(Sender: TObject);
begin
    if StringGrid1.Cells[2,ind2]='Não'
      Then Begin
               if Application.MessageBox(PChar('Deseja Realmente Reativar o Filme '+StringGrid1.Cells[0,ind2]),'Reativar Filme',36)=6
                 Then Begin
                          StringGrid1.Cells[2,ind2]:='Sim'
                      End;
           End
      Else Begin
               ShowMessage('Filme já está Ativo. Por favor Selecione outro.')
           End;

end;

procedure TFrm_EditarFilme.FormCreate(Sender: TObject);
var Filme:Filmes;
    i:integer;
begin
    ind2:=1;
    C_CodigoCategoria.Clear;
    for i := 0 to Length(V_Categoria)-1 do
      Begin
          if V_Categoria[i].Ativo
            Then C_CodigoCategoria.Items.Add(IntToStr(V_Categoria[i].Codigo){ + ' - ' + V_Categoria[i].Nome});
      End;

    Filme:=RetornaFilmeEditar(ind,V_Filme);
    C_Codigo.Text:=intToStr(Filme.Codigo);
    C_Descricao.Text:=Filme.Descricao;
    for i := 0 to C_Audio.Items.Count do
      Begin
          if C_Audio.Items[i]=Filme.Audio
            Then Begin
                     C_Audio.ItemIndex:=i;
                     Break;
                 End;
      End;
    for i := 0 to C_CodigoCategoria.Items.Count do
      Begin
          if C_CodigoCategoria.Items[i]=intToSTr(Filme.CodigoCategoria)
            Then Begin
                     C_CodigoCategoria.ItemIndex:=i;
                     Break;
                 End;
      End;
    for i := 0 to C_TipoFilme.Items.Count do
      Begin
          if C_TipoFilme.Items[i]=Filme.TipoFilme
            Then Begin
                     C_TipoFilme.ItemIndex:=i;
                     Break;
                 End;
      End;

    AtualizaGridExemplares;
end;

Procedure TFrm_EditarFilme.AtualizaGridExemplares;
var Filme:Filmes;
    i:integer;
  Begin
      Filme:=RetornaFilmeEditar(ind,V_Filme);

      StringGrid1.RowCount:=Length(Filme.Exemplar)+1;
      StringGrid1.Cells[0,0]:='Codigo';
      StringGrid1.Cells[1,0]:='Disponivel';
      StringGrid1.Cells[2,0]:='Ativo';

      for i := 0 to length(Filme.Exemplar)-1 do
        Begin
            StringGrid1.Cells[0,i+1]:=intToStr(Filme.Codigo)+'-'+intToStr(Filme.Exemplar[i].SubCodigo);
            if Filme.Exemplar[i].Disponivel
              Then StringGrid1.Cells[1,i+1]:='Sim'
              Else StringGrid1.Cells[1,i+1]:='Não';
            if Filme.Exemplar[i].Ativo
              Then StringGrid1.Cells[2,i+1]:='Sim'
              Else StringGrid1.Cells[2,i+1]:='Não';
        End;
  End;

procedure TFrm_EditarFilme.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
    ind2:=ARow;
end;

end.
