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
  $cmdsql="SELECT cplivro, txtituloacervo FROM livros ORDER BY txtituloacervo";
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
  $prg=( $acao=="Consultar" ) ? 'livcon.php' : (( $acao=="Excluir" ) ? 'livexc.php' : 'livalt.php') ; 
  # iniciando o form que faz a chamada recursiva com base no valor de $acao
  printf("<form action='./$prg' method='POST'>\n");
  printf(" <input type='hidden' name='salto' value='$salto'>\n");
  # Definindo a variável oculta 'bloco' com 2 (picklist() é SEMPRE EXECUTADA na primeira tela das funcionalidades Consultar, Alterar e/ou Excluir).
  printf(" <input type='hidden' name='bloco' value='2'>\n");
  # iniciando a caixa de seleção com nome cpmedico. As linhas desta picklist são 'montadas' dentro do laço de repetição a seguir.
  printf(" <select name='cplivro'>\n");
  while ( $reg=mysqli_fetch_array($execsql) )
  {
    # montando as linhas <option>...</option>.
    printf("  <option value='$reg[cplivro]'>$reg[txtituloacervo]-($reg[cplivro]) </option>\n");
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
function mostraregistro($cplivro)
{ # Esta função faz uma consulta na tabela médicos com o valor informado no parâmetro $cpmedico e monta um vetor com os dados lidos.
  $cmdsql="SELECT * FROM livros WHERE cplivro='$cplivro'";

  # printf("$cmdsql<br>\n");
  # 'globalizando' a variável $con para que seja identificada em todos os escopo de execução de PA
  global $con;
  # executando a função externa que 'executa' o SQL no BD.
  $execsql=mysqli_query($con,$cmdsql);
  # vetorizando os dados da linha lida (é uma só linha já que o retorno é feito com um ÚNICO endereço de registro.).
  $reg=mysqli_fetch_array($execsql);

  # Exibindo os dados do vetor em uma tabela
  printf("<table>\n");
  printf("<tr><td>Título: </td>           <td>$reg[txtituloacervo]</td></tr>\n");
  printf("<tr><td>Editora: </td>             <td>$reg[ceeditora]</td></tr>\n");
  printf("<tr><td>Data Publicação: </td>             <td>$reg[dtpublicacao]</td></tr>\n");
  printf("<tr><td>Ano Publicação: </td>             <td>$reg[nuanopublicacao]</td></tr>\n");
  printf("<tr><td>Quantidade Exemplares Acervo: </td>             <td>$reg[qtexemplaresacervo]</td></tr>\n");
  printf("<tr><td>Quantidade Exemplares Consulta: </td>             <td>$reg[qtexemplaresconsulta]</td></tr>\n");
  printf("<tr><td>Data Cadastro Livro: </td>             <td>$reg[dtcadlivro]</td></tr>\n");

  printf("</table>\n");
  # Note: A 'Barra de Botões' será montada em particular para cada funcionalidade que executa a mostraregistro().
}
?>
