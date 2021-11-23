<?php
#----------------------------------------------------------------------------------------------------------------------------------------------------
# Arquivo..: toolsbag.php
# Descricao: Coleção de Funções Sistêmicas (devem ser acessadas por todas os PA de gerenciamento de dados de TODAS as tabelas)
# Autor....: JMH
# Criação..: 2021-10-22
# Revisão..: 2021-10-25 - escrita das funções iniciapagina, conectadb e terminapagina
#            2021-10-28 - escrita da função montamenu
#            2021-11-11 - escrita da função barrabotoes
#----------------------------------------------------------------------------------------------------------------------------------------------------
function iniciapagina($fundo,$tab,$acao)
{
  printf("<!DOCTYPE html>\n");
  printf("<html>\n");
  printf("<head>\n");
  printf("<title>$tab-$acao</title>\n");
  printf("<link rel='stylesheet' type='text/css' href='./toolsbag.css'>\n");
  printf("</head>\n");
  printf($fundo ? " <body class='$acao'>\n" : " <body>\n");
}
function terminapagina($tab,$acao,$arqprg)
{
  printf("<hr>\n");
  printf("$tab - $acao | &copy; 2021-10-25 - JMH+FATEC-4ºADS | $arqprg\n");
  printf("</body>\n");
  printf("</html>\n");
}
function montamenu($tab,$tabname,$acao,$salto)
{ 
  printf("<div class='$acao'>\n");
  printf(" <div class='menu'>\n");
  printf(" <form action='' method='POST'>\n");
  printf("  <input type='hidden' name='salto' value='$salto'>$tab:\n");
  printf("  <button class='ins' type='submit' formaction='./".$tabname."inc.php'>Incluir</button>\n");
  printf("  <button class='con' type='submit' formaction='./".$tabname."con.php'>Consultar</button>\n");
  printf("  <button class='alt' type='submit' formaction='./".$tabname."alt.php'>Alterar</button>\n");
  printf("  <button class='exc' type='submit' formaction='./".$tabname."exc.php'>Excluir</button>\n");
  printf("  <button class='lst' type='submit' formaction='./".$tabname."lst.php'>Listar</button>\n");
  printf(" </form>\n");
  printf("</div>\n");
  printf("<red>$acao</red><hr>\n");
  printf("</div>\n<br><br><br>\n");
}
function conectadb($servidor,$usuario,$senha,$nomedabase)
{
  global $con;
  $con=mysqli_connect($servidor, $usuario, $senha, $nomedabase);
}
function barrabotoes($acao,$limpa,$volta,$salto)
{
  $menu=$salto-1;
  printf($acao!="" ? "  <button type='submit'>$acao</button>\n" : "");
  printf($limpa ? "  <button type='reset'>Limpar</button>\n" : "");
  printf($volta ? "  <button type='button' onclick='history.go(-1)'>Voltar</button>\n" : "");
  printf("  <button type='button' onclick='history.go(-$menu)'>Abertura</button>\n");
  printf("  <button type='button' onclick='history.go(-$salto)'>Sair</button>\n");
}
## -- fim do trecho de declaração de funções
## -- Bloco Principal do PA
## -- Executando a função de conexão com o Banco de dados e acesso à base ilp54020212
conectadb('localhost','root','','Baseilp540-2021.2');



## Lista de códigos Hexadecimais para símbolos gráficos
## Ok dentro de Quadrado  -  &#x1f197;&#xfe0e;
## Flecha de Retorno  -  &#x21a9;
## Página Anterior  -  &#x2397;
## Próxima Página  -  &#x2398;
## Marca de Check  -  &#x2713;
## Check Enfático  -  &#x2714;
