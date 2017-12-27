unit Unit_Biblioteca;

interface

uses
   System.SysUtils, DateUtils, Vcl.Forms;
type
    Empresas = Record
               NomeEmpresa:String;
               RazSocial:String;
               InscEstadual:String;
               CNPJ:String;
               TelEmpresa:String;
               Email:String;
               Cidade:String;
               Bairro:String;
               Lagradouro:String;
               Num:String;
               NomeGerente:String;
               TelGerente:String;
               Senha:String;
    End;
//-------------------------------------------
    Clientes = Record
               Codigo:Integer;
               Nome:String;
               CPF:String;
               Sexo:String;
               EstCivil:String;
               DataNascimento:String;
               Cidade:String;
               Bairro:String;
               Lagradouro:String;
               Num:String;
               Telefone:String;
               Email:String;
               Ativo:Boolean;
    End;
    Vet_Clientes = Array of Clientes;
//-------------------------------------------
    Categorias = Record
                 Codigo:Integer;
                 Nome:String;
                 Descricao:String;
                 PrecoLocacao:String;
                 PrecoMulta:String;
                 Ativo:boolean;
    End;
    Vet_Categorias = Array of Categorias;
//-------------------------------------------
    Funcionarios = Record
                   Codigo:Integer;
                   Nome:String;
                   Telefone:String;
                   Email:String;
                   Cidade:String;
                   Bairro:String;
                   Lagradouro:STring;
                   Num:String;
                   Login:String;
                   Senha:String;
                   Ativo:Boolean;
    End;
    Vet_Funcionarios = Array of Funcionarios;
//-------------------------------------------
    Fornecedores = Record
                   Codigo:Integer;
                   Nome:String;
                   RazSocial:String;
                   InscEstadual:String;
                   CNPJ:String;
                   TelEmpresa:String;
                   Email:String;
                   Cidade:String;
                   Bairro:String;
                   Lagradouro:String;
                   Num:String;
                   Ativo:Boolean;
    End;
    Vet_Fornecedores = Array of Fornecedores;
//-------------------------------------------
    Exemplares = Record
                 SubCodigo:Integer;
                 Disponivel:Boolean;
                 Lucro:String;
                 Ativo:Boolean;             //servira de controle para controles de exemplares ativos, caso algum quebre ou suma
    End;
    Filmes = Record
             Codigo:Integer;                //sera o codigo do filme
             Exemplar:Array of Exemplares;  //O proprio indice do vetor sera um sub codigo se estiver true esta disponivel
             Descricao:String;
             QtdExemplar:integer;
             QtdDisponivel:Integer;
             CodigoCategoria:Integer;
             TipoFilme:String;
             Preco:String;
             Audio:String;
             Ativo:Boolean;                 //sera usado para fazer contagem de filmes para mostrar no string grid de filmes, caso no tenha mais nenhum exemplar ativo passara para false
    End;
    Vet_Filmes = Array of Filmes;
//-------------------------------------------
    FilmeNota = Record
                Descricao:String;
                PrecoCusto:String;
                Quantidade:Integer;
    End;
    NotasEntrada = Record
                   CodigoEntrada:Integer;
                   CodigoFornecedor:Integer;   //ligado ao fornecedor
                   Imposto:String;             //colocar relatorio
                   Frete:String;               //colocar relatorio
                   QtdParcela:Integer;
                   Entrada:String;
                   Total:String;
                   Data:TDate;
                   Hora:String;
                   Filme:Array of FilmeNota;   //sera um vetor para cada filme que for comprado
    End;
    Vet_NotasEntrada = Array of NotasEntrada;
//-------------------------------------------
    ParcelaAPagar = Record
                    NumParcela:Integer;      //1, 2 ou 3 parcela
                    DataVencimento:TDate;    //data para se pagar
                    Valor:String;            //valor da parcela
                    DataPaga:TDate;          //Data que foi paga
                    HoraPaga:String;         //Hora que foi paga
                    Multa:String;            //Valor da Multa
                    Paga:Boolean;            //se ja foi paga
    End;
    NotasAPagar = Record
                  Codigo:integer;                     //será associado ao codigo da nota de entrada
                  Parcelas:Array of ParcelaAPagar;    //sera um vetor para cada parcela a se pagar
    End;
    Vet_NotasAPagar = Array of NotasAPagar;
//-------------------------------------------
    FilmeLocacao = Record
                   CodigoFilme:String;      //ligado ao codigo filme + - + Codigo exemplar
                   CodigoCategoria:Integer;   //ligado ao codigo de categoria
                   DataDevolvida:TDate;
                   Devolvido:Boolean;
    End;
    NotasLocacao = Record
                   Codigo:Integer;
                   CodigoCliente:Integer;    //ligado ao codigo do cliente
                   Funcionario:String;
                   QtdParcela:Integer; //se for 0 significa q é avista caso contrario é aprazo com qtd de parcela
                   Entrada:String;
                   Total:String;
                   Data:TDate;
                   DataDevolucao:TDate;
                   Hora:String;       //retirar depois
                   Multa:String;      //retirar depois
                   Filme:Array of FilmeLocacao;
    End;
    Vet_NotasLocacao = Array of NotasLocacao;
//-------------------------------------------
    ParcelaAReceber = Record
                      NumParcela:Integer;      //1, 2 ou 3 parcela
                      DataVencimento:TDate;    //data para se Receber
                      Valor:String;            //valor da parcela
                      DataPaga:TDate;          //Data que foi recebida
                      HoraPaga:String;         //Hora que foi recebida
                      Multa:String;            //ELIMINAR
                      Paga:Boolean;            //se ja foi recebida
    End;
    NotasAReceber = Record
                    Codigo:integer;                       //será associado ao codigo da nota de locacao
                    CodigoCliente:Integer;                //será associado ao codigo do cliente
                    Parcelas:Array of ParcelaAReceber;    //sera um vetor para cada parcela a se pagar
    End;
    Vet_NotasAReceber = Array of NotasAReceber;
//-------------------------------------------
    Movimentacao = Record
                   Descricao:String;
                   Valor:String;
                   Data:TDate;
                   Hora:TTime;
    End;
    Vet_Movimentacao = Array of Movimentacao;

//Procedimentos iniciais e finais para tratamento dos dados do sistema
Procedure IniciaVetores;
Procedure RecebeVetores;
Procedure VerificaRepeticaoDadosImportacao;
Procedure FinalizaVetores;
Procedure LerVetores(DadosEmpresa,DadosCliente,DadosFuncionario,DadosCategoria,
                     DadosFornecedor,DadosFilme,DadosNotaEntrada,DadosLocacao,
                     DadosContaAPagar,DadosContasAReceber,DadosMovimentacaoCaixa,DadosCaixa
                     :Boolean);//vai definir por booleanas quais vetores serão lidos

//Processos de leitura de cada dado do arquivo dividido por categorias----------
Procedure LeEmpresa(TagTemp,Temp:STring;var Empresa:Empresas);
Procedure LeCliente(TagTemp,Temp:STring;var Cliente:Clientes);
Procedure LeFuncionario(TagTemp,Temp:STring;var Funcionario:Funcionarios);
Procedure LeCategoria(TagTemp,Temp:STring;var Categoria:Categorias);
Procedure LeFornecedor(TagTemp,Temp:STring;var Fornecedor:Fornecedores);
Procedure LeFilme(TagTemp,SubTagTemp,Temp:STring;qtd_SubRegistro:Integer;var Filme:Filmes);
Procedure LeCaixa(TagTemp,Temp:STring;var Caixa:String);
Procedure LeNotaEntrada(TagTemp,SubTagTemp,Temp:STring;qtd_SubRegistro:Integer;var NotaEntrada:NotasEntrada);
Procedure LeNotaAPagar(TagTemp,SubTagTemp,Temp:STring;qtd_SubRegistro:Integer;var NotaAPagar:NotasAPagar);
Procedure LeNotaLocacao(TagTemp,SubTagTemp,Temp:STring;qtd_SubRegistro:Integer;var NotaLocacao:NotasLocacao);
Procedure LeNotaAReceber(TagTemp,SubTagTemp,Temp:STring;qtd_SubRegistro:Integer;var NotaAReceber:NotasAReceber);
Procedure LeMovimentacaoCaixa(TagTemp,Temp:STring;var MovimentacaoCaixa:Movimentacao);

//Faz procedimentos internos no sistema que levam a uma modificação nos dados posteriormente
Procedure GravaDevolucaoNotaFilme(cod:NotasLocacao);
Procedure GravaDevolucaoExemplarFilme(cod,subCod:integer);
Procedure PagaParcela(Codigo,Parcela:Integer);
Procedure RecebeParcela(Codigo,Parcela:Integer);
Procedure CarregaCopiaTemporariaFilmes;  //faz copia do vetor V_Filmes para CopiaFilme
Procedure GravaVetorOriginal;            //copia os dados modificados de CopiaFilme para V_Filme
Function  ArredondaNumero(valor:String):String;
Function  VerificaTeclaNumeroReal(num:String;key:char):Char;
Function  VerificaTeclaNumeroInteiro(num:String;Key:char):Char;

//As multas serão calculadas em execução e mostradas nos componentes visuais
Procedure DescontaPagamento(Valor:String);
Procedure RecebePagamento(Valor:String);
Function  CalculaMultaDevolucao(PrazoDevolucao:TDate;CodigoCategoria:integer):String;
Function  CalculaMultaPagamentos(PrazoDevolucao:TDate;ValorParcela:String):String;

//Todos os processos de Cadastro de dados em variaveis
Procedure CadastraEmpresa(cod:Empresas);
Procedure CadastraCliente(cod:Clientes;var vetor:Vet_Clientes);
Procedure CadastraCategoria(cod:Categorias;var vetor:Vet_Categorias);
Procedure CadastraFuncionario(cod:Funcionarios;var vetor:Vet_Funcionarios);
Procedure CadastraFornecedor(cod:Fornecedores;var vetor:Vet_Fornecedores);
Function  PreCadastraFilme(cod:Filmes):Filmes;
Procedure CadastraFilme(cod:Filmes;var vetor:Vet_Filmes);
Procedure CadastraNotaEntrada(cod:NotasEntrada;var vetor:Vet_NotasEntrada);
Function  PreCadastraContaAPagar(Nota:NotasEntrada;Data,ValorParcela:String):NotasAPagar;
Procedure CadastraContaAPagar(cod:NotasAPagar;var vetor:Vet_NotasAPagar);
Procedure CadastraLocacao(cod:NotasLocacao;var vetor:Vet_NotasLocacao);
Function  PreCadastraContaAReceber(Nota:NotasLocacao;Data,ValorParcela:String):NotasAReceber;
Procedure CadastraContaAReceber(cod:NotasAReceber;var Vetor:Vet_NotasAReceber);
Procedure CadastraMovimentacaoCaixa(cod:Movimentacao;var vetor:Vet_Movimentacao);

//Todos os processos de exclusao no sistema serão logicos
Procedure ExcluiCliente(cod:integer);
Procedure ExcluiCategoria(cod:integer);
Procedure ExcluiFuncionario(cod:integer);
Procedure ExcluiFornecedor(cod:integer);

//Faz Verificação se não é um dado repetido
Function VerificaCliente(CPF:string):integer;
Function VerificaCategoria(Nome:string):integer;
Function VerificaFuncionario(login:String):integer;
Function VerificaFornecedor(CNPJ:string):integer;
Function VerificaFilme(Nome:string):integer;
Function VerificaPagarContaAvista(ValorConta:String):Boolean;
Function VerificaLoginFuncionario(login,senha:String):Boolean;

//Retorna indices dos vetores de dados do sistema
Function RetornaIndiceCliente(cod:integer):integer;
Function RetornaIndiceCategoria(cod:integer):integer;
Function RetornaIndiceVendedor(cod:integer):integer;
Function RetornaIndiceFornecedor(cod:integer):integer;
Function RetornaIndiceNotaAPagar(cod:integer):integer;
Function RetornaIndiceNotaAReceber(cod:integer):integer;
Function RetornaIndiceFilme(cod:integer):integer;
Function RetornaIndiceExemplar(ind,cod:integer):integer;
Function RetornaIndiceExemplarFilmeDisponivel(Filme:Filmes):integer;
Function RetornaIndiceLocacao(cod:integer):integer;

//Retorna a propria variavel com o dado a ser editado
Function RetornaVendedorEditar(ind:integer):Funcionarios;
Function RetornaClienteEditar(ind:integer):Clientes;
Function RetornaCategoriaEditar(ind:integer):Categorias;
Function RetornaFornecedorEditar(ind:integer):Fornecedores;
Function RetornaFilmeEditar(ind:integer;Vetor:Array of Filmes):Filmes;
Function RetornaCNPJFornecedor(Nome:String):String;
Function RetornaPrecoLocacaoCategoria(cod:integer):String;
Function RetornaLocaçãoEditar(ind:integer):NotasLocacao;

