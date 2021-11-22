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
    $reglido=mysqli_fetch_array(mysqli_query($con,"SELECT * FROM medicos WHERE cpmedico='$_REQUEST[cpmedico]'"));
    # montando o form
    printf("<form action='medalt.php' method='POST'>\n");
    printf(" <input type='hidden' name='bloco' value='3'>\n");
    printf(" <input type='hidden' name='salto' value='$salto'>\n");
    printf(" <input type='hidden' name='cpmedico' value='$_REQUEST[cpmedico]'>\n");
    printf("<table>");
    printf("<tr><td>Nome:</td>              <td><input type='text' name='txnomemedico' value='$reglido[txnomemedico]' size='50' maxlength='200'></td></tr>\n");
    printf("<tr><td>NuCRM:</td>             <td><input type='text' name='nucrm' value='$reglido[nucrm]' size='8' maxlength='8'></td></tr>\n");
    printf("<tr><td>Situação:</td>          <td><input type='radio' name='aosituacao' value='A' checked>-Ativado<input type='radio' name='aosituacao' value='D'>-Desativado</td></tr>\n");
    # Montando a Picklist para a Especialidade Médica (tabela:especmedicas)
    printf("<tr><td>Especialidade:</td>     <td>");
    $cmdsql="SELECT cpespecialidade,txnomeespecialidade from especmedicas order by txnomeespecialidade";
    $execcmd=mysqli_query($con,$cmdsql);
    printf("<select name='ceespecialidade'>\n");
    while ( $reg=mysqli_fetch_array($execcmd) )
    {
      $selected=( $reg['cpespecialidade']==$reglido['ceespecialidade'] ) ? " SELECTED": "" ;
      printf("<option value='$reg[cpespecialidade]'$selected>$reg[txnomeespecialidade]-($reg[cpespecialidade])</option>");
    }
    printf("</select>\n");
    printf("</td></tr>\n");
    printf("<tr><td>Escola de formação:</td><td>");
    $cmdsql="SELECT cpinstituicaoensino,txnomeinstituicaoensino from instituicoesdeensino order by txnomeinstituicaoensino";
    $execcmd=mysqli_query($con,$cmdsql);
    printf("<select name='ceinstituicaoensino'>\n");
    while ( $reg=mysqli_fetch_array($execcmd) )
    {
      $selected=( $reg['cpinstituicaoensino']==$reglido['ceinstituicaoensino'] ) ? " SELECTED": "" ;
      printf("<option value='$reg[cpinstituicaoensino]'$selected>$reg[txnomeinstituicaoensino]-($reg[cpinstituicaoensino])</option>");
    }
    printf("</select>\n");
    printf("</td></tr>\n");
    printf("<tr><td></td>                   <td><hr></td></tr>\n");
    printf("<tr><td>Clínica:</td>           <td>");
    $cmdsql="SELECT cplogradouro,txnomelogrcompleto from logradourocompleto order by txnomelogrcompleto";
    $execcmd=mysqli_query($con,$cmdsql);
    printf("<select name='celogradouroclinica'>\n");
    while ( $reg=mysqli_fetch_array($execcmd) )
    {
      $selected=( $reg['cplogradouro']==$reglido['celogradouroclinica'] ) ? " SELECTED": "" ;
      printf("<option value='$reg[cplogradouro]'$selected>$reg[txnomelogrcompleto]-($reg[cplogradouro])</option>");
    }
    printf("</select>\n");
    printf("</td></tr>\n");
    printf("<tr><td></td>                   <td>Complemento Clinica<br><input type='text' name='txcomplementoclinica' value='$reglido[txcomplementoclinica]' size='50' maxlength='50'></td></tr>\n");
    printf("<tr><td></td>                   <td>CEP: <input type='text' name='nucepclinica' value='$reglido[nucepclinica]' size='8' maxlength='8'> - Telefone: <input type='text' name='nuteleclinica' value='$reglido[nuteleclinica]' size='11' maxlength='11'></td></tr>\n");
    printf("<tr><td></td>                   <td><hr></td></tr>\n");
    printf("<tr><td>Moradia:</td>           <td>");
    $cmdsql="SELECT cplogradouro,txnomelogrcompleto from logradourocompleto order by txnomelogrcompleto";
    $execcmd=mysqli_query($con,$cmdsql);
    printf("<select name='celogradouromoradia'>\n");
    while ( $reg=mysqli_fetch_array($execcmd) )
    {
      $selected=( $reg['cplogradouro']==$reglido['celogradouromoradia'] ) ? " SELECTED": "" ;
      printf("<option value='$reg[cplogradouro]'$selected>$reg[txnomelogrcompleto]-($reg[cplogradouro])</option>");
    }
    printf("</select>\n");
    printf("</td></tr>\n");
    printf("<tr><td></td>                   <td>Complemento moradia<br><input type='text' name='txcomplementomoradia' value='$reglido[txcomplementomoradia]' size='50' maxlength='50'></td></tr>\n");
    printf("<tr><td></td>                   <td>CEP: <input type='text' name='nucepmoradia' value='$reglido[nucepmoradia]' size='8' maxlength='8'> - Telefone: <input type='text' name='nutelemoradia' value='$reglido[nutelemoradia]' size='11' maxlength='11'></td></tr>\n");
    printf("<tr><td></td>                   <td><hr></td></tr>\n");
    printf("<tr><td>Cadastro em:</td>       <td><input type='date' name='dtcadmedico' value='$reglido[dtcadmedico]'></td></tr>\n");
    printf("<tr><td>&nbsp;</td>             <td>");
    /*printf(" <button type='submit'>Alterar</button>\n");
    printf(" <button type='reset'>Limpar</button>\n");
    printf(" <button onclick='history.go(-1)'>Voltar</button>\n");
    printf(" <button onclick='history.go(-$menu)'>Abertura</button>\n");
    printf(" <button onclick='history.go(-$salto)'>Sair</button>\n");*/
    barrabotoes('Alterar',TRUE,TRUE,$salto);
    printf("</td></tr>\n");
    printf("</table>");
    printf("</form>");
    break;
  }
  case ( $bloco==3 ):
  { # CASE 3: Tratamento de Transação para Gravar os dados que foram alterados no form.
    printf("Tratatando a Alteração do registro $_REQUEST[cpmedico]<br>\n");
    # construção do comando de atualização.
    $cmdsql="UPDATE medicos
                    SET txnomemedico         = '$_REQUEST[txnomemedico]',
                        ceespecialidade      = '$_REQUEST[ceespecialidade]',
                        nucrm                = '$_REQUEST[nucrm]',
                        aosituacao           = '$_REQUEST[aosituacao]',
                        ceinstituicaoensino  = '$_REQUEST[ceinstituicaoensino]',
                        celogradouromoradia  = '$_REQUEST[celogradouromoradia]',
                        txcomplementomoradia = '$_REQUEST[txcomplementomoradia]',
                        nucepmoradia         = '$_REQUEST[nucepmoradia]',
                        nutelemoradia        = '$_REQUEST[nutelemoradia]',
                        celogradouroclinica  = '$_REQUEST[celogradouroclinica]',
                        txcomplementoclinica = '$_REQUEST[txcomplementoclinica]',
                        nucepclinica         = '$_REQUEST[nucepclinica]',
                        nuteleclinica        = '$_REQUEST[nuteleclinica]',
                        dtcadmedico          = '$_REQUEST[dtcadmedico]'
                    WHERE
                        cpmedico='$_REQUEST[cpmedico]'";
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
        $mens="Registro com código $_REQUEST[cpmedico] Alterado!";
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
	( $mostrar ) ? mostraregistro($_REQUEST['cpmedico']) : "";
    /*printf(" <button onclick='history.go(-1)'>Voltar</button>\n");
    printf(" <button type='button' onclick='history.go(-$menu);'>Abertura</button>\n");
    printf(" <button type='button' onclick='history.go(-$salto);'>Sair</button>\n");*/
    barrabotoes('',FALSE,TRUE,$salto);
    break;
  }
}

terminapagina('Livros',"Alterar",'livalt.php');
?>
