<?php
#####################################################################################################################################################
# Programa.: medicos (med.php)
# Objetivo.: Funcionalidade "Abertura" do Sistema de Gerenciamento de Dados na tabela medicos.
# Descrição: Inclui a execução dos arquivos externos ("toolsbag.php"), identifica valor de variável
#            de controle de saltos entre aplicativos ($salto). Executa funções externas e exibe mensagem de orientação do uso do sistema.
# Autor....: JMH
# Criação..: 2021-10-25
# Revisão..: 2021-10-25 - Primeira escrita e montagem da estrutura geral. Escrevi o texto inicial com a orientação dos botões de navegação.
#            2021-11-08 - Revisão do PA para uso da variável de controle de Saltos entre os PA e montagem da navegabilidade 'dentro' do sistema.
#####################################################################################################################################################
require_once("./toolsbag.php");
# iniciando a variável que 'conta a quantidade de cliques' na navegação do sistema.
$salto=(ISSET($_REQUEST['salto'])) ? $_REQUEST['salto']:1;
# iniciando a página
iniciapagina(TRUE,"Méd","Abertura");
# aqui vamos construir o menu do sistema
montamenu('Médicos','med','Abertura',$salto);
printf("Este sistema faz o Gerenciamento de dados da Tabela medicos.<br>\n");
printf("O menu apresentado acima indica as funcionalidades do sistema.<br><br>\n");
printf("Em cada tela do sistema são apresentados acessos para:<br>\n");
printf("<ul>\n");
printf(" <li><u>Ação</u> de completar a funcionalidade escolhida.</li>\n");
printf(" <li><u>Limpar</u> os campos do Formulário (se preciso);</li>\n");
printf(" <li><u>Voltar</u> uma tela na navegação das funcionalidades;</li>\n");
printf(" <li><u>Abertura</u> (Esta página);</li>\n");
printf(" <li><u>Sair</u> do Sistema;</li>\n");
printf("</ul><br>\n");
printf(" <button onclick='history.go(-$salto)'>Sair</button>\n");
terminapagina('Médicos',"Abertura",'med.php');
?>
