<?php
#####################################################################################################################################################
# Programa.: medicosalterar (medalt.php)
# Objetivo.: Funcionalidade "Abertura" do Sistema de Gerenciamento de Dados na tabela medicos.
# Descrição: Inclui a execução dos arquivos externos ("toolsbag.php"), identifica valor de variável
#            de controle de saltos entre aplicativos ($salto). Executa funções externas e exibe mensagem de orientação do uso do sistema.
# Autor....: JMH
# Criação..: 2021-10-25
# Revisão..: 2021-10-25 - Primeira escrita e montagem da estrutura geral.
#            2021-11-08 - Revisão do PA para uso da variável de controle de Saltos entre os PA e montagem da navegabilidade 'dentro' do sistema.
#####################################################################################################################################################
require_once("./toolsbag.php");
require_once("./livfun.php");
# determinando o valor da variável que permite escolha do bloco lógico a executar:- montagem da picklist ou de exibição dos dados do registro esoolhido.
$bloco=( !ISSET($_REQUEST['bloco']) ) ? 1 : $_REQUEST['bloco'];
$salto=$_REQUEST['salto']+1;
iniciapagina(TRUE,'Livros','Alterar');
# aqui vamos construir o menu do sistema
montamenu('Livros','liv','Alterar',$salto);
# divisor principal do programa.
switch (TRUE)
{
  case ( $bloco==1 ):
  { # CASE 1: Chamada do picklist para escolha do registro que deverá ser alterado.
    picklist("Alterar",$salto);
    break;
  }
  case ( $bloco==2 ):
  { # CASE 2: Montagem de um form com os dados do registro escolhido para alteração.
    # lendo o registro a alterar da tabela medicos
    $reglido=mysqli_fetch_array(mysqli_query($con,"SELECT * FROM livros WHERE cplivro='$_REQUEST[cplivro]'"));
    # montando o form
    printf("  <form action='livalt.php' method='POST'>\n");
    printf("  <input type='hidden' name='bloco' value='3'>\n");
    printf("  <input type='hidden' name='salto' value='$salto'>\n");
    printf(" <input type='hidden' name='cplivro' value='$_REQUEST[cplivro]'>\n");
    printf("  <table>\n");
    printf("   <tr><td>Título:</td>           <td><input type='text' name='txtituloacervo' value='$reglido[txtituloacervo]' placeholder='' size=50 maxlength=200></td></tr>\n");
    printf("   <tr><td>Quantidade Exemplares:</td>           <td><input type='number' name='qtexemplaresacervo' value='$reglido[qtexemplaresacervo]' placeholder='' size=50 maxlength=200></td></tr>\n");
    printf("   <tr><td>Quantidade Exemplares Consulta:</td>           <td><input type='number' name='qtexemplaresconsulta'  value='$reglido[qtexemplaresconsulta]'  placeholder='' size=50 maxlength=200></td></tr>\n");
    printf("<tr><td>Editora:</td>     <td>");
    # Montando a Picklist para a Especialidade Médica (tabela:especmedicas)
    $cmdsql="SELECT cpeditora,txnomeeditora from editoras order by txnomeeditora";
    $execcmd=mysqli_query($con,$cmdsql);
    printf("<select name='ceeditora'>\n");
    while ( $reg=mysqli_fetch_array($execcmd) )
    {
      $selected=( $reg['cpeditora']==$reglido['ceeditora'] ) ? " SELECTED": "" ;
      printf("<option value='$reglido[ceeditora]' $selected>$reg[txnomeeditora]-($reg[cpeditora])</option>");
  
    }
    printf("</select>\n");
    printf("</td></tr>\n");
    
    
    printf("<tr><td>Autores:</td><td>");
    $cmdsql="SELECT cpautor,txnomeautor from autores order by txnomeautor";
    $execcmd=mysqli_query($con,$cmdsql);
    printf("<select name='cpautor'>\n");
    while ( $reg=mysqli_fetch_array($execcmd) )
    {
      $selected=( $reg['cpautor']==$reglido['cpautor'] ) ? " SELECTED": "" ;
      printf("<option value='$reglido[cpautor]'>$reg[txnomeautor]-($reg[cpautor])</option>");
    }
    printf("</select>\n");
    printf("</td></tr>\n");

    printf("<tr><td></td>\n");
    printf("   <tr><td>Ano Publicação:</td><td><input type='text' name='nuanopublicacao' value='$reglido[nuanopublicacao]' placeholder='' size=50 maxlength=200></td></tr>\n");
    printf("<tr><td></td>\n");
    printf("   <tr><td>Data Publicação:</td>  <td><input type='date' name='dtpublicacao' value='$reglido[dtpublicacao]'></td></tr>\n");
    printf("<tr><td></td>\n");
    printf("   <tr><td>Data Cadastro:</td>  <td><input type='date' name='dtcadlivro' value='$reglido[dtcadlivro]'></td></tr>\n");
    
    barrabotoes('Alterar',TRUE,TRUE,$salto);
    printf("</td></tr>\n");
    printf("</table>");
    printf("</form>");
    break;
  }


  case ( $bloco==3 ):
  { # CASE 3: Tratamento de Transação para Gravar os dados que foram alterados no form.
    printf("Tratatando a Alteração do registro $_REQUEST[cplivro]<br>\n");
    # construção do comando de atualização.
    $cmdsql="UPDATE livros
                    SET
                    txtituloacervo             = '$_REQUEST[txtituloacervo]',
                    ceeditora                  = '$_REQUEST[ceeditora]',
                    dtpublicacao               = '$_REQUEST[dtpublicacao]',
                    nuanopublicacao            = '$_REQUEST[nuanopublicacao]',
                    qtexemplaresacervo         = '$_REQUEST[qtexemplaresacervo]',
                    qtexemplaresconsulta       = '$_REQUEST[qtexemplaresconsulta]',
                    dtcadlivro                 = '$_REQUEST[dtcadlivro]'
                    WHERE
                    cplivro='$_REQUEST[cplivro]'";
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
        $mens="Registro com código $_REQUEST[cplivro] Alterado!";
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
	( $mostrar ) ? mostraregistro($_REQUEST['cplivro']) : "";
    /*printf(" <button onclick='history.go(-1)'>Voltar</button>\n");
    printf(" <button type='button' onclick='history.go(-$menu);'>Abertura</button>\n");
    printf(" <button type='button' onclick='history.go(-$salto);'>Sair</button>\n");*/
    barrabotoes('',FALSE,TRUE,$salto);
    break;
  }
}

terminapagina('Livros',"Alterar",'livalt.php');
?>
