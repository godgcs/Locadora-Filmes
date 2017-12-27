unit Unit_AcrescentarFilmeLocacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Unit_Biblioteca;

type
  TFrm_AcrescentarFilmeLocacao = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    C_Filme: TComboBox;
    C_Codigo: TEdit;
    Label_Cadastro: TLabel;
    Panel2: TPanel;
    Bt_Cancelar: TBitBtn;
    Bt_Ok: TBitBtn;
    Bt_FilmesFilmes: TBitBtn;
    Label1: TLabel;
    C_QtdDisponivel: TEdit;
    procedure C_CodigoKeyPress(Sender: TObject; var Key: Char);
    procedure C_CodigoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure C_FilmeSelect(Sender: TObject);
    procedure Bt_OkClick(Sender: TObject);
    procedure Bt_FilmesFilmesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Bt_CancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure GarregaFilmesParaLocacao;
    Procedure GarregaFilmeEdicao;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_AcrescentarFilmeLocacao: TFrm_AcrescentarFilmeLocacao;
  FilmeTempEdicao:FilmeLocacao;
  IndiceFilmeEditar:integer;

implementation

{$R *.dfm}

uses Unit_Filmes;

procedure TFrm_AcrescentarFilmeLocacao.Bt_CancelarClick(Sender: TObject);
begin
    If Application.MessageBox('Deseja Realmente Cancelar?','Sair',MB_ICONQUESTION+MB_YESNO) = 6
      Then Begin
               Close;
           End;
end;

procedure TFrm_AcrescentarFilmeLocacao.Bt_FilmesFilmesClick(Sender: TObject);
begin
    Application.CreateForm(TFrm_Filmes,Frm_Filmes);
    Frm_Filmes.ShowModal;
end;

procedure TFrm_AcrescentarFilmeLocacao.Bt_OkClick(Sender: TObject);
var codigo,Exemplar,NumCategoria:integer;
    Filme:Filmes;
    Categoria:Categorias;
begin
    if (C_Codigo.Text<>'')and(C_Filme.Text<>'')
      Then Begin
               codigo:=StrToInt(C_Codigo.Text);
               ind:=RetornaIndiceFilme(codigo);
               if ind>=0
                 Then Begin
                         Filme:=RetornaFilmeEditar(ind,CopiaFilme);
                         Exemplar:=RetornaIndiceExemplarFilmeDisponivel(Filme);
                         ////
                         if Editar_Cadastro
                           Then Begin
                                    V_TempNotaLocacao.Filme[lin-1].CodigoFilme:=IntToStr(Filme.Codigo)+'-'+IntToStr(CopiaFilme[ind].Exemplar[Exemplar].SubCodigo);
                                    V_TempNotaLocacao.Filme[lin-1].CodigoCategoria:=Filme.CodigoCategoria;
                                    V_TempNotaLocacao.Filme[lin-1].Devolvido:=False;
                                    CopiaFilme[ind].QtdDisponivel:=CopiaFilme[ind].QtdDisponivel-1;
                                    CopiaFilme[ind].Exemplar[Exemplar].Disponivel:=False;

                                    NumCategoria:=RetornaIndiceCategoria(Filme.CodigoCategoria);
                                    Categoria:=RetornaCategoriaEditar(NumCategoria);
                                    CopiaFilme[ind].Exemplar[Exemplar].Lucro:=ArredondaNumero(FloatToStr(StrToFloat(CopiaFilme[ind].Exemplar[Exemplar].Lucro)+StrToFloat(Categoria.PrecoLocacao)));

                                    ConfirmaAlteracao:=True;
                                    ShowMessage('Filme Editado com Sucesso');
                                    Close;
                                End
                           Else Begin
                                    if Filme.QtdDisponivel>0
                                      Then Begin
                                               SetLength(V_TempNotaLocacao.Filme,Length(V_TempNotaLocacao.Filme)+1);
                                               V_TempNotaLocacao.Filme[Length(V_TempNotaLocacao.Filme)-1].CodigoFilme:=IntToStr(Filme.Codigo)+'-'+IntToStr(Exemplar);
                                               V_TempNotaLocacao.Filme[Length(V_TempNotaLocacao.Filme)-1].CodigoCategoria:=Filme.CodigoCategoria;//
                                               V_TempNotaLocacao.Filme[Length(V_TempNotaLocacao.Filme)-1].Devolvido:=false;
                                               CopiaFilme[ind].Exemplar[Exemplar].Disponivel:=False;
                                               CopiaFilme[ind].QtdDisponivel:=CopiaFilme[ind].QtdDisponivel-1;

                                               NumCategoria:=RetornaIndiceCategoria(Filme.CodigoCategoria);
                                               Categoria:=RetornaCategoriaEditar(NumCategoria);
                                               CopiaFilme[ind].Exemplar[Exemplar].Lucro:=ArredondaNumero(FloatToStr(StrToFloat(CopiaFilme[ind].Exemplar[Exemplar].Lucro)+StrToFloat(Categoria.PrecoLocacao)));

                                               inc(Temp_Qtd_Filmes);

                                               ShowMessage('Filme Adicionado a Lista');
                                               Close;
                                           End
                                      Else Begin
                                               ShowMessage('Filme não está Disponivel para Locação');
                                           End;
                                End;
                     End;
           End
      Else Begin
               ShowMessage('Preencha Todos os Dados');
           End;
