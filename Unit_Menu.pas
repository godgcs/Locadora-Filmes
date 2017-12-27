unit Unit_Menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ComCtrls, Vcl.Menus, Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, Unit_Biblioteca;

type
  TFrm_Menu = class(TForm)
    Panel_Menu: TPanel;
    Bt_Clientes: TBitBtn;
    Bt_Filmes: TBitBtn;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    Ajuda1: TMenuItem;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    Bt_Gerente: TBitBtn;
    Bt_Relatorios: TBitBtn;
    Lb_Vendedor: TLabel;
    Nome_Vendedor: TLabel;
    Bt_Logon: TBitBtn;
    Bt_Caixa: TBitBtn;
    ImagemFundo: TImage;
    Bt_Sair: TBitBtn;
    Panel_Caixa: TPanel;
    Bt_CaixaReceber: TBitBtn;
    Bt_CaixaPagar: TBitBtn;
    Bt_CaixaCaixa: TBitBtn;
    Panel_Gerente: TPanel;
    Bt_GerenteFuncionarios: TBitBtn;
    Bt_GerenteFornecedores: TBitBtn;
    Bt_GerenteCadastroEmpresa: TBitBtn;
    Bt_GerenteCategorias: TBitBtn;
    Panel_Filmes: TPanel;
    Bt_FilmesLocacao: TBitBtn;
    Bt_FilmesDevolucao: TBitBtn;
    Bt_FilmesFilmes: TBitBtn;
    Panel_Clientes: TPanel;
    Bt_ClientesClientes: TBitBtn;
    Bt_ClientesCadastro: TBitBtn;
    Bt_EntradaFilmes: TBitBtn;
    Bt_GerenteImportacao: TBitBtn;
    Help1: TMenuItem;
    Bt_Help: TBitBtn;
    procedure Bt_SairClick(Sender: TObject);
    procedure Bt_GerenteCadastroEmpresaClick(Sender: TObject);
    procedure Bt_LogonClick(Sender: TObject);
    procedure Bt_CaixaClick(Sender: TObject);
    procedure Bt_ClientesClick(Sender: TObject);
    procedure Bt_FilmesClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Bt_RelatoriosClick(Sender: TObject);
    procedure Bt_GerenteClick(Sender: TObject);
    procedure Bt_FilmesFilmesClick(Sender: TObject);
    Procedure AtivaSubMenu(cod:integer);
    procedure Bt_ClientesCadastroClick(Sender: TObject);
    procedure Bt_ClientesEditarClick(Sender: TObject);
    procedure Bt_ClientesClientesClick(Sender: TObject);
    procedure Bt_AdministracaoClick(Sender: TObject);
    procedure Bt_EntradaFilmesClick(Sender: TObject);
    procedure Bt_CaixaCaixaClick(Sender: TObject);
    procedure Bt_GerenteFuncionariosClick(Sender: TObject);
    procedure Bt_GerenteFornecedoresClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Bt_GerenteCategoriasClick(Sender: TObject);
    procedure Bt_CaixaPagarClick(Sender: TObject);
    procedure Bt_FilmesLocacaoClick(Sender: TObject);
    procedure Bt_CaixaReceberClick(Sender: TObject);
    procedure Bt_FilmesDevolucaoClick(Sender: TObject);
    procedure Bt_GerenteImportacaoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Help1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Bt_HelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Menu: TFrm_Menu;
  MenuAtivo:integer;

implementation

{$R *.dfm}

uses Unit_CadastroEmpresa, Unit_Login, Unit_Clientes,
    Unit_Filmes, Unit_Relatorio, Unit_CadastroCliente,
    Unit_EntradaFilmes, Unit_Funcionarios, Unit_Fornecedores,
    Unit_CadastroCategoria, Unit_Categorias, Unit_ContasAPagar, Unit_LocacaoFilme,
    Unit_ContasAReceber, Unit_DevolucaoFilme, Unit_Caixa,
  Unit_ImportacaoExportacao, Unit_Help;

procedure TFrm_Menu.Bt_CaixaCaixaClick(Sender: TObject);
begin
    Application.CreateForm(TFrm_Caixa,Frm_Caixa);
    Frm_Caixa.ShowModal;

    Frm_Caixa.Destroy;
