unit Unit_ImportacaoExportacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Unit_Biblioteca,
  Vcl.ComCtrls;

type
  TFrm_ImportacaoExportacao = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    RadioGroup1: TRadioGroup;
    GroupBox1: TGroupBox;
    Bt_Ok: TBitBtn;
    Bt_Cancelar: TBitBtn;
    CB_Empresa: TCheckBox;
    CB_Clientes: TCheckBox;
    CB_Funcionarios: TCheckBox;
    CB_Categorias: TCheckBox;
    CB_Fornecedores: TCheckBox;
    CB_Filmes: TCheckBox;
    CB_NotasEntrada: TCheckBox;
    CB_Locacoes: TCheckBox;
    CB_NotasAPagar: TCheckBox;
    CB_NotasAReceber: TCheckBox;
    CB_MovimentacoesCaixa: TCheckBox;
    CB_Caixa: TCheckBox;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    CB_Selecionar: TCheckBox;
    Label2: TLabel;
    ProgressBar1: TProgressBar;
    procedure Bt_CancelarClick(Sender: TObject);
    procedure Bt_OkClick(Sender: TObject);
    procedure CB_SelecionarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CB_EmpresaClick(Sender: TObject);
    Procedure VerificaRequisitosDados;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_ImportacaoExportacao: TFrm_ImportacaoExportacao;

implementation

{$R *.dfm}

Procedure TFrm_ImportacaoExportacao.VerificaRequisitosDados;
  Begin
      //alguns dados necessitam de outros pre cadastrados pois estão ligados, então eles devem ser selecionados juntos
      if CB_NotasAReceber.Checked
        Then Begin
                 CB_Locacoes.Checked:=true;
             End;
      if CB_NotasAPagar.Checked
        Then Begin
                 CB_NotasEntrada.Checked:=true;
             End;
      if CB_NotasEntrada.Checked
        Then Begin
                 CB_Fornecedores.Checked:=true;
             End;
      if CB_Locacoes.Checked
        Then Begin
                 CB_Filmes.Checked:=true;
                 CB_Clientes.Checked:=true;
             End;
      if CB_Filmes.Checked
        Then CB_Categorias.Checked:=true;
  End;

procedure TFrm_ImportacaoExportacao.Bt_CancelarClick(Sender: TObject);
begin
    if Application.MessageBox('Deseja Realmente Cancelar?','Cancelar',36)=6
      Then Begin
               Close;
           End;
end;

