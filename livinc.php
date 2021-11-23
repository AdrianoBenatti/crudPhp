<?php
#####################################################################################################################################################
# Programa.: medicosincluir (medinc.php)
# Objetivo.: Funcionalidade "Incluir" do Sistema de Gerenciamento de Dados na tabela medicos.
# Descrição: Inclui a execução dos arquivos externos ("toolsbag.php") e o arquivo ("medfun.php"), identifica valor de variável
#            de controle de saltos entre aplicativos ($salto e $menu). Executa funções externas (monta as TAGs da página inicial, monta o menu)
#            e inicia o bloco principal de execução. No Bloco 1 monta um form para entrada de dados e no Bloco 2 trata a transação de INSERT.
#            O comando INSERT é montado 'dentro' da transação, lendo o valor da última CP da tabela.
# Autor....: JMH
# Criação..: 2021-10-25
# Revisão..: 2021-10-25 - Primeira escrita e montagem da estrutura geral.
#            2021-11-08 - Revisão do PA para uso da variável de controle de Saltos entre os PA e montagem da navegabilidade 'dentro' do sistema.
#####################################################################################################################################################
require_once("./toolsbag.php");
require_once("./livfun.php");
# determinando o valor da variável que permite escolha do bloco lógico a executar:- montagem da picklist ou de exibição dos dados do registro esoolhido.
$bloco=( !ISSET($_REQUEST['bloco']) ) ? 1 : $_REQUEST['bloco'];
# $menu=$_REQUEST['salto'];
$salto=$_REQUEST['salto']+1;
iniciapagina(TRUE,"Livros","Incluir");
# aqui vamos construir o menu do sistema
montamenu('Lirvos','liv','Incluir',$salto);
# Aqui será criado um SWITCH... CASE ... com 2 blocos:
# divisor principal do programa.
switch (TRUE)
{
  case ( $bloco==1 ):
  { # CASE 1: Formulário para entrada de dados
    printf("  <form action='livinc.php' method='POST'>\n");
    printf("  <input type='hidden' name='bloco' value='2'>\n");
    printf("  <input type='hidden' name='salto' value='$salto'>\n");
    printf("  <table>\n");
    printf("   <tr><td>Código:</td>         <td>O código será gerado pelo Sistema</td></tr>\n");
    printf("   <tr><td>Título:</td>           <td><input type='text' name='txtituloacervo' placeholder='' size=50 maxlength=200></td></tr>\n");
    printf("   <tr><td>Quantidade Exemplares:</td>           <td><input type='number' name='qtexemplaresacervo' placeholder='' size=50 maxlength=200></td></tr>\n");
    printf("   <tr><td>Quantidade Exemplares Consulta:</td>           <td><input type='number' name='qtexemplaresconsulta' placeholder='' size=50 maxlength=200></td></tr>\n");
    printf("<tr><td>Editora:</td>     <td>");
    $cmdsql="SELECT cpeditora,txnomeeditora from editoras order by txnomeeditora";
    $execcmd=mysqli_query($con,$cmdsql);
    printf("<select name='ceeditora'>\n");
    while ( $reg=mysqli_fetch_array($execcmd) )
    {
      printf("<option value='$reg[cpeditora]'>$reg[txnomeeditora]-($reg[cpeditora])</option>");
    }
    printf("</select>\n");
    printf("</td></tr>\n");
    printf("<tr><td>Autores:</td><td>");
    $cmdsql="SELECT cpautor,txnomeautor from autores order by txnomeautor";
    $execcmd=mysqli_query($con,$cmdsql);
    printf("<select name='cpautor'>\n");
    while ( $reg=mysqli_fetch_array($execcmd) )
    {
      printf("<option value='$reg[txnomeautor]'>$reg[txnomeautor]-($reg[cpautor])</option>");
    }
    printf("</select>\n");

    printf("<tr><td></td>\n");
    printf("   <tr><td>Ano Publicação:</td><td><input type='text' name='nuanopublicacao' placeholder='' size=50 maxlength=200></td></tr>\n");
    printf("<tr><td></td>\n");
    printf("   <tr><td>Data Publicação:</td>  <td><input type='date' name='dtpublicacao'></td></tr>\n");
    printf("<tr><td></td>\n");
    printf("   <tr><td>Data Cadastro:</td>  <td><input type='date' name='dtcadlivro'></td></tr>\n");



    $execcmd=mysqli_query($con,$cmdsql);
    printf("</select>\n");
    printf("</td></tr>\n");
    printf("<tr><td></td>\n");
    printf("   <tr><td></td>                <td>");
    printf("  </table>\n");
    /*
    printf("  <button type='submit'>Incluir</button>\n");
    printf("  <button type='reset'>Limpar</button>\n");
    printf("  <button onclick='history.go(-$menu)'>Abertura</button>\n");
    printf("  <button onclick='history.go(-$salto)'>Sair</button>\n");
	*/
	barrabotoes("Incluir",TRUE,FALSE,$salto);
    printf("  </form>\n");

    break;
  }
  case ( $bloco==2 ):
  { # CASE 2: Tratamento de Transação para Gravar os dados do form.
    $mostrar=FALSE;
    $tenta=TRUE;
    while ( $tenta )
    { # laço de controle de exec da trans.
      mysqli_query($con,"START TRANSACTION");
      # construção do comando de atualização.
      # recuperação do último valor gravado na PK da tabela
      $ultimacp=mysqli_fetch_array(mysqli_query($con,"SELECT MAX(cplivro) AS CpMAX FROM livros"));
      $CP=$ultimacp['CpMAX']+1;
      # Construção do comando de atualização.
      $cmdsql="INSERT INTO livros (cplivro, txtituloacervo,ceeditora, dtpublicacao, nuanopublicacao, qtexemplaresacervo, qtexemplaresconsulta, dtcadlivro)
                      VALUES ('$CP',
                              '$_REQUEST[txtituloacervo]',
                              '$_REQUEST[ceeditora]',
                              '$_REQUEST[dtpublicacao]',
                              '$_REQUEST[nuanopublicacao]',
                              '$_REQUEST[qtexemplaresacervo]',
                              '$_REQUEST[qtexemplaresconsulta]',
                              '$_REQUEST[dtcadlivro]')";
                              
      # printf("$cmdsql<br>\n");
      # execução do cmd.
      mysqli_query($con,$cmdsql);
      # tratamento dos erros de exec do cmd.
      if ( mysqli_errno($con)==0 )
      { # trans pode ser concluída e não reiniciar
        mysqli_query($con,"COMMIT");
        $tenta=FALSE;
        $mostrar=TRUE;
        $mens="Registro incluído!";
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
    printf("$mens<br>\n");
    if ( $mostrar )
    { # mostraregistro incova botoes que recebe os parâmetros ($acao,$clear,$voltar,$menu,$sair)
      mostraregistro("$CP",);
	}
    /*printf("<button type='button' onclick='history.go(-1)'>Voltar</button>\n");
    printf("<button type='button' onclick='history.go(-$menu)'>Abertura</button>\n");
    printf("<button type='button' onclick='history.go(-$salto)'>Sair</button>\n");
    barrabotoes($acao,$limpa,$volta,$salto) */
    barrabotoes('',FALSE,TRUE,$salto);
    break;
  }
}
terminapagina('Livros',"Incluir",'liv.php');
?>
