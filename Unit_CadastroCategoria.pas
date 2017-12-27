unit Unit_CadastroCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Unit_Biblioteca;

type
  TFrm_CadastroCategoria = class(TForm)
    Panel1: TPanel;
    Label_Cadastro: TLabel;
    GroupBox1: TGroupBox;
    Label14: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    C_Codigo: TEdit;
    C_Descricao: TEdit;
    C_Nome: TEdit;
    C_Preco: TEdit;
    Panel2: TPanel;
    Bt_Ok: TBitBtn;
    Bt_Cancelar: TBitBtn;
    Label3: TLabel;
    C_Multa: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Bt_OkClick(Sender: TObject);
    procedure Bt_CancelarClick(Sender: TObject);
    procedure C_PrecoKeyPress(Sender: TObject; var Key: Char);
    procedure C_MultaKeyPress(Sender: TObject; var Key: Char);
    procedure C_PrecoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure C_MultaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_CadastroCategoria: TFrm_CadastroCategoria;

implementation

{$R *.dfm}

procedure TFrm_CadastroCategoria.Bt_CancelarClick(Sender: TObject);
begin
    If Application.MessageBox('Deseja Realmente Cancelar?','Sair',MB_ICONQUESTION+MB_YESNO) = 6
      Then Close;
end;

procedure TFrm_CadastroCategoria.Bt_OkClick(Sender: TObject);
var cod:Categorias;
begin
    cod.Codigo:=StrToInt(C_Codigo.text);
    cod.Nome:=C_Nome.Text;
    cod.Descricao:=C_Descricao.Text;
    cod.PrecoLocacao:=C_preco.Text;
    cod.PrecoMulta:=C_Multa.Text;
    cod.Ativo:=True;
    if Editar_Cadastro
      Then Begin
               If(Application.MessageBox('Deseja Confirmar a edição da Categoria?','Confirmar Edição',36)=6)
                  Then Begin
                           CadastraCategoria(Cod,V_Categoria);
                           ShowMessage('Edição de Categoria realizada com Sucesso');
                           //
                           Close;
                       End;
           End
      Else Begin
               If(Application.MessageBox('Deseja Confirmar o Cadastro da Categoria?','Confirmar Cadastro',36)=6)
                  Then Begin
                           ind:=VerificaCategoria(C_Nome.text);
                           If ind<0
                             Then Begin
                                      CadastraCategoria(Cod,V_Categoria);
                                      inc(Qtd_Categoria_Ativo);
                                      ShowMessage('Cadastro de Categoria realizada com Sucesso');
                                      //
                                      Close;
                                  End
                             Else Begin
                                      If not(V_Categoria[ind].Ativo)
                                        Then Begin
                                                  If (Application.MessageBox('Categoria já cadastrada e está desativado.' +#13+ 'Deseja reativa-la?','Categoria já cadastrada',36)=6)
                                                    Then Begin
                                                             V_Categoria[ind].Ativo:=True;
                                                             inc(Qtd_Categoria_Ativo);
                                                             Close;
                                                         End
                                                    Else Begin
                                                             ShowMessage('Categoria já está cadastrada');
                                                             C_Nome.Clear;
                                                             C_Nome.SetFocus;
                                                         End;
                                             End
                                        Else Begin
                                                 ShowMessage('Categoria já está cadastrada');
                                                 C_Nome.Clear;
                                                 C_Nome.SetFocus;
                                             End;
                                  End;
                  End;
      End;
end;

procedure TFrm_CadastroCategoria.C_MultaKeyPress(Sender: TObject;
  var Key: Char);
begin
    Key:=VerificaTeclaNumeroReal(C_Multa.Text,Key);
end;

procedure TFrm_CadastroCategoria.C_MultaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if C_Multa.Text=''
      Then C_Multa.Text:=zero;
end;

procedure TFrm_CadastroCategoria.C_PrecoKeyPress(Sender: TObject;
  var Key: Char);
begin
    Key:=VerificaTeclaNumeroReal(C_Preco.Text,Key);
end;

procedure TFrm_CadastroCategoria.C_PrecoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if C_Preco.Text=''
      Then C_Preco.Text:=zero;
end;

procedure TFrm_CadastroCategoria.FormCreate(Sender: TObject);
var cod:Categorias;
begin
    If Editar_Cadastro
      Then Begin
               Label_Cadastro.Caption:= 'Editar Categoria';
               Cod:=RetornaCategoriaEditar(ind);

               C_Codigo.Text:=IntToStr(cod.Codigo);
               C_Nome.Text:=cod.Nome;
               C_Descricao.Text:=cod.Descricao;
               C_Preco.Text:=cod.PrecoLocacao;
               C_Multa.Text:=cod.PrecoMulta;
           End
      Else Begin
               Label_Cadastro.Caption:= 'Cadastro de Categoria';
               C_Codigo.Text:=IntToStr(Length(V_Categoria)+1);
           End;
end;

end.
