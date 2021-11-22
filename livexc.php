<?php
#####################################################################################################################################################
# Programa.: medicosexcluir (medexc.php)
# Objetivo.. Funcionalidade "EXCLUIR" do Sistema de Gerenciamento de Dados na tabela medicos.
# Descrição: Faz a referencia dos arquivos externos ("./toolsbag.php") e ("./medfun.php"), identifica valor de variável de controle de blocos de 
#            execução ($bloco), identifica a variável de controle de saltos entre aplicativos ($salto).
#            Executa funções externas e inicia o bloco de controle principal do PA com base em $bloco. Os Blocos de execução são:
#            - montagem da picklist (le a tabela medicos e monta a picklist para escolha do registro que será excluído.
#            - exibição dos dados do registro escolhido e montagem do form de confirmação da exclusão ou
#            - tratamento da transação (comando DELETE).
# Autor....: JMH
# Criação..: 2021-11-01
# Revisão..: 2021-11-01 - Primeira escrita e montagem da estrutura geral. Desenvolvimento do Case ($bloco==1) - picklist e do 
#                         Case ($bloco==2) - exibição do registro a ser excluído com o form de confirmação.
#            2021-11-02 - Desenvolvimento do Case ($bloco==3) - Tratamento da Transação.
#            2021-11-08 - Revisão do PA para uso da variável de controle de Saltos entre os PA e montagem da navegabilidade 'dentro' do sistema.
#####################################################################################################################################################
require_once("./toolsbag.php");
require_once("./livfun.php");
# determinando o valor da variável que permite escolha do bloco lógico a executar:
# - montagem da picklist
# - exibição dos dados do registro escolhido ou
# - tratamento da transação (comando DELETE).
$bloco=( !ISSET($_REQUEST['bloco']) ) ? 1 : $_REQUEST['bloco'];
$salto=$_REQUEST['salto']+1;
iniciapagina(TRUE,'Livros','Excluir');
# aqui vamos construir o menu do sistema
montamenu('Livros','liv','Excluir',$salto);
# divisor principal do programa (baseado em $bloco).
switch (TRUE)
{
  case ( $bloco==1 ):
  { # Montar o form com a picklist que permite escolher o medico para consultar registro.
    picklist('Excluir',$salto);
    break;
  }
  case ( $bloco==2 ):
  { # Capturar o valor do código do médico, pesquisar na tabela médicos e montar tabela Campo|Valor exibindo os dados.
    mostraregistro("$_REQUEST[cpmedico]");
    printf("<form action='./medexc.php' method='POST'>\n");
    printf("<input type='hidden' name='bloco' value='3'>\n");
    printf("<input type='hidden' name='salto' value='$salto'>\n");
    printf("<input type='hidden' name='cpmedico' value='$_REQUEST[cpmedico]'>\n");
    /*printf("<button type='submit'>Confirmar Exclusão</button>\n");
    printf("<button type='button' onclick='history.go(-1);'>Voltar</button>\n");
    printf("<button type='button' onclick='history.go(-$menu);'>Abertura</button>\n");
    printf("<button type='button' onclick='history.go(-$salto);'>Sair</button>\n");*/
    barrabotoes('Confirmar Exclusão',FALSE,TRUE,$salto);
    printf("</form>\n");
    break;
  }
  case ( $bloco==3 ):
  { # Tratamento da transação de exclusão do registro
    printf("Tratatando a exclusão do registro $_REQUEST[cpmedico]<br>\n");
    # construção do comando de atualização.
    $cmdsql="DELETE FROM medicos WHERE medicos.cpmedico='$_REQUEST[cpmedico]'";
    $mostrar=FALSE;
    $tenta=TRUE;
    while ( $tenta )
    { # laço de controle de exec da trans.
      mysqli_query($con,"START TRANSACTION");
      # execução do cmd.
      mysqli_query($con,$cmdsql);
      # tratamento dos erros de exec do cmd.
      if ( mysqli_errno($con)==0 )
      { # trans pode ser concluída e não reiniciar
        mysqli_query($con,"COMMIT");
        $tenta=FALSE;
        $mostrar=TRUE;
        $mens="Registro com código $_REQUEST[cpmedico] excluído!";
      }
      else
      {
        if ( mysqli_errno($con)==1213 )
        { # abortar a trans e reiniciar
          $tenta=TRUE;
        }
        else
        { # abortar a trans e NÃO reiniciar
          $tenta=FALSE;
          $mens=mysqli_errno($con)."-".mysqli_error($con);
        }
        mysqli_query($con,"ROLLBACK");
        $mostrar=FALSE;
      }
    }
	printf("$mens<br>");
    /*printf("<button type='button' onclick='history.go(-$menu);'>Abertura</button>\n");
    printf("<button type='button' onclick='history.go(-$salto);'>Sair</button>\n");*/
    barrabotoes("",FALSE,FALSE,$salto);
    break;
  }
}
terminapagina('Livros',"Excluir",'livexc.php');
?>