const zero='0,00';
      NumerosReais=['0'..'9',',',#8];  //Conjuntos tipo reais
      NumerosInteiros=['0'..'9',#8];   //Conjuntos tipo numeros inteiros

var
  Arquivo_Empresa : TextFile;
  //
  V_Empresa, Impor_Empresa : Empresas;
  Empresa_Cadastrada : Boolean;
  //
  V_Cliente, Impor_Cliente : Vet_Clientes;
  Qtd_Cliente_Ativo : Integer;
  //
  V_Filme, Impor_Filme : Vet_Filmes;
  CopiaFilme: Vet_Filmes;   //será usado como copia do vetor fixo para fazer modificações na hora de uma locação
  Qtd_Filme_Ativo : Integer;
  //
  V_Categoria, Impor_Categoria : Vet_Categorias;
  Qtd_Categoria_Ativo : Integer;
  //
  V_Funcionario, Impor_Funcionario : Vet_Funcionarios;
  Qtd_Funcionarios_Ativo : Integer;
  //
  V_Fornecedor, Impor_Fornecedor : Vet_Fornecedores;
  Qtd_Fornecedor_Ativo : Integer;
  //
  V_NotaEntrada, Impor_NotaEntrada : Vet_NotasEntrada;
  V_TempNotaEntrada : NotasEntrada;       //Vetor Temporario
  Qtd_NotaEntrada, Temp_Qtd_Filmes, cont: Integer;
  //
  V_NotaAPagar, Impor_NotaAPagar : Vet_NotasAPagar;
  Qtd_NotaAPagar_Ativo : Integer;
  //
  V_NotaLocacao, Impor_NotaLocacao : Vet_NotasLocacao;       //Será usado como a nota com todos os dados da locação e também usado para devolução
  V_TempNotaLocacao : NotasLocacao;       //Vetor Temporario
  Qtd_Locacao_Ativo : Integer;
  //
  V_NotaAReceber, Impor_NotaAReceber : Vet_NotasAReceber;
  Qtd_NotaAReceber_Ativo : Integer;
  //
  V_MovimentacaoCaixa, Impor_MovimentacaoCaixa : Vet_Movimentacao;  //qualquer movimentação no caixa será atribuida aqui
  V_Caixa, Impor_Caixa : String;
  //
  Cod_Arquivo : integer;
  Editar_Cadastro ,CadastroFilmeNota, ConfirmaPagamento,ConfirmaAlteracao,ImporArquivo,ExporArquivo,Saque: Boolean;
  lin,ind : integer;
  Vendedor_Ativo, Multa, Diretorio_Arquivo: String;
  Progresso, Media : Integer;
//Faz o controle dos vetores que serão lidas do arquivo-------------------------------------
  LerDadosEmpresa,LerDadosCliente,LerDadosCategoria,LerDadosFuncionario,
  LerDadosFornecedor,LerDadosFilme,LerDadosNotaEntrada,LerDadosContaAPagar,
  LerDadosLocacao,LerDadosContasAReceber,LerDadosMovimentacaoCaixa,LerDadosCaixa:Boolean;
//------------------------------------------------------------------------------------------
implementation

uses Unit_ImportacaoExportacao;

Procedure LerVetores(DadosEmpresa,DadosCliente,DadosFuncionario,DadosCategoria,
                     DadosFornecedor,DadosFilme,DadosNotaEntrada,DadosLocacao,
                     DadosContaAPagar,DadosContasAReceber,DadosMovimentacaoCaixa,DadosCaixa
                     :Boolean);
  Begin
      LerDadosEmpresa:=DadosEmpresa;
      LerDadosCliente:=DadosCliente;
      LerDadosCategoria:=DadosCategoria;
      LerDadosFuncionario:=DadosFuncionario;
      LerDadosFornecedor:=DadosFornecedor;
      LerDadosFilme:=DadosFilme;
      LerDadosNotaEntrada:=DadosNotaEntrada;
      LerDadosContaAPagar:=DadosContaAPagar;
      LerDadosLocacao:=DadosLocacao;
      LerDadosContasAReceber:=DadosContasAReceber;
      LerDadosMovimentacaoCaixa:=DadosMovimentacaoCaixa;
      LerDadosCaixa:=DadosCaixa;
  End;

Procedure IniciaVetores;
  Begin
      ImporArquivo:=False;
      ExporArquivo:=False;
      SetLength(V_Cliente,0);
      SetLength(V_Filme,0);
      SetLength(V_Categoria,0);
      SetLength(V_Funcionario,0);
      SetLength(V_Fornecedor,0);
      SetLength(V_NotaEntrada,0);
      SetLength(V_NotaAPagar,0);
      SetLength(V_NotaLocacao,0);
      SetLength(V_MovimentacaoCaixa,0);
      V_Caixa:=zero;
      LerVetores(True,True,True,True,True,True,True,True,True,True,True,True);
      RecebeVetores;
      If not(DirectoryExists('C:\Relatorios'))
        Then ForceDirectories('C:\Relatorios');
      If not(DirectoryExists('C:\Relatorios\EntradaFilmes'))
        Then ForceDirectories('C:\Relatorios\EntradaFilmes');
      If not(DirectoryExists('C:\Relatorios\Locação'))
        Then ForceDirectories('C:\Relatorios\Locação');
      If not(DirectoryExists('C:\Relatorios\Multas'))
        Then ForceDirectories('C:\Relatorios\Multas');
      If not(DirectoryExists('C:\Relatorios\RelatoriosEmpresariais'))
        Then ForceDirectories('C:\Relatorios\RelatoriosEmpresariais');
  End;

Procedure RecebeVetores;
var i,{Qtd_Registro,}Qtd_SubRegistro:integer;
    Linha:String;
    TagTemp,Temp,TabelaTemp,SubTagTemp,TagClose:String;
    Empresa:Empresas;
    Cliente:Clientes;
    Categoria:Categorias;
    Funcionario:Funcionarios;
    Fornecedor:Fornecedores;
    Filme:Filmes;
    NotaEntrada:NotasEntrada;
    NotaAPagar:NotasAPagar;
    NotaLocacao:NotasLocacao;
    NotaAReceber:NotasAReceber;
    MovimentacaoCaixa:Movimentacao;
    Caixa:String;
  Begin
      //Qtd_Registro:=0;
      Qtd_SubRegistro:=0;
      Case Cod_Arquivo of
      1:Begin              //arquivo texto
            if not(ImporArquivo)
              Then Diretorio_Arquivo:='Dados.xml';

            Assign(Arquivo_Empresa, Diretorio_Arquivo);
            If not(FileExists(Diretorio_Arquivo))
              Then Begin
                       Rewrite(Arquivo_Empresa);
                       Empresa_Cadastrada:=False;
                   End
              Else Begin
                       Reset(Arquivo_Empresa);
                       while (not Eof(Arquivo_Empresa)) do { enquanto não atingir a marca de final do arquivo }
                         Begin
                             Readln(Arquivo_Empresa,linha);
//---------------------------------DELETA IDENTAÇÃO----------------------------------------
                             i := pos('<', linha);
                             delete(linha, 1, i-1);
//-----------------------PEGA O VALOR DE CADA TAG ABERTURA E FECHAMENTO-------------------
                             i := pos('>', linha);
                             TagTemp := copy(linha, 1, i); //Pega o valor da Tag
                             delete(linha, 1, i);
                             TagClose:=TagTemp;
                             Insert('/',TagClose,2);
//------------------------ATRIBUI VALOR DA TAG PARA VARIAVEL TABELATEMP--------------------------
                             if(TagTemp='<Tabela=Empresa>')or(TagTemp='<Tabela=Clientes>')
                             or(TagTemp='<Tabela=Filmes>')or(TagTemp='<Tabela=Funcionarios>')
                             or(TagTemp='<Tabela=Categorias>')or(TagTemp='<Tabela=Fornecedores>')
                             or(TagTemp='<Tabela=Caixa>')or(TagTemp='<Tabela=NotaEntrada>')
                             or(TagTemp='<Tabela=NotaPagar>')or(TagTemp='<Tabela=Locacao>')
                             or(TagTemp='<Tabela=NotaReceber>')or(TagTemp='<Tabela=MovimentacaoCaixa>')
                               Then Begin
                                        TabelaTemp:=TagTemp;
                                    End;
//------------------------SE VARIAVEL TABELATEMP FOI VARIAVEL DO TIPO ARRAY OF ARRAY DEFINE TAMANHO 0--------------------------
                             if TagTemp='<Registro>'
                               Then Begin
                                        Qtd_SubRegistro:=0;
                                        if TabelaTemp='<Tabela=Filmes>'
                                          Then Begin
                                                   SetLength(Filme.Exemplar,0);
                                               End;
                                        if TabelaTemp='<Tabela=NotaEntrada>'
                                          Then Begin
                                                    SetLength(NotaEntrada.Filme,0);
                                               End;
                                        if TabelaTemp='<Tabela=NotaPagar>'
                                          Then Begin
                                                    SetLength(NotaAPagar.Parcelas,0);
                                               End;
                                        if TaBelaTemp='<Tabela=Locacao>'
                                          Then Begin
                                                    SetLength(NotaLocacao.Filme,0);
                                               End;
                                        if TabelaTemp='<Tabela=NotaReceber>'
                                          Then Begin
                                                    SetLength(NotaAReceber.Parcelas,0);
                                               End;
                                    End;
//------------------------SE A TAG É UM SUB REGISTRO ELE ALMENTA O TAMANHO DO SUB REGISTRO--------------------------
                             if TabelaTemp='<Tabela=Filmes>'
                               Then Begin
                                        if TagTemp='<Sub-Exemplar>'
                                          Then Begin
                                                   inc(qtd_SubRegistro);
                                                   SubTagTemp:=TagTemp;
                                                   SetLength(Filme.Exemplar,Length(Filme.Exemplar)+1);
                                               End;
                                        if TagTemp='</Sub-Exemplar>'
                                          Then SubTagTemp:=TagTemp;
                                    End;
                             if TabelaTemp='<Tabela=NotaEntrada>'
                                Then Begin
                                         if TagTemp='<Sub-Filmes>'
                                           Then Begin
                                                    inc(qtd_SubRegistro);
                                                    SubTagTemp:=TagTemp;
                                                    SetLength(NotaEntrada.Filme,Length(NotaEntrada.Filme)+1);
                                                End;
                                         if TagTemp='</Sub-Filmes>'
                                           Then SubTagTemp:=TagTemp;
                                     End;
                             if TabelaTemp='<Tabela=NotaPagar>'
                               Then Begin
                                        if TagTemp='<Sub-Parcelas>'
                                          Then Begin
                                                   inc(qtd_SubRegistro);
                                                   SubTagTemp:=TagTemp;
                                                   SetLength(NotaAPagar.Parcelas,Length(NotaAPagar.Parcelas)+1);
                                                 End;
                                        if TagTemp='</Sub-Parcelas>'
                                          Then SubTagTemp:=TagTemp;
                                      End;
                             if TabelaTemp='<Tabela=Locacao>'
                               Then Begin
                                        if TagTemp='<Sub-Filmes>'
                                          Then Begin
                                                   inc(qtd_SubRegistro);
                                                   SubTagTemp:=TagTemp;
                                                   SetLength(NotaLocacao.Filme,Length(NotaLocacao.Filme)+1);
                                               End;
                                        if TagTemp='</Sub-Filmes>'
                                          Then SubTagTemp:=TagTemp;
                                     End;
                             if TabelaTemp='<Tabela=NotaReceber>'
                               Then Begin
                                        if TagTemp='<Sub-Parcelas>'
                                          Then Begin
                                                   inc(qtd_SubRegistro);
                                                   SubTagTemp:=TagTemp;
                                                   SetLength(NotaAReceber.Parcelas,Length(NotaAReceber.Parcelas)+1);
                                               End;
                                        if TagTemp='</Sub-Parcelas>'
                                          Then SubTagTemp:=TagTemp;
                                    End;
//------------------------------PEGA O VALOR DA LINHA ENTRE AS TAGS-------------------------
                             i := pos(TagClose, linha);
                             Temp := copy(linha, 1, i-1); //Pega Valor da linha
//------------------------------CADASTRA O CONTEUDO DE CADA TAG EM SEUS VETORES-------------------------
                             if TabelaTemp='<Tabela=Empresa>'
                               Then Begin
                                        If LerDadosEmpresa
                                          Then LeEmpresa(TagTemp,Temp,Empresa);
                                    End
                               Else Begin
                                        if TabelaTemp='<Tabela=Clientes>'
                                          Then Begin
                                                   if LerDadosCliente
                                                     Then LeCliente(TagTemp,Temp,Cliente);
                                               End
                                          Else Begin
                                                   if TabelaTemp='<Tabela=Funcionarios>'
                                                     Then Begin
                                                              if LerDadosFuncionario
                                                                Then LeFuncionario(TagTemp,Temp,Funcionario);
                                                          End
                                                     Else Begin
                                                              if TabelaTemp='<Tabela=Categorias>'
                                                                Then Begin
                                                                         if LerDadosCategoria
                                                                           Then LeCategoria(TagTemp,Temp,Categoria);
                                                                     End
                                                                Else Begin
                                                                         If TabelaTemp='<Tabela=Fornecedores>'
                                                                           Then Begin
                                                                                    if LerDadosFornecedor
                                                                                      Then LeFornecedor(TagTemp,Temp,Fornecedor);
                                                                                End
                                                                           Else Begin
                                                                                    if TabelaTemp='<Tabela=Filmes>'
                                                                                      Then Begin
                                                                                               if LerDadosFilme
                                                                                                 Then LeFilme(TagTemp,SubTagTemp,Temp,qtd_SubRegistro,Filme);
                                                                                           End
                                                                                      Else Begin
                                                                                               if TabelaTemp='<Tabela=Caixa>'
                                                                                                 Then Begin
                                                                                                          if LerDadosCaixa
                                                                                                            Then LeCaixa(TagTemp,Temp,Caixa);
                                                                                                      End
                                                                                                 Else Begin
                                                                                                          if TabelaTemp='<Tabela=NotaEntrada>'
                                                                                                            Then Begin
                                                                                                                     if LerDadosNotaEntrada
                                                                                                                       Then LeNotaEntrada(TagTemp,SubTagTemp,Temp,qtd_SubRegistro,NotaEntrada);
                                                                                                                 End
                                                                                                            Else Begin
                                                                                                                     if TabelaTemp='<Tabela=NotaPagar>'
                                                                                                                       Then Begin
                                                                                                                                if LerDadosContaAPagar
                                                                                                                                  Then LeNotaAPagar(TagTemp,SubTagTemp,Temp,qtd_SubRegistro,NotaAPagar);
                                                                                                                            End
                                                                                                                       Else Begin
                                                                                                                                if TabelaTemp='<Tabela=Locacao>'
                                                                                                                                  Then Begin
                                                                                                                                           if LerDadosLocacao
                                                                                                                                             Then LeNotaLocacao(TagTemp,SubTagTemp,Temp,qtd_SubRegistro,NotaLocacao);
                                                                                                                                       End
                                                                                                                                  Else Begin
                                                                                                                                           if TabelaTemp='<Tabela=NotaReceber>'
                                                                                                                                             Then Begin
                                                                                                                                                      if LerDadosContasAReceber
                                                                                                                                                        Then LeNotaAReceber(TagTemp,SubTagTemp,Temp,qtd_SubRegistro,NotaAReceber);
                                                                                                                                                  End
                                                                                                                                             Else Begin
                                                                                                                                                      if TabelaTemp='<Tabela=MovimentacaoCaixa>'
                                                                                                                                                        Then Begin
                                                                                                                                                                 if LerDadosMovimentacaoCaixa
                                                                                                                                                                   Then LeMovimentacaoCaixa(TagTemp,Temp,MovimentacaoCaixa);
                                                                                                                                                             End
                                                                                                                                                        Else Begin
                                                                                                                                                                 //
                                                                                                                                                             End;
                                                                                                                                                  End;
                                                                                                                                       End;
                                                                                                                            End;
                                                                                                                 End;
                                                                                                      End;
                                                                                           End;
                                                                                End;
                                                                     End;
                                                          End;
                                               End;
                                    End;
                         End;  //END While
                   End;
            CloseFile(Arquivo_Empresa);
            if ImporArquivo
              Then ImporArquivo:=False;
        End;  //END Case op 1
      2: ; //Arquivo Binario
      3: ; //Nuvem
      4: ; //Banco de dados
      end;
  End; {if not(ImporExporArquivo)}

Procedure LeEmpresa(TagTemp,Temp:STring;var Empresa:Empresas);
  Begin
      if TagTemp='<NomeEmpresa>'
         Then Empresa.NomeEmpresa:=Temp
         Else Begin
                  If TagTemp='<RazSocial>'
                    Then Empresa.RazSocial:=Temp
                    Else Begin
                             if TagTemp='<InscEstadual>'
                               Then Empresa.InscEstadual:=Temp
                               Else Begin
                                        if TagTemp='<CNPJ>'
                                          Then Empresa.CNPJ:=Temp
                                          Else Begin
                                                   if TagTemp='<TelEmpresa>'
                                                     Then Empresa.TelEmpresa:=Temp
                                                     Else Begin
                                                              if TagTemp='<Email>'
                                                                Then Empresa.Email:=Temp
                                                                Else Begin
                                                                         if TagTemp='<Cidade>'
                                                                           Then Empresa.Cidade:=Temp
                                                                           Else Begin
                                                                                    if TagTemp='<Bairro>'
                                                                                      Then Empresa.Bairro:=Temp
                                                                                      Else Begin
                                                                                               if TagTemp='<Lagradouro>'
                                                                                                 Then Empresa.Lagradouro:=Temp
                                                                                                 Else Begin
                                                                                                          if TagTemp='<Num>'
                                                                                                            Then Empresa.Num:=Temp
                                                                                                            Else Begin
                                                                                                                     if TagTemp='<NomeGerente>'
                                                                                                                       Then Empresa.NomeGerente:=Temp
                                                                                                                       Else Begin
                                                                                                                                if TagTemp='<TelGerente>'
                                                                                                                                  Then Empresa.TelGerente:=Temp
                                                                                                                                  Else Begin
                                                                                                                                           if TagTemp='<Senha>'
                                                                                                                                             Then Empresa.Senha:=Temp
                                                                                                                                             Else Begin
                                                                                                                                                      if TagTemp='</Registro>'
                                                                                                                                                        Then Begin
                                                                                                                                                                 if not(ImporArquivo)
                                                                                                                                                                   Then Begin
                                                                                                                                                                            CadastraEmpresa(Empresa);
                                                                                                                                                                        End
                                                                                                                                                                   Else Begin
                                                                                                                                                                            if LerDadosEmpresa
                                                                                                                                                                              Then Begin
                                                                                                                                                                                       if Empresa_Cadastrada
                                                                                                                                                                                         Then Begin
                                                                                                                                                                                                  if (Application.MessageBox('Deseja Substituir os dados Atuais Empresariais pelo do novo Arquivo?','Substituir Dados Empresariais',36)=6)
                                                                                                                                                                                                    Then CadastraEmpresa(Empresa);
                                                                                                                                                                                              End
                                                                                                                                                                                         Else CadastraEmpresa(Empresa);
                                                                                                                                                                                   End;
                                                                                                                                                                        End;
                                                                                                                                                             End;
                                                                                                                                                  End;
                                                                                                                                       End;
                                                                                                                            End;
                                                                                                                 End;
                                                                                                      End;
                                                                                           End;
                                                                                End;
                                                                     End;
                                                          End;
                                               End;
                                    End;
                         End;
              End;
  End;

Procedure LeCliente(TagTemp,Temp:STring;var Cliente:Clientes);
  Begin
      if TagTemp='<Codigo>'
         Then Cliente.Codigo:=StrToInt(temp)
         Else Begin
                  if TagTemp='<Nome>'
                    Then Cliente.Nome:=temp
                    Else Begin
                             if TagTemp='<CPF>'
                               Then Cliente.CPF:=temp
                               Else Begin
                                        if TagTemp='<Sexo>'
                                          Then Cliente.Sexo:=temp
                                          Else Begin
                                                   if TagTemp='<EstCivil>'
                                                     Then Cliente.EstCivil:=temp
                                                     Else Begin
                                                              if TagTemp='<DataNascimento>'
                                                                Then Cliente.DataNascimento:=temp
                                                                Else Begin
                                                                         if TagTemp='<Cidade>'
                                                                           Then Cliente.Cidade:=temp
                                                                           Else Begin
                                                                                    if TagTemp='<Bairro>'
                                                                                      Then Cliente.Bairro:=temp
                                                                                      Else Begin
                                                                                               if TagTemp='<Lagradouro>'
                                                                                                 Then Cliente.Lagradouro:=temp
                                                                                                 Else Begin
                                                                                                          if TagTemp='<Num>'
                                                                                                            Then Cliente.Num:=temp
                                                                                                            Else Begin
                                                                                                                     if TagTemp='<Telefone>'
                                                                                                                       Then Cliente.Telefone:=temp
                                                                                                                       Else Begin
                                                                                                                                if TagTemp='<Email>'
                                                                                                                                  Then Cliente.Email:=temp
                                                                                                                                  Else Begin
                                                                                                                                           if TagTemp='<Ativo>'
                                                                                                                                             Then Begin
                                                                                                                                                      if temp='True'
                                                                                                                                                        Then Cliente.Ativo:=True
                                                                                                                                                        Else Cliente.Ativo:=False;
                                                                                                                                                  End
                                                                                                                                             Else Begin
                                                                                                                                                      if TagTemp='</Registro>'
                                                                                                                                                        Then Begin
                                                                                                                                                                 if not(ImporArquivo)
                                                                                                                                                                   Then Begin
                                                                                                                                                                            CadastraCliente(Cliente,V_Cliente);
                                                                                                                                                                            if Cliente.Ativo Then inc(Qtd_Cliente_Ativo);
                                                                                                                                                                        End
                                                                                                                                                                   Else CadastraCliente(Cliente,Impor_Cliente);
                                                                                                                                                             End;
                                                                                                                                                  End;
                                                                                                                                       End;
                                                                                                                            End;
                                                                                                                 End;
                                                                                                      End;
                                                                                           End;
                                                                                End;
                                                                     End;
                                                          End;
                                               End;
                                    End;
                         End;
              End;
  End;

Procedure LeFuncionario(TagTemp,Temp:STring;var Funcionario:Funcionarios);
  Begin
      If TagTemp='<Codigo>'
        Then Funcionario.Codigo:=StrToInt(Temp)
        Else Begin
                 if TagTemp='<Nome>'
                   Then Funcionario.Nome:=Temp
                   Else Begin
                            if TagTemp='<Telefone>'
                              Then Funcionario.Telefone:=Temp
                              Else Begin
                                       if TagTemp='<Email>'
                                         Then Funcionario.Email:=Temp
                                         Else Begin
                                                  if TagTemp='<Cidade>'
                                                    Then Funcionario.Cidade:=Temp
                                                    Else Begin
                                                             if TagTemp='<Bairro>'
                                                               Then Funcionario.Bairro:=Temp
                                                               Else Begin
                                                                        if TagTemp='<Lagradouro>'
                                                                          Then Funcionario.Lagradouro:=Temp
                                                                          Else Begin
                                                                                   if TagTemp='<Num>'
                                                                                     Then Funcionario.Num:=Temp
                                                                                     Else Begin
                                                                                              if TagTemp='<Login>'
                                                                                                Then Funcionario.Login:=Temp
                                                                                                Else Begin
                                                                                                         if TagTemp='<Senha>'
                                                                                                           Then Funcionario.Senha:=Temp
                                                                                                           Else Begin
                                                                                                                    if TagTemp='<Ativo>'
                                                                                                                      Then Begin
                                                                                                                               if temp='True'
                                                                                                                                 Then Funcionario.Ativo:=true
                                                                                                                                 Else Funcionario.Ativo:=False;
                                                                                                                           End
                                                                                                                      Else Begin
                                                                                                                               if TagTemp='</Registro>'
                                                                                                                                 Then Begin
                                                                                                                                          if not(ImporArquivo)
                                                                                                                                            Then Begin
                                                                                                                                                     CadastraFuncionario(Funcionario,V_Funcionario);
                                                                                                                                                     if Funcionario.Ativo Then inc(Qtd_Funcionarios_Ativo);
                                                                                                                                                 End
                                                                                                                                            Else CadastraFuncionario(Funcionario,Impor_Funcionario)
                                                                                                                                      End;
                                                                                                                           End;
                                                                                                                End;
                                                                                                     End;
                                                                                          End;
                                                                               End;
                                                                    End;
                                                         End;
                                              End;
                                   End;
                        End;
             End;
  End;

Procedure LeCategoria(TagTemp,Temp:STring;var Categoria:Categorias);
  Begin
      If TagTemp='<Codigo>'
         Then Categoria.Codigo:=StrToInt(Temp)
         Else Begin
                  if TagTemp='<Nome>'
                    Then Categoria.Nome:=Temp
                    Else Begin
                             if TagTemp='<Descricao>'
                               Then Categoria.Descricao:=Temp
                               Else Begin
                                        if TagTemp='<Preco>'
                                          Then Categoria.PrecoLocacao:=Temp
                                          Else Begin
                                                   if TagTemp='<PrecoMulta>'
                                                    Then Categoria.PrecoMulta:=Temp
                                                    Else Begin
                                                             if TagTemp='<Ativo>'
                                                               Then Begin
                                                                        if temp='True'
                                                                          Then Categoria.Ativo:=true
                                                                          Else Categoria.Ativo:=False;
                                                                    End
                                                               Else Begin
                                                                        if TagTemp='</Registro>'
                                                                          Then Begin
                                                                                   if not(ImporArquivo)
                                                                                     Then Begin
                                                                                              CadastraCategoria(Categoria,V_Categoria);
                                                                                              if Categoria.Ativo Then inc(Qtd_Categoria_Ativo);
                                                                                          End
                                                                                     Else CadastraCategoria(Categoria,Impor_Categoria);
                                                                               End;
                                                                    End;
                                                         End;
                                               End;
                                    End;
                         End;
              End;
  End;

Procedure LeFornecedor(TagTemp,Temp:STring;var Fornecedor:Fornecedores);
  Begin
      if TagTemp='<Codigo>'
        Then Fornecedor.Codigo:=StrToInt(Temp)
        Else Begin
                 if TagTemp='<Nome>'
                   Then Fornecedor.Nome:=Temp
                   Else Begin
                            if TagTemp='<RazSocial>'
                              Then Fornecedor.RazSocial:=Temp
                              Else Begin
                                       if TagTemp='<InscEstadual>'
                                         Then Fornecedor.InscEstadual:=Temp
                                         Else Begin
                                                  if TagTemp='<CNPJ>'
                                                    Then Fornecedor.CNPJ:=Temp
                                                    Else Begin
                                                             if TagTemp='<TelEmpresa>'
                                                               Then Fornecedor.TelEmpresa:=Temp
                                                               Else Begin
                                                                        if TagTemp='<Email>'
                                                                          Then Fornecedor.Email:=Temp
                                                                          Else Begin
                                                                                   if TagTemp='<Cidade>'
                                                                                     Then Fornecedor.Cidade:=Temp
                                                                                     Else Begin
                                                                                              if TagTemp='<Bairro>'
                                                                                                Then Fornecedor.Bairro:=Temp
                                                                                                Else Begin
                                                                                                         if TagTemp='<Lagradouro>'
                                                                                                           Then Fornecedor.Lagradouro:=Temp
                                                                                                           Else Begin
                                                                                                                    if TagTemp='<Num>'
                                                                                                                      Then Fornecedor.Num:=Temp
                                                                                                                      Else Begin
                                                                                                                               if TagTemp='<Ativo>'
                                                                                                                                 Then Begin
                                                                                                                                          if temp='True'
                                                                                                                                            Then Fornecedor.Ativo:=true
                                                                                                                                            Else Fornecedor.Ativo:=False;
                                                                                                                                      End
                                                                                                                                 Else Begin
                                                                                                                                          if TagTemp='</Registro>'
                                                                                                                                            Then Begin
                                                                                                                                                     if not(ImporArquivo)
                                                                                                                                                       Then Begin
                                                                                                                                                                CadastraFornecedor(Fornecedor,V_Fornecedor);
                                                                                                                                                                if Fornecedor.Ativo Then inc(Qtd_Fornecedor_Ativo);
                                                                                                                                                            End
                                                                                                                                                       Else CadastraFornecedor(Fornecedor,Impor_Fornecedor);
                                                                                                                                                 End;
                                                                                                                                      End;
                                                                                                                           End;
                                                                                                                End;
                                                                                                     End;
                                                                                          End;
                                                                               End;
                                                                    End;
                                                         End;
                                              End;
                                   End;
                        End;
             End;
  End;

Procedure LeFilme(TagTemp,SubTagTemp,Temp:STring;qtd_SubRegistro:Integer;var Filme:Filmes);
  Begin
      if TagTemp='<Codigo>'
         Then Filme.codigo:=StrToInt(Temp)
         Else Begin
                  if TagTemp='<Descricao>'
                    Then Filme.Descricao:=Temp
                    Else Begin
                             if TagTemp='<QtdExemplar>'
                               Then Filme.QtdExemplar:=StrToInt(Temp)
                               Else Begin
                                        If TagTemp='<QtdDisponivel>'
                                          Then Filme.QtdDisponivel:=StrToInt(Temp)
                                          Else Begin
                                                   If TagTemp='<CodigoCategoria>'
                                                     Then Filme.CodigoCategoria:=StrToInt(Temp)
                                                     Else Begin
                                                              If TagTemp='<TipoFilme>'
                                                                Then Filme.TipoFilme:=Temp
                                                                Else Begin
                                                                         If TagTemp='<Preco>'
                                                                           Then Filme.Preco:=Temp
                                                                           Else Begin
                                                                                    If TagTemp='<Audio>'
                                                                                      Then Filme.Audio:=Temp
                                                                                      Else Begin
                                                                                               if TagTemp='<Ativo>'
                                                                                                 Then Begin
                                                                                                          if temp='True'
                                                                                                            Then Filme.Ativo:=true
                                                                                                            Else Filme.Ativo:=False;
                                                                                                      End
                                                                                                 Else Begin
                                                                                                          if SubTagTemp='<Sub-Exemplar>'
                                                                                                            Then Begin
                                                                                                                     if TagTemp='<CodigoExemplar>'
                                                                                                                       Then Filme.Exemplar[qtd_SubRegistro-1].SubCodigo:=StrToInt(Temp)
                                                                                                                       Else Begin
                                                                                                                               if TagTemp='<Disponivel>'
                                                                                                                                 Then Begin
                                                                                                                                          if Temp='True'
                                                                                                                                            Then Filme.Exemplar[qtd_SubRegistro-1].Disponivel:=true
                                                                                                                                            Else Filme.Exemplar[qtd_SubRegistro-1].Disponivel:=false;
                                                                                                                                      End
                                                                                                                                 Else Begin
                                                                                                                                          if TagTemp='<Lucro>'
                                                                                                                                            Then Filme.Exemplar[qtd_SubRegistro-1].Lucro:=Temp
                                                                                                                                            Else Begin
                                                                                                                                                     if TagTemp='<ExemplarAtivo>'
                                                                                                                                                       Then Begin
                                                                                                                                                                if Temp='True'
                                                                                                                                                                  Then Filme.Exemplar[qtd_SubRegistro-1].Ativo:=true
                                                                                                                                                                  Else Filme.Exemplar[qtd_SubRegistro-1].Ativo:=false;
                                                                                                                                                            End;
                                                                                                                                                 End;
                                                                                                                                      End;
                                                                                                                            End;
                                                                                                                 End
                                                                                                            Else Begin
                                                                                                                     if TagTemp='</Registro>'
                                                                                                                       Then Begin
                                                                                                                                if not(ImporArquivo)
                                                                                                                                  Then Begin
                                                                                                                                           CadastraFilme(Filme,V_Filme);
                                                                                                                                           if filme.Ativo Then inc(Qtd_Filme_Ativo);
                                                                                                                                       End
                                                                                                                                  Else CadastraFilme(Filme,Impor_Filme);
                                                                                                                            End;
                                                                                                                 End;
                                                                                                      End;
                                                                                           End;
                                                                                End;
                                                                     End;
                                                          End;
                                               End;
                                    End;
                         End;
              End;
  End;

Procedure LeCaixa(TagTemp,Temp:STring;var Caixa:String);
  Begin
      if TagTemp='<Caixa>'
        Then Caixa:=Temp
        Else Begin
                 if TagTemp='</Registro>'
                   Then Begin
                            if LerDadosCaixa
                              Then V_Caixa:=ArredondaNumero(FloatToStr(StrToFloat(V_Caixa)+StrToFloat(Caixa)));
                        End;
             End;
  End;

Procedure LeNotaEntrada(TagTemp,SubTagTemp,Temp:STring;qtd_SubRegistro:Integer;var NotaEntrada:NotasEntrada);
  Begin
      if TagTemp='<Codigo>'
         Then NotaEntrada.CodigoEntrada:=StrToInt(Temp)
         Else Begin
                  if TagTemp='<CodigoFornecedor>'
                    Then NotaEntrada.CodigoFornecedor:=StrToInt(Temp)
                    Else Begin
                             if TagTemp='<Imposto>'
                               Then NotaEntrada.Imposto:=Temp
                               Else Begin
                                        if TagTemp='<Frete>'
                                          Then NotaEntrada.Frete:=Temp
                                          Else Begin
                                                   if TagTemp='<QtdParcela>'
                                                     Then NotaEntrada.QtdParcela:=StrToInt(Temp)
                                                     Else Begin
                                                              if TagTemp='<Entrada>'
                                                                Then NotaEntrada.Entrada:=Temp
                                                                Else Begin
                                                                         if TagTemp='<Data>'
                                                                           Then NotaEntrada.Data:=StrToDate(Temp)
                                                                           Else Begin
                                                                                    if TagTemp='<Hora>'
                                                                                      Then NotaEntrada.Hora:=Temp
                                                                                      Else Begin
                                                                                               if TagTemp='<Total>'
                                                                                                 Then NotaEntrada.Total:=Temp
                                                                                                 Else Begin
                                                                                                          if SubTagTemp='<Sub-Filmes>'
                                                                                                            Then Begin
                                                                                                                     if TagTemp='<Descrição>'
                                                                                                                       Then NotaEntrada.Filme[qtd_SubRegistro-1].Descricao:=Temp
                                                                                                                       Else Begin
                                                                                                                                if TagTemp='<PrecoCusto>'
                                                                                                                                  Then NotaEntrada.Filme[qtd_SubRegistro-1].PrecoCusto:=Temp
                                                                                                                                  Else Begin
                                                                                                                                           if TagTemp='<Quantidade>'
                                                                                                                                             Then NotaEntrada.Filme[qtd_SubRegistro-1].Quantidade:=StrToInt(Temp);
                                                                                                                                       End;
                                                                                                                            End;
                                                                                                                 End
                                                                                                            Else Begin
                                                                                                                     if TagTemp='</Registro>'
                                                                                                                       Then Begin
                                                                                                                                if not(ImporArquivo)
                                                                                                                                  Then Begin
                                                                                                                                           CadastraNotaEntrada(NotaEntrada,V_NotaEntrada);
                                                                                                                                           inc(Qtd_NotaEntrada);
                                                                                                                                       End
                                                                                                                                  Else CadastraNotaEntrada(NotaEntrada,Impor_NotaEntrada)
                                                                                                                            End;
                                                                                                                 End;
                                                                                                      End;
                                                                                           End;
                                                                                End;
                                                                     End;
                                                          End;
                                               End;
                                    End;
                         End;
              End;
  End;

Procedure LeNotaAPagar(TagTemp,SubTagTemp,Temp:STring;qtd_SubRegistro:Integer;var NotaAPagar:NotasAPagar);
  Begin
      if TagTemp='<Codigo>'
        Then NotaAPagar.Codigo:=StrToInt(Temp)
        Else Begin
                 if SubTagTemp='<Sub-Parcelas>'
                   Then Begin
                            if TagTemp='<NumParcela>'
                              Then NotaAPagar.Parcelas[qtd_SubRegistro-1].NumParcela:=StrToInt(Temp)
                              Else Begin
                                       if TagTemp='<DataVencimento>'
                                         Then NotaAPagar.Parcelas[qtd_SubRegistro-1].DataVencimento:=StrToDate(Temp)
                                         Else Begin
                                                  if TagTemp='<Valor>'
                                                    Then NotaAPagar.Parcelas[qtd_SubRegistro-1].Valor:=Temp
                                                    Else Begin
                                                             if TagTemp='<DataPaga>'
                                                               Then NotaAPagar.Parcelas[qtd_SubRegistro-1].DataPaga:=StrToDate(Temp)
                                                               Else Begin
                                                                        if TagTemp='<HoraPaga>'
                                                                          Then NotaAPagar.Parcelas[qtd_SubRegistro-1].HoraPaga:=Temp
                                                                          Else Begin
                                                                                   if TagTemp='<Paga>'
                                                                                     Then Begin
                                                                                              if Temp='True'
                                                                                                Then NotaAPagar.Parcelas[qtd_SubRegistro-1].Paga:=True
                                                                                                Else NotaAPagar.Parcelas[qtd_SubRegistro-1].Paga:=False;
                                                                                          End;
                                                                               End;
                                                                    End;
                                                         End;
                                              End;
                                   End;
                        End
                   Else Begin
                            if TagTemp='</Registro>'
                              Then Begin
                                       if not(ImporArquivo)
                                         Then CadastraContaAPagar(NotaAPagar,V_NotaAPagar)
                                         Else CadastraContaAPagar(NotaAPagar,Impor_NotaAPagar);
                                   End;
                        End;
             End;
  End;

Procedure LeNotaLocacao(TagTemp,SubTagTemp,Temp:STring;qtd_SubRegistro:Integer;var NotaLocacao:NotasLocacao);
  Begin
      if TagTemp='<CodigoLocacao>'
       Then NotaLocacao.Codigo:=StrToInt(Temp)
       Else Begin
                if TagTemp='<CodigoCliente>'
                  Then NotaLocacao.CodigoCliente:=StrToInt(Temp)
                  Else Begin
                           if TagTemp='<Funcionario>'
                             Then NotaLocacao.Funcionario:=Temp
                             Else Begin
                                     if TagTemp='<QtdParcela>'
                                       Then NotaLocacao.QtdParcela:=StrToInt(Temp)
                                       Else Begin
                                                if TagTemp='<Entrada>'
                                                  Then NotaLocacao.Entrada:=Temp
                                                  Else Begin
                                                           if TagTemp='<Total>'
                                                             Then NotaLocacao.Total:=Temp
                                                             Else Begin
                                                                      if TagTemp='<Data>'
                                                                        Then NotaLocacao.Data:=StrToDate(Temp)
                                                                        Else Begin
                                                                                 if TagTemp='<DataDevolucao>'
                                                                                   Then NotaLocacao.DataDevolucao:=StrToDate(Temp)
                                                                                   Else Begin
                                                                                            if TagTemp='<Hora>'
                                                                                              Then NotaLocacao.Hora:=Temp
                                                                                              Else Begin
                                                                                                       if TagTemp='<Multa>'
                                                                                                         Then NotaLocacao.Multa:=Temp
                                                                                                         Else Begin
                                                                                                                  if SubTagTemp='<Sub-Filmes>'
                                                                                                                    Then Begin
                                                                                                                             if TagTemp='<CodigoFilme>'
                                                                                                                               Then NotaLocacao.Filme[qtd_SubRegistro-1].CodigoFilme:=Temp
                                                                                                                               Else Begin
                                                                                                                                        if TagTemp='<CodigoCategoria>'
                                                                                                                                           Then NotaLocacao.Filme[qtd_SubRegistro-1].CodigoCategoria:=StrToInt(Temp)
                                                                                                                                           Else Begin
                                                                                                                                                    if TagTemp='<DataDevolvida>'
                                                                                                                                                       Then NotaLocacao.Filme[qtd_SubRegistro-1].DataDevolvida:=StrToDate(Temp)
                                                                                                                                                       Else Begin
                                                                                                                                                               if TagTemp='<Devolvido>'
                                                                                                                                                                 Then Begin
                                                                                                                                                                          if Temp='True'
                                                                                                                                                                            Then NotaLocacao.Filme[qtd_SubRegistro-1].Devolvido:=True
                                                                                                                                                                            Else NotaLocacao.Filme[qtd_SubRegistro-1].Devolvido:=False;
                                                                                                                                                                      End;
                                                                                                                                                            End;
                                                                                                                                                End;
                                                                                                                                    End;
                                                                                                                         End
                                                                                                                    Else Begin
                                                                                                                             if TagTemp='</Registro>'
                                                                                                                               Then Begin
                                                                                                                                        if not(ImporArquivo)
                                                                                                                                          Then Begin
                                                                                                                                                   CadastraLocacao(NotaLocacao,V_NotaLocacao);
                                                                                                                                                   inc(Qtd_Locacao_Ativo);
                                                                                                                                               End
                                                                                                                                          Else CadastraLocacao(NotaLocacao,Impor_NotaLocacao);
                                                                                                                                    End;
                                                                                                                         End;
                                                                                                              End;
                                                                                                   End;
                                                                                        End;
                                                                             End;
                                                                  End;
                                                       End;
                                            End;
                                 End;
                       End;
            End;
  End;

Procedure LeNotaAReceber(TagTemp,SubTagTemp,Temp:STring;qtd_SubRegistro:Integer;var NotaAReceber:NotasAReceber);
  Begin
      if TagTemp='<Codigo>'
        Then NotaAReceber.Codigo:=StrToInt(Temp)
        Else Begin
                 if TagTemp='<CodigoCliente>'
                  Then NotaAReceber.CodigoCliente:=StrToInt(Temp)
                  Else Begin
                           if SubTagTemp='<Sub-Parcelas>'
                             Then Begin
                                      if TagTemp='<NumParcela>'
                                        Then NotaAReceber.Parcelas[qtd_SubRegistro-1].NumParcela:=StrToInt(Temp)
                                        Else Begin
                                                 if TagTemp='<DataVencimento>'
                                                   Then NotaAReceber.Parcelas[qtd_SubRegistro-1].DataVencimento:=StrToDate(Temp)
                                                   Else Begin
                                                            if TagTemp='<Valor>'
                                                              Then NotaAReceber.Parcelas[qtd_SubRegistro-1].Valor:=Temp
                                                              Else Begin
                                                                       if TagTemp='<DataPaga>'
                                                                         Then NotaAReceber.Parcelas[qtd_SubRegistro-1].DataPaga:=StrToDate(Temp)
                                                                         Else Begin
                                                                                  if TagTemp='<HoraPaga>'
                                                                                    Then NotaAReceber.Parcelas[qtd_SubRegistro-1].HoraPaga:=Temp
                                                                                    Else Begin
                                                                                             if TagTemp='<Paga>'
                                                                                               Then Begin
                                                                                                        if Temp='True'
                                                                                                          Then NotaAReceber.Parcelas[qtd_SubRegistro-1].Paga:=True
                                                                                                          Else NotaAReceber.Parcelas[qtd_SubRegistro-1].Paga:=False;
                                                                                                    End;
                                                                                         End;
                                                                              End;
                                                                   End;
                                                        End;
                                             End;
                                  End
                             Else Begin
                                      if TagTemp='</Registro>'
                                        Then Begin
                                                 if not(ImporArquivo)
                                                   Then CadastraContaAReceber(NotaAReceber,V_NotaAReceber)
                                                   Else CadastraContaAReceber(NotaAReceber,Impor_NotaAReceber);
                                             End;
                                  End;
                       End;
             End;
  End;

Procedure LeMovimentacaoCaixa(TagTemp,Temp:STring;var MovimentacaoCaixa:Movimentacao);
  Begin
      if TagTemp='<Descricao>'
         Then MovimentacaoCaixa.Descricao:=Temp
         Else Begin
                  if TagTemp='<Valor>'
                    Then MovimentacaoCaixa.Valor:=Temp
                    Else Begin
                             if TagTemp='<Data>'
                               Then MovimentacaoCaixa.Data:=StrToDate(Temp)
                               Else Begin
                                        if TagTemp='<Hora>'
                                          Then MovimentacaoCaixa.Hora:=StrToTime(Temp)
                                          Else Begin
                                                   if TagTemp='</Registro>'
                                                     Then Begin
                                                              if not(ImporArquivo)
                                                                Then CadastraMovimentacaoCaixa(MovimentacaoCaixa,V_MovimentacaoCaixa)
                                                                Else CadastraMovimentacaoCaixa(MovimentacaoCaixa,Impor_MovimentacaoCaixa);
                                                          End;
                                               End;
                                    End
                         End;
              End;
  End;

Procedure VerificaRepeticaoDadosImportacao;
var i,j,k,posi:integer;
    codigo:integer;
    ind:integer;
  Begin
      ImporArquivo:=true;
      //if LerDadosEmpresa
      if LerDadosCliente
        Then Begin
                 for i := 0 to length(Impor_Cliente)-1 do
                   Begin  //a função de verificação retorna o indice de repetido ou caso n repita retona -1
                       ind:=VerificaCliente(Impor_Cliente[i].CPF);
                       if ind < 0
                         Then Begin{caso não seja repetido vou cadastrar o vetor com novo codigo e todos os dados que
                                    são relacionados a este codigo vao ser alterados também para o novo codigo}
                                  CadastraCliente(Impor_Cliente[i],V_Cliente);
                                  if Impor_Cliente[i].Ativo Then inc(Qtd_Cliente_Ativo);
                         //altera codigos dos clientes nas notas de locação
                                  for j := 0 to length(Impor_NotaLocacao)-1 do
                                    Begin
                                        if Impor_NotaLocacao[j].CodigoCliente=Impor_Cliente[i].Codigo
                                          Then Impor_NotaLocacao[j].CodigoCliente:=V_Cliente[length(V_Cliente)-1].Codigo;
                                    End;
                         //altera codigos dos clientes nas notas A Receber
                                  for j := 0 to length(Impor_NotaAReceber)-1 do
                                    Begin
                                        if Impor_NotaAReceber[i].CodigoCliente=Impor_Cliente[i].Codigo
                                          Then Impor_NotaAReceber[i].CodigoCliente:=V_Cliente[length(V_Cliente)-1].Codigo;
                                    End;
                              End
                         Else Begin {Se for repetido todos os dados relacionados a este codigo vão ser alterados
                                     para o codigo ja cadastrado}
                                  for j := 0 to length(Impor_NotaLocacao)-1 do
                                    Begin
                                         if Impor_NotaLocacao[j].CodigoCliente=Impor_Cliente[i].Codigo
                                          Then Impor_NotaLocacao[j].CodigoCliente:=V_Cliente[ind].Codigo;
                                    End;
                                  for j := 0 to length(Impor_NotaAReceber)-1 do
                                    Begin
                                        if Impor_NotaAReceber[i].CodigoCliente=Impor_Cliente[i].Codigo
                                          Then Impor_NotaAReceber[i].CodigoCliente:=V_Cliente[ind].Codigo;
                                    End;

                              End;
                   End;
             End;
      if ImporArquivo Then Frm_ImportacaoExportacao.ProgressBar1.Position:=10;
      if LerDadosCategoria
        Then Begin
                 for i := 0 to length(Impor_Categoria)-1 do
                   Begin
                       ind:=VerificaCategoria(Impor_Categoria[i].Nome);
                       if ind < 0
                         Then Begin
                                  CadastraCategoria(Impor_Categoria[i],V_Categoria);
                                  if Impor_Categoria[i].Ativo Then inc(Qtd_Categoria_Ativo);
                         //altera codigos das categorias nos Filmes
                                  for j := 0 to length(Impor_Filme)-1 do
                                    Begin
                                        if Impor_Filme[j].CodigoCategoria=Impor_Categoria[i].Codigo
                                          Then Impor_Filme[j].CodigoCategoria:=V_Categoria[length(V_Categoria)-1].Codigo;
                                    End;
                              End
                         Else Begin
                                  for j := 0 to length(Impor_Filme)-1 do
                                    Begin
                                        if Impor_Filme[j].CodigoCategoria=Impor_Categoria[i].Codigo
                                          Then Impor_Filme[j].CodigoCategoria:=V_Categoria[ind].Codigo;
                                    End;
                              End;
                   End;
             End;
      if ImporArquivo Then Frm_ImportacaoExportacao.ProgressBar1.Position:=20;
      if LerDadosFuncionario
        Then Begin
                 for i := 0 to length(Impor_Funcionario)-1 do
                   Begin
                       if VerificaFuncionario(Impor_Funcionario[i].Login)<0
                         Then Begin
                                  CadastraFuncionario(Impor_Funcionario[i],V_Funcionario);
                                  if Impor_Funcionario[i].Ativo Then inc(Qtd_Funcionarios_Ativo);
                              End
                         Else Begin
                                  //mensagem de repetido
                              End;
                   End;
             End;
      if ImporArquivo Then Frm_ImportacaoExportacao.ProgressBar1.Position:=30;
      if LerDadosFornecedor
        Then Begin
                 for i := 0 to length(Impor_Fornecedor)-1 do
                   Begin
                       ind:=VerificaFornecedor(Impor_Fornecedor[i].CNPJ);
                       if ind < 0
                         Then Begin
                                  CadastraFornecedor(Impor_Fornecedor[i],V_Fornecedor);
                                  if Impor_Fornecedor[i].Ativo Then inc(Qtd_Fornecedor_Ativo);
                         //altera codigos dos Fornecedores nas notas de Entrada
                                  for j := 0 to length(Impor_NotaEntrada)-1 do
                                    Begin
                                        if Impor_NotaEntrada[j].CodigoFornecedor=Impor_Fornecedor[i].Codigo
                                          Then Impor_NotaEntrada[j].CodigoFornecedor:=V_Fornecedor[length(V_Fornecedor)-1].Codigo;
                                    End;
                              End
                         Else Begin
                                  for j := 0 to length(Impor_NotaEntrada)-1 do
                                    Begin
                                        if Impor_NotaEntrada[j].CodigoFornecedor=Impor_Fornecedor[i].Codigo
                                          Then Impor_NotaEntrada[j].CodigoFornecedor:=V_Fornecedor[ind].Codigo;
                                    End;
                              End;
                   End;
             End;
      if ImporArquivo Then Frm_ImportacaoExportacao.ProgressBar1.Position:=40;
      if LerDadosFilme
        Then Begin
                 for i := 0 to length(Impor_Filme)-1 do
                   Begin
                       CadastraFilme(Impor_Filme[i],V_Filme);
                       if Impor_Filme[i].Ativo Then inc(Qtd_Filme_Ativo);
                       //altera codigos dos Filmes nas notas de Locação
                       for j := 0 to length(Impor_NotaLocacao)-1 do     //percorro todas as locações
                         Begin
                             for k := 0 to length(Impor_NotaLocacao[j].Filme)-1 do  //nas locações percorro todos os filmes delas
                               Begin
                                   posi:=pos('-',Impor_NotaLocacao[j].Filme[k].CodigoFilme);          //pego o codigo do filme locado
                                   Codigo:=StrToInt(copy(Impor_NotaLocacao[j].Filme[k].CodigoFilme,1,posi-1));
                                   if codigo=Impor_Filme[i].Codigo           //se o filme locado foi igual ao filme cadastrado substituirei pelo novo codigo
                                     Then Begin
                                              Delete(Impor_NotaLocacao[j].Filme[k].CodigoFilme,1,posi-1);
                                              Insert(IntToStr(V_Filme[Length(V_Filme)-1].Codigo),Impor_NotaLocacao[j].Filme[k].CodigoFilme,1);
                                          End;
                               End;
                         End;
                   End;
             End;
      if ImporArquivo Then Frm_ImportacaoExportacao.ProgressBar1.Position:=50;
      if LerDadosNotaEntrada
        Then Begin
                 for i := 0 to length(Impor_NotaEntrada)-1 do
                   Begin
                       CadastraNotaEntrada(Impor_NotaEntrada[i],V_NotaEntrada);
                       inc(Qtd_NotaEntrada);
                       //altera codigos das Notas Entrada nas notas A Pagar
                       for j := 0 to length(Impor_NotaAPagar)-1 do
                         Begin
                             if Impor_NotaAPagar[j].Codigo=Impor_NotaEntrada[i].CodigoEntrada
                               Then Impor_NotaAPagar[i].Codigo:=V_NotaEntrada[length(V_NotaEntrada)-1].CodigoEntrada;
                         End;
                   End;
             End;
      if ImporArquivo Then Frm_ImportacaoExportacao.ProgressBar1.Position:=60;
      if LerDadosContaAPagar
        Then Begin
                 for i := 0 to length(Impor_NotaAPagar)-1 do
                   Begin
                       CadastraContaAPagar(Impor_NotaAPagar[i],V_NotaAPagar);
                       for j := 0 to length(Impor_NotaAPagar[i].Parcelas)-1 do
                         Begin
                             if not(Impor_NotaAPagar[i].Parcelas[j].Paga)
                               Then inc(Qtd_NotaAPagar_Ativo);
                         End;
                   End;
             End;
      if ImporArquivo Then Frm_ImportacaoExportacao.ProgressBar1.Position:=70;
      if LerDadosLocacao
        Then Begin
                 for i := 0 to length(Impor_NotaLocacao)-1 do
                   Begin
                       CadastraLocacao(Impor_NotaLocacao[i],V_NotaLocacao);
                       //altera codigos das Notas Locacao nas notas A Receber
                       for j := 0 to length(Impor_NotaAReceber)-1 do
                         Begin
                             if Impor_NotaAReceber[j].Codigo=Impor_NotaLocacao[i].Codigo
                               Then Impor_NotaAReceber[j].Codigo:=V_NotaLocacao[length(V_NotaLocacao)-1].Codigo;
                         End;
                   End;
             End;
      if ImporArquivo Then Frm_ImportacaoExportacao.ProgressBar1.Position:=80;
      if LerDadosContasAReceber
        Then Begin
                 for i := 0 to Length(Impor_NotaAReceber)-1 do
                   Begin
                       CadastraContaAReceber(Impor_NotaAReceber[i],V_NotaAReceber);
                       for j := 0 to length(Impor_NotaAReceber[i].Parcelas)-1 do
                         Begin
                             if not(Impor_NotaAReceber[i].Parcelas[j].Paga)
                               Then inc(Qtd_NotaAReceber_Ativo);
                         End;
                   End;
             End;
      if ImporArquivo Then Frm_ImportacaoExportacao.ProgressBar1.Position:=90;
      if LerDadosMovimentacaoCaixa
        Then Begin
                 for i := 0 to length(Impor_MovimentacaoCaixa)-1 do
                   Begin
                       CadastraMovimentacaoCaixa(Impor_MovimentacaoCaixa[i],V_MovimentacaoCaixa);
                   End;
             End;
      {if LerDadosCaixa
        Then Begin
             End;}
      if ImporArquivo Then Frm_ImportacaoExportacao.ProgressBar1.Position:=100;
      ImporArquivo:=false;
      FinalizaVetores;
  End;

Procedure FinalizaVetores;
var i, j:integer;
  Begin
      case Cod_Arquivo of
      1:Begin//Arquivo Texto
            if not(ExporArquivo)
              Then Begin
                       Diretorio_Arquivo:='Dados.xml';
                       LerVetores(True,True,True,True,True,True,True,True,True,True,True,True);
                   End;
            AssignFile(Arquivo_Empresa, Diretorio_Arquivo);
            Rewrite(Arquivo_Empresa);
            Writeln(Arquivo_Empresa,'<Dados>');
//EMPRESA-------------------------------------------------------------------------
              writeln(Arquivo_Empresa,#9'<Tabela=Empresa>');
                if LerDadosEmpresa
                  Then Begin
                            writeln(Arquivo_Empresa,#9#9'<Registro>');
                              writeln(Arquivo_Empresa,#9#9#9'<NomeEmpresa>',V_Empresa.NomeEmpresa,'</NomeEmpresa>');
                              writeln(Arquivo_Empresa,#9#9#9'<RazSocial>',V_Empresa.RazSocial,'</RazSocial>');
                              writeln(Arquivo_Empresa,#9#9#9'<InscEstadual>',V_Empresa.InscEstadual,'</InscEstadual>');
                              writeln(Arquivo_Empresa,#9#9#9'<CNPJ>',V_Empresa.CNPJ,'</CNPJ>');
                              writeln(Arquivo_Empresa,#9#9#9'<TelEmpresa>',V_Empresa.TelEmpresa,'</TelEmpresa>');
                              writeln(Arquivo_Empresa,#9#9#9'<Email>',V_Empresa.Email,'</Email>');
                              writeln(Arquivo_Empresa,#9#9#9'<Cidade>',V_Empresa.Cidade,'</Cidade>');
                              writeln(Arquivo_Empresa,#9#9#9'<Bairro>',V_Empresa.Bairro,'</Bairro>');
                              writeln(Arquivo_Empresa,#9#9#9'<Lagradouro>',V_Empresa.Lagradouro,'</Lagradouro>');
                              writeln(Arquivo_Empresa,#9#9#9'<Num>',V_Empresa.Num,'</Num>');
                              writeln(Arquivo_Empresa,#9#9#9'<NomeGerente>',V_Empresa.NomeGerente,'</NomeGerente>');
                              writeln(Arquivo_Empresa,#9#9#9'<TelGerente>',V_Empresa.TelGerente,'</TelGerente>');
                              writeln(Arquivo_Empresa,#9#9#9'<Senha>',V_Empresa.Senha,'</Senha>');
                            writeln(Arquivo_Empresa,#9#9'</Registro>');
                       End;
              writeln(Arquivo_Empresa,#9'</Tabela=Empresa>');
//CLIENTES------------------------------------------------------------------------
              media:=Length(V_Cliente) div 10;
              writeln(Arquivo_Empresa,#9'<Tabela=Clientes>');
                if LerDadosCliente
                  Then Begin
                            for i := 0 to Length(V_Cliente)-1 do
                              Begin
                                  writeln(Arquivo_Empresa,#9#9'<Registro>');
                                    writeln(Arquivo_Empresa,#9#9#9'<Codigo>',IntToStr(V_Cliente[i].Codigo),'</Codigo>');
                                    writeln(Arquivo_Empresa,#9#9#9'<Nome>',V_Cliente[i].Nome,'</Nome>');
                                    writeln(Arquivo_Empresa,#9#9#9'<CPF>',V_Cliente[i].CPF,'</CPF>');
                                    writeln(Arquivo_Empresa,#9#9#9'<Sexo>',V_Cliente[i].Sexo,'</Sexo>');
                                    writeln(Arquivo_Empresa,#9#9#9'<EstCivil>',V_Cliente[i].EstCivil,'</EstCivil>');
                                    writeln(Arquivo_Empresa,#9#9#9'<DataNascimento>',V_Cliente[i].DataNascimento,'</DataNascimento>');
                                    writeln(Arquivo_Empresa,#9#9#9'<Cidade>',V_Cliente[i].Cidade,'</Cidade>');
                                    writeln(Arquivo_Empresa,#9#9#9'<Bairro>',V_Cliente[i].Bairro,'</Bairro>');
                                    writeln(Arquivo_Empresa,#9#9#9'<Lagradouro>',V_Cliente[i].Lagradouro,'</Lagradouro>');
                                    writeln(Arquivo_Empresa,#9#9#9'<Num>',V_Cliente[i].Num,'</Num>');
                                    writeln(Arquivo_Empresa,#9#9#9'<Telefone>',V_Cliente[i].Telefone,'</Telefone>');
                                    writeln(Arquivo_Empresa,#9#9#9'<Email>',V_Cliente[i].Email,'</Email>');
                                    if V_Cliente[i].Ativo
                                      Then writeln(Arquivo_Empresa,#9#9#9'<Ativo>','True','</Ativo>')
                                      Else writeln(Arquivo_Empresa,#9#9#9'<Ativo>','False','</Ativo>');
                                  writeln(Arquivo_Empresa,#9#9'</Registro>');

                                  if ExporArquivo
                                    Then Begin
                                             if media<>0
                                               Then Begin
                                                        if i+1 mod media=0
                                                          Then Begin
                                                                   Frm_ImportacaoExportacao.ProgressBar1.Position:=Frm_ImportacaoExportacao.ProgressBar1.Position+1;
                                                               End;
                                                    End;
                                         End;
                              End;
                       End;
              writeln(Arquivo_Empresa,#9'</Tabela=Clientes>');
              if ExporArquivo Then Frm_ImportacaoExportacao.ProgressBar1.Position:=10;
//FUNCIONARIOS--------------------------------------------------------------------
              media:=Length(V_Funcionario) div 10;
              writeln(Arquivo_Empresa,#9'<Tabela=Funcionarios>');
              if LerDadosFuncionario
                Then Begin
                          for i := 0 to Length(V_Funcionario)-1 do
                            Begin
                                writeln(Arquivo_Empresa,#9#9'<Registro>');
                                  writeln(Arquivo_Empresa,#9#9#9'<Codigo>',IntToStr(V_Funcionario[i].Codigo),'</Codigo>');
                                  writeln(Arquivo_Empresa,#9#9#9'<Nome>',V_Funcionario[i].Nome,'</Nome>');
                                  writeln(Arquivo_Empresa,#9#9#9'<Telefone>',V_Funcionario[i].Telefone,'</Telefone>');
                                  writeln(Arquivo_Empresa,#9#9#9'<Email>',V_Funcionario[i].Email,'</Email>');
                                  writeln(Arquivo_Empresa,#9#9#9'<Cidade>',V_Funcionario[i].Cidade,'</Cidade>');
                                  writeln(Arquivo_Empresa,#9#9#9'<Bairro>',V_Funcionario[i].Bairro,'</Bairro>');
                                  writeln(Arquivo_Empresa,#9#9#9'<Lagradouro>',V_Funcionario[i].Lagradouro,'</Lagradouro>');
                                  writeln(Arquivo_Empresa,#9#9#9'<Num>',V_Funcionario[i].Num,'</Num>');
                                  writeln(Arquivo_Empresa,#9#9#9'<Login>',V_Funcionario[i].Login,'</Login>');
                                  writeln(Arquivo_Empresa,#9#9#9'<Senha>',V_Funcionario[i].Senha,'</Senha>');
                                  if V_Funcionario[i].Ativo
                                    Then writeln(Arquivo_Empresa,#9#9#9'<Ativo>','True','</Ativo>')
                                    Else writeln(Arquivo_Empresa,#9#9#9'<Ativo>','False','</Ativo>');
                                writeln(Arquivo_Empresa,#9#9'</Registro>');

                                if ExporArquivo
                                    Then Begin
                                             if media<>0
                                               Then Begin
                                                        if i+1 mod media=0
                                                          Then Begin
                                                                   Frm_ImportacaoExportacao.ProgressBar1.Position:=Frm_ImportacaoExportacao.ProgressBar1.Position+1;
                                                               End;
                                                    End;
                                         End;
                            End;
                     End;
              writeln(Arquivo_Empresa,#9'</Tabela=Funcionarios>');
              if ExporArquivo Then Frm_ImportacaoExportacao.ProgressBar1.Position:=20;
//CATEGORIAS----------------------------------------------------------------------
              media:=Length(V_Categoria) div 10;
              writeln(Arquivo_Empresa,#9'<Tabela=Categorias>');
              if LerDadosCategoria
                Then Begin
                          for i := 0 to Length(V_Categoria)-1 do
                            Begin
                                writeln(Arquivo_Empresa,#9#9'<Registro>');
                                  writeln(Arquivo_Empresa,#9#9#9'<Codigo>',IntToStr(V_Categoria[i].Codigo),'</Codigo>');
                                  writeln(Arquivo_Empresa,#9#9#9'<Nome>',V_Categoria[i].Nome,'</Nome>');
                                  writeln(Arquivo_Empresa,#9#9#9'<Descricao>',V_Categoria[i].Descricao,'</Descricao>');
                                  writeln(Arquivo_Empresa,#9#9#9'<Preco>',V_Categoria[i].PrecoLocacao,'</Preco>');
                                  writeln(Arquivo_Empresa,#9#9#9'<PrecoMulta>',V_Categoria[i].PrecoMulta,'</PrecoMulta>');
                                  if V_Categoria[i].Ativo
                                    Then writeln(Arquivo_Empresa,#9#9#9'<Ativo>','True','</Ativo>')
                                    Else writeln(Arquivo_Empresa,#9#9#9'<Ativo>','False','</Ativo>');
                                writeln(Arquivo_Empresa,#9#9'</Registro>');
                                if ExporArquivo
                                    Then Begin
                                             if media<>0
                                               Then Begin
                                                        if i+1 mod media=0
                                                          Then Begin
                                                                   Frm_ImportacaoExportacao.ProgressBar1.Position:=Frm_ImportacaoExportacao.ProgressBar1.Position+1;
                                                               End;
                                                    End;
                                         End;
                            End;
                     End;
              writeln(Arquivo_Empresa,#9'</Tabela=Categorias>');
              if ExporArquivo Then Frm_ImportacaoExportacao.ProgressBar1.Position:=30;
//FORNECEDOR----------------------------------------------------------------------
              media:=Length(V_Fornecedor) div 10;
              writeln(Arquivo_Empresa,#9'<Tabela=Fornecedores>');
              if LerDadosFornecedor
                Then Begin
                          for i := 0 to Length(V_Fornecedor)-1 do
                            Begin
                                writeln(Arquivo_Empresa,#9#9'<Registro>');
                                  writeln(Arquivo_Empresa,#9#9#9'<Codigo>',IntToStr(V_Fornecedor[i].Codigo),'</Codigo>');
                                  writeln(Arquivo_Empresa,#9#9#9'<Nome>',V_Fornecedor[i].Nome,'</Nome>');
                                  writeln(Arquivo_Empresa,#9#9#9'<RazSocial>',V_Fornecedor[i].RazSocial,'</RazSocial>');
                                  writeln(Arquivo_Empresa,#9#9#9'<InscEstadual>',V_Fornecedor[i].InscEstadual,'</InscEstadual>');
                                  writeln(Arquivo_Empresa,#9#9#9'<CNPJ>',V_Fornecedor[i].CNPJ,'</CNPJ>');
                                  writeln(Arquivo_Empresa,#9#9#9'<TelEmpresa>',V_Fornecedor[i].TelEmpresa,'</TelEmpresa>');
                                  writeln(Arquivo_Empresa,#9#9#9'<Email>',V_Fornecedor[i].Email,'</Email>');
                                  writeln(Arquivo_Empresa,#9#9#9'<Cidade>',V_Fornecedor[i].Cidade,'</Cidade>');
                                  writeln(Arquivo_Empresa,#9#9#9'<Bairro>',V_Fornecedor[i].Bairro,'</Bairro>');
                                  writeln(Arquivo_Empresa,#9#9#9'<Lagradouro>',V_Fornecedor[i].Lagradouro,'</Lagradouro>');
                                  writeln(Arquivo_Empresa,#9#9#9'<Num>',V_Fornecedor[i].Num,'</Num>');
                                  if V_Fornecedor[i].Ativo
                                    Then writeln(Arquivo_Empresa,#9#9#9'<Ativo>','True','</Ativo>')
                                    Else writeln(Arquivo_Empresa,#9#9#9'<Ativo>','False','</Ativo>');
                                writeln(Arquivo_Empresa,#9#9'</Registro>');
                                if ExporArquivo
                                    Then Begin
                                             if media<>0
                                               Then Begin
                                                        if i+1 mod media=0
                                                          Then Begin
                                                                   Frm_ImportacaoExportacao.ProgressBar1.Position:=Frm_ImportacaoExportacao.ProgressBar1.Position+1;
                                                               End;
                                                    End;
                                         End;
                            End;
                     End;
              writeln(Arquivo_Empresa,#9'</Tabela=Fornecedores>');
              if ExporArquivo Then Frm_ImportacaoExportacao.ProgressBar1.Position:=40;
//FILMES--------------------------------------------------------------------------
              media:=Length(V_Filme) div 10;
              writeln(Arquivo_Empresa,#9'<Tabela=Filmes>');
              if LerDadosFilme
                Then Begin
                          for i := 0 to Length(V_Filme)-1 do
                            Begin
                                writeln(Arquivo_Empresa,#9#9'<Registro>');
                                  writeln(Arquivo_Empresa,#9#9#9'<Codigo>',IntToStr(V_Filme[i].Codigo),'</Codigo>');
                                  for j := 0 to length(V_Filme[i].Exemplar)-1 do
                                    Begin
                                        writeln(Arquivo_Empresa,#9#9#9#9'<Sub-Exemplar>');
                                          writeln(Arquivo_Empresa,#9#9#9#9#9'<CodigoExemplar>',IntToStr(V_Filme[i].Exemplar[j].SubCodigo),'</CodigoExemplar>');
                                          if V_Filme[i].Exemplar[j].Disponivel
                                            Then writeln(Arquivo_Empresa,#9#9#9#9#9'<Disponivel>','True','</Disponivel>')
                                            Else writeln(Arquivo_Empresa,#9#9#9#9#9'<Disponivel>','False','</Disponivel>');
                                          writeln(Arquivo_Empresa,#9#9#9#9#9'<Lucro>',V_Filme[i].Exemplar[j].Lucro,'</Lucro>');
                                          if V_Filme[i].Exemplar[j].Ativo
                                            Then writeln(Arquivo_Empresa,#9#9#9#9#9'<ExemplarAtivo>','True','</ExemplarAtivo>')
                                            Else writeln(Arquivo_Empresa,#9#9#9#9#9'<ExemplarAtivo>','False','</ExemplarAtivo>');
                                        writeln(Arquivo_Empresa,#9#9#9#9'</Sub-Exemplar>');
                                    End;
                                  writeln(Arquivo_Empresa,#9#9#9'<Descricao>',V_Filme[i].Descricao,'</Descricao>');
                                  writeln(Arquivo_Empresa,#9#9#9'<QtdExemplar>',IntToStr(V_Filme[i].QtdExemplar),'</QtdExemplar>');
                                  writeln(Arquivo_Empresa,#9#9#9'<QtdDisponivel>',IntToStr(V_Filme[i].QtdDisponivel),'</QtdDisponivel>');
                                  writeln(Arquivo_Empresa,#9#9#9'<CodigoCategoria>',IntToStr(V_Filme[i].CodigoCategoria),'</CodigoCategoria>');
                                  writeln(Arquivo_Empresa,#9#9#9'<TipoFilme>',V_Filme[i].TipoFilme,'</TipoFilme>');
                                  writeln(Arquivo_Empresa,#9#9#9'<Preco>',V_Filme[i].Preco,'</Preco>');
                                  writeln(Arquivo_Empresa,#9#9#9'<Audio>',V_Filme[i].Audio,'</Audio>');
                                  if V_Filme[i].Ativo
                                    Then writeln(Arquivo_Empresa,#9#9#9'<Ativo>','True','</Ativo>')
                                    Else writeln(Arquivo_Empresa,#9#9#9'<Ativo>','False','</Ativo>');
                                writeln(Arquivo_Empresa,#9#9'</Registro>');
                                if ExporArquivo
                                    Then Begin
                                             if media<>0
                                               Then Begin
                                                        if i+1 mod media=0
                                                          Then Begin
                                                                   Frm_ImportacaoExportacao.ProgressBar1.Position:=Frm_ImportacaoExportacao.ProgressBar1.Position+1;
                                                               End;
                                                    End;
                                         End;
                            End;
                     End;
              writeln(Arquivo_Empresa,#9'</Tabela=Filmes>');
              if ExporArquivo Then Frm_ImportacaoExportacao.ProgressBar1.Position:=50;
//NOTAFISCALENTRADA---------------------------------------------------------------
              media:=Length(V_NotaEntrada) div 10;
              writeln(Arquivo_Empresa,#9'<Tabela=NotaEntrada>');
              if LerDadosNotaEntrada
                Then Begin
                          for i := 0 to Length(V_NotaEntrada)-1 do
                              Begin
                                  writeln(Arquivo_Empresa,#9#9'<Registro>');
                                    writeln(Arquivo_Empresa,#9#9#9'<Codigo>',IntToStr(V_NotaEntrada[i].CodigoEntrada),'</Codigo>');
                                    writeln(Arquivo_Empresa,#9#9#9'<CodigoFornecedor>',IntToStr(V_NotaEntrada[i].CodigoFornecedor),'</CodigoFornecedor>');
                                    writeln(Arquivo_Empresa,#9#9#9'<Imposto>',V_NotaEntrada[i].Imposto,'</Imposto>');
                                    writeln(Arquivo_Empresa,#9#9#9'<Frete>',V_NotaEntrada[i].Frete,'</Frete>');
                                    writeln(Arquivo_Empresa,#9#9#9'<QtdParcela>',IntToStr(V_NotaEntrada[i].QtdParcela),'</QtdParcela>');
                                    writeln(Arquivo_Empresa,#9#9#9'<Entrada>',V_NotaEntrada[i].Entrada,'</Total>');
                                    writeln(Arquivo_Empresa,#9#9#9'<Data>',DateToStr(V_NotaEntrada[i].Data),'</Data>');
                                    writeln(Arquivo_Empresa,#9#9#9'<Hora>',V_NotaEntrada[i].Hora,'</Hora>');
                                    writeln(Arquivo_Empresa,#9#9#9'<Total>',V_NotaEntrada[i].Total,'</Total>');
                                    for j := 0 to Length(V_NotaEntrada[i].Filme)-1 do
                                      Begin
                                          writeln(Arquivo_Empresa,#9#9#9#9'<Sub-Filmes>');
                                            writeln(Arquivo_Empresa,#9#9#9#9#9'<Descrição>',V_NotaEntrada[i].Filme[j].Descricao,'</Descrição>');
                                            writeln(Arquivo_Empresa,#9#9#9#9#9'<PrecoCusto>',V_NotaEntrada[i].Filme[j].PrecoCusto,'</PrecoCusto>');
                                            writeln(Arquivo_Empresa,#9#9#9#9#9'<Quantidade>',V_NotaEntrada[i].Filme[j].Quantidade,'</Quantidade>');
                                          writeln(Arquivo_Empresa,#9#9#9#9'</Sub-Filmes>');
                                      End;
                                  writeln(Arquivo_Empresa,#9#9'</Registro>');
                                  if ExporArquivo
                                    Then Begin
                                             if media<>0
                                               Then Begin
                                                        if i+1 mod media=0
                                                          Then Begin
                                                                   Frm_ImportacaoExportacao.ProgressBar1.Position:=Frm_ImportacaoExportacao.ProgressBar1.Position+1;
                                                               End;
                                                    End;
                                         End;
                              End;
                     End;
              writeln(Arquivo_Empresa,#9'</Tabela=NotaEntrada>');
              if ExporArquivo Then Frm_ImportacaoExportacao.ProgressBar1.Position:=60;
//NOTAAPAGAR----------------------------------------------------------------------
              media:=Length(V_NotaAPagar) div 10;
              writeln(Arquivo_Empresa,#9'<Tabela=NotaPagar>');
              if LerDadosContaAPagar
                Then Begin
                          For i := 0 to Length(V_NotaAPagar)-1 do
                            Begin
                                writeln(Arquivo_Empresa,#9#9'<Registro>');
                                  writeln(Arquivo_Empresa,#9#9#9'<Codigo>',IntToStr(V_NotaAPagar[i].Codigo),'</Codigo>');
                                  for j := 0 to Length(V_NotaAPagar[i].Parcelas)-1 do
                                    Begin
                                        writeln(Arquivo_Empresa,#9#9#9#9'<Sub-Parcelas>');
                                          writeln(Arquivo_Empresa,#9#9#9#9#9'<NumParcela>',IntToStr(V_NotaAPagar[i].Parcelas[j].NumParcela),'</NumParcela>');
                                          writeln(Arquivo_Empresa,#9#9#9#9#9'<DataVencimento>',DateToSTr(V_NotaAPagar[i].Parcelas[j].DataVencimento),'</DataVencimento>');
                                          writeln(Arquivo_Empresa,#9#9#9#9#9'<Valor>',V_NotaAPagar[i].Parcelas[j].Valor,'</Valor>');
                                          writeln(Arquivo_Empresa,#9#9#9#9#9'<DataPaga>',DateToStr(V_NotaAPagar[i].Parcelas[j].DataPaga),'</DataPaga>');
                                          writeln(Arquivo_Empresa,#9#9#9#9#9'<HoraPaga>',V_NotaAPagar[i].Parcelas[j].HoraPaga,'</HoraPaga>');
                                          if V_NotaAPagar[i].Parcelas[j].Paga
                                            Then writeln(Arquivo_Empresa,#9#9#9#9#9'<Paga>','True','</Paga>')
                                            Else writeln(Arquivo_Empresa,#9#9#9#9#9'<Paga>','False','</Paga>');
                                        writeln(Arquivo_Empresa,#9#9#9#9'</Sub-Parcelas>');
                                    End;
                                writeln(Arquivo_Empresa,#9#9'</Registro>');
                                if ExporArquivo
                                    Then Begin
                                             if media<>0
                                               Then Begin
                                                        if i+1 mod media=0
                                                          Then Begin
                                                                   Frm_ImportacaoExportacao.ProgressBar1.Position:=Frm_ImportacaoExportacao.ProgressBar1.Position+1;
                                                               End;
                                                    End;
                                         End;
                            End;
                     End;
              writeln(Arquivo_Empresa,#9'</Tabela=NotaPagar>');
              if ExporArquivo Then Frm_ImportacaoExportacao.ProgressBar1.Position:=70;
//LOCAÇÃO-------------------------------------------------------------------------
              media:=Length(V_NotaLocacao) div 10;
              writeln(Arquivo_Empresa,#9'<Tabela=Locacao>');
              if LerDadosLocacao
                Then Begin
                          For i := 0 to Length(V_NotaLocacao)-1 do
                            Begin
                                writeln(Arquivo_Empresa,#9#9'<Registro>');
                                  writeln(Arquivo_Empresa,#9#9#9'<CodigoLocacao>',IntToStr(V_NotaLocacao[i].Codigo),'</CodigoLocacao>');
                                  writeln(Arquivo_Empresa,#9#9#9'<CodigoCliente>',IntToStr(V_NotaLocacao[i].CodigoCliente),'</CodigoCliente>');
                                  writeln(Arquivo_Empresa,#9#9#9'<Funcionario>',V_NotaLocacao[i].Funcionario,'</Funcionario>');
                                  writeln(Arquivo_Empresa,#9#9#9'<QtdParcela>',IntToStr(V_NotaLocacao[i].QtdParcela),'</QtdParcela>');
                                  writeln(Arquivo_Empresa,#9#9#9'<Entrada>',V_NotaLocacao[i].Entrada,'</Entrada>');
                                  writeln(Arquivo_Empresa,#9#9#9'<Total>',V_NotaLocacao[i].Total,'</Total>');
                                  writeln(Arquivo_Empresa,#9#9#9'<Data>',DateToSTr(V_NotaLocacao[i].Data),'</Data>');
                                  writeln(Arquivo_Empresa,#9#9#9'<DataDevolucao>',DateToSTr(V_NotaLocacao[i].DataDevolucao),'</DataDevolucao>');
                                  writeln(Arquivo_Empresa,#9#9#9'<Hora>',V_NotaLocacao[i].Hora,'</Hora>');
                                  writeln(Arquivo_Empresa,#9#9#9'<Multa>',V_NotaLocacao[i].Multa,'</Multa>');
                                    for j := 0 to Length(V_NotaLocacao[i].Filme)-1 do
                                      Begin
                                          writeln(Arquivo_Empresa,#9#9#9#9'<Sub-Filmes>');
                                            writeln(Arquivo_Empresa,#9#9#9#9#9'<CodigoFilme>',V_NotaLocacao[i].Filme[j].CodigoFilme,'</CodigoFilme>');
                                            writeln(Arquivo_Empresa,#9#9#9#9#9'<CodigoCategoria>',IntToStr(V_NotaLocacao[i].Filme[j].CodigoCategoria),'</CodigoCategoria>');
                                            writeln(Arquivo_Empresa,#9#9#9#9#9'<DataDevolvida>',DateToSTr(V_NotaLocacao[i].Filme[j].DataDevolvida),'</DataDevolvida>');
                                            if V_NotaLocacao[i].Filme[j].Devolvido
                                              Then writeln(Arquivo_Empresa,#9#9#9#9#9'<Devolvido>','True','</Devolvido>')
                                              Else writeln(Arquivo_Empresa,#9#9#9#9#9'<Devolvido>','False','</Devolvido>');
                                          writeln(Arquivo_Empresa,#9#9#9#9'</Sub-Filmes>');
                                      End;
                                writeln(Arquivo_Empresa,#9#9'</Registro>');
                                if ExporArquivo
                                    Then Begin
                                             if media<>0
                                               Then Begin
                                                        if i+1 mod media=0
                                                          Then Begin
                                                                   Frm_ImportacaoExportacao.ProgressBar1.Position:=Frm_ImportacaoExportacao.ProgressBar1.Position+1;
                                                               End;
                                                    End;
                                         End;
                            End;
                     End;
              writeln(Arquivo_Empresa,#9'</Tabela=Locacao>');
              if ExporArquivo Then Frm_ImportacaoExportacao.ProgressBar1.Position:=80;
//NOTAARECEBER----------------------------------------------------------------------
              media:=Length(V_NotaAReceber) div 10;
              writeln(Arquivo_Empresa,#9'<Tabela=NotaReceber>');
              if LerDadosContasAReceber
                Then Begin
                          For i := 0 to Length(V_NotaAReceber)-1 do
                            Begin
                                writeln(Arquivo_Empresa,#9#9'<Registro>');
                                  writeln(Arquivo_Empresa,#9#9#9'<Codigo>',IntToStr(V_NotaAReceber[i].Codigo),'</Codigo>');
                                  writeln(Arquivo_Empresa,#9#9#9#9'<CodigoCliente>',IntToStr(V_NotaAReceber[i].CodigoCliente),'</CodigoCliente>');
                                  for j := 0 to Length(V_NotaAReceber[i].Parcelas)-1 do
                                    Begin
                                        writeln(Arquivo_Empresa,#9#9#9#9#9'<Sub-Parcelas>');
                                          writeln(Arquivo_Empresa,#9#9#9#9#9#9'<NumParcela>',IntToStr(V_NotaAReceber[i].Parcelas[j].NumParcela),'</NumParcela>');
                                          writeln(Arquivo_Empresa,#9#9#9#9#9#9'<DataVencimento>',DateToSTr(V_NotaAReceber[i].Parcelas[j].DataVencimento),'</DataVencimento>');
                                          writeln(Arquivo_Empresa,#9#9#9#9#9#9'<Valor>',V_NotaAReceber[i].Parcelas[j].Valor,'</Valor>');
                                          writeln(Arquivo_Empresa,#9#9#9#9#9#9'<DataPaga>',DateToStr(V_NotaAReceber[i].Parcelas[j].DataPaga),'</DataPaga>');
                                          writeln(Arquivo_Empresa,#9#9#9#9#9#9'<HoraPaga>',V_NotaAReceber[i].Parcelas[j].HoraPaga,'</HoraPaga>');
                                          if V_NotaAReceber[i].Parcelas[j].Paga
                                            Then writeln(Arquivo_Empresa,#9#9#9#9#9#9'<Paga>','True','</Paga>')
                                            Else writeln(Arquivo_Empresa,#9#9#9#9#9#9'<Paga>','False','</Paga>');
                                        writeln(Arquivo_Empresa,#9#9#9#9#9'</Sub-Parcelas>');
                                    End;
                                writeln(Arquivo_Empresa,#9#9'</Registro>');
                                if ExporArquivo
                                    Then Begin
                                             if media<>0
                                               Then Begin
                                                        if i+1 mod media=0
                                                          Then Begin
                                                                   Frm_ImportacaoExportacao.ProgressBar1.Position:=Frm_ImportacaoExportacao.ProgressBar1.Position+1;
                                                               End;
                                                    End;
                                         End;
                            End;
                     End;
              writeln(Arquivo_Empresa,#9'</Tabela=NotaReceber>');
              if ExporArquivo Then Frm_ImportacaoExportacao.ProgressBar1.Position:=90;
//MOVIMENTAÇÃOCAIXA---------------------------------------------------------------
              writeln(Arquivo_Empresa,#9'<Tabela=MovimentacaoCaixa>');
              if LerDadosMovimentacaoCaixa
                Then Begin
                          For i := 0 to length(V_MovimentacaoCaixa)-1 do
                            Begin
                                writeln(Arquivo_Empresa,#9#9'<Registro>');
                                  writeln(Arquivo_Empresa,#9#9#9'<Descricao>',V_MovimentacaoCaixa[i].Descricao,'</Descricao>');
                                  writeln(Arquivo_Empresa,#9#9#9'<Valor>',V_MovimentacaoCaixa[i].Valor,'</Valor>');
                                  writeln(Arquivo_Empresa,#9#9#9'<Data>',DateToSTr(V_MovimentacaoCaixa[i].Data),'</Data>');
                                  writeln(Arquivo_Empresa,#9#9#9'<Hora>',TimeToStr(V_MovimentacaoCaixa[i].Hora),'</Hora>');
                                writeln(Arquivo_Empresa,#9#9'</Registro>');
                            End;
                     End;
              writeln(Arquivo_Empresa,#9'</Tabela=MovimentacaoCaixa>');
//CAIXA---------------------------------------------------------------------------
              writeln(Arquivo_Empresa,#9'<Tabela=Caixa>');
              if LerDadosCaixa
                Then Begin
                          writeln(Arquivo_Empresa,#9#9'<Registro>');
                            writeln(Arquivo_Empresa,#9#9#9'<Caixa>',V_Caixa,'</Caixa>');
                          writeln(Arquivo_Empresa,#9#9'</Registro>');
                     End;
              writeln(Arquivo_Empresa,#9'</Tabela=Caixa>');
              if ExporArquivo Then Frm_ImportacaoExportacao.ProgressBar1.Position:=100;

            writeln(Arquivo_Empresa,'</Dados>');
            CloseFile(Arquivo_Empresa);

            if ExporArquivo
              Then ExporArquivo:=False;
        End;
      2: ;//Binario
      3: ;//Nuvem
      4: ;//banco de dados
      end;
  End;

Function VerificaLoginFuncionario(login,senha:String):Boolean;
var i:integer;
  Begin
      Result:=false;
      For i := 0 to Length(V_Funcionario)-1 do
        Begin
            if V_Funcionario[i].Ativo
              Then Begin
                       If (login=V_Funcionario[i].Login) And (Senha= V_Funcionario[i].Senha)
                         Then Begin
                                  Result:=True;
                                  Break;
                              End;
                   End;
        End;
      if (login='GERENTE')and(senha=V_Empresa.Senha)
        Then Result:=True;
  End;

Procedure CadastraEmpresa(cod:Empresas);
  Begin
      V_Empresa:=cod;
      Empresa_Cadastrada:=True;
  End;

Procedure CadastraCliente(cod:Clientes;var vetor:Vet_Clientes);
  Begin
      if Editar_Cadastro
        Then Begin
                 vetor[Cod.Codigo-1]:=Cod;
             End
        Else Begin
                 SetLength(vetor,Length(vetor)+1);
                 vetor[Length(vetor)-1]:=Cod;
                 vetor[Length(vetor)-1].Codigo:=Length(vetor);
             End;
  End;

Procedure CadastraCategoria(cod:Categorias;var vetor:Vet_Categorias);
  Begin
      if Editar_Cadastro
        Then Begin
                 vetor[Cod.Codigo-1]:=Cod;
             End
        Else Begin
                 SetLength(vetor,Length(vetor)+1);
                 vetor[Length(vetor)-1]:=Cod;
                 vetor[Length(vetor)-1].Codigo:=length(Vetor);
             End;
  End;

Procedure CadastraFornecedor(cod:Fornecedores;var vetor:Vet_Fornecedores);
  Begin
      if Editar_Cadastro
        Then Begin
                 vetor[Cod.Codigo-1]:=Cod;
             End
        Else Begin
                 SetLength(vetor,Length(vetor)+1);
                 vetor[Length(vetor)-1]:=Cod;
                 vetor[Length(vetor)-1].Codigo:=Length(vetor);
             End;
  End;

Procedure CadastraNotaEntrada(cod:NotasEntrada;var vetor:Vet_NotasEntrada);
  Begin
      SetLength(vetor,Length(vetor)+1);
      vetor[Length(vetor)-1]:=Cod;
      vetor[Length(vetor)-1].CodigoEntrada:=Length(vetor);
  End;

Procedure CadastraLocacao(cod:NotasLocacao;var vetor:Vet_NotasLocacao);
var i:integer;
  Begin
      SetLength(vetor,Length(vetor)+1);
      vetor[Length(vetor)-1].CodigoCliente:=Cod.CodigoCliente;
      vetor[Length(vetor)-1].Funcionario:=Cod.Funcionario;
      vetor[Length(vetor)-1].QtdParcela:=Cod.QtdParcela;
      vetor[Length(vetor)-1].Entrada:=Cod.Entrada;
      vetor[Length(vetor)-1].Total:=Cod.Total;
      vetor[Length(vetor)-1].Data:=Cod.Data;
      vetor[Length(vetor)-1].DataDevolucao:=Cod.DataDevolucao;
      vetor[Length(vetor)-1].Hora:=Cod.Hora;
      vetor[Length(vetor)-1].Multa:=Cod.Multa;
      SetLength(vetor[Length(vetor)-1].Filme,Length(cod.Filme));
      for i := 0 to length(cod.Filme)-1 do
        Begin
            vetor[Length(vetor)-1].Filme[i].CodigoFilme:=cod.Filme[i].CodigoFilme;
            vetor[Length(vetor)-1].Filme[i].CodigoCategoria:=cod.Filme[i].CodigoCategoria;
            vetor[Length(vetor)-1].Filme[i].DataDevolvida:=cod.Filme[i].DataDevolvida;
            vetor[Length(vetor)-1].Filme[i].Devolvido:=cod.Filme[i].Devolvido;
        End;
      vetor[Length(vetor)-1].Codigo:=Length(vetor);
  End;

Procedure GravaDevolucaoNotaFilme(cod:NotasLocacao);
var ind,i:integer;
  Begin
      ind:=RetornaIndiceLocacao(cod.Codigo);

      V_NotaLocacao[ind].Codigo:=cod.Codigo;
      V_NotaLocacao[ind].CodigoCliente:=cod.CodigoCliente;
      V_NotaLocacao[ind].QtdParcela:=cod.QtdParcela;
      V_NotaLocacao[ind].Entrada:=cod.Entrada;
      V_NotaLocacao[ind].Total:=cod.Total;
      V_NotaLocacao[ind].Data:=cod.Data;
      V_NotaLocacao[ind].DataDevolucao:=cod.DataDevolucao;
      V_NotaLocacao[ind].Hora:=cod.Hora;
      V_NotaLocacao[ind].Multa:=cod.Multa;
      for i := 0 to length(V_NotaLocacao[ind].Filme)-1 do
        Begin
            V_NotaLocacao[ind].Filme[i].CodigoFilme:=cod.Filme[i].CodigoFilme;
            V_NotaLocacao[ind].Filme[i].CodigoCategoria:=cod.Filme[i].CodigoCategoria;
            V_NotaLocacao[ind].Filme[i].DataDevolvida:=cod.Filme[i].DataDevolvida;
            V_NotaLocacao[ind].Filme[i].Devolvido:=cod.Filme[i].Devolvido;
        End;

      GravaVetorOriginal;
      FinalizaVetores;
  End;

Procedure GravaDevolucaoExemplarFilme(cod,subCod:integer);
var ind,exemplar:integer;
  Begin
      ind:=RetornaIndiceFilme(cod);
      Exemplar:=RetornaIndiceExemplar(ind,subcod);
      inc(CopiaFilme[ind].QtdDisponivel);
      CopiaFilme[ind].Exemplar[Exemplar].Disponivel:=True;
  End;

Procedure CadastraMovimentacaoCaixa(cod:Movimentacao;var vetor:Vet_Movimentacao);
  Begin
      SetLength(vetor,length(vetor)+1);
      vetor[length(vetor)-1].Descricao:=cod.Descricao;
      vetor[length(vetor)-1].Valor:=cod.Valor;
      vetor[length(vetor)-1].Data:=cod.Data;
      vetor[length(vetor)-1].Hora:=cod.Hora;
  End;

Function ArredondaNumero(valor:String):String;
var i:integer;
  Begin
      i:=pos(',',valor);
      if i<>0
        Then Begin
                 if i+1=Length(valor)
                   Then Result:=valor+'0'
                   Else Result:=Copy(valor,1,i+2);
             End
        Else Result:=valor+',00';
  End;

Function PreCadastraContaAPagar(Nota:NotasEntrada;Data,ValorParcela:String):NotasAPagar;
{Usarei este processo para pre cadastrar uma variavel com todos os dados das futuras notas a pagar
para que o processo que grava no vetor principal seja o mais generico possivel para ser reutilizado}
Var DataParcela:Array of String;
    i,j:integer;
  Begin
      SetLength(DataParcela,0);
      for i := 0 to Nota.QtdParcela-1 do
        Begin
            j := pos('-', Data);
            SetLength(DataParcela,Length(DataParcela)+1);
            DataParcela[i] := copy(Data, 1, j-1); //Pega o valor de cada Data e poe em um vetor
            delete(Data, 1, j);
        End;

      Result.Codigo:=Length(V_NotaEntrada);
      for i := 0 to Nota.QtdParcela-1 do
        Begin
            SetLength(Result.Parcelas,Length(Result.Parcelas)+1);
            Result.Parcelas[i].NumParcela:=i+1;
            Result.Parcelas[i].DataVencimento:=StrToDate(DataParcela[i]);
            Result.Parcelas[i].Valor:=ValorParcela;
            Result.Parcelas[i].HoraPaga:='';
            Result.Parcelas[i].Multa:=Zero;
            Result.Parcelas[i].Paga:=False;
        End;
  End;

Procedure CadastraContaAPagar(cod:NotasAPagar;var vetor:Vet_NotasAPagar);
Var i:integer;
  Begin
      SetLength(vetor,Length(vetor)+1);
      vetor[Length(vetor)-1].Codigo:=cod.Codigo;
      for i := 0 to Length(cod.Parcelas)-1 do
        Begin
            SetLength(vetor[Length(vetor)-1].Parcelas,Length(vetor[Length(vetor)-1].Parcelas)+1);
            vetor[Length(vetor)-1].Parcelas[i].NumParcela:=cod.Parcelas[i].NumParcela;
            vetor[Length(vetor)-1].Parcelas[i].DataVencimento:=cod.Parcelas[i].DataVencimento;
            vetor[Length(vetor)-1].Parcelas[i].Valor:=cod.Parcelas[i].Valor;
            vetor[Length(vetor)-1].Parcelas[i].DataPaga:=cod.Parcelas[i].DataPaga;
            vetor[Length(vetor)-1].Parcelas[i].HoraPaga:=cod.Parcelas[i].HoraPaga;
            vetor[Length(vetor)-1].Parcelas[i].Multa:=cod.Parcelas[i].Multa;
            vetor[Length(vetor)-1].Parcelas[i].Paga:=cod.Parcelas[i].Paga;
            if not(ImporArquivo)
              Then Begin
                       if not(vetor[Length(vetor)-1].Parcelas[i].Paga)
                        Then inc(Qtd_NotaAPagar_Ativo);
                   End;
        End
  End;

Function PreCadastraContaAReceber(Nota:NotasLocacao;Data,ValorParcela:String):NotasAReceber;
Var DataParcela:Array of String;
    i,j:integer;
  Begin
      SetLength(DataParcela,0);
      for i := 0 to Nota.QtdParcela-1 do
        Begin
            j := pos('-', Data);
            SetLength(DataParcela,Length(DataParcela)+1);
            DataParcela[i] := copy(Data, 1, j-1); //Pega o valor de cada Data e poe em um vetor
            delete(Data, 1, j);
        End;

      Result.Codigo:=Length(V_NotaLocacao);
      Result.CodigoCliente:=V_TempNotaLocacao.CodigoCliente;
      for i := 0 to Nota.QtdParcela-1 do
        Begin
            SetLength(Result.Parcelas,Length(Result.Parcelas)+1);
            Result.Parcelas[i].NumParcela:=i+1;
            Result.Parcelas[i].DataVencimento:=StrToDate(DataParcela[i]);
            Result.Parcelas[i].Valor:=ValorParcela;
            Result.Parcelas[i].HoraPaga:='';
            Result.Parcelas[i].Multa:=Zero;
            Result.Parcelas[i].Paga:=False;
        End;
  End;

Procedure CadastraContaAReceber(cod:NotasAReceber;var vetor:Vet_NotasAReceber);
var i:integer;
  Begin
      SetLength(vetor,Length(vetor)+1);
      vetor[Length(vetor)-1].Codigo:=cod.Codigo;
      vetor[Length(vetor)-1].CodigoCliente:=cod.CodigoCliente;
      for i := 0 to Length(cod.Parcelas)-1 do
        Begin
            SetLength(vetor[Length(vetor)-1].Parcelas,Length(vetor[Length(vetor)-1].Parcelas)+1);
            vetor[Length(vetor)-1].Parcelas[i].NumParcela:=cod.Parcelas[i].NumParcela;
            vetor[Length(vetor)-1].Parcelas[i].DataVencimento:=cod.Parcelas[i].DataVencimento;
            vetor[Length(vetor)-1].Parcelas[i].Valor:=cod.Parcelas[i].Valor;
            vetor[Length(vetor)-1].Parcelas[i].DataPaga:=cod.Parcelas[i].DataPaga;
            vetor[Length(vetor)-1].Parcelas[i].HoraPaga:=cod.Parcelas[i].HoraPaga;
            vetor[Length(vetor)-1].Parcelas[i].Multa:=cod.Parcelas[i].Multa;
            vetor[Length(vetor)-1].Parcelas[i].Paga:=cod.Parcelas[i].Paga;
            if not(ImporArquivo)
              Then Begin
                       if not(vetor[Length(vetor)-1].Parcelas[i].Paga)
                        Then inc(Qtd_NotaAReceber_Ativo);
                   End;
        End;
  End;
Function PreCadastraFilme(cod:Filmes):Filmes;
var i:integer;
  Begin
      Result.Codigo:=cod.Codigo;
      Result.Descricao:=cod.Descricao;
      Result.QtdExemplar:=cod.QtdExemplar;
      Result.QtdDisponivel:=cod.QtdDisponivel;
      Result.CodigoCategoria:=cod.CodigoCategoria;
      Result.TipoFilme:=cod.TipoFilme;
      Result.Preco:=cod.Preco;
      Result.Audio:=cod.Audio;
      Result.Ativo:=cod.Ativo;
      SetLength(Result.Exemplar,Result.QtdExemplar);
      for i := 0 to Length(Result.Exemplar)-1 do
        Begin
            Result.Exemplar[i].SubCodigo:=i;
            Result.Exemplar[i].Disponivel:=True;
            Result.Exemplar[i].Lucro:=Zero;
            Result.Exemplar[i].Ativo:=True;
        End;
  End;

Procedure CadastraFilme(cod:Filmes;var vetor:Vet_Filmes);
var i:integer;
  Begin
      if Editar_Cadastro
        Then Begin
                 //vetor[ind].Codigo:=cod.Codigo;
                 vetor[ind].Descricao:=cod.Descricao;
                 vetor[ind].QtdExemplar:=cod.QtdExemplar;
                 vetor[ind].QtdDisponivel:=cod.QtdDisponivel;
                 vetor[ind].CodigoCategoria:=cod.CodigoCategoria;
                 vetor[ind].TipoFilme:=cod.TipoFilme;
                 //vetor[ind].Preco:=cod.Preco;
                 vetor[ind].Audio:=cod.Audio;
                 if not(cod.Ativo)and(vetor[ind].Ativo)
                  Then dec(Qtd_Filme_Ativo);
                 vetor[ind].Ativo:=cod.Ativo;

                 SetLength(vetor[ind].Exemplar,length(cod.Exemplar));
                 for i := 0 to length(cod.Exemplar)-1 do
                   Begin
                       //Filme.Exemplar[i].SubCodigo
                       //Filme.Exemplar[i].Disponivel
                       //Filme.Exemplar[i].Lucro
                       vetor[ind].Exemplar[i].Ativo:=cod.Exemplar[i].Ativo;
                   End;
                 Editar_Cadastro:=false;
             End
        Else Begin
                 SetLength(vetor,Length(vetor)+1);
                 //vetor[Length(vetor)-1].Codigo:=cod.Codigo;
                 vetor[Length(vetor)-1].Descricao:=cod.Descricao;
                 vetor[Length(vetor)-1].QtdExemplar:=cod.QtdExemplar;
                 vetor[Length(vetor)-1].QtdDisponivel:=cod.QtdDisponivel;
                 vetor[Length(vetor)-1].CodigoCategoria:=cod.CodigoCategoria;
                 vetor[Length(vetor)-1].TipoFilme:=cod.TipoFilme;
                 vetor[Length(vetor)-1].Preco:=cod.Preco;
                 vetor[Length(vetor)-1].Audio:=cod.Audio;
                 vetor[Length(vetor)-1].Ativo:=cod.Ativo;
                 SetLength(vetor[Length(vetor)-1].Exemplar,length(cod.Exemplar));
                 for i := 0 to Length(vetor[Length(vetor)-1].Exemplar)-1 do
                   Begin
                       vetor[Length(vetor)-1].Exemplar[i].SubCodigo:=cod.Exemplar[i].SubCodigo;
                       vetor[Length(vetor)-1].Exemplar[i].Disponivel:=cod.Exemplar[i].Disponivel;
                       vetor[Length(vetor)-1].Exemplar[i].Lucro:=cod.Exemplar[i].Lucro;
                       vetor[Length(vetor)-1].Exemplar[i].Ativo:=cod.Exemplar[i].Ativo;
                   End;
                 vetor[Length(vetor)-1].Codigo:=length(Vetor);
             End;
  End;

Procedure CadastraFuncionario(cod:Funcionarios;var vetor:Vet_Funcionarios);
  Begin
      if Editar_Cadastro
        Then Begin
                 vetor[Cod.Codigo-1]:=Cod;
             End
        Else Begin
                 SetLength(vetor,Length(vetor)+1);
                 vetor[Length(vetor)-1]:=Cod;
                 vetor[Length(vetor)-1].Codigo:=Length(vetor);
             End;
  End;

Function VerificaCliente(CPF:string):integer;
var i:integer;
  Begin
      Result:=-1;
      For i := 0 to Length(V_Cliente)-1 do
        Begin
             if V_Cliente[i].CPF=CPF
               Then Begin
                        Result:=i;
                        Break;
                    End;
        End;
  End;

Function VerificaCategoria(Nome:string):integer;
var i:integer;
  Begin
      Result:=-1;
      For i := 0 to Length(V_Categoria)-1 do
        Begin
             if V_Categoria[i].nome=Nome
               Then Begin
                        Result:=i;
                        Break;
                    End;
        End;
  End;

Function VerificaFuncionario(login:String):integer;
var i:integer;
  Begin
      Result:=-1;
      For i := 0 to Length(V_Funcionario)-1 do
        Begin
            if V_Funcionario[i].Login=login
              Then Begin
                       Result:=i;
                   End;
        End;
  End;

Function VerificaFornecedor(CNPJ:string):integer;
var i:integer;
  Begin
      Result:=-1;
      For i := 0 to Length(V_Fornecedor)-1 do
        Begin
             if V_Fornecedor[i].CNPJ=CNPJ
               Then Begin
                        Result:=i;
                        Break;
                    End;
        End;
  End;

Function VerificaFilme(Nome:string):integer;
var i:integer;
  Begin
      Result:=-1;
      For i := 0 to Length(V_Filme)-1 do
        Begin
             if V_Filme[i].Descricao=Nome
               Then Begin
                        Result:=i;
                        Break;
                    End;
        End;
  End;

Function VerificaPagarContaAvista(ValorConta:String):Boolean;
  Begin
      Result:=false;
      if StrToFloat(V_Caixa)>=StrToFloat(ValorConta)
        Then Begin
                 Result:=True;
             End;
  End;

Function RetornaIndiceCliente(cod:integer):integer;
var i: Integer;
  Begin
      Result:=-1;
      for i := 0 to Length(V_Cliente)-1 do
        Begin
            if cod=V_Cliente[i].Codigo
              Then Begin
                       Result:=i;
                       Break;
                   End;
        End;
  End;

Function RetornaIndiceFilme(cod:integer):integer;
var i: Integer;
  Begin
      Result:=-1;
      for i := 0 to Length(V_Filme)-1 do
        Begin
            if cod=V_Filme[i].Codigo
              Then Begin
                       Result:=i;
                       Break;
                   End;
        End;
  End;

Function RetornaIndiceExemplar(ind,cod:integer):integer;
var i: Integer;
  Begin
      Result:=-1;
      for i := 0 to Length(V_Filme[ind].Exemplar)-1 do
        Begin
            if cod=V_Filme[ind].Exemplar[i].SubCodigo
              Then Begin
                       Result:=i;
                       Break;
                   End;
        End;
  End;

Function RetornaIndiceExemplarFilmeDisponivel(Filme:Filmes):Integer;
var i:integer;
  Begin
      Result:=-1;
      for i := 0 to Length(Filme.Exemplar)-1 do
        Begin
            if (Filme.Exemplar[i].Disponivel)and(Filme.Exemplar[i].Ativo)
              Then Begin
                       Result:=i;
                       Break;
                   End;
        End;
  End;

Function RetornaIndiceLocacao(cod:integer):integer;
var i:integer;
  Begin
      Result:=-1;
      for i := 0 to Length(V_NotaLocacao)-1 do
        Begin
            if cod=V_NotaLocacao[i].Codigo
              Then Begin
                       Result:=i;
                       Break;
                   End;
        End;
  End;

Function RetornaIndiceCategoria(cod:integer):integer;
var i: Integer;
  Begin
      Result:=0;
      for i := 0 to Length(V_Categoria)-1 do
        Begin
            if cod=V_Categoria[i].Codigo
              Then Begin
                       Result:=i;
                       Break;
                   End;
        End;
  End;

Function RetornaIndiceVendedor(cod:integer):integer;
var i: Integer;
  Begin
      Result:=0;
      for i := 0 to Length(V_Funcionario)-1 do
        Begin
            if cod=V_Funcionario[i].Codigo
              Then Begin
                       Result:=i;
                       Break;
                   End;
        End;
  End;

Function RetornaIndiceFornecedor(cod:integer):integer;
var i: Integer;
  Begin
      Result:=-1;
      for i := 0 to Length(V_Fornecedor)-1 do
        Begin
            if cod=V_Fornecedor[i].Codigo
              Then Begin
                       Result:=i;
                       Break;
                   End;
        End;
  End;

Function RetornaIndiceNotaAPagar(cod:integer):integer;
var i:integer;
  Begin
      Result:=0;
      for i := 0 to Length(V_NotaAPagar)-1 do
        Begin
            if cod=V_NotaAPagar[i].Codigo
              Then Begin
                       Result:=i;
                       Break;
                   End;
        End;
  End;

Function RetornaIndiceNotaAReceber(cod:integer):integer;
var i:integer;
  Begin
      Result:=0;
      for i := 0 to Length(V_NotaAReceber)-1 do
        Begin
            if cod=V_NotaAReceber[i].Codigo
              Then Begin
                       Result:=i;
                       Break;
                   End;
        End;
  End;

Function RetornaCNPJFornecedor(Nome:String):String;
var i: Integer;
  Begin
      for i := 0 to Length(V_Fornecedor)-1 do
        Begin
            if Nome=V_Fornecedor[i].Nome
              Then Begin
                       Result:=V_Fornecedor[i].CNPJ;
                       Break;
                   End;
        End;
  End;

Function RetornaPrecoLocacaoCategoria(cod:integer):String;
var i:integer;
  Begin
      for i := 0 to Length(V_Categoria)-1 do
        Begin
            if cod=V_Categoria[i].Codigo
              Then Begin
                       Result:=V_Categoria[i].PrecoLocacao;
                   End;
        End;
  End;

Function RetornaClienteEditar(ind:integer):Clientes;
  Begin
      Result:=V_Cliente[ind];
  End;

Function RetornaLocaçãoEditar(ind:integer):NotasLocacao;
var i:integer;
  Begin
      Result.Codigo:=V_NotaLocacao[ind].Codigo;
      Result.CodigoCliente:=V_NotaLocacao[ind].CodigoCliente;
      Result.Funcionario:=V_NotaLocacao[ind].Funcionario;
      Result.QtdParcela:=V_NotaLocacao[ind].QtdParcela;
      Result.Entrada:=V_NotaLocacao[ind].Entrada;
      Result.Total:=V_NotaLocacao[ind].Total;
      Result.Data:=V_NotaLocacao[ind].Data;
      Result.DataDevolucao:=V_NotaLocacao[ind].DataDevolucao;
      Result.Hora:=V_NotaLocacao[ind].Hora;
      Result.Multa:=V_NotaLocacao[ind].Multa;
      for i := 0 to length(V_NotaLocacao[ind].Filme)-1 do
        Begin
            SetLength(Result.Filme,Length(V_NotaLocacao[ind].Filme));
            Result.Filme[i].CodigoFilme:=V_NotaLocacao[ind].Filme[i].CodigoFilme;
            Result.Filme[i].CodigoCategoria:=V_NotaLocacao[ind].Filme[i].CodigoCategoria;
            Result.Filme[i].DataDevolvida:=V_NotaLocacao[ind].Filme[i].DataDevolvida;
            Result.Filme[i].Devolvido:=V_NotaLocacao[ind].Filme[i].Devolvido;
        End;
  End;

Function RetornaFilmeEditar(ind:integer;Vetor:Array of Filmes):Filmes;
var i:integer;
  Begin
      Result.Codigo:=Vetor[ind].Codigo;
      SetLength(Result.Exemplar,length(Vetor[ind].Exemplar));
      for i := 0 to length(Vetor[ind].Exemplar)-1 do
        Begin
            Result.Exemplar[i].SubCodigo:=Vetor[ind].Exemplar[i].SubCodigo;
            Result.Exemplar[i].Disponivel:=Vetor[ind].Exemplar[i].Disponivel;
            Result.Exemplar[i].Lucro:=Vetor[ind].Exemplar[i].Lucro;
            Result.Exemplar[i].Ativo:=Vetor[ind].Exemplar[i].Ativo;
        End;
      Result.Descricao:=Vetor[ind].Descricao;
      Result.QtdExemplar:=Vetor[ind].QtdExemplar;
      Result.QtdDisponivel:=Vetor[ind].QtdDisponivel;
      Result.CodigoCategoria:=Vetor[ind].CodigoCategoria;
      Result.TipoFilme:=Vetor[ind].TipoFilme;
      Result.Preco:=Vetor[ind].Preco;
      Result.Audio:=Vetor[ind].Audio;
      Result.Ativo:=Vetor[ind].Ativo;
  End;

Function RetornaCategoriaEditar(ind:integer):Categorias;
  Begin
      Result:=V_Categoria[ind];
  End;

Function RetornaFornecedorEditar(ind:integer):Fornecedores;
  Begin
      Result:=V_Fornecedor[ind];
  End;

Function RetornaVendedorEditar(ind:integer):Funcionarios;
  Begin
      Result:=V_Funcionario[ind];
  End;

Procedure ExcluiCliente(cod:integer);
  Begin
      V_Cliente[cod-1].Ativo:=False;
      dec(Qtd_Cliente_Ativo);
  End;

Procedure ExcluiCategoria(cod:integer);
  Begin
      V_Categoria[cod-1].Ativo:=False;
      dec(Qtd_Categoria_Ativo);
  End;

Procedure ExcluiFuncionario(cod:integer);
  Begin
      V_Funcionario[cod-1].Ativo:=False;
      dec(Qtd_Funcionarios_Ativo);
  End;

Procedure ExcluiFornecedor(cod:integer);
  Begin
      V_Fornecedor[cod-1].Ativo:=False;
      dec(Qtd_Fornecedor_Ativo);
  End;

Procedure DescontaPagamento(Valor:String);
  Begin
      V_Caixa:=FloatToStr(StrToFloat(V_Caixa)-StrToFloat(Valor));
  End;

Procedure RecebePagamento(Valor:String);
  Begin
      V_Caixa:=FloatToStr(StrToFloat(V_Caixa)+StrToFloat(Valor));
  End;

Procedure PagaParcela(Codigo,Parcela:Integer);
  Begin
      codigo:=RetornaIndiceNotaAPagar(codigo);
      V_NotaAPagar[codigo].Parcelas[parcela-1].Paga:=True;
      V_NotaAPagar[codigo].Parcelas[parcela-1].DataPaga:=Date;
      V_NotaAPagar[codigo].Parcelas[parcela-1].HoraPaga:=TimeToStr(Time);
      Dec(qtd_NotaAPagar_ATivo);
      FinalizaVetores;
  End;

Procedure RecebeParcela(Codigo,Parcela:Integer);
  Begin
      codigo:=RetornaIndiceNotaAReceber(codigo);
      V_NotaAReceber[codigo].Parcelas[parcela-1].Paga:=True;
      V_NotaAReceber[codigo].Parcelas[parcela-1].DataPaga:=Date;
      V_NotaAReceber[codigo].Parcelas[parcela-1].HoraPaga:=TimeToStr(Time);
      Dec(Qtd_NotaAReceber_Ativo);
      FinalizaVetores;
  End;

Function CalculaMultaDevolucao(PrazoDevolucao:TDate;CodigoCategoria:integer):String;
var ind:integer;
    categoria:Categorias;
    dias:TDAte;
  Begin
      dias:=date-PrazoDevolucao;
      if dias>0
        Then Begin
                 ind:=RetornaIndiceCategoria(CodigoCategoria);
                 Categoria:=V_Categoria[ind];
                 Result:=FloatToStr(StrToFloat(V_Categoria[ind].PrecoMulta)*dias);
             End
        Else Result:=zero;
  End;

Function CalculaMultaPagamentos(PrazoDevolucao:TDate;ValorParcela:String):String;
var dias:integer;
    mesesAtrazo:integer;
  Begin
      dias:=DaysBetween(Date,PrazoDevolucao);
      if Date<PrazoDevolucao
        Then dias:=Dias*(-1);

      if dias>0
        Then Begin
                 mesesAtrazo:=(dias div 30)+1;
                 Result:=ArredondaNumero(FloatToSTr(mesesAtrazo*StrToFloat(ValorParcela)*0.1));
             End
        Else Result:=zero;
  End;

Procedure CarregaCopiaTemporariaFilmes;
var i,j:integer;
  Begin
      SetLength(CopiaFilme,0);
      SetLength(CopiaFilme,Length(V_Filme));   //lista de filmes temporarios para manipulação de quantidades
      for i := 0 to Length(V_Filme)-1 do
        Begin
            CopiaFilme[i].Codigo:=V_Filme[i].Codigo;
            CopiaFilme[i].Descricao:=V_Filme[i].Descricao;
            CopiaFilme[i].QtdExemplar:=V_Filme[i].QtdExemplar;
            CopiaFilme[i].QtdDisponivel:=V_Filme[i].QtdDisponivel;
            CopiaFilme[i].CodigoCategoria:=V_Filme[i].CodigoCategoria;
            CopiaFilme[i].TipoFilme:=V_Filme[i].TipoFilme;
            CopiaFilme[i].Preco:=V_Filme[i].Preco;
            CopiaFilme[i].Audio:=V_Filme[i].Audio;
            CopiaFilme[i].Ativo:=V_Filme[i].Ativo;

            SetLength(CopiaFilme[i].Exemplar,Length(V_Filme[i].Exemplar));
            for j := 0 to length(CopiaFilme[i].Exemplar)-1 do
              Begin
                  CopiaFilme[i].Exemplar[j].SubCodigo:=V_Filme[i].Exemplar[j].SubCodigo;
                  CopiaFilme[i].Exemplar[j].Disponivel:=V_Filme[i].Exemplar[j].Disponivel;
                  CopiaFilme[i].Exemplar[j].Lucro:=V_Filme[i].Exemplar[j].Lucro;
                  CopiaFilme[i].Exemplar[j].Ativo:=V_Filme[i].Exemplar[j].Ativo;
              End;
        End;
  End;

Procedure GravaVetorOriginal;
var i:integer;
  Begin
      For i := 0 to Length(V_Filme)-1 do
        Begin
            V_Filme[i]:=CopiaFilme[i];
        End;
  End;

Function VerificaTeclaNumeroReal(num:String;Key:char):Char;
var i: Integer;
    Repete:Boolean;
  Begin
      Repete:=False;
      if key=#44
        Then Begin
                 For i := 1 to Length(num) do
                   Begin
                       if num[i]=#44
                         Then Begin
                                  Repete:=True;
                                  Break;
                              End;
                   End;
             End;
      if not(key in NumerosReais)or Repete
        Then Result:=#0
        Else Result:=Key;
  End;

Function VerificaTeclaNumeroInteiro(num:String;Key:char):Char;
  Begin
      if not(key in NumerosInteiros)
        Then Result:=#0
        Else Result:=Key;
  End;

end.
