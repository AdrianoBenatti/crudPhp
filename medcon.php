<?php
#####################################################################################################################################################
# Programa.: medicosconsultar (medcon.php)
# Objetivo.: Funcionalidade "Abertura" do Sistema de Gerenciamento de Dados na tabela medicos.
# Descrição: Inclui a execução dos arquivos externos ("toolsbag.php"), identifica valor de variável
#            de controle de saltos entre aplicativos ($salto). Executa funções externas e exibe mensagem de orientação do uso do sistema.
# Autor....: JMH
# Criação..: 2021-10-25
# Revisão..: 2021-10-25 - Primeira escrita e montagem da estrutura geral.
#            2021-11-08 - Revisão do PA para uso da variável de controle de Saltos entre os PA e montagem da navegabilidade 'dentro' do sistema.
#####################################################################################################################################################
require_once("./toolsbag.php");
require_once("./medfun.php");
# determinando o valor da variável que permite escolha do bloco lógico a executar:- montagem da picklist ou de exibição dos dados do registro esoolhido.
$bloco=( !ISSET($_REQUEST['bloco']) ) ? 1 : $_REQUEST['bloco'];
$salto=$_REQUEST['salto']+1;
iniciapagina(TRUE,'Med','Consultar');
# aqui vamos construir o menu do sistema
montamenu('Médicos','med','Consultar',$salto);
# divisor principal do programa.
switch (TRUE)
{
  case ( $bloco==1 ):
  { # Montar o form com a picklist que permite escolher o medico para consultar registro.
    picklist("Consultar",$salto);    
    break;
  }
  case ( $bloco==2 ):
  { # Capturar o valor do código do médico, pesquisar na tabela médicos e montar tabela Campo|Valor exibindo os dados.
    mostraregistro("$_REQUEST[cpmedico]");
    /*printf("<button type='button' onclick='history.go(-1);'>Voltar</button>\n");
    printf("<button type='button' onclick='history.go(-$menu);'>Abertura</button>\n");
    printf("<button type='button' onclick='history.go(-$salto);'>Sair</button>\n");*/
    barrabotoes("",FALSE,TRUE,$salto);
    break;
  }
}

terminapagina('Médicos',"Consultar",'medcon.php');
?>