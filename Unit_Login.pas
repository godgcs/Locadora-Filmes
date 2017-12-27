unit Unit_Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, Unit_Biblioteca, System.UITypes, Vcl.Imaging.jpeg;

type
  TFrm_Login = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    C_Senha: TEdit;
    Bt_Ok: TBitBtn;
    Bt_Cancelar: TBitBtn;
    C_Login: TComboBox;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    procedure Bt_OkClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Bt_CancelarClick(Sender: TObject);
    procedure CarregaLogins;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Login: TFrm_Login;

implementation

{$R *.dfm}

uses Unit_Menu, Unit_CadastroEmpresa;

procedure TFrm_Login.Bt_CancelarClick(Sender: TObject);
begin
    if Application.MessageBox('Deseja Realmente Sair??','Sair',MB_ICONQUESTION+MB_YESNO)=6
      Then Application.Terminate;
end;

procedure TFrm_Login.Bt_OkClick(Sender: TObject);
begin
    if VerificaLoginFuncionario(C_Login.Text,C_Senha.Text)
      Then Begin
               Vendedor_Ativo:=C_Login.text;
               Application.CreateForm(TFrm_Menu, Frm_Menu);
               Frm_Login.Hide; //Esconde a tela
               Frm_Menu.ShowModal;

               Frm_Menu.Destroy; //Remove a tela da memória
               Frm_Login.Show;
               C_Senha.Clear;
               C_Login.SetFocus;
               //Frm_Login := Nil; //Atribui conteúdo nulo para a variável de tela FrmLogin
           End
      Else Begin
               MessageDlg(Pchar('Senha do usuário inválida.'+#13+#13
                + 'Se você esqueceu sua senha, consulte '+ #13
                + 'o administrador do sistema'), mtError, [mbOK], 0);
               C_Senha.Clear; // limpa o objeto EdtSenha
               C_Login.ItemIndex:=-1;
               C_Login.SetFocus; //Ajusta o foco para o objeto EdtSenha
           End;
end;

procedure TFrm_Login.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Application.Terminate;
end;

procedure TFrm_Login.FormCreate(Sender: TObject);
begin
    Cod_Arquivo:=1;
    Editar_Cadastro:=False;
    IniciaVetores;
    //V_Caixa:='50000';
end;

procedure TFrm_Login.FormShow(Sender: TObject);
begin
    While Not(Empresa_Cadastrada) do
      Begin
          Application.CreateForm(TFrm_CadastroEmpresa,Frm_CadastroEmpresa);
          Frm_CadastroEmpresa.ShowModal;
      End;
    CarregaLogins;
end;

procedure TFrm_Login.Timer1Timer(Sender: TObject);
begin
    StatusBar1.Panels[1].Text := ' ' + FormatDateTime ('dddd", "dd" de "mmmm" de "yyyy',now);
    StatusBar1.Panels[2].Text := ' ' + FormatDateTime('hh:nn',now);
end;

procedure TFrm_Login.CarregaLogins;
var i:integer;
  Begin
      C_Login.Items.Clear;
      C_Login.Items.Add('GERENTE');
      For i := 0 to Length(V_Funcionario)-1 do
        Begin
            If V_Funcionario[i].Ativo
              Then C_Login.Items.Add(V_Funcionario[i].Login);
        End;
  End;

end.