procedure TFrm_ImportacaoExportacao.Bt_OkClick(Sender: TObject);
var Mensagem:String;
const seta=#26;
begin
    Editar_Cadastro:=false;
    if (RadioGroup1.ItemIndex=0)or(RadioGroup1.ItemIndex=1)
      Then Begin
               Mensagem:='Dados Selecionados:'+#13+#13;
               if CB_Empresa.Checked then Mensagem:=Mensagem+seta+'Empresa'+#13;
               if CB_Clientes.Checked then Mensagem:=Mensagem+seta+'Clientes'+#13;
               if CB_Funcionarios.Checked then Mensagem:=Mensagem+seta+'Funcionarios'+#13;
               if CB_Categorias.Checked then Mensagem:=Mensagem+seta+'Categorias'+#13;
               if CB_Fornecedores.Checked then Mensagem:=Mensagem+seta+'Fornecedores'+#13;
               if CB_Filmes.Checked then Mensagem:=Mensagem+seta+'Filmes'+#13;
               if CB_NotasEntrada.Checked then Mensagem:=Mensagem+seta+'Notas Fiscais de Entrada'+#13;
               if CB_Locacoes.Checked then Mensagem:=Mensagem+seta+'Locações'+#13;
               if CB_NotasAPagar.Checked then Mensagem:=Mensagem+seta+'Notas A Pagar'+#13;
               if CB_NotasAReceber.Checked then Mensagem:=Mensagem+seta+'Notas A Receber'+#13;
               if CB_MovimentacoesCaixa.Checked then Mensagem:=Mensagem+seta+'Movimentações do Caixa'+#13;
               if CB_Caixa.Checked then Mensagem:=Mensagem+seta+'Valor do Caixa'+#13;

               if Application.MessageBox(Pchar(mensagem),'Confirmar Dados Selecionados',36)=6
                 Then Begin
                          if (RadioGroup1.ItemIndex=0)
                            Then Begin
                                     If OpenDialog1.Execute
                                       Then Begin
                                                LerVetores(CB_Empresa.Checked,CB_Clientes.Checked,CB_Funcionarios.Checked,CB_Categorias.Checked,
                                                           CB_Fornecedores.Checked,CB_Filmes.Checked,CB_NotasEntrada.Checked,CB_Locacoes.Checked,
                                                           CB_NotasAPagar.Checked,CB_NotasAReceber.Checked,CB_MovimentacoesCaixa.Checked,CB_Caixa.Checked);
                                                Diretorio_Arquivo:=OpenDialog1.FileName;
                                                ImporArquivo:=True;
                                                RecebeVetores;
                                                VerificaRepeticaoDadosImportacao;
                                                Sleep(1000);

                                                ShowMessage('Importação de Dados Concluida com Sucesso');
                                                Close;
                                            End;
                                 End
                            Else Begin
                                     if SaveDialog1.Execute
                                       Then Begin
                                                LerVetores(CB_Empresa.Checked,CB_Clientes.Checked,CB_Funcionarios.Checked,CB_Categorias.Checked,
                                                           CB_Fornecedores.Checked,CB_Filmes.Checked,CB_NotasEntrada.Checked,CB_Locacoes.Checked,
                                                           CB_NotasAPagar.Checked,CB_NotasAReceber.Checked,CB_MovimentacoesCaixa.Checked,CB_Caixa.Checked);
                                                Diretorio_Arquivo:=SaveDialog1.FileName;
                                                ExporArquivo:=True;
                                                FinalizaVetores;
                                                Sleep(1000);

                                                ShowMessage('Exportação de Dados Concluida com Sucesso');
                                                Close;
                                            End;
                                 End;
                      End;
           End
      Else Begin
               ShowMessage('Selecione a Operação Desejada');
           End;
end;

procedure TFrm_ImportacaoExportacao.CB_EmpresaClick(Sender: TObject);
begin
    VerificaRequisitosDados;
end;

procedure TFrm_ImportacaoExportacao.CB_SelecionarClick(Sender: TObject);
begin
    if CB_Selecionar.Checked
      Then Begin
               CB_Empresa.Checked:=True;
               CB_Clientes.Checked:=True;
               CB_Funcionarios.Checked:=True;
               CB_Categorias.Checked:=True;
               CB_Fornecedores.Checked:=True;
               CB_Filmes.Checked:=True;
               CB_NotasEntrada.Checked:=True;
               CB_Locacoes.Checked:=True;
               CB_NotasAPagar.Checked:=True;
               CB_NotasAReceber.Checked:=True;
               CB_MovimentacoesCaixa.Checked:=True;
               CB_Caixa.Checked:=True;
           End;
    if not(CB_Selecionar.Checked)
      Then Begin
               CB_Caixa.Checked:=False;
               CB_MovimentacoesCaixa.Checked:=False;
               CB_NotasAReceber.Checked:=False;
               CB_NotasAPagar.Checked:=False;
               CB_Locacoes.Checked:=False;
               CB_NotasEntrada.Checked:=False;
               CB_Filmes.Checked:=False;
               CB_Fornecedores.Checked:=False;
               CB_Empresa.Checked:=False;
               CB_Clientes.Checked:=False;
               CB_Funcionarios.Checked:=False;
               CB_Categorias.Checked:=False;
           End;
end;

procedure TFrm_ImportacaoExportacao.FormCreate(Sender: TObject);
begin
    //SetLength(Impor_Empresa,0);
    SetLength(Impor_Cliente,0);
    SetLength(Impor_Filme,0);
    SetLength(Impor_Categoria,0);
    SetLength(Impor_Funcionario,0);
    SetLength(Impor_Fornecedor,0);
    SetLength(Impor_NotaEntrada,0);
    SetLength(Impor_NotaAPagar,0);
    SetLength(Impor_NotaLocacao,0);
    SetLength(Impor_NotaAReceber,0);
    SetLength(Impor_MovimentacaoCaixa,0);
    //SetLength(Impor_Caixa,0);
end;

end.