end;

procedure TFrm_AcrescentarFilmeLocacao.C_CodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
    Key:=VerificaTeclaNumeroInteiro(C_Codigo.Text,Key);
end;

procedure TFrm_AcrescentarFilmeLocacao.C_CodigoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var ind,codigo:integer;
    Filme:Filmes;
begin
    if (C_Codigo.Text<>'')
      Then Begin
               codigo:=StrToInt(C_Codigo.Text);
               ind:=RetornaIndiceFilme(codigo);
               if ind>=0
                 Then Begin
                          Filme:=RetornaFilmeEditar(ind,CopiaFilme);
                          if Filme.Ativo
                            Then Begin
                                     C_Filme.ItemIndex:=C_Filme.Items.IndexOf(IntToStr(Filme.Codigo)+' - '+Filme.Descricao);
                                     C_QtdDisponivel.Text:=IntToStr(Filme.QtdDisponivel);
                                 End
                            Else Begin
                                     C_Filme.ItemIndex:=-1;
                                     C_QtdDisponivel.Text:='';
                                 End;
                      End
                 Else Begin
                          C_Filme.ItemIndex:=-1;
                      End;
           End;
end;

procedure TFrm_AcrescentarFilmeLocacao.C_FilmeSelect(Sender: TObject);
var i,codigo,ind:integer;
    Filme:Filmes;
begin
    i:=pos('-',C_Filme.Text);
    codigo:=StrToInt(Copy(C_Filme.Text,1,i-2));
    C_Codigo.Text:=IntToStr(Codigo);
    ind:=RetornaIndiceFilme(Codigo);
    if ind>=0
      Then Begin
               Filme:=RetornaFilmeEditar(ind,CopiaFilme);
               C_QtdDisponivel.Text:=IntToStr(Filme.QtdDisponivel);
           End;
end;

procedure TFrm_AcrescentarFilmeLocacao.FormClose(Sender: TObject;
var Action: TCloseAction);
begin
    if (Editar_Cadastro)and(not(ConfirmaAlteracao))
      Then Begin
               dec(CopiaFilme[IndiceFilmeEditar].QtdDisponivel);
           End;
end;

procedure TFrm_AcrescentarFilmeLocacao.FormCreate(Sender: TObject);
begin
    GarregaFilmesParaLocacao;

    if Editar_Cadastro
      Then Begin
               Label_Cadastro.Caption:= 'Editar Filme Locação';
               GarregaFilmeEdicao;
           End
      Else Begin
               Label_Cadastro.Caption:= 'Acrescentar Filme Locação';
           End;
end;

Procedure TFrm_AcrescentarFilmeLocacao.GarregaFilmeEdicao;
var Filme:Filmes;
    Categoria:Categorias;
    j,Exemplar,NumCategoria:Integer;
  Begin
      j:=pos('-',V_TempNotaLocacao.Filme[lin-1].CodigoFilme);
      C_Codigo.text:=Copy(V_TempNotaLocacao.Filme[lin-1].CodigoFilme,1,j-1);
      ind:=RetornaIndiceFilme(StrToInt(C_Codigo.text));
      IndiceFilmeEditar:=ind;
      Exemplar:=StrToInt(Copy(V_TempNotaLocacao.Filme[lin-1].CodigoFilme,j+1,Length(V_TempNotaLocacao.Filme[lin-1].CodigoFilme)));
{gravo o indice o filme q estou editando para q se cancelar eu diminua a quantidade
disponivel de novo retorno +1 filme para disponivel pois estou editando ele}
      CopiaFilme[ind].QtdDisponivel:=CopiaFilme[ind].QtdDisponivel+1;
      CopiaFilme[ind].Exemplar[Exemplar].Disponivel:=True;

      Filme:=RetornaFilmeEditar(ind,CopiaFilme);
      C_Filme.ItemIndex:=C_Filme.Items.IndexOf(IntToStr(Filme.Codigo)+' - '+Filme.Descricao);
      C_QtdDisponivel.Text:=IntToStr(Filme.QtdDisponivel);

      NumCategoria:=RetornaIndiceCategoria(Filme.CodigoCategoria);
      Categoria:=RetornaCategoriaEditar(NumCategoria);
      CopiaFilme[ind].Exemplar[Exemplar].Lucro:=ArredondaNumero(FloatToStr(StrToFloat(CopiaFilme[ind].Exemplar[Exemplar].Lucro)-StrToFloat(Categoria.PrecoLocacao)));
End;

Procedure TFrm_AcrescentarFilmeLocacao.GarregaFilmesParaLocacao;
var i:integer;
  Begin
      C_Filme.Items.Clear;
        for i := 0 to Length(CopiaFilme)-1 do
          Begin
              if CopiaFilme[i].Ativo
                Then C_Filme.Items.Add(IntToStr(CopiaFilme[i].Codigo)+' - '+CopiaFilme[i].Descricao);
          End;
  End;

end.
