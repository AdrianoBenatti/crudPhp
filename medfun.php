<?php
#####################################################################################################################################################
# Programa.: medicosfuncoes (medfun.php)
# Objetivo.: Disponibilizar as Funções ESPECÍFICAS do Sistema de Gerenciamento de Dados na tabela medicos.
# Descrição: Inclui a execução dos arquivos externos ("toolsbag.php"), identifica valor de variável
#            de controle de saltos entre aplicativos ($salto). Executa funções externas e exibe mensagem de orientação do uso do sistema.
# Autor....: JMH
# Criação..: 2021-11-04
# Revisão..: 2021-11-04 - Primeira escrita (e revisões) das funções: PICKLIST e MOSTRAREGISTRO.
#####################################################################################################################################################
function picklist($acao,$salto)
{ # Esta função 'monta' um form mostrando os dados da tabela medicos suficientes para a escolha em uma caixa de seleção.
  # Parâmetros: $acao - texto 'Consultar' ou 'Excluir' ou 'Alterar' que é usado para Determinar o PA recursivo e
  # para exibir o texto na barra de botões ao lado da caixa de seleção.
  # Construindo a variável que contém o comando SQL que faz a projeção de CPMEDICO E TXNOMEMEDICO da tabela medicos ordenado por TXNOMEMEDICO
  $cmdsql="SELECT cpmedico, txnomemedico FROM medicos ORDER BY txnomemedico";
  # 'globalizando' a variável $con para que seja identificada em todos os escopo de execução de PA
  global $con;
  # executando a função de ambiente externa que 'executa' o SQL no BD.
  $execsql=mysqli_query($con,$cmdsql);
  # esta função RETORNA um 'vetor complexo' com 3 partes:
  # 1- nome das tabelas escritas no comando
  # 2- nomes dos campos do retorno
  # 3- os endereços dos registros que foram processados.
  # pode-se usar o $execsql como parâmetros de outras funções
  # a função a seguir 'vetoriza' os dados do primeiro endereço de registro do retorno de _query.
  # definição do formulário recursivo com passagem oculta do valor de bloco para 2.
  # Definindo o nome do arquivo de programa que deve ser referenciado recursivamente na função.
  $prg=( $acao=="Consultar" ) ? 'medcon.php' : (( $acao=="Excluir" ) ? 'medexc.php' : 'medalt.php') ; 
  # iniciando o form que faz a chamada recursiva com base no valor de $acao
  printf("<form action='./$prg' method='POST'>\n");
  printf(" <input type='hidden' name='salto' value='$salto'>\n");
  # Definindo a variável oculta 'bloco' com 2 (picklist() é SEMPRE EXECUTADA na primeira tela das funcionalidades Consultar, Alterar e/ou Excluir).
  printf(" <input type='hidden' name='bloco' value='2'>\n");
  # iniciando a caixa de seleção com nome cpmedico. As linhas desta picklist são 'montadas' dentro do laço de repetição a seguir.
  printf(" <select name='cpmedico'>\n");
  while ( $reg=mysqli_fetch_array($execsql) )
  {
    # montando as linhas <option>...</option>.
    printf("  <option value='$reg[cpmedico]'>$reg[txnomemedico]-($reg[cpmedico]) </option>\n");
  }
  printf(" </select>\n");
  # montando a barra de botões. A função picklist() é sempre executa na tela do mesmo nível no DHF. Por conta disso a barra de botões é sempre a mesma.
  /*printf(" <button type='submit'>$acao</button>\n");
  printf(" <button type='reset'>Limpar</button>\n");
  printf(" <button type='button' onclick='history.go(-$menu);'>Abertura</button>\n");
  printf(" <button type='button' onclick='history.go(-$salto);'>Sair</button>\n"); */
  barrabotoes($acao,TRUE,FALSE,$salto);
  printf("</form>\n");
}
function mostraregistro($cpmedico)
{ # Esta função faz uma consulta na tabela médicos com o valor informado no parâmetro $cpmedico e monta um vetor com os dados lidos.
  $cmdsql="SELECT * FROM medicos WHERE cpmedico='$cpmedico'";
  # printf("$cmdsql<br>\n");
  # 'globalizando' a variável $con para que seja identificada em todos os escopo de execução de PA
  global $con;
  # executando a função externa que 'executa' o SQL no BD.
  $execsql=mysqli_query($con,$cmdsql);
  # vetorizando os dados da linha lida (é uma só linha já que o retorno é feito com um ÚNICO endereço de registro.).
  $reg=mysqli_fetch_array($execsql);
  # Exibindo os dados do vetor em uma tabela
  printf("<table>\n");
  printf("<tr><td>Código</td>           <td>$reg[cpmedico]</td></tr>\n");
  printf("<tr><td>Nome</td>             <td>$reg[txnomemedico]</td></tr>\n");
  printf("<tr><td>Especialidade</td>    <td>$reg[ceespecialidade]</td></tr>\n");
  printf("<tr><td>NuCRM</td>            <td>$reg[nucrm]</td></tr>\n");
  printf("<tr><td>Situação</td>         <td>$reg[aosituacao]</td></tr>\n");
  printf("<tr><td>InstEns. Formação</td><td>$reg[ceinstituicaoensino]</td></tr>\n");
  printf("<tr><td>Logr. Moradia</td>    <td>$reg[celogradouromoradia]</td></tr>\n");
  printf("<tr><td>Complemento</td>      <td>$reg[txcomplementomoradia]</td></tr>\n");
  printf("<tr><td>CEP Moradia</td>      <td>$reg[nucepmoradia]</td></tr>\n");
  printf("<tr><td>Tel Moradia</td>      <td>$reg[nutelemoradia]</td></tr>\n");
  printf("<tr><td>Logr. Clínica</td>    <td>$reg[celogradouroclinica]</td></tr>\n");
  printf("<tr><td>Complemento</td>      <td>$reg[txcomplementoclinica]</td></tr>\n");
  printf("<tr><td>CEP Clínica</td>      <td>$reg[nucepclinica]</td></tr>\n");
  printf("<tr><td>Tel Clínica</td>      <td>$reg[nuteleclinica]</td></tr>\n");
  printf("<tr><td>Dt Cadastro</td>      <td>$reg[dtcadmedico]</td></tr>\n");
  printf("</table>\n");
  # Note: A 'Barra de Botões' será montada em particular para cada funcionalidade que executa a mostraregistro().
}
?>
