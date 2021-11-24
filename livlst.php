<?php
#####################################################################################################################################################
# Programa.: medicoslistar (medlst.php)
# Objetivo.: Exibir uma Listagem com os Dados na tabela medicos, possibilitando a emissão de uma cópia para impressão.
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
# determinando as variáveis de controle de saltos entre funcionalidades do PA
$menu=$_REQUEST['salto'];
$salto=$_REQUEST['salto']+1;
$cordefundo=($bloco<3) ? TRUE : FALSE;
iniciapagina($cordefundo,"Livros","Listar");
# Aqui será criado um SWITCH... CASE ... com 2 blocos:
# divisor principal do programa.
switch (TRUE)
{
  case ( $bloco==1 ):
  { # CASE 1: Formulário para entrada de dados
    # iniciando o menu do sistema para os case 1 e 2.
    montamenu("Livros","liv","Listar",$salto);
    printf(" <form action='./livlst.php' method='post'>\n");
    printf("  <input type='hidden' name='bloco' value=2>\n");
    printf("  <input type='hidden' name='salto' value='$salto'>\n");
    printf("  <table>\n");
    printf("   <tr><td colspan=2>Escolha a <negrito>ordem</negrito> como os dados serão exibidos no relatório:</td></tr>\n");
    printf("   <tr><td>Nome do Livro:</td><td>(<input type='radio' name='ordem' value='M.txtituloacervo'>)</td></tr>\n");
    printf("   <tr><td>Ano de publicação...:</td><td>(<input type='radio' name='ordem' value='M.nuanopublicacao' checked>)</td></tr>\n");
    printf("   <tr><td colspan=2>Escolha valores para seleção de <negrito>dados</negrito> do relatório:</td></tr>\n");
    printf("   <tr><td>Escolha uma editora:</td><td>");
    $cmdsql="SELECT cpeditora,txnomeeditora from editoras order by txnomeeditora";
    $execcmd=mysqli_query($con,$cmdsql);
    printf("<select name='ceeditora'>\n");
    while ( $reg=mysqli_fetch_array($execcmd) )
    {
      printf("<option value='$reg[cpeditora]'>$reg[txnomeeditora]-($reg[cpeditora])</option>");
    }
    printf("</select>\n");
    printf("</td></tr>\n");
    $dtini="1901-01-01";
    $dtfim=date("Y-m-d");
    printf("<tr><td>Intervalo de datas de cadastro:</td><td><input type='date' name='dtcadini' value='$dtini'> até <input type='date' name='dtcadfim' value='$dtfim'></td></tr>");
    printf("   <tr><td></td><td>");
    /*printf("<button type='submit'>Listar</button>\n");
    printf("<button type='reset'>Limpar</button>\n");
    printf("<button type='button' onclick='history.go(-$menu)'>Abertura</button>\n");
    printf("<button type='button' onclick='history.go(-$salto)'>Sair</button>\n");*/
    barrabotoes('Listar',TRUE,FALSE,$salto);
    printf("</td></tr>\n");
    printf("  </table>\n");
    break;
  }
  case ( $bloco==2 or $bloco==3 ):
  { # CASE 2: Tratamento de Transação para Gravar os dados do form.


    # Depois monta a tabela com os dados e a seguir um form permitindo que a listagem seja exibida para impressão em uma nova aba.
    $selecao=" WHERE (M.dtcadlivro between '$_REQUEST[dtcadini]' and '$_REQUEST[dtcadfim]')";
    $selecao=( $_REQUEST['ceeditora']!='TODAS' ) ? $selecao." AND M.ceeditora='$_REQUEST[ceeditora]'" : $selecao ;
    $cmdsql="SELECT * FROM livros AS M".$selecao." ORDER BY $_REQUEST[ordem]";
    $execsql=mysqli_query($con,$cmdsql);
    ($bloco==2) ? montamenu("Livros","liv","Listar","$_REQUEST[salto]") : "";
    printf("<table border=1 style=' border-collapse: collapse; '>\n");
    printf(" <tr><td valign=top>Cod.</td>\n");
    printf("     <td valign=top>Título</td>\n");
    printf("     <td valign=top>Quantidade Exemplares</td>\n");
    printf("     <td valign=top>Quantidade Exemplares Consulta</td>\n");
    printf("     <td valign=top>Editora</td>\n");
    printf("     <td valign=top>Ano Publicação</td>\n");
    printf("     <td valign=top>Data Publicação</td>\n");
    printf("     <td valign=top>Data Cadastro</td></tr>\n");

	$corlinha="White";
    while ( $le=mysqli_fetch_array($execsql) )
    {
      printf("<tr bgcolor=$corlinha><td>$le[cplivro]</td>\n");
      printf("   <td valign=top>$le[txtituloacervo]</td>\n");
      printf("   <td valign=top>$le[qtexemplaresacervo]</td>\n");
      printf("   <td valign=top>$le[qtexemplaresconsulta]</td>\n");
      printf("   <td valign=top>$le[ceeditora]</td>\n");
      printf("   <td valign=top>$le[nuanopublicacao]</td>\n");
      printf("   <td valign=top>$le[dtpublicacao]</td>\n");
      printf("   <td valign=top>$le[dtcadlivro]</td></tr>\n");
      $corlinha=( $corlinha=="White" ) ? "Navajowhite" : "White";
    }
    printf("</table>\n");
    if ( $bloco==2 )
    {
      printf("<form action='./livlst.php' method='POST' target='_NEW'>\n");
      printf(" <input type='hidden' name='bloco' value=3>\n");
      printf(" <input type='hidden' name='salto' value='$_REQUEST[salto]'>\n");
      printf(" <input type='hidden' name='ceeditora' value=$_REQUEST[ceeditora]>\n");
      printf(" <input type='hidden' name='dtcadini' value=$_REQUEST[dtcadini]>\n");
      printf(" <input type='hidden' name='dtcadfim' value=$_REQUEST[dtcadfim]>\n");
      printf(" <input type='hidden' name='ordem' value=$_REQUEST[ordem]>\n");
      printf(" <button type='submit'>Gerar Impressão</button>\n");
      printf(" <button type='button' onclick='history.go(-1)'>Voltar</button>\n");
      printf(" <button type='button' onclick='history.go(-$menu)'>Abertura</button>\n");
      printf(" <button type='button' onclick='history.go(-$salto)'>Sair</button>\n");
      printf("</form>\n\n\n");
    }
    else
    {
      printf("<button type='submit' onclick='window.print();'>Imprimir</button> - Corte a folha abaixo da linha no final da página<br>\n<hr>\n");
    }
    break;
  }
}
terminapagina('Livros',"Listar",'livlst.php');
?>