end;

procedure TFrm_Menu.Bt_CaixaClick(Sender: TObject);
begin
    If MenuAtivo<>1
      Then MenuAtivo:=1
      Else MenuAtivo:=0;
    AtivaSubMenu(MenuAtivo);
end;

procedure TFrm_Menu.Bt_CaixaPagarClick(Sender: TObject);
begin
    Application.CreateForm(TFrm_ContasAPagar,Frm_ContasAPagar);
    Frm_ContasAPagar.ShowModal;

    Frm_ContasAPagar.Destroy;
end;

procedure TFrm_Menu.Bt_CaixaReceberClick(Sender: TObject);
begin
    Application.CreateForm(TFrm_ContasAReceber,Frm_ContasAReceber);
    Frm_ContasAReceber.ShowModal;

    Frm_ContasAReceber.Destroy;
end;

procedure TFrm_Menu.Bt_ClientesCadastroClick(Sender: TObject);
begin
    Editar_Cadastro:=False;
    Application.CreateForm(TFrm_CadastroCliente,Frm_CadastroCliente);
    Frm_CadastroCliente.ShowModal;

    Frm_CadastroCliente.Destroy;
end;

procedure TFrm_Menu.Bt_ClientesClick(Sender: TObject);
begin
    If MenuAtivo<>3
      Then MenuAtivo:=3
      Else MenuAtivo:=0;
    AtivaSubMenu(MenuAtivo);
end;

procedure TFrm_Menu.Bt_ClientesClientesClick(Sender: TObject);
begin
    Application.CreateForm(TFrm_Clientes,Frm_Clientes);
    Frm_Clientes.ShowModal;

    Frm_Clientes.Destroy;
end;

procedure TFrm_Menu.Bt_FilmesClick(Sender: TObject);
begin
   If MenuAtivo<>2
      Then MenuAtivo:=2
      Else MenuAtivo:=0;
    AtivaSubMenu(MenuAtivo);
end;

procedure TFrm_Menu.Bt_FilmesDevolucaoClick(Sender: TObject);
begin
    Application.CreateForm(TFrm_DevolucaoFilme,Frm_DevolucaoFilme);
    Frm_DevolucaoFilme.ShowModal;

    Frm_DevolucaoFilme.Destroy;
end;

procedure TFrm_Menu.Bt_GerenteClick(Sender: TObject);
begin
   If MenuAtivo<>6
      Then MenuAtivo:=6
      Else MenuAtivo:=0;
    AtivaSubMenu(MenuAtivo);
end;

procedure TFrm_Menu.Bt_GerenteFornecedoresClick(Sender: TObject);
begin
    Application.CreateForm(TFrm_Fornecedores,Frm_Fornecedores);
    Frm_Fornecedores.ShowModal;

    Frm_Fornecedores.Destroy;
end;

procedure TFrm_Menu.Bt_GerenteFuncionariosClick(Sender: TObject);
begin
    Application.CreateForm(TFrm_Funcionarios,Frm_Funcionarios);
    Frm_Funcionarios.ShowModal;

    Frm_Funcionarios.Destroy;
end;

procedure TFrm_Menu.Bt_GerenteImportacaoClick(Sender: TObject);
begin
    Application.CreateForm(TFrm_ImportacaoExportacao,Frm_ImportacaoExportacao);
    Frm_ImportacaoExportacao.ShowModal;

    Frm_ImportacaoExportacao.Destroy;
end;

procedure TFrm_Menu.Bt_LogonClick(Sender: TObject);
begin
    Frm_Menu.Close;
end;

procedure TFrm_Menu.Bt_RelatoriosClick(Sender: TObject);
begin
    If MenuAtivo<>5
      Then MenuAtivo:=5
      Else MenuAtivo:=0;
    AtivaSubMenu(MenuAtivo);

    Application.CreateForm(TFrm_Relatorio,Frm_Relatorio);
    Frm_Relatorio.ShowModal;

    Frm_Relatorio.Destroy;
end;

procedure TFrm_Menu.Bt_SairClick(Sender: TObject);
begin
    if Application.MessageBox('Deseja Realmente Sair??','Sair',MB_ICONQUESTION+MB_YESNO)=6
      Then Application.Terminate;
