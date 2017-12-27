program Project_Locadora;

uses
  Vcl.Forms,
  Unit_Login in 'Unit_Login.pas' {Frm_Login},
  Unit_Menu in 'Unit_Menu.pas' {Frm_Menu},
  Unit_Biblioteca in 'Unit_Biblioteca.pas',
  Unit_CadastroEmpresa in 'Unit_CadastroEmpresa.pas' {Frm_CadastroEmpresa},
  Unit_CadastroCliente in 'Unit_CadastroCliente.pas' {Frm_CadastroCliente},
  Unit_CadastroFilme in 'Unit_CadastroFilme.pas' {Frm_CadastroFilme},
  Unit_CadastroFuncionario in 'Unit_CadastroFuncionario.pas' {Frm_CadastroFuncionario},
  Unit_CadastroFornecedor in 'Unit_CadastroFornecedor.pas' {Frm_CadastroFornecedor},
  Unit_Clientes in 'Unit_Clientes.pas' {Frm_Clientes},
  Unit_Filmes in 'Unit_Filmes.pas' {Frm_Filmes},
  Unit_Relatorio in 'Unit_Relatorio.pas' {Frm_Relatorio},
  Unit_EntradaFilmes in 'Unit_EntradaFilmes.pas' {Frm_EntradaFilmes},
  Unit_Funcionarios in 'Unit_Funcionarios.pas' {Frm_Funcionarios},
  Unit_Fornecedores in 'Unit_Fornecedores.pas' {Frm_Fornecedores},
  Unit_CadastroCategoria in 'Unit_CadastroCategoria.pas' {Frm_CadastroCategoria},
  Unit_Categorias in 'Unit_Categorias.pas' {Frm_Categorias},
  Unit_AcrescentarFilmeNota in 'Unit_AcrescentarFilmeNota.pas' {Frm_AcrescentarFilmeNota},
  Unit_PagamentoEntradaFilme in 'Unit_PagamentoEntradaFilme.pas' {Frm_PagamentoEntradaFilme},
  Unit_ContasAPagar in 'Unit_ContasAPagar.pas' {Frm_ContasAPagar},
  Unit_LocacaoFilme in 'Unit_LocacaoFilme.pas' {Frm_LocacaoFilme},
  Unit_ContasAReceber in 'Unit_ContasAReceber.pas' {Frm_ContasAReceber},
  Unit_AcrescentarFilmeLocacao in 'Unit_AcrescentarFilmeLocacao.pas' {Frm_AcrescentarFilmeLocacao},
  Unit_PagamentoLocacao in 'Unit_PagamentoLocacao.pas' {Frm_PagamentoLocacao},
  Unit_DevolucaoFilme in 'Unit_DevolucaoFilme.pas' {Frm_DevolucaoFilme},
  Unit_DevolucaoFilmeDetalhado in 'Unit_DevolucaoFilmeDetalhado.pas' {Frm_DevolucaoFilmeDetalhada},
  Unit_PagamentoMulta in 'Unit_PagamentoMulta.pas' {Frm_PagamentoMulta},
  Unit_Caixa in 'Unit_Caixa.pas' {Frm_Caixa},
  Unit_ImportacaoExportacao in 'Unit_ImportacaoExportacao.pas' {Frm_ImportacaoExportacao},
  Unit_EditarFilme in 'Unit_EditarFilme.pas' {Frm_EditarFilme},
  Unit_Help in 'Unit_Help.pas' {Frm_Help},
  Unit_RetiradaCaixa in 'Unit_RetiradaCaixa.pas' {Frm_RetiradaCaixa};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrm_Login, Frm_Login);
  Application.CreateForm(TFrm_Help, Frm_Help);
  Application.Run;
end.
