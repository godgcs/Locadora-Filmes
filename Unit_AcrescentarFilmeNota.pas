unit Unit_AcrescentarFilmeNota;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Unit_Biblioteca;

type
  TFrm_AcrescentarFilmeNota = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    C_Descricao: TEdit;
    Label2: TLabel;
    C_Preco: TEdit;
    Label3: TLabel;
    C_Quantidade: TEdit;
    Panel2: TPanel;
    Bt_Ok: TBitBtn;
    Bt_Cancelar: TBitBtn;
    Label_Cadastro: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Bt_OkClick(Sender: TObject);
    procedure C_PrecoKeyPress(Sender: TObject; var Key: Char);
    procedure C_QuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure C_PrecoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure C_QuantidadeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_CancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_AcrescentarFilmeNota: TFrm_AcrescentarFilmeNota;

implementation

{$R *.dfm}

procedure TFrm_AcrescentarFilmeNota.Bt_CancelarClick(Sender: TObject);
begin
    If Application.MessageBox('Deseja Realmente Cancelar?','Sair',MB_ICONQUESTION+MB_YESNO) = 6
      Then Close;
end;

procedure TFrm_AcrescentarFilmeNota.Bt_OkClick(Sender: TObject);
begin
    if C_Descricao.Text<>''
      Then Begin
              If Editar_Cadastro
                Then Begin
                         V_TempNotaEntrada.Filme[lin-1].Descricao:=C_Descricao.Text;
                         V_TempNotaEntrada.Filme[lin-1].PrecoCusto:=C_Preco.Text;
                         V_TempNotaEntrada.Filme[lin-1].Quantidade:=StrToInt(C_Quantidade.Text);
                     End
                Else Begin
                         SetLength(V_TempNotaEntrada.Filme,Length(V_TempNotaEntrada.Filme)+1);
                         V_TempNotaEntrada.Filme[Length(V_TempNotaEntrada.Filme)-1].Descricao:=C_Descricao.Text;
                         V_TempNotaEntrada.Filme[Length(V_TempNotaEntrada.Filme)-1].PrecoCusto:=C_Preco.Text;
                         V_TempNotaEntrada.Filme[Length(V_TempNotaEntrada.Filme)-1].Quantidade:=StrToInt(C_Quantidade.Text);
                         Inc(Temp_Qtd_Filmes);
                     End;
                Close;
           End
      Else Begin
               ShowMessage('Por favor insira a Descrição');
               C_Descricao.SetFocus;
           End;
end;

procedure TFrm_AcrescentarFilmeNota.C_PrecoKeyPress(Sender: TObject;
  var Key: Char);
begin
    Key:=VerificaTeclaNumeroReal(C_Preco.Text,Key);
end;

procedure TFrm_AcrescentarFilmeNota.C_PrecoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if C_Preco.Text=''
      Then C_Preco.Text:=zero;
end;

procedure TFrm_AcrescentarFilmeNota.C_QuantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
    Key:=VerificaTeclaNumeroInteiro(C_Quantidade.Text,Key);
end;

procedure TFrm_AcrescentarFilmeNota.C_QuantidadeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if C_Quantidade.Text=''
      Then C_Quantidade.Text:='0';
end;

procedure TFrm_AcrescentarFilmeNota.FormCreate(Sender: TObject);
begin
    If Editar_Cadastro
      Then Begin
               Label_Cadastro.Caption:= 'Editar Filme da Nota';

               C_Descricao.text:=V_TempNotaEntrada.Filme[lin-1].Descricao;
               C_Preco.text:=V_TempNotaEntrada.Filme[lin-1].PrecoCusto;
               C_Quantidade.text:=IntToStr(V_TempNotaEntrada.Filme[lin-1].Quantidade);
           End
      Else Begin
               Label_Cadastro.Caption:= 'Acrescentar Filme a Nota';
           End;
end;

end.