end;

procedure TFrm_Menu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    FinalizaVetores;
end;

procedure TFrm_Menu.FormCreate(Sender: TObject);
begin
    if Vendedor_Ativo ='GERENTE'
      Then Begin
               Bt_Gerente.Visible:=True;
           End
      Else Begin
               Bt_Gerente.Visible:=False;
           End;
end;

procedure TFrm_Menu.FormShow(Sender: TObject);
begin
   Nome_Vendedor.Caption:=Vendedor_Ativo;

   SetWindowLong(Frm_Menu.Handle, GWL_ExStyle, GetWindowLong(Frm_Menu.Handle, GWL_ExStyle)
   or WS_EX_AppWindow);
end;

procedure TFrm_Menu.Help1Click(Sender: TObject);
begin
    Application.CreateForm(TFrm_Help, Frm_Help);
    Frm_Help.ShowModal;
end;

procedure TFrm_Menu.Sair1Click(Sender: TObject);
begin
    if Application.MessageBox('Deseja Realmente Sair??','Sair',MB_ICONQUESTION+MB_YESNO)=6
      Then Application.Terminate;
end;

procedure TFrm_Menu.Timer1Timer(Sender: TObject);
begin
    StatusBar1.Panels[1].Text := ' ' + FormatDateTime ('dddd", "dd" de "mmmm" de "yyyy',now);
    StatusBar1.Panels[2].Text := ' ' + FormatDateTime('hh:nn',now);
end;

procedure TFrm_Menu.Bt_FilmesFilmesClick(Sender: TObject);
begin
    Application.CreateForm(TFrm_Filmes, Frm_Filmes);
    Frm_Filmes.ShowModal;

    Frm_Filmes.Destroy;
end;

procedure TFrm_Menu.Bt_FilmesLocacaoClick(Sender: TObject);
begin
    Application.CreateForm(TFrm_LocacaoFilme,Frm_LocacaoFilme);
    Frm_LocacaoFilme.ShowModal;

    Frm_LocacaoFilme.Destroy;
end;

procedure TFrm_Menu.Bt_ClientesEditarClick(Sender: TObject);
begin
    Application.CreateForm(TFrm_CadastroCliente,Frm_CadastroCliente);
    Frm_CadastroCliente.ShowModal;
end;

procedure TFrm_Menu.Bt_GerenteCategoriasClick(Sender: TObject);
begin
    Application.CreateForm(TFrm_Categorias,Frm_Categorias);
    Frm_Categorias.ShowModal;

    Frm_Categorias.Destroy;
end;

procedure TFrm_Menu.Bt_HelpClick(Sender: TObject);
begin
     Application.CreateForm(TFrm_Help, Frm_Help);
     Frm_Help.ShowModal;
end;

procedure TFrm_Menu.Bt_AdministracaoClick(Sender: TObject);
begin
    If MenuAtivo<>4
      Then MenuAtivo:=4
      Else MenuAtivo:=0;
    AtivaSubMenu(MenuAtivo);
end;

procedure TFrm_Menu.Bt_EntradaFilmesClick(Sender: TObject);
begin
    Application.CreateForm(TFrm_EntradaFilmes,Frm_EntradaFilmes);
    Frm_EntradaFilmes.ShowModal;

    Frm_EntradaFilmes.Destroy;
end;

procedure TFrm_Menu.Bt_GerenteCadastroEmpresaClick(Sender: TObject);
begin
    Application.CreateForm(TFrm_CadastroEmpresa,Frm_CadastroEmpresa);
    Frm_CadastroEmpresa.ShowModal;

    Frm_CadastroEmpresa.Destroy;
end;

Procedure TFrm_Menu.AtivaSubMenu(cod:integer);
  Begin
      Panel_Caixa.Visible:=false;
      Panel_Filmes.Visible:=false;
      Panel_Gerente.Visible:=false;
      Panel_Clientes.Visible:=false;

      Case cod of
      1:Panel_Caixa.Visible:=true;
      2:Panel_Filmes.Visible:=true;
      3:Panel_Clientes.Visible:=true;
      4:;
      5:;
      6:Panel_Gerente.Visible:=True;
      end;
  End;

end.
