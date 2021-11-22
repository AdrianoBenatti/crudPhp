-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.19-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Copiando estrutura para tabela ilp54020212t.areaestcursos
DROP TABLE IF EXISTS `areaestcursos`;
CREATE TABLE IF NOT EXISTS `areaestcursos` (
  `cpareaestudocurso` int(5) NOT NULL,
  `cecurso` int(5) NOT NULL,
  `ceareaestudo` int(3) NOT NULL,
  `dtcadareaestudocurso` date NOT NULL,
  PRIMARY KEY (`cpareaestudocurso`),
  KEY `icursos` (`cecurso`) USING BTREE,
  KEY `iareaestudos` (`ceareaestudo`) USING BTREE,
  CONSTRAINT `areaestudocursosce1` FOREIGN KEY (`ceareaestudo`) REFERENCES `areaestudos` (`cpareaestudo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `areaestudocursosce2` FOREIGN KEY (`cecurso`) REFERENCES `cursos` (`cpcurso`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Cadastro das áreas de estudos de cursos oferecidos em uma escola.';

-- Copiando dados para a tabela ilp54020212t.areaestcursos: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `areaestcursos` DISABLE KEYS */;
INSERT INTO `areaestcursos` (`cpareaestudocurso`, `cecurso`, `ceareaestudo`, `dtcadareaestudocurso`) VALUES
	(1, 1, 1, '2015-04-22'),
	(2, 1, 3, '2015-04-22'),
	(3, 2, 1, '2015-04-22'),
	(4, 2, 2, '2015-04-22'),
	(5, 2, 3, '2015-04-22'),
	(6, 6, 1, '2015-04-22'),
	(7, 6, 2, '2015-04-22'),
	(8, 6, 6, '2015-04-22'),
	(9, 6, 6, '2018-12-03');
/*!40000 ALTER TABLE `areaestcursos` ENABLE KEYS */;

-- Copiando estrutura para tabela ilp54020212t.areaestdisciplinas
DROP TABLE IF EXISTS `areaestdisciplinas`;
CREATE TABLE IF NOT EXISTS `areaestdisciplinas` (
  `cpareaestudodisciplina` int(4) NOT NULL,
  `cedisciplina` int(4) NOT NULL,
  `ceareaestudo` int(3) NOT NULL,
  `dtcadareaestudodisc` date NOT NULL,
  PRIMARY KEY (`cpareaestudodisciplina`),
  KEY `idisciplinas` (`cedisciplina`) USING BTREE,
  KEY `iareaestudos` (`ceareaestudo`) USING BTREE,
  CONSTRAINT `areaestudodisciplinasce1` FOREIGN KEY (`ceareaestudo`) REFERENCES `areaestudos` (`cpareaestudo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `areaestudodisciplinasce2` FOREIGN KEY (`cedisciplina`) REFERENCES `disciplinas` (`cpdisciplina`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Cadastro das áreas de estudos de disciplinas.';

-- Copiando dados para a tabela ilp54020212t.areaestdisciplinas: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `areaestdisciplinas` DISABLE KEYS */;
INSERT INTO `areaestdisciplinas` (`cpareaestudodisciplina`, `cedisciplina`, `ceareaestudo`, `dtcadareaestudodisc`) VALUES
	(1, 1, 1, '2015-04-22'),
	(2, 2, 5, '2015-04-22'),
	(3, 3, 1, '2018-12-14');
/*!40000 ALTER TABLE `areaestdisciplinas` ENABLE KEYS */;

-- Copiando estrutura para tabela ilp54020212t.areaestlivros
DROP TABLE IF EXISTS `areaestlivros`;
CREATE TABLE IF NOT EXISTS `areaestlivros` (
  `cpareaestudolivro` int(6) NOT NULL,
  `celivro` int(9) NOT NULL,
  `ceareaestudo` int(3) NOT NULL,
  `nugrauinfluencia` int(3) NOT NULL,
  `dtcadareaestudolivro` date NOT NULL,
  PRIMARY KEY (`cpareaestudolivro`),
  KEY `iareaestudos` (`ceareaestudo`) USING BTREE,
  KEY `ilivros` (`celivro`) USING BTREE,
  CONSTRAINT `areaestudolivrosce1` FOREIGN KEY (`ceareaestudo`) REFERENCES `areaestudos` (`cpareaestudo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `areaestudolivrosce2` FOREIGN KEY (`celivro`) REFERENCES `livros` (`cplivro`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Cadastro das áreas de estudos de livros.';

-- Copiando dados para a tabela ilp54020212t.areaestlivros: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `areaestlivros` DISABLE KEYS */;
INSERT INTO `areaestlivros` (`cpareaestudolivro`, `celivro`, `ceareaestudo`, `nugrauinfluencia`, `dtcadareaestudolivro`) VALUES
	(1, 5, 5, 1, '2017-10-20'),
	(2, 8, 2, 5, '2017-10-20'),
	(3, 1, 6, 5, '2018-12-03'),
	(4, 2, 5, 4, '2020-07-02'),
	(6, 6, 5, 2, '2020-07-02'),
	(7, 6, 4, 5, '2020-07-02'),
	(8, 9, 1, 2, '2020-07-02'),
	(9, 12, 2, 3, '2020-07-08'),
	(10, 3, 6, 5, '2020-07-04');
/*!40000 ALTER TABLE `areaestlivros` ENABLE KEYS */;

-- Copiando estrutura para tabela ilp54020212t.areaestudos
DROP TABLE IF EXISTS `areaestudos`;
CREATE TABLE IF NOT EXISTS `areaestudos` (
  `cpareaestudo` int(3) NOT NULL,
  `txnomearea` varchar(250) COLLATE utf8_bin NOT NULL,
  `txdescricaoarea` text COLLATE utf8_bin NOT NULL,
  `dtcadareaestudo` date NOT NULL,
  PRIMARY KEY (`cpareaestudo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Cadastro das áreas de estudos de interesse nas disciplinas de uma escola.';

-- Copiando dados para a tabela ilp54020212t.areaestudos: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `areaestudos` DISABLE KEYS */;
INSERT INTO `areaestudos` (`cpareaestudo`, `txnomearea`, `txdescricaoarea`, `dtcadareaestudo`) VALUES
	(1, 'Exatas - Física', 'Todo os cursos de Física ou Correlatos', '2015-04-19'),
	(2, 'Exatas - Química', 'Todos os cursos relacionados com Química (orgânica e inorgânica)', '2015-04-19'),
	(3, 'Exatas - Matemática', 'Todos os cursos de Matemática (Pura e Aplicada)', '2015-04-19'),
	(4, 'Humanas - Sociais', 'Engloba cursos de Hist', '2015-04-19'),
	(5, 'Humanas - Letras', 'Engloba os cursos de tratam os relacionamentos humanos', '2015-04-19'),
	(6, 'Biomédicas - Medicinas', 'Todos os cursos de Medicina do Ser Humano', '2015-04-19'),
	(7, 'Biomédicas - Biologias', 'Todos os cursos de micro vida próxima aos seres humanos (Agronomia)', '2015-04-19'),
	(8, 'Biomédicas - Ecologias', 'Todos os cursos de Relacionamentos com a Terra (Oceanografia, Veterinária, etc)', '2015-04-19');
/*!40000 ALTER TABLE `areaestudos` ENABLE KEYS */;

-- Copiando estrutura para tabela ilp54020212t.atribuicoes
DROP TABLE IF EXISTS `atribuicoes`;
CREATE TABLE IF NOT EXISTS `atribuicoes` (
  `cpatribuicao` int(5) NOT NULL,
  `ceprofessor` int(3) NOT NULL,
  `cedisciplina` int(4) NOT NULL,
  `qthorasatribuidas` int(5) NOT NULL,
  `dtatribuicao` date NOT NULL,
  `dtcadatribuicao` date NOT NULL,
  PRIMARY KEY (`cpatribuicao`),
  KEY `iprofessores` (`ceprofessor`) USING BTREE,
  KEY `idisciplinas` (`cedisciplina`) USING BTREE,
  CONSTRAINT `atribuicoesce1` FOREIGN KEY (`cedisciplina`) REFERENCES `disciplinas` (`cpdisciplina`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `atribuicoesce2` FOREIGN KEY (`ceprofessor`) REFERENCES `professores` (`cpprofessor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Cadastro das disciplinas atribuídas aos professores de uma escola.';

-- Copiando dados para a tabela ilp54020212t.atribuicoes: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `atribuicoes` DISABLE KEYS */;
INSERT INTO `atribuicoes` (`cpatribuicao`, `ceprofessor`, `cedisciplina`, `qthorasatribuidas`, `dtatribuicao`, `dtcadatribuicao`) VALUES
	(1, 1, 1, 180, '2010-01-15', '2017-10-20'),
	(2, 6, 2, 180, '2010-01-15', '2018-12-13'),
	(3, 12, 2, 120, '2018-12-13', '2018-12-13'),
	(5, 12, 3, 120, '2018-12-13', '2018-12-13'),
	(6, 6, 3, 120, '2018-12-03', '2018-12-13'),
	(7, 6, 1, 120, '2018-12-03', '2018-12-13'),
	(8, 6, 2, 100, '2018-12-04', '2018-12-13'),
	(9, 6, 2, 100, '2018-12-05', '2018-12-13');
/*!40000 ALTER TABLE `atribuicoes` ENABLE KEYS */;

-- Copiando estrutura para tabela ilp54020212t.autores
DROP TABLE IF EXISTS `autores`;
CREATE TABLE IF NOT EXISTS `autores` (
  `cpautor` int(6) NOT NULL,
  `txnomeautor` char(90) COLLATE utf8_bin NOT NULL,
  `celogradouro` bigint(20) unsigned DEFAULT NULL,
  `txcomplemento` varchar(35) COLLATE utf8_bin NOT NULL,
  `txbairro` varchar(40) COLLATE utf8_bin NOT NULL,
  `nucep` char(8) COLLATE utf8_bin NOT NULL,
  `nutelefone` char(11) COLLATE utf8_bin NOT NULL,
  `dtcadautor` date NOT NULL,
  PRIMARY KEY (`cpautor`) USING BTREE,
  KEY `icelogradouro` (`celogradouro`) USING BTREE,
  CONSTRAINT `autoresce1` FOREIGN KEY (`celogradouro`) REFERENCES `logradouros` (`cplogradouro`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Cadastro dos autores.';

-- Copiando dados para a tabela ilp54020212t.autores: ~30 rows (aproximadamente)
/*!40000 ALTER TABLE `autores` DISABLE KEYS */;
INSERT INTO `autores` (`cpautor`, `txnomeautor`, `celogradouro`, `txcomplemento`, `txbairro`, `nucep`, `nutelefone`, `dtcadautor`) VALUES
	(2, 'Arthur Conan Doyle', 13, '1451', 'Centro', '4155421', '14545154125', '2020-06-08'),
	(3, 'Carlos Drumond de Andrade', 3, '867', 'Vila California', '14512451', '14967867567', '2010-10-10'),
	(4, 'Edgard Allan Paul', 4, '3435', 'Jardim Matilde', '04512475', '11981075672', '2015-04-21'),
	(5, 'Gracialiano Ramos', 13, '23434', 'Bela Vista', '42145121', '2323', '2020-06-02'),
	(6, 'Ignácio de Loyola Brandão', 1, '345 - Ap. 48', 'Sta Cruz', '04512451', '1184512753', '2015-04-21'),
	(8, 'Clarice Lispector', 15, '233', 'Luz', '11232323', '11343423456', '2020-06-09'),
	(9, 'Mario de Andrade', 11, '3456', 'Lapa', '56345634', '43456546435', '2020-06-04'),
	(10, 'Monteiro Lobato', 8, '3456', 'Vila California', '56345634', '43456546435', '2020-06-04'),
	(11, 'Jorge Amado', 12, '234', 'Jardim de Alah', '42145121', '31974847584', '2020-06-02'),
	(12, 'José de Alencar', 22, '234', 'Bela Vista', '42145121', '11974587458', '2020-06-05'),
	(13, 'Cecília Meireles', 5, '234', 'Sumaré', '42145121', '11854574542', '2020-06-05'),
	(14, 'Érico Veríssimo', 4, '23454', 'Centro - Diadema', '42145121', '42152152142', '2020-06-05'),
	(15, 'Manuel Bandeira', 4, '23454', 'Centro - Diadema', '42145121', '42152152142', '2020-06-05'),
	(16, 'Raquel de Queiroz', 23, '23454', 'Jardins', '11451425', '11452415242', '2020-06-05'),
	(17, 'João Cabral de Melo Neto', 3, '23454', 'Santa Cecílica', '11451425', '11452415242', '2020-06-05'),
	(18, 'Oswald de Andrade', 16, '23454', 'São Vicente', '11451425', '11452415242', '2020-05-31'),
	(19, 'Mario Quintana', 15, '23454', 'São Vicente', '11451425', '11452415242', '2020-05-31'),
	(20, 'Guimarães Rosa', 22, '23454', 'São Vicente', '11451425', '11452415242', '2020-05-31'),
	(21, 'Lima Barreto', 26, '23454', 'Guararema', '11451425', '11452415242', '2020-04-27'),
	(22, 'Ferreira Gullar', 8, '23454', 'Vila clementino', '11451425', '11452415242', '2020-03-02'),
	(23, 'Luisa Geisler', 7, '23454', 'Higienópolis', '11451425', '11452415242', '2020-03-02'),
	(24, 'Daniel Galera', 13, '23454', 'Higienópolis', '11451425', '11452415242', '2020-03-02'),
	(25, 'Raphael Montes', 13, '23454', 'Higienópolis', '11451425', '11452415242', '2020-03-02'),
	(26, 'Veronica Stigger', 11, '23454', 'Centro', '11451425', '11452415242', '2020-03-02'),
	(28, 'Oswald de Andrade', 17, '324', 'Centro', '11451425', '11748574784', '2020-07-01'),
	(29, 'Guimarães Rosa', 13, '123', 'Centro', '1123123', '1147488545', '2020-04-07'),
	(30, 'Oswald de Andrade', 1, '234', 'V. Matilde', '14414211', '11457454', '2020-07-01'),
	(31, 'John Ronald Reuel Tolkien', 1, '123', 'V. Matilde', '11145151', '114545454', '2020-07-02'),
	(32, 'Euclides da Cunha', 20, '123', 'Centro', '11145151', '114545454', '2020-07-02'),
	(33, 'Eduardo Mello', 20, '745697', 'Vila Clementino', '1145124', '1174857485', '2020-07-02');
/*!40000 ALTER TABLE `autores` ENABLE KEYS */;

-- Copiando estrutura para tabela ilp54020212t.autorias
DROP TABLE IF EXISTS `autorias`;
CREATE TABLE IF NOT EXISTS `autorias` (
  `cpautoria` int(9) NOT NULL,
  `celivro` int(9) NOT NULL,
  `ceautor` int(6) NOT NULL,
  `dtcadastro` date NOT NULL,
  PRIMARY KEY (`cpautoria`),
  KEY `ilivros` (`celivro`) USING BTREE,
  KEY `iautores` (`ceautor`) USING BTREE,
  CONSTRAINT `autoriasce1` FOREIGN KEY (`ceautor`) REFERENCES `autores` (`cpautor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `autoriasce2` FOREIGN KEY (`celivro`) REFERENCES `livros` (`cplivro`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Cadastro das autorias de livros (livros e seus autores).';

-- Copiando dados para a tabela ilp54020212t.autorias: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `autorias` DISABLE KEYS */;
INSERT INTO `autorias` (`cpautoria`, `celivro`, `ceautor`, `dtcadastro`) VALUES
	(3, 2, 3, '2015-04-21'),
	(4, 3, 4, '2015-04-21'),
	(6, 4, 6, '2015-04-21'),
	(7, 5, 3, '2015-04-21'),
	(8, 5, 4, '2015-04-21'),
	(11, 6, 6, '2018-12-03');
/*!40000 ALTER TABLE `autorias` ENABLE KEYS */;

-- Copiando estrutura para tabela ilp54020212t.bibliografias
DROP TABLE IF EXISTS `bibliografias`;
CREATE TABLE IF NOT EXISTS `bibliografias` (
  `cpbibliografia` int(6) NOT NULL,
  `cedisciplina` int(4) NOT NULL,
  `celivro` int(9) NOT NULL,
  `aotipo` char(1) COLLATE utf8_bin NOT NULL,
  `dtadocaodolivro` date NOT NULL,
  `dtcadbibliografia` date NOT NULL,
  PRIMARY KEY (`cpbibliografia`),
  KEY `idisciplinas` (`cedisciplina`) USING BTREE,
  KEY `ilivros` (`celivro`) USING BTREE,
  CONSTRAINT `bibliografiasce1` FOREIGN KEY (`cedisciplina`) REFERENCES `disciplinas` (`cpdisciplina`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bibliografiasce2` FOREIGN KEY (`celivro`) REFERENCES `livros` (`cplivro`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Cadastro das bibliografias das disciplinas dos cursos de uma escola.';

-- Copiando dados para a tabela ilp54020212t.bibliografias: ~19 rows (aproximadamente)
/*!40000 ALTER TABLE `bibliografias` DISABLE KEYS */;
INSERT INTO `bibliografias` (`cpbibliografia`, `cedisciplina`, `celivro`, `aotipo`, `dtadocaodolivro`, `dtcadbibliografia`) VALUES
	(1, 1, 1, 'B', '2017-10-22', '2017-10-22'),
	(2, 2, 1, 'C', '2017-10-22', '2017-10-22'),
	(3, 3, 1, 'B', '2017-10-22', '2017-10-22'),
	(4, 1, 6, 'C', '2017-10-22', '2017-10-22'),
	(5, 2, 6, 'B', '2017-10-22', '2017-10-22'),
	(6, 3, 6, 'B', '2017-10-22', '2017-10-22'),
	(7, 1, 2, 'C', '2017-10-22', '2017-10-22'),
	(8, 2, 2, 'B', '2017-10-22', '2017-10-22'),
	(9, 3, 2, 'C', '2017-10-22', '2017-10-22'),
	(10, 1, 3, 'C', '2017-10-22', '2017-10-22'),
	(11, 2, 3, 'C', '2017-10-22', '2017-10-22'),
	(12, 3, 3, 'B', '2017-10-22', '2017-10-22'),
	(13, 1, 4, 'B', '2017-10-22', '2017-10-22'),
	(14, 2, 4, 'C', '2017-10-22', '2017-10-22'),
	(15, 3, 4, 'B', '2017-10-22', '2017-10-22'),
	(16, 1, 5, 'B', '2017-10-22', '2017-10-22'),
	(17, 2, 5, 'B', '2017-10-22', '2017-10-22'),
	(18, 3, 5, 'C', '2017-10-22', '2017-10-22'),
	(19, 1, 8, 'D', '2020-10-05', '2020-10-05');
/*!40000 ALTER TABLE `bibliografias` ENABLE KEYS */;

-- Copiando estrutura para tabela ilp54020212t.cargos
DROP TABLE IF EXISTS `cargos`;
CREATE TABLE IF NOT EXISTS `cargos` (
  `cpcargo` smallint(5) unsigned NOT NULL COMMENT 'CP da Tabela',
  `txnomecargo` varchar(60) COLLATE utf8_bin NOT NULL COMMENT 'Nome completo do cargo sem abreviações',
  `dtcadcargo` date NOT NULL COMMENT 'Data de geração do registro',
  PRIMARY KEY (`cpcargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Cadastro dos cargos ocupados por funcionários.';

-- Copiando dados para a tabela ilp54020212t.cargos: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `cargos` DISABLE KEYS */;
INSERT INTO `cargos` (`cpcargo`, `txnomecargo`, `dtcadcargo`) VALUES
	(1, 'Presidente', '2018-02-01'),
	(2, 'Diretor', '2018-02-01'),
	(3, 'Gerente', '2018-02-01'),
	(4, 'Chefe de equipe', '2018-02-01'),
	(5, 'Analista de sistema senior', '2018-02-01'),
	(6, 'Analista de sistema pleno', '2018-02-01'),
	(7, 'Analista de Sistema Junior (ASJ)', '2018-02-01'),
	(8, 'Programador senior', '2018-02-01'),
	(9, 'Programador pleno', '2018-02-01'),
	(10, 'Programador trainee', '2018-02-01');
/*!40000 ALTER TABLE `cargos` ENABLE KEYS */;

-- Copiando estrutura para tabela ilp54020212t.cidades
DROP TABLE IF EXISTS `cidades`;
CREATE TABLE IF NOT EXISTS `cidades` (
  `cpcidade` smallint(5) unsigned NOT NULL,
  `txnome` varchar(250) COLLATE utf8_bin NOT NULL,
  `cesiglaestado` char(2) COLLATE utf8_bin DEFAULT NULL,
  `txformaacesso` text COLLATE utf8_bin NOT NULL,
  `qtpopulacao` float NOT NULL,
  `dtfundacao` date DEFAULT NULL,
  `qtarea` float(6,0) NOT NULL,
  `dtcadastro` date NOT NULL,
  PRIMARY KEY (`cpcidade`) USING BTREE,
  KEY `cidadesce1` (`cesiglaestado`),
  CONSTRAINT `cidadesce1` FOREIGN KEY (`cesiglaestado`) REFERENCES `estadosdauniao` (`cpestadouniao`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Cadastro das Cidades de estados da união.';

-- Copiando dados para a tabela ilp54020212t.cidades: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `cidades` DISABLE KEYS */;
INSERT INTO `cidades` (`cpcidade`, `txnome`, `cesiglaestado`, `txformaacesso`, `qtpopulacao`, `dtfundacao`, `qtarea`, `dtcadastro`) VALUES
	(1, 'São Paulo', 'SP', 'Rodovias: Castelo Branco, Anhanguera, Anchieta, Raposo Tavares, R', 15000000, '0000-00-00', 450000, '2014-10-10'),
	(2, 'Osasco', 'SP', 'Rodovias: Castelo Branco, Anhanguera, Anchieta, Raposo Tavares, R', 2000000, '0000-00-00', 100000, '2014-10-10'),
	(3, 'Barueri', NULL, 'Rodovia Raposo Tavares, Trem urbano da CBTU, Rodovia Castelo Branco', 850000, '0000-00-00', 250, '2015-04-19'),
	(4, 'Carapicuíba', NULL, 'Rodovia Raposo Tavares, Trem urbano da CBTU, Rodovia Castelo Branco', 950000, '0000-00-00', 450, '2015-04-19'),
	(5, 'Guarulhos', 'SP', 'Rodovia Dutra, rodovia Regis Bitencourt, Trem urbano da CBTU', 950000, '0000-00-00', 450, '2015-04-19'),
	(6, 'Mogi das Cruzes', NULL, 'Rodovia Airton Senna, Rodovia dos Trabalhadores, trem urbano CBTU.', 950000, '0000-00-00', 650, '2015-04-19');
/*!40000 ALTER TABLE `cidades` ENABLE KEYS */;

-- Copiando estrutura para tabela ilp54020212t.clientes
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `cpcliente` int(6) NOT NULL,
  `txnomecliente` varchar(250) COLLATE utf8_bin NOT NULL,
  `txrazaosocial` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `aoativo` char(1) COLLATE utf8_bin DEFAULT NULL,
  `celogradouro` bigint(20) unsigned DEFAULT NULL,
  `txcomplemento` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `nutelefone` char(11) COLLATE utf8_bin DEFAULT NULL,
  `txnomecontato` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `nucep` char(8) COLLATE utf8_bin DEFAULT NULL,
  `vllimitecompra` double(15,2) NOT NULL,
  `dtcadcliente` date NOT NULL,
  PRIMARY KEY (`cpcliente`),
  KEY `icelogradouro` (`celogradouro`) USING BTREE,
  CONSTRAINT `clientesce1` FOREIGN KEY (`celogradouro`) REFERENCES `logradouros` (`cplogradouro`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Cadastro dos Clientes.';

-- Copiando dados para a tabela ilp54020212t.clientes: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` (`cpcliente`, `txnomecliente`, `txrazaosocial`, `aoativo`, `celogradouro`, `txcomplemento`, `nutelefone`, `txnomecontato`, `nucep`, `vllimitecompra`, `dtcadcliente`) VALUES
	(2, 'nome', NULL, 'A', 7, 'conj 34', '1334343555', 'jose', '14521452', 15000.00, '2018-02-25'),
	(5, 'Marmitex bom de prato', 'Restaurante Bom de Prato e serviço de Marmitex S/C Ltda.', 'A', 8, ' 150', NULL, NULL, '', 1000.00, '2011-10-24'),
	(10, 'Tratoria do Sargento', 'Ristoranti Il Tratoria do Sargento', 'A', 9, ' 985', NULL, NULL, '', 25000.00, '2007-02-02'),
	(15, 'Restaurante Bom Vivan', 'Restaurante "O Bom Vivan" S/C Ltda.', 'A', 10, ' 567', NULL, NULL, '12345678', 5000.00, '2009-12-10'),
	(20, 'Tratoria do Sargento', 'Restaurante da Tratoria do Sargento S/C Ltda.', 'A', 11, ' 1254', NULL, NULL, '', 12000.00, '2011-06-01'),
	(25, 'Tratoria do Pirata', 'Ristoranti tre fratelli S.A.', 'A', 12, ' 1492', NULL, NULL, '12345678', 30000.00, '2007-01-20'),
	(30, 'Mc Donalds', 'Rest Com S/A ', 'A', 13, ' 6500', NULL, NULL, '', 100000.00, '2008-01-20'),
	(35, 'La Traviatta Ripante', 'Rest Com S/A ', 'A', 14, ' 125 - 15And Ap 156', NULL, NULL, '', 100000.00, '2008-01-20'),
	(40, 'Bistro Ratatui', 'sdf sdgf', 'A', 15, ' 1245', NULL, NULL, '', 3456.00, '2011-10-22'),
	(45, 'AgoraSim', 'Fabrica de Roupas Infanto-Juvenis AgoraSim S/C Ltda.', 'A', 16, '452', NULL, NULL, '1421541', 1000.00, '2014-04-12'),
	(50, 'Trocando em miúdos', 'Teste S/C Ltda.', 'A', 17, '335', '', 'Temistocles', '1452412', 15000.00, '2015-05-22'),
	(55, 'um teste de inclusão de registros', 'Teste S/C Ltda.', 'A', 18, '335', NULL, NULL, '1452412', 15000.00, '2015-05-22');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;

-- Copiando estrutura para tabela ilp54020212t.consultas
DROP TABLE IF EXISTS `consultas`;
CREATE TABLE IF NOT EXISTS `consultas` (
  `cpconsulta` int(6) NOT NULL,
  `cemedico` int(6) NOT NULL,
  `dthoraconsulta` datetime NOT NULL,
  `cefuncionario` int(6) unsigned DEFAULT NULL,
  `dthorarealizada` datetime NOT NULL,
  `ceplanodesaude` int(4) DEFAULT NULL,
  `aosituacaoconsulta` char(1) COLLATE utf8_bin NOT NULL,
  `dtcadconsulta` date NOT NULL,
  PRIMARY KEY (`cpconsulta`),
  KEY `imedicos` (`cemedico`) USING BTREE,
  KEY `ifuncionarios` (`cefuncionario`) USING BTREE,
  KEY `iplanosdesaude` (`ceplanodesaude`),
  CONSTRAINT `consultasce1` FOREIGN KEY (`cemedico`) REFERENCES `medicos` (`cpmedico`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `consultasce2` FOREIGN KEY (`ceplanodesaude`) REFERENCES `planosdesaude` (`cpplanodesaude`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `consultasce3` FOREIGN KEY (`cefuncionario`) REFERENCES `funcionarios` (`cpfuncionario`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Cadastro das Consultas Médicas disponibilizadas para os funcionários.';

-- Copiando dados para a tabela ilp54020212t.consultas: ~53 rows (aproximadamente)
/*!40000 ALTER TABLE `consultas` DISABLE KEYS */;
INSERT INTO `consultas` (`cpconsulta`, `cemedico`, `dthoraconsulta`, `cefuncionario`, `dthorarealizada`, `ceplanodesaude`, `aosituacaoconsulta`, `dtcadconsulta`) VALUES
	(1, 1, '2017-05-22 07:00:00', 150, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(2, 1, '2017-05-22 07:20:00', 200, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(3, 1, '2017-05-22 07:40:00', 510, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(4, 1, '2017-05-22 08:00:00', 10, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(5, 1, '2017-05-22 08:20:00', 330, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(6, 1, '2017-05-22 08:40:00', 390, '0000-00-00 00:00:00', NULL, '', '2017-04-22'),
	(7, 1, '2017-05-22 09:00:00', NULL, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(8, 1, '2017-05-22 09:20:00', NULL, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(9, 1, '2017-05-22 09:40:00', NULL, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(10, 1, '2017-05-22 10:00:00', NULL, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(11, 1, '2017-05-22 10:20:00', NULL, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(12, 1, '2017-05-22 10:40:00', NULL, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(13, 1, '2017-05-22 12:00:00', NULL, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(14, 1, '2017-05-22 12:20:00', NULL, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(15, 1, '2017-05-22 12:40:00', NULL, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(16, 1, '2017-05-22 13:00:00', NULL, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(17, 1, '2017-05-22 13:20:00', NULL, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(18, 1, '2017-05-22 13:40:00', NULL, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(19, 2, '2017-05-22 07:00:00', 280, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(20, 2, '2017-05-22 07:20:00', 460, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(21, 2, '2017-05-22 08:40:00', 230, '0000-00-00 00:00:00', NULL, '', '2017-04-22'),
	(22, 2, '2017-05-22 08:00:00', 230, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(23, 2, '2017-05-22 08:20:00', 340, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(24, 2, '2017-05-22 08:40:00', 410, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(25, 2, '2017-05-22 09:00:00', 290, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(26, 2, '2017-05-22 09:20:00', NULL, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(27, 2, '2017-05-22 09:40:00', NULL, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(28, 2, '2017-05-22 10:00:00', NULL, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(29, 2, '2017-05-22 10:20:00', NULL, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(30, 2, '2017-05-22 10:40:00', NULL, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(31, 2, '2017-05-22 12:00:00', NULL, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(32, 2, '2017-05-22 12:20:00', NULL, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(33, 2, '2017-05-22 12:40:00', NULL, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(34, 2, '2017-05-22 13:00:00', NULL, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(35, 2, '2017-05-22 13:20:00', NULL, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(36, 2, '2017-05-22 13:40:00', NULL, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(37, 3, '2017-05-22 07:00:00', 320, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(38, 3, '2017-05-22 07:20:00', NULL, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(40, 3, '2017-05-22 08:00:00', 450, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(41, 3, '2017-05-22 08:20:00', 40, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(42, 3, '2017-05-22 08:40:00', 470, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(43, 3, '2017-05-22 09:00:00', 180, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(44, 3, '2017-05-22 09:20:00', 20, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(45, 3, '2017-05-22 09:40:00', 300, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(46, 3, '2017-05-22 10:00:00', 380, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(47, 3, '2017-05-22 10:20:00', NULL, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(48, 3, '2017-05-22 10:40:00', 30, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(49, 3, '2017-05-22 12:00:00', 360, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(50, 3, '2017-05-22 12:20:00', 270, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(51, 3, '2017-05-22 12:40:00', NULL, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(52, 3, '2017-05-22 13:00:00', NULL, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(53, 3, '2017-05-22 13:20:00', NULL, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22'),
	(54, 3, '2017-05-22 13:40:00', NULL, '0000-00-00 00:00:00', NULL, 'A', '2017-04-22');
/*!40000 ALTER TABLE `consultas` ENABLE KEYS */;

-- Copiando estrutura para tabela ilp54020212t.cores
DROP TABLE IF EXISTS `cores`;
CREATE TABLE IF NOT EXISTS `cores` (
  `cpcor` int(10) NOT NULL,
  `txnomecor` varchar(200) COLLATE utf8_bin NOT NULL,
  `nupantone` int(10) NOT NULL,
  `dtcadcor` date NOT NULL,
  PRIMARY KEY (`cpcor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Cadastro das cores.';

-- Copiando dados para a tabela ilp54020212t.cores: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `cores` DISABLE KEYS */;
INSERT INTO `cores` (`cpcor`, `txnomecor`, `nupantone`, `dtcadcor`) VALUES
	(1, 'Branco', 1, '2017-10-21'),
	(2, 'Preto', 2, '2017-10-21'),
	(3, 'Cinza Prata', 234, '2017-10-21'),
	(4, 'Cinza Chumbo', 200, '2017-10-21');
/*!40000 ALTER TABLE `cores` ENABLE KEYS */;

-- Copiando estrutura para tabela ilp54020212t.cursos
DROP TABLE IF EXISTS `cursos`;
CREATE TABLE IF NOT EXISTS `cursos` (
  `cpcurso` int(5) NOT NULL,
  `txnomecurso` varchar(200) COLLATE utf8_bin NOT NULL,
  `ceescola` int(3) DEFAULT NULL,
  `qtcargahoraria` int(3) NOT NULL,
  `dtcadcurso` date NOT NULL,
  PRIMARY KEY (`cpcurso`) USING BTREE,
  KEY `iescolas` (`ceescola`) USING BTREE,
  CONSTRAINT `cursosce1` FOREIGN KEY (`ceescola`) REFERENCES `instituicaodeensino` (`cpinstens`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Cadastro dos cursos de uma escola.';

-- Copiando dados para a tabela ilp54020212t.cursos: ~17 rows (aproximadamente)
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` (`cpcurso`, `txnomecurso`, `ceescola`, `qtcargahoraria`, `dtcadcurso`) VALUES
	(1, 'Arquitetura', 1, 123, '2014-05-15'),
	(2, 'Engenharia Civil', 2, 180, '2014-01-10'),
	(3, 'Engenharia Mecânica', 2, 240, '2014-05-15'),
	(4, 'Engenharia Naval', 1, 123, '2014-05-15'),
	(5, 'Engenharia de Minas', 2, 180, '2014-01-10'),
	(6, 'Engenharia Elétrica', 2, 240, '2014-05-15'),
	(7, 'História', 1, 123, '2014-05-15'),
	(8, 'Geografia', 2, 180, '2014-01-10'),
	(9, 'Letras', 2, 240, '2014-05-15'),
	(10, 'Filosofia', 2, 180, '2014-01-10'),
	(11, 'Sociologia', 2, 180, '2014-01-10'),
	(12, 'Física', 2, 180, '2014-01-10'),
	(13, 'Biologia', 2, 180, '2014-01-10'),
	(14, 'Filosofia', 2, 180, '2014-01-10'),
	(15, 'Administração de Empresas', 2, 180, '2014-01-10'),
	(16, 'Economia', 2, 180, '2014-01-10'),
	(17, 'Comunicação e Artes', 2, 180, '2014-01-10');
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;

-- Copiando estrutura para tabela ilp54020212t.disciplinas
DROP TABLE IF EXISTS `disciplinas`;
CREATE TABLE IF NOT EXISTS `disciplinas` (
  `cpdisciplina` int(4) NOT NULL,
  `txnome` varchar(250) COLLATE utf8_bin NOT NULL,
  `cecurso` int(5) NOT NULL,
  `txementa` varchar(250) COLLATE utf8_bin NOT NULL,
  `qthoras` int(4) NOT NULL,
  `dtcaddisciplina` date NOT NULL,
  PRIMARY KEY (`cpdisciplina`) USING BTREE,
  KEY `icursos` (`cecurso`) USING BTREE,
  CONSTRAINT `disciplinasce1` FOREIGN KEY (`cecurso`) REFERENCES `cursos` (`cpcurso`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Cadastro das Disciplinas dos cursos.';

-- Copiando dados para a tabela ilp54020212t.disciplinas: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `disciplinas` DISABLE KEYS */;
INSERT INTO `disciplinas` (`cpdisciplina`, `txnome`, `cecurso`, `txementa`, `qthoras`, `dtcaddisciplina`) VALUES
	(1, 'Estudo das Cores', 1, 'Análise da formação do conceito de cor. Fatores importantes da cor na indústria.', 400, '2010-10-10'),
	(2, 'Fotografia', 1, 'O surgimento e desenvolvimento da indústria da fotografia. Característica dos equipamentos, a evolução dos dispositivos desde o modo mecânico até o modo digital.', 200, '2010-10-10'),
	(3, 'Antropologia das Culturas ocidentais', 1, 'Como o desenvolvimento social se deu de modo diferenciado nas culturas ocidental e oriental e como a geografia pode ter influenciado nesta evolução.', 120, '2010-10-10');
/*!40000 ALTER TABLE `disciplinas` ENABLE KEYS */;

-- Copiando estrutura para tabela ilp54020212t.editoras
DROP TABLE IF EXISTS `editoras`;
CREATE TABLE IF NOT EXISTS `editoras` (
  `cpeditora` int(5) NOT NULL,
  `txnomeeditora` char(70) COLLATE utf8_bin NOT NULL,
  `txrazaosocial` varchar(250) COLLATE utf8_bin NOT NULL,
  `celogradouro` bigint(20) unsigned DEFAULT NULL,
  `txcomplemento` varchar(50) COLLATE utf8_bin NOT NULL,
  `txbairro` varchar(40) COLLATE utf8_bin NOT NULL,
  `nucep` char(8) COLLATE utf8_bin DEFAULT NULL,
  `nutelefone` char(11) COLLATE utf8_bin DEFAULT NULL,
  `txnomecontato` varchar(50) COLLATE utf8_bin NOT NULL,
  `dtcadeditora` date NOT NULL,
  PRIMARY KEY (`cpeditora`) USING BTREE,
  KEY `icelogradouro` (`celogradouro`) USING BTREE,
  CONSTRAINT `editorasce1` FOREIGN KEY (`celogradouro`) REFERENCES `logradouros` (`cplogradouro`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Cadastro das Editoras de Livros.';

-- Copiando dados para a tabela ilp54020212t.editoras: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `editoras` DISABLE KEYS */;
INSERT INTO `editoras` (`cpeditora`, `txnomeeditora`, `txrazaosocial`, `celogradouro`, `txcomplemento`, `txbairro`, `nucep`, `nutelefone`, `txnomecontato`, `dtcadeditora`) VALUES
	(1, 'Editora Renascer', 'Editora Renascer S/C Ltda.', 7, '355', 'Vila Madalena', '12457896', '1174584521', 'Ana', '2015-10-20'),
	(2, 'Editora Abril', 'Editora Paulista Abril S/C Ltda.', 8, '450 - 4ºAndar', 'Barra Funda', '12457234', '1433265241', 'Juliana', '2015-10-20'),
	(3, 'Editora Nobel', 'Editora Nobel S.A.', 4, '234', 'Barra Funda', '01245124', '1145244526', 'Flávio', '2015-10-20'),
	(4, 'Editora Paulinas', 'Editora Paulista Abril S/C Ltda.', 3, '23 - Cj10', 'Barra Funda', '74512451', '14985632415', 'José', '2015-10-20'),
	(5, 'Editora Erica', 'Editora Paulista Abril S/C Ltda.', 4, '250 - bloco3', 'Barra Funda', '41526385', '11981024152', 'Adailton', '2015-10-20'),
	(6, 'Elseviewer', 'Editora Elseviewer S', 9, '45654', 'Vila da Monções', '11452178', '1174589632', 'teófilo', '2018-12-12');
/*!40000 ALTER TABLE `editoras` ENABLE KEYS */;

-- Copiando estrutura para tabela ilp54020212t.especmedicas
DROP TABLE IF EXISTS `especmedicas`;
CREATE TABLE IF NOT EXISTS `especmedicas` (
  `cpespecialidade` int(4) NOT NULL,
  `txnomeespecialidade` varchar(200) COLLATE utf8_bin NOT NULL,
  `dtcadespecmedica` date NOT NULL,
  PRIMARY KEY (`cpespecialidade`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Cadastro das Especialidades Médicas';

-- Copiando dados para a tabela ilp54020212t.especmedicas: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `especmedicas` DISABLE KEYS */;
INSERT INTO `especmedicas` (`cpespecialidade`, `txnomeespecialidade`, `dtcadespecmedica`) VALUES
	(1, 'Clinica geral', '2014-10-10'),
	(2, 'Pediatria', '2014-10-10'),
	(3, 'Obstetrícia', '2014-10-10'),
	(4, 'Urologia', '2014-10-10'),
	(5, 'Oncologia', '0000-00-00'),
	(6, 'Geriatria', '0000-00-00'),
	(7, 'Endocrinologia', '0000-00-00');
/*!40000 ALTER TABLE `especmedicas` ENABLE KEYS */;

-- Copiando estrutura para tabela ilp54020212t.estadosdauniao
DROP TABLE IF EXISTS `estadosdauniao`;
CREATE TABLE IF NOT EXISTS `estadosdauniao` (
  `cpestadouniao` char(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'cp da Tabela. É a sigla do Estado da União Federativa.',
  `txnome` varchar(250) NOT NULL COMMENT 'Nome usual completo (sem abreviações)',
  `txcapital` varchar(250) DEFAULT NULL COMMENT 'Nome da Capital do Estado',
  `qtareatotal` decimal(15,2) DEFAULT NULL COMMENT 'Área do estado em Km2 com duas casas decimais de precisão',
  `qtpopulacao` decimal(16,0) DEFAULT NULL COMMENT 'Quantidade de pessoas moradoras do estado da união.',
  `dtcadestadouniao` date NOT NULL COMMENT 'Data de geração do registro',
  PRIMARY KEY (`cpestadouniao`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Cadastro dos estados da união Federativa do Brasil';

-- Copiando dados para a tabela ilp54020212t.estadosdauniao: ~27 rows (aproximadamente)
/*!40000 ALTER TABLE `estadosdauniao` DISABLE KEYS */;
INSERT INTO `estadosdauniao` (`cpestadouniao`, `txnome`, `txcapital`, `qtareatotal`, `qtpopulacao`, `dtcadestadouniao`) VALUES
	('AC', 'Acre', 'Rio Branco', 164123.04, 829619, '2018-02-01'),
	('AL', 'Alagoas', 'Maceió', 27778.50, 3375823, '2018-02-01'),
	('AM', 'Amazonas', 'Manaus', 1559159.15, 4063614, '2018-02-01'),
	('AP', 'Amapá', 'Macapá', 142828.52, 797722, '2018-02-01'),
	('BA', 'Bahia', 'Salvador', 564733.18, 15344447, '2018-02-01'),
	('CE', 'Ceará', 'Fortaleza', 148920.47, 9020460, '2018-02-01'),
	('DF', 'Distrito Federal', 'Brasília', 5779.10, 3039444, '2018-02-01'),
	('ES', 'Espírito Santo', 'Vitória', 46095.58, 4016356, '2018-02-01'),
	('GO', 'Goiás', 'Goiânia', 340111.78, 6778772, '2018-02-01'),
	('MA', 'Maranhão', 'São Luís', 331937.45, 7000229, '2018-02-01'),
	('MG', 'Minas Gerais', 'Belo Horizonte', 586522.12, 21119536, '2018-02-01'),
	('MS', 'Mato Grosso do Sul', 'Campo Grande', 357145.53, 2713147, '2018-02-01'),
	('MT', 'Mato Grosso', 'Cuiabá', 903366.19, 3344544, '2018-02-01'),
	('PA', 'Pará', 'Belém', 1247954.67, 8366628, '2018-02-01'),
	('PB', 'Paraíba', 'João Pessoa', 56585.00, 4025558, '2018-02-01'),
	('PE', 'Pernambuco', 'Recife', 98311.62, 9473266, '2018-02-01'),
	('PI', 'Piauí', 'Teresina', 251577.74, 3219257, '2018-02-01'),
	('PR', 'Paraná', 'Curitiba', 199307.92, 11320892, '2018-02-01'),
	('RJ', 'Rio de Janeiro', 'Rio de Janeiro', 43780.17, 16718956, '2018-02-01'),
	('RN', 'Rio Grande do Norte', 'Natal', 52811.05, 3507003, '2018-02-01'),
	('RO', 'Rondônia', 'Porto Velho', 237590.55, 1805788, '2018-02-01'),
	('RR', 'Roraima', 'Boa Vista', 224300.51, 522636, '2018-02-01'),
	('RS', 'Rio Grande do Sul', 'Porto Alegre', 281730.22, 11322895, '2018-02-01'),
	('SC', 'Santa Catarina', 'Florianópolis', 95736.16, 7001161, '2018-02-01'),
	('SE', 'Sergipe', 'Aracaju', 21915.12, 2288116, '2018-02-01'),
	('SP', 'São Paulo', 'São Paulo', 248222.36, 45094866, '2018-02-01'),
	('TO', 'Tocantins', 'Palmas', 277720.52, 1550194, '2018-02-01');
/*!40000 ALTER TABLE `estadosdauniao` ENABLE KEYS */;

-- Copiando estrutura para tabela ilp54020212t.fabricantes
DROP TABLE IF EXISTS `fabricantes`;
CREATE TABLE IF NOT EXISTS `fabricantes` (
  `cpfabricante` int(3) NOT NULL,
  `txnome` varchar(250) COLLATE utf8_bin NOT NULL,
  `txrazaosocial` varchar(250) COLLATE utf8_bin NOT NULL,
  `celogradouro` bigint(20) unsigned DEFAULT NULL,
  `txcomplemento` varchar(50) COLLATE utf8_bin NOT NULL,
  `txbairro` varchar(200) COLLATE utf8_bin NOT NULL,
  `nutelefone` char(11) COLLATE utf8_bin NOT NULL,
  `txnomecontato` varchar(50) COLLATE utf8_bin NOT NULL,
  `nucep` char(8) COLLATE utf8_bin NOT NULL,
  `dtcadfabricante` date NOT NULL,
  PRIMARY KEY (`cpfabricante`) USING BTREE,
  KEY `icelogradouro` (`celogradouro`) USING BTREE,
  CONSTRAINT `fabricantesce1` FOREIGN KEY (`celogradouro`) REFERENCES `logradouros` (`cplogradouro`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Cadastro dos Fabricantes de veículos.';

-- Copiando dados para a tabela ilp54020212t.fabricantes: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `fabricantes` DISABLE KEYS */;
INSERT INTO `fabricantes` (`cpfabricante`, `txnome`, `txrazaosocial`, `celogradouro`, `txcomplemento`, `txbairro`, `nutelefone`, `txnomecontato`, `nucep`, `dtcadfabricante`) VALUES
	(1, 'FAME', 'Fábrica Americana de Materiais Elétricos S.A. ', 21, '345', 'Bresser', '', '', '04521524', '2010-10-01'),
	(2, 'Lorenzetti', 'Fabrica de Chuveiros Lorenzetti S/C Ltda.', 22, '235', 'Centro', '', '', '14514251', '2010-10-10'),
	(3, 'Bosch & Blaupunkt', 'Manufatura de Equipamentos Eletronicos S/C Ltda.', 23, '23235', 'Santo Amaro', '', '', '14514251', '2010-10-10'),
	(4, 'Forim', 'Fabrica de Batentes e Fechaduras Forim S/C Ltda.', 24, '235', 'Jardim São Luis', '', '', '14514251', '2010-10-10'),
	(5, 'Autolins', 'Fabrica de tapetes automotivos S/C Ltda.', 25, '235', 'Distrito Industrial II', '1441524152', '14754859685', '14514251', '2010-10-10'),
	(6, 'Volkswagen', 'Volkswagen do Brasil S.A.', 26, 'Km45', 'Distrito Industrial 3', '', '', '46512452', '2015-04-21'),
	(7, 'CAIO Induscar', 'Companhia Americana Industrial de Ônibus', 21, '435', 'Bresser', '11454251', 'Waldemir', '14515421', '2018-12-12'),
	(8, 'wilson', 'asdASD', 6, '23454', 'Higienópolis', '11984514250', '12341234', '42145121', '2020-06-30');
/*!40000 ALTER TABLE `fabricantes` ENABLE KEYS */;

-- Copiando estrutura para tabela ilp54020212t.feitospor
DROP TABLE IF EXISTS `feitospor`;
CREATE TABLE IF NOT EXISTS `feitospor` (
  `cpfeitospor` smallint(5) unsigned NOT NULL COMMENT 'cp da tabela',
  `ceoficina` smallint(5) unsigned NOT NULL COMMENT 'ce indicando a oficina que executa serviços de manutenção.',
  `ceservico` smallint(5) unsigned DEFAULT NULL COMMENT 'ce indicando o serviço que é feito pelas oficinas.',
  `txdescricaocomplementar` varchar(250) DEFAULT NULL COMMENT 'Descrição complementar do serviço prestado no veículo pela oficina (se preciso).',
  `dtcadfeitospor` date NOT NULL COMMENT 'Data de geração do registro',
  PRIMARY KEY (`cpfeitospor`),
  KEY `iceoficina` (`ceoficina`),
  KEY `iceservico` (`ceservico`),
  CONSTRAINT `feitosporce1` FOREIGN KEY (`ceoficina`) REFERENCES `oficinas` (`cpoficina`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `feitosporce2` FOREIGN KEY (`ceservico`) REFERENCES `servicos` (`cpservico`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Cadastro de serviços prestados pela oficinas nos ve';

-- Copiando dados para a tabela ilp54020212t.feitospor: ~21 rows (aproximadamente)
/*!40000 ALTER TABLE `feitospor` DISABLE KEYS */;
INSERT INTO `feitospor` (`cpfeitospor`, `ceoficina`, `ceservico`, `txdescricaocomplementar`, `dtcadfeitospor`) VALUES
	(1, 10, 1, 'Serviço completo', '2018-10-01'),
	(2, 10, 2, 'Serviço completo', '2018-10-01'),
	(3, 10, 3, 'Serviço completo', '2018-10-01'),
	(4, 10, 4, 'Serviço completo', '2018-10-01'),
	(5, 25, 1, 'Serviço completo', '2018-10-01'),
	(6, 25, 2, 'Serviço completo', '2018-10-01'),
	(7, 25, 3, 'Serviço completo', '2018-10-01'),
	(8, 25, 4, 'Serviço completo', '2018-10-01'),
	(9, 20, 1, 'Serviço completo', '2018-10-01'),
	(10, 20, 2, 'Serviço completo', '2018-10-01'),
	(11, 20, 3, 'Serviço completo', '2018-10-01'),
	(12, 20, 4, 'Serviço completo', '2018-10-01'),
	(13, 5, 1, 'Serviço completo', '2018-10-01'),
	(14, 5, 2, 'Serviço completo', '2018-10-01'),
	(15, 5, 3, 'Serviço completo', '2018-10-01'),
	(16, 5, 4, 'Serviço completo', '2018-10-01'),
	(17, 15, 1, 'Serviço completo', '2018-10-01'),
	(18, 15, 2, 'Serviço completo', '2018-10-01'),
	(19, 15, 3, 'Serviço completo', '2018-10-01'),
	(20, 15, 4, 'Serviço completo', '2018-10-01'),
	(21, 5, 4, 'dfggsdfg dg df sdg sdg sdgf gsdg sdg sd', '2019-02-05');
/*!40000 ALTER TABLE `feitospor` ENABLE KEYS */;

-- Copiando estrutura para tabela ilp54020212t.funcionarios
DROP TABLE IF EXISTS `funcionarios`;
CREATE TABLE IF NOT EXISTS `funcionarios` (
  `cpfuncionario` int(6) unsigned NOT NULL,
  `txnomefunc` varchar(12) COLLATE utf8_bin NOT NULL,
  `txsobrenomefunc` varchar(15) COLLATE utf8_bin NOT NULL,
  `cecargo` smallint(5) unsigned DEFAULT NULL,
  `celogradouro` bigint(20) unsigned DEFAULT NULL,
  `txcomplemento` varchar(50) COLLATE utf8_bin NOT NULL,
  `nutelefone` char(11) COLLATE utf8_bin NOT NULL,
  `dtcontratacao` date NOT NULL,
  `nuramal` char(4) COLLATE utf8_bin NOT NULL,
  `aosexo` char(1) COLLATE utf8_bin NOT NULL,
  `dtnascimento` date NOT NULL,
  `txresenha` text COLLATE utf8_bin NOT NULL,
  `vlsalario` decimal(9,2) NOT NULL,
  `vlbonus` decimal(9,2) NOT NULL,
  `vlcomissao` decimal(9,2) NOT NULL,
  `nucep` char(8) COLLATE utf8_bin NOT NULL,
  `dtcadfuncionario` date NOT NULL,
  PRIMARY KEY (`cpfuncionario`) USING BTREE,
  KEY `icargos` (`cecargo`),
  KEY `ilogradouros` (`celogradouro`) USING BTREE,
  CONSTRAINT `funcionariosce1` FOREIGN KEY (`celogradouro`) REFERENCES `logradouros` (`cplogradouro`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `funcionariosce2` FOREIGN KEY (`cecargo`) REFERENCES `cargos` (`cpcargo`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Cadastro dos funcionários.';

-- Copiando dados para a tabela ilp54020212t.funcionarios: ~52 rows (aproximadamente)
/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
INSERT INTO `funcionarios` (`cpfuncionario`, `txnomefunc`, `txsobrenomefunc`, `cecargo`, `celogradouro`, `txcomplemento`, `nutelefone`, `dtcontratacao`, `nuramal`, `aosexo`, `dtnascimento`, `txresenha`, `vlsalario`, `vlbonus`, `vlcomissao`, `nucep`, `dtcadfuncionario`) VALUES
	(10, 'CHRISTINE I', 'HAAS', 10, 1, '4512', '1174858654', '1995-01-01', '452', 'M', '1963-08-24', ' ', 152750.00, 1000.00, 4220.00, '', '2018-12-12'),
	(20, 'MICHAEL L', 'THOMPSON', 10, 2, '', '', '2003-10-10', '', 'M', '1978-02-02', ' ', 94250.00, 800.00, 3300.00, '', '0000-00-00'),
	(30, 'SALLY A', 'KWAN', 2, 1, '', '', '2005-04-05', '', 'F', '1971-05-11', ' ', 98250.00, 800.00, 3060.00, '', '0000-00-00'),
	(40, 'MAUDE F', 'SETRIGHT', 5, 2, '', '', '1994-09-12', '', 'F', '1961-04-21', ' ', 35900.00, 300.00, 1272.00, '', '0000-00-00'),
	(50, 'JOHN B', 'GEYER', 5, 3, '', '', '1979-08-17', '', 'M', '1955-09-15', ' ', 80175.00, 800.00, 3214.00, '', '0000-00-00'),
	(60, 'IRVING F', 'STERN', 4, 4, '', '', '2003-09-14', '', 'M', '1975-07-07', ' ', 72250.00, 500.00, 2580.00, '', '0000-00-00'),
	(70, 'EVA D', 'PULASKI', 4, 11, '', '', '2005-09-30', '', 'F', '2003-05-26', ' ', 96170.00, 700.00, 2893.00, '', '0000-00-00'),
	(80, 'RAMLAL V', 'MEHTA', 3, 6, '', '', '1995-07-07', '', 'M', '1962-08-11', ' ', 39950.00, 400.00, 1596.00, '', '0000-00-00'),
	(90, 'EILEEN W', 'HENDERSON', 3, 7, '', '', '2000-08-15', '', 'F', '1971-05-15', ' ', 89750.00, 600.00, 2380.00, '', '0000-00-00'),
	(100, 'THEODORE Q', 'SPENSER', 1, 6, '', '', '2000-06-19', '', 'M', '1980-12-18', ' ', 86150.00, 500.00, 2092.00, '', '0000-00-00'),
	(110, 'VINCENZO G', 'LUCCHESSI', 1, 8, '', '', '1988-05-16', '', 'M', '1959-11-05', ' ', 66500.00, 900.00, 3720.00, '', '0000-00-00'),
	(120, 'SEAN ', 'O CONNELL', 7, 9, '', '', '1993-12-05', '', 'M', '1972-10-18', ' ', 49250.00, 600.00, 2340.00, '', '0000-00-00'),
	(130, 'DELORES M', 'QUINTANA', 7, 10, '', '', '2001-07-28', '', 'F', '1955-09-15', ' ', 73800.00, 500.00, 1904.00, '', '0000-00-00'),
	(150, 'BRUCE W', 'ADAMSON', 3, 11, '', '', '2002-02-12', '', 'M', '1977-05-17', 'NULL', 55280.00, 500.00, 2022.00, '12312312', '2010-10-10'),
	(160, 'ELIZABETH R', 'PIANKA', 4, 11, '', '', '2006-10-11', '', 'F', '1980-04-12', ' ', 62250.00, 400.00, 1780.00, '', '0000-00-00'),
	(170, 'MASATOSHI J', 'YOSHIMURA', 2, 12, '', '', '1999-09-15', '', 'M', '1981-01-05', ' ', 44680.00, 500.00, 1974.00, '', '0000-00-00'),
	(180, 'MARILYN S', 'SCOUTTEN', 3, 15, '', '', '2003-07-07', '', 'F', '1979-02-21', ' ', 51340.00, 500.00, 1707.00, '', '0000-00-00'),
	(190, 'JAMES H', 'WALKER', 3, 14, '', '', '2004-07-26', '', 'M', '1982-06-25', ' ', 50450.00, 400.00, 1636.00, '', '0000-00-00'),
	(200, 'DAVid ', 'BROWN', 3, 15, '', '', '2002-03-03', '', 'M', '1971-05-29', ' ', 57740.00, 600.00, 2217.00, '', '0000-00-00'),
	(210, 'WILLIAM T', 'JONES', 1, 10, '', '', '1998-04-11', '', 'M', '2003-02-23', ' ', 68270.00, 400.00, 1462.00, '', '0000-00-00'),
	(220, 'JENNIFER K', 'LUTZ', 9, 1, '', '', '1998-08-29', '', 'F', '1978-03-19', ' ', 49840.00, 600.00, 2387.00, '', '0000-00-00'),
	(230, 'JAMES J', 'JEFFERSON', 8, 2, '', '', '1996-11-21', '', 'M', '1980-05-30', ' ', 42180.00, 400.00, 1774.00, '', '0000-00-00'),
	(240, 'SALVATORE M', 'MARINO', 9, 2, '', '', '2004-12-05', '', 'M', '2002-03-31', ' ', 48760.00, 600.00, 2301.00, '', '0000-00-00'),
	(250, 'DANIEL S', 'SMITH', 9, 4, '', '', '1999-10-30', '', 'M', '1969-11-12', ' ', 49180.00, 400.00, 1534.00, '', '0000-00-00'),
	(260, 'SYBIL P', 'JOHNSON', 8, 14, '', '', '2005-09-11', '', 'F', '1976-10-05', ' ', 47250.00, 300.00, 1380.00, '', '0000-00-00'),
	(270, 'MARIA L', 'PEREZ', 8, 17, '', '', '2006-09-30', '', 'F', '2003-05-26', ' ', 37380.00, 500.00, 2190.00, '', '0000-00-00'),
	(280, 'ETHEL R', 'SCHNEidER', 8, 18, '', '', '1997-03-24', '', 'F', '0000-00-00', 'Um teste de troca', 36250.00, 500.00, 2100.00, '12345678', '2010-10-10'),
	(290, 'JOHN R', 'PARKER', 3, 19, '', '', '2006-05-30', '', 'M', '1985-07-09', ' ', 35340.00, 300.00, 1227.00, '', '0000-00-00'),
	(300, 'PHILIP X', 'SMITH', 5, 12, '', '', '2002-06-19', '', 'M', '1976-10-27', ' ', 37750.00, 400.00, 1420.00, '', '0000-00-00'),
	(310, 'WING ', 'LEE', 5, 20, '', '', '2006-02-23', '', 'M', '1971-07-18', ' ', 45370.00, 500.00, 2030.00, '', '0000-00-00'),
	(320, 'JASON R', 'GOUNOT', 5, 21, '', '', '1977-05-05', '', 'M', '1956-05-17', ' ', 43840.00, 500.00, 1907.00, '', '0000-00-00'),
	(330, 'DIAN J', 'HEMMINGER', 3, 21, '', '', '1995-01-01', '', 'F', '1973-08-14', ' ', 46500.00, 1000.00, 4220.00, '', '0000-00-00'),
	(340, 'GREG ', 'ORLANDO', 3, 22, '', '', '2002-05-05', '', 'M', '1972-10-18', ' ', 39250.00, 600.00, 2340.00, '', '0000-00-00'),
	(350, 'KIM N', 'NATZ', 3, 21, '', '', '2006-12-15', '', 'F', '1976-01-19', ' ', 68420.00, 600.00, 2274.00, '', '0000-00-00'),
	(360, 'KIYOSHI ', 'YAMAMOTO', 3, 20, '', '', '2005-09-15', '', 'M', '1981-01-05', ' ', 64680.00, 500.00, 1974.00, '', '0000-00-00'),
	(370, 'REBA K', 'JOHN', 3, 21, '', '', '2005-08-29', '', 'F', '1978-03-19', ' ', 69840.00, 600.00, 2387.00, '', '0000-00-00'),
	(380, 'ROBERT M', 'MONTEVERDE', 5, 14, '', '', '2004-12-05', '', 'M', '1984-03-31', ' ', 37760.00, 600.00, 2301.00, '', '0000-00-00'),
	(390, 'EILEEN R', 'SCHWARTZ', 5, 19, '', '', '1997-03-24', '', 'F', '1966-03-28', ' ', 46250.00, 500.00, 2100.00, '', '0000-00-00'),
	(400, 'MICHELLE F', 'SPRINGER', 5, 1, '', '', '1994-09-12', '', 'F', '1961-04-21', ' ', 35900.00, 300.00, 1272.00, '', '0000-00-00'),
	(410, 'HELENA ', 'WONG', 5, 14, '', '', '2006-02-23', '', 'F', '1971-07-18', ' ', 35370.00, 500.00, 2030.00, '', '0000-00-00'),
	(420, 'ROY R', 'ALONZO', 2, 21, '', '', '1997-07-05', '', 'M', '1956-05-17', ' ', 31840.00, 500.00, 1907.00, '', '0000-00-00'),
	(430, 'JOSE A', 'BUENO', 4, 23, '', '', '0000-00-00', '', 'M', '0000-00-00', ' ', 1250.00, 100.00, 500.00, '', '0000-00-00'),
	(450, 'Louis W', 'Armstrong', 4, 25, '', '', '2002-10-20', '', 'M', '1958-05-15', 'Músico', 2500.00, 500.00, 400.00, '1452151', '2002-10-20'),
	(460, 'Ella W', 'Fritzgerald', 4, 24, '', '', '2002-10-20', '', 'F', '1958-05-14', 'Cantora', 2500.00, 500.00, 400.00, '14511254', '2002-10-05'),
	(470, 'Leonidas S', 'Spartacus', 4, 9, '', '', '1901-10-10', '', 'M', '1960-05-05', 'Forte pacas', 12000.00, 1000.00, 500.00, '0451245', '1902-10-10'),
	(480, 'Jennifer A', 'Soulthernman', 4, 8, '', '', '2010-10-10', '', 'F', '1970-02-05', 'teasdas', 12000.00, 2600.00, 1500.00, '12452121', '2010-10-10'),
	(490, 'Robert D', 'Dourvall', 4, 7, '', '', '2010-10-10', '', 'M', '1970-02-05', 'teasdas', 12000.00, 2600.00, 1500.00, '12452121', '2010-10-10'),
	(500, 'Louise A', 'Huang', 5, 6, '', '', '2010-10-10', '', 'F', '1970-02-05', 'teasdas', 12000.00, 2600.00, 1500.00, '12452121', '2010-10-10'),
	(510, 'Chritopher B', 'Hemingway', 7, 8, '', '', '2010-10-10', '', 'M', '1970-02-05', 'teasdas', 12000.00, 2600.00, 1500.00, '12452121', '2010-10-10'),
	(520, 'Demistocles ', 'Santoristeles', 4, 8, '', '', '0000-00-00', '', '', '0000-00-00', '', 0.00, 0.00, 0.00, '', '0000-00-00'),
	(521, 'Fulano e bel', 'da silva', 4, 13, '4521', '11123123123', '1992-02-24', '125', 'M', '1970-11-18', 'trabalhador com bom relacionamento com todos os colegas.', 14000.00, 3500.00, 1500.00, '11415521', '2018-12-05'),
	(522, 'Asdrual de A', 'Lins', 10, 5, '4500', '1145214521', '1995-06-10', '145', 'H', '1958-04-01', 'Bom profissional e já trabalhou com gerenciamento de projetos.', 15000.00, 4000.00, 3500.00, '12345678', '1995-06-10');
/*!40000 ALTER TABLE `funcionarios` ENABLE KEYS */;

-- Copiando estrutura para tabela ilp54020212t.funcionariosplanos
DROP TABLE IF EXISTS `funcionariosplanos`;
CREATE TABLE IF NOT EXISTS `funcionariosplanos` (
  `cpfuncionarioplano` int(6) NOT NULL,
  `cefuncionario` int(6) unsigned NOT NULL,
  `ceplanodesaude` int(4) NOT NULL,
  `dtvinculacao` date NOT NULL,
  `dtdesligamento` date NOT NULL,
  `dtcadfuncplano` date DEFAULT NULL,
  PRIMARY KEY (`cpfuncionarioplano`),
  KEY `ifuncionarios` (`cefuncionario`) USING BTREE,
  KEY `iplanosdesaude` (`ceplanodesaude`) USING BTREE,
  CONSTRAINT `funcionariosplanosce1` FOREIGN KEY (`cefuncionario`) REFERENCES `funcionarios` (`cpfuncionario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `funcionariosplanosce2` FOREIGN KEY (`ceplanodesaude`) REFERENCES `planosdesaude` (`cpplanodesaude`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Cadastro das ligações entre funcionários e planos de saúde.';

-- Copiando dados para a tabela ilp54020212t.funcionariosplanos: ~99 rows (aproximadamente)
/*!40000 ALTER TABLE `funcionariosplanos` DISABLE KEYS */;
INSERT INTO `funcionariosplanos` (`cpfuncionarioplano`, `cefuncionario`, `ceplanodesaude`, `dtvinculacao`, `dtdesligamento`, `dtcadfuncplano`) VALUES
	(1, 10, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(2, 10, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(3, 20, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(4, 20, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(5, 30, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(6, 30, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(7, 40, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(8, 40, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(9, 50, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(10, 50, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(11, 60, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(12, 60, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(13, 70, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(14, 70, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(15, 80, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(16, 80, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(17, 90, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(18, 90, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(19, 100, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(20, 100, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(21, 110, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(22, 110, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(23, 120, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(24, 120, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(25, 130, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(26, 130, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(27, 150, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(28, 150, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(29, 160, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(30, 160, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(31, 170, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(32, 170, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(33, 180, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(34, 180, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(35, 190, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(36, 190, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(37, 200, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(38, 200, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(39, 210, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(40, 210, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(41, 220, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(42, 220, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(43, 230, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(44, 230, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(45, 240, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(46, 240, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(47, 250, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(48, 250, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(49, 260, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(50, 260, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(51, 270, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(52, 270, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(53, 280, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(54, 280, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(55, 290, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(56, 290, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(57, 300, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(58, 300, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(59, 310, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(60, 310, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(61, 320, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(62, 320, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(63, 330, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(64, 330, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(65, 340, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(66, 340, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(67, 350, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(68, 350, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(69, 360, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(70, 360, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(71, 370, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(72, 370, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(73, 380, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(74, 380, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(75, 390, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(76, 390, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(77, 400, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(78, 400, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(79, 410, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(80, 410, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(81, 420, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(82, 420, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(83, 430, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(84, 430, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(87, 450, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(88, 450, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(89, 460, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(90, 460, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(91, 470, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(92, 470, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(93, 480, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(94, 480, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(95, 490, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(96, 490, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(97, 500, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(98, 500, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(99, 510, 1, '2016-04-22', '2017-04-22', '2017-10-22'),
	(100, 510, 2, '2016-04-22', '2017-04-22', '2017-10-22'),
	(101, 150, 3, '2020-04-14', '2021-04-14', '2021-04-15');
/*!40000 ALTER TABLE `funcionariosplanos` ENABLE KEYS */;

-- Copiando estrutura para tabela ilp54020212t.habilitacoes
DROP TABLE IF EXISTS `habilitacoes`;
CREATE TABLE IF NOT EXISTS `habilitacoes` (
  `cphabilitacao` int(5) NOT NULL,
  `cecurso` int(5) NOT NULL,
  `ceprofessor` int(3) NOT NULL,
  `dthabilitacao` date NOT NULL,
  `dtcadhabilitacao` date NOT NULL,
  PRIMARY KEY (`cphabilitacao`),
  KEY `icursos` (`cecurso`) USING BTREE,
  KEY `iprofessores` (`ceprofessor`) USING BTREE,
  CONSTRAINT `habilitacoesce1` FOREIGN KEY (`cecurso`) REFERENCES `cursos` (`cpcurso`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `habilitacoesce2` FOREIGN KEY (`ceprofessor`) REFERENCES `professores` (`cpprofessor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Cadastro das habilitações dos professores em dar aulas em cursos.';

-- Copiando dados para a tabela ilp54020212t.habilitacoes: ~160 rows (aproximadamente)
/*!40000 ALTER TABLE `habilitacoes` DISABLE KEYS */;
INSERT INTO `habilitacoes` (`cphabilitacao`, `cecurso`, `ceprofessor`, `dthabilitacao`, `dtcadhabilitacao`) VALUES
	(1, 1, 1, '2009-11-10', '2009-12-10'),
	(2, 1, 2, '2010-01-10', '2010-02-09'),
	(3, 1, 3, '1999-08-10', '1999-09-09'),
	(4, 1, 4, '2000-11-06', '2000-12-06'),
	(5, 1, 5, '2001-05-10', '2001-06-09'),
	(6, 2, 1, '2009-11-10', '2009-12-10'),
	(7, 2, 2, '2010-01-10', '2010-02-09'),
	(8, 2, 3, '1999-08-10', '1999-09-09'),
	(9, 2, 4, '2000-11-06', '2000-12-06'),
	(10, 2, 5, '2001-05-10', '2001-06-09'),
	(11, 3, 1, '2009-11-10', '2009-12-10'),
	(12, 3, 2, '2010-01-10', '2010-02-09'),
	(13, 3, 3, '1999-08-10', '1999-09-09'),
	(14, 3, 4, '2000-11-06', '2000-12-06'),
	(15, 3, 5, '2001-05-10', '2001-06-09'),
	(16, 4, 1, '2009-11-10', '2009-12-10'),
	(17, 4, 2, '2010-01-10', '2010-02-09'),
	(18, 4, 3, '1999-08-10', '1999-09-09'),
	(19, 4, 4, '2000-11-06', '2000-12-06'),
	(20, 4, 5, '2001-05-10', '2001-06-09'),
	(21, 5, 1, '2009-11-10', '2009-12-10'),
	(22, 5, 2, '2010-01-10', '2010-02-09'),
	(23, 5, 3, '1999-08-10', '1999-09-09'),
	(24, 5, 4, '2000-11-06', '2000-12-06'),
	(25, 5, 5, '2001-05-10', '2001-06-09'),
	(26, 6, 1, '2009-11-10', '2009-12-10'),
	(27, 6, 2, '2010-01-10', '2010-02-09'),
	(28, 6, 3, '1999-08-10', '1999-09-09'),
	(29, 6, 4, '2000-11-06', '2000-12-06'),
	(30, 6, 5, '2001-05-10', '2001-06-09'),
	(31, 7, 1, '2009-11-10', '2009-12-10'),
	(32, 7, 2, '2010-01-10', '2010-02-09'),
	(33, 7, 3, '1999-08-10', '1999-09-09'),
	(34, 7, 4, '2000-11-06', '2000-12-06'),
	(35, 7, 5, '2001-05-10', '2001-06-09'),
	(36, 6, 5, '2001-05-10', '2001-06-09'),
	(37, 6, 6, '2010-05-26', '2010-06-25'),
	(38, 6, 7, '1991-06-10', '1991-07-10'),
	(39, 6, 8, '2006-05-10', '2006-06-09'),
	(40, 6, 9, '2000-05-10', '2000-06-09'),
	(41, 6, 10, '1998-12-10', '1999-01-09'),
	(42, 6, 11, '1996-01-10', '1996-02-09'),
	(43, 6, 12, '2004-09-10', '2004-10-10'),
	(44, 6, 13, '1996-02-10', '1996-03-11'),
	(45, 6, 14, '2000-01-10', '2000-02-09'),
	(46, 7, 5, '2001-05-10', '2001-06-09'),
	(47, 7, 6, '2010-05-26', '2010-06-25'),
	(48, 7, 7, '1991-06-10', '1991-07-10'),
	(49, 7, 8, '2006-05-10', '2006-06-09'),
	(50, 7, 9, '2000-05-10', '2000-06-09'),
	(51, 7, 10, '1998-12-10', '1999-01-09'),
	(52, 7, 11, '1996-01-10', '1996-02-09'),
	(53, 7, 12, '2004-09-10', '2004-10-10'),
	(54, 7, 13, '1996-02-10', '1996-03-11'),
	(55, 7, 14, '2000-01-10', '2000-02-09'),
	(56, 8, 5, '2001-05-10', '2001-06-09'),
	(57, 8, 6, '2010-05-26', '2010-06-25'),
	(58, 8, 7, '1991-06-10', '1991-07-10'),
	(59, 8, 8, '2006-05-10', '2006-06-09'),
	(60, 8, 9, '2000-05-10', '2000-06-09'),
	(61, 8, 10, '1998-12-10', '1999-01-09'),
	(62, 8, 11, '1996-01-10', '1996-02-09'),
	(63, 8, 12, '2004-09-10', '2004-10-10'),
	(64, 8, 13, '1996-02-10', '1996-03-11'),
	(65, 8, 14, '2000-01-10', '2000-02-09'),
	(66, 9, 5, '2001-05-10', '2001-06-09'),
	(67, 9, 6, '2010-05-26', '2010-06-25'),
	(68, 9, 7, '1991-06-10', '1991-07-10'),
	(69, 9, 8, '2006-05-10', '2006-06-09'),
	(70, 9, 9, '2000-05-10', '2000-06-09'),
	(71, 9, 10, '1998-12-10', '1999-01-09'),
	(72, 9, 11, '1996-01-10', '1996-02-09'),
	(73, 9, 12, '2004-09-10', '2004-10-10'),
	(74, 9, 13, '1996-02-10', '1996-03-11'),
	(75, 9, 14, '2000-01-10', '2000-02-09'),
	(76, 10, 5, '2001-05-10', '2001-06-09'),
	(77, 10, 6, '2010-05-26', '2010-06-25'),
	(78, 10, 7, '1991-06-10', '1991-07-10'),
	(79, 10, 8, '2006-05-10', '2006-06-09'),
	(80, 10, 9, '2000-05-10', '2000-06-09'),
	(81, 10, 10, '1998-12-10', '1999-01-09'),
	(82, 10, 11, '1996-01-10', '1996-02-09'),
	(83, 10, 12, '2004-09-10', '2004-10-10'),
	(84, 10, 13, '1996-02-10', '1996-03-11'),
	(85, 10, 14, '2000-01-10', '2000-02-09'),
	(86, 11, 5, '2001-05-10', '2001-06-09'),
	(87, 11, 6, '2010-05-26', '2010-06-25'),
	(88, 11, 7, '1991-06-10', '1991-07-10'),
	(89, 11, 8, '2006-05-10', '2006-06-09'),
	(90, 11, 9, '2000-05-10', '2000-06-09'),
	(91, 11, 10, '1998-12-10', '1999-01-09'),
	(92, 11, 11, '1996-01-10', '1996-02-09'),
	(93, 11, 12, '2004-09-10', '2004-10-10'),
	(94, 11, 13, '1996-02-10', '1996-03-11'),
	(95, 11, 14, '2000-01-10', '2000-02-09'),
	(96, 12, 5, '2001-05-10', '2001-06-09'),
	(97, 12, 6, '2010-05-26', '2010-06-25'),
	(98, 12, 7, '1991-06-10', '1991-07-10'),
	(99, 12, 8, '2006-05-10', '2006-06-09'),
	(100, 12, 9, '2000-05-10', '2000-06-09'),
	(101, 12, 10, '1998-12-10', '1999-01-09'),
	(102, 12, 11, '1996-01-10', '1996-02-09'),
	(103, 12, 12, '2004-09-10', '2004-10-10'),
	(104, 12, 13, '1996-02-10', '1996-03-11'),
	(105, 12, 14, '2000-01-10', '2000-02-09'),
	(106, 13, 5, '2001-05-10', '2001-06-09'),
	(107, 13, 6, '2010-05-26', '2010-06-25'),
	(108, 13, 7, '1991-06-10', '1991-07-10'),
	(109, 13, 8, '2006-05-10', '2006-06-09'),
	(110, 13, 9, '2000-05-10', '2000-06-09'),
	(111, 13, 10, '1998-12-10', '1999-01-09'),
	(112, 13, 11, '1996-01-10', '1996-02-09'),
	(113, 13, 12, '2004-09-10', '2004-10-10'),
	(114, 13, 13, '1996-02-10', '1996-03-11'),
	(115, 13, 14, '2000-01-10', '2000-02-09'),
	(116, 14, 5, '2001-05-10', '2001-06-09'),
	(117, 14, 6, '2010-05-26', '2010-06-25'),
	(118, 14, 7, '1991-06-10', '1991-07-10'),
	(119, 14, 8, '2006-05-10', '2006-06-09'),
	(120, 14, 9, '2000-05-10', '2000-06-09'),
	(121, 14, 10, '1998-12-10', '1999-01-09'),
	(122, 14, 11, '1996-01-10', '1996-02-09'),
	(123, 14, 12, '2004-09-10', '2004-10-10'),
	(124, 14, 13, '1996-02-10', '1996-03-11'),
	(125, 14, 14, '2000-01-10', '2000-02-09'),
	(126, 15, 5, '2001-05-10', '2001-06-09'),
	(127, 15, 6, '2010-05-26', '2010-06-25'),
	(128, 15, 7, '1991-06-10', '1991-07-10'),
	(129, 15, 8, '2006-05-10', '2006-06-09'),
	(130, 15, 9, '2000-05-10', '2000-06-09'),
	(131, 15, 10, '1998-12-10', '1999-01-09'),
	(132, 15, 11, '1996-01-10', '1996-02-09'),
	(133, 15, 12, '2004-09-10', '2004-10-10'),
	(134, 15, 13, '1996-02-10', '1996-03-11'),
	(135, 15, 14, '2000-01-10', '2000-02-09'),
	(136, 16, 5, '2001-05-10', '2001-06-09'),
	(137, 16, 6, '2010-05-26', '2010-06-25'),
	(138, 16, 7, '1991-06-10', '1991-07-10'),
	(139, 16, 8, '2006-05-10', '2006-06-09'),
	(140, 16, 9, '2000-05-10', '2000-06-09'),
	(141, 16, 10, '1998-12-10', '1999-01-09'),
	(142, 16, 11, '1996-01-10', '1996-02-09'),
	(143, 16, 12, '2004-09-10', '2004-10-10'),
	(144, 16, 13, '1996-02-10', '1996-03-11'),
	(145, 16, 14, '2000-01-10', '2000-02-09'),
	(146, 17, 5, '2001-05-10', '2001-06-09'),
	(147, 17, 6, '2010-05-26', '2010-06-25'),
	(148, 17, 7, '1991-06-10', '1991-07-10'),
	(149, 17, 8, '2006-05-10', '2006-06-09'),
	(150, 17, 9, '2000-05-10', '2000-06-09'),
	(151, 17, 10, '1998-12-10', '1999-01-09'),
	(152, 17, 11, '1996-01-10', '1996-02-09'),
	(153, 17, 12, '2004-09-10', '2004-10-10'),
	(154, 17, 13, '1996-02-10', '1996-03-11'),
	(155, 17, 14, '2000-01-10', '2000-02-09'),
	(156, 5, 4, '1995-05-10', '1995-05-10'),
	(157, 5, 4, '1995-05-10', '1995-05-10'),
	(158, 5, 13, '1995-05-10', '1995-05-10'),
	(159, 14, 6, '1995-05-10', '1995-05-10'),
	(160, 14, 6, '1995-05-10', '1995-05-10');
/*!40000 ALTER TABLE `habilitacoes` ENABLE KEYS */;

-- Copiando estrutura para tabela ilp54020212t.instituicaodeensino
DROP TABLE IF EXISTS `instituicaodeensino`;
CREATE TABLE IF NOT EXISTS `instituicaodeensino` (
  `cpinstens` int(3) NOT NULL,
  `txnomeinstens` varchar(200) COLLATE utf8_bin NOT NULL,
  `celogadouro` bigint(20) unsigned DEFAULT NULL,
  `txcomplemento` varchar(50) COLLATE utf8_bin NOT NULL,
  `nutelefone` char(11) COLLATE utf8_bin NOT NULL,
  `txnomecontato` varchar(50) COLLATE utf8_bin NOT NULL,
  `txbairro` varchar(200) COLLATE utf8_bin NOT NULL,
  `nucep` char(8) COLLATE utf8_bin NOT NULL,
  `dtcadinstens` date NOT NULL,
  PRIMARY KEY (`cpinstens`) USING BTREE,
  KEY `icelogradouro` (`celogadouro`) USING BTREE,
  CONSTRAINT `escolasce1` FOREIGN KEY (`celogadouro`) REFERENCES `logradouros` (`cplogradouro`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Cadastro dos instituições de ensino onde acontecem os cursos.';

-- Copiando dados para a tabela ilp54020212t.instituicaodeensino: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `instituicaodeensino` DISABLE KEYS */;
INSERT INTO `instituicaodeensino` (`cpinstens`, `txnomeinstens`, `celogadouro`, `txcomplemento`, `nutelefone`, `txnomecontato`, `txbairro`, `nucep`, `dtcadinstens`) VALUES
	(1, 'Universidade de São Paulo', 19, '400', '', '', 'Cidade Universitária', '02342312', '2014-10-10'),
	(2, 'Universidade Júlio De Mesquita Filho', 20, '70 - 3ºAndar conjuntos 30 à 35', '1175488569', 'Sergio', 'Centro - Sé', '04511415', '2014-10-10'),
	(3, 'Fatec São Paulo - CPS', 9, '1452', '1145214523', 'Marilia', 'Bom Retiro', '01145277', '2018-12-12'),
	(5, 'Fatec Ourinhos - CPS', 22, '1452', '1145214523', 'Marilia', 'Bom Retiro', '01145277', '2018-12-12');
/*!40000 ALTER TABLE `instituicaodeensino` ENABLE KEYS */;

-- Copiando estrutura para tabela ilp54020212t.livros
DROP TABLE IF EXISTS `livros`;
CREATE TABLE IF NOT EXISTS `livros` (
  `cplivro` int(9) NOT NULL,
  `txtituloacervo` varchar(90) COLLATE utf8_bin NOT NULL,
  `ceeditora` int(5) DEFAULT NULL,
  `dtpublicacao` date NOT NULL,
  `nuanopublicacao` year(4) NOT NULL,
  `qtexemplaresacervo` int(3) NOT NULL,
  `qtexemplaresconsulta` int(2) NOT NULL,
  `dtcadlivro` date NOT NULL,
  PRIMARY KEY (`cplivro`),
  KEY `ieditoras` (`ceeditora`),
  CONSTRAINT `livrosce1` FOREIGN KEY (`ceeditora`) REFERENCES `editoras` (`cpeditora`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Cadastro dos Livros';

-- Copiando dados para a tabela ilp54020212t.livros: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `livros` DISABLE KEYS */;
INSERT INTO `livros` (`cplivro`, `txtituloacervo`, `ceeditora`, `dtpublicacao`, `nuanopublicacao`, `qtexemplaresacervo`, `qtexemplaresconsulta`, `dtcadlivro`) VALUES
	(1, 'O Morro dos Ventos Uivantes', 1, '1880-05-10', '1910', 40, 10, '2010-10-10'),
	(2, 'O Senhor dos Aneis', NULL, '1880-05-10', '1973', 40, 10, '2010-10-10'),
	(3, 'Guerra e Paz', 2, '1880-05-10', '1920', 40, 10, '2010-10-10'),
	(4, 'A Insustentável Leveza do Ser', NULL, '1880-05-10', '1980', 40, 10, '2010-10-10'),
	(5, 'O Bater de Suas Asas', 2, '1880-05-10', '2010', 40, 10, '2010-10-10'),
	(6, 'O Hobbit', 1, '1880-05-10', '1982', 40, 10, '2010-10-10'),
	(7, 'As estrelas contam histórias', 2, '2018-10-01', '2018', 80, 20, '2018-10-01'),
	(8, 'Os Três', 4, '2018-10-01', '2018', 40, 10, '2018-10-01'),
	(9, 'Os quatros contos do mundo', 2, '2018-10-01', '2018', 80, 20, '2018-10-01'),
	(10, 'O último Anjo', NULL, '2018-10-01', '2018', 20, 5, '2018-10-01'),
	(11, 'Desenvolvimento de Quimica', 1, '2018-10-30', '2018', 60, 10, '2018-10-30'),
	(12, 'A Arte da Escrita de Fórmulas', 4, '2018-10-30', '2018', 120, 10, '2018-10-30');
/*!40000 ALTER TABLE `livros` ENABLE KEYS */;

-- Copiando estrutura para tabela ilp54020212t.logradouros
DROP TABLE IF EXISTS `logradouros`;
CREATE TABLE IF NOT EXISTS `logradouros` (
  `cplogradouro` bigint(20) unsigned NOT NULL,
  `txnomelogradouro` varchar(300) COLLATE utf8_bin NOT NULL,
  `cetipologradouro` tinyint(3) unsigned DEFAULT NULL,
  `cecidade` smallint(5) unsigned DEFAULT NULL,
  `dtcadlogradouro` date NOT NULL,
  PRIMARY KEY (`cplogradouro`),
  KEY `icetipologradouro` (`cetipologradouro`),
  KEY `icecidade` (`cecidade`),
  CONSTRAINT `logradourosce1` FOREIGN KEY (`cetipologradouro`) REFERENCES `logradourostipos` (`cptipologradouro`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `logradourosce2` FOREIGN KEY (`cecidade`) REFERENCES `cidades` (`cpcidade`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Listas com as ruas, praças, avenidas, etc que compoem os arruamentos (públicos ou não de uma cidade)';

-- Copiando dados para a tabela ilp54020212t.logradouros: ~26 rows (aproximadamente)
/*!40000 ALTER TABLE `logradouros` DISABLE KEYS */;
INSERT INTO `logradouros` (`cplogradouro`, `txnomelogradouro`, `cetipologradouro`, `cecidade`, `dtcadlogradouro`) VALUES
	(1, 'Dona Matilde', 33, 1, '2018-10-25'),
	(2, 'Alicante', 33, 1, '2018-10-25'),
	(3, 'Rui Barbosa', 33, 1, '2018-10-25'),
	(4, 'dos Autonomistas', 4, 2, '2018-10-25'),
	(5, 'Sumaré', 4, 1, '2018-10-25'),
	(6, 'Loefreguem', 33, 1, '2018-10-25'),
	(7, 'Rio de Janeiro', 33, 1, '2018-10-25'),
	(8, 'Paraná', 33, 1, '2018-10-25'),
	(9, 'Timbiras', 33, 3, '2018-10-25'),
	(10, 'Horizonte', 4, 4, '2018-10-25'),
	(11, 'Leste Oeste', 4, 4, '2018-10-25'),
	(12, 'Conde de Frontin', 33, 1, '2018-10-25'),
	(13, 'Direita', 33, 2, '2018-10-25'),
	(14, '15 de Novembro', 33, 3, '2018-10-25'),
	(15, 'Fradique Coutinho', 33, 1, '2018-10-25'),
	(16, 'Santos', 2, 2, '2018-10-25'),
	(17, 'Luis Goes', 33, 6, '2018-10-25'),
	(18, 'Ruben Berrta', 4, 6, '2018-10-25'),
	(19, 'Da Reitoria', 4, 1, '2018-10-25'),
	(20, 'Da Sé', 28, 1, '2018-10-25'),
	(21, 'Bresser', 33, 1, '2018-10-25'),
	(22, 'Marcondes', 4, 2, '2018-10-25'),
	(23, 'das Nações Unidas', 4, 2, '2018-10-25'),
	(24, 'Copernico', 4, 2, '2018-10-25'),
	(25, 'Marcondes', 4, 4, '2018-10-25'),
	(26, 'Padre Anchieta', 32, 4, '2018-10-25');
/*!40000 ALTER TABLE `logradouros` ENABLE KEYS */;

-- Copiando estrutura para tabela ilp54020212t.logradourostipos
DROP TABLE IF EXISTS `logradourostipos`;
CREATE TABLE IF NOT EXISTS `logradourostipos` (
  `cptipologradouro` tinyint(3) unsigned NOT NULL,
  `txnometipologradouro` varchar(250) NOT NULL,
  `dtcadtipologradouro` date NOT NULL,
  PRIMARY KEY (`cptipologradouro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cadastro dos Tipos de logradouros';

-- Copiando dados para a tabela ilp54020212t.logradourostipos: ~44 rows (aproximadamente)
/*!40000 ALTER TABLE `logradourostipos` DISABLE KEYS */;
INSERT INTO `logradourostipos` (`cptipologradouro`, `txnometipologradouro`, `dtcadtipologradouro`) VALUES
	(1, 'Aeroporto', '2018-10-25'),
	(2, 'Alameda', '2018-10-25'),
	(3, 'Área', '2018-10-25'),
	(4, 'Avenida', '2018-10-25'),
	(5, 'Campo', '2018-10-25'),
	(6, 'Chácara', '2018-10-25'),
	(7, 'Colônia', '2018-10-25'),
	(8, 'Condomínio', '2018-10-25'),
	(9, 'Conjunto', '2018-10-25'),
	(10, 'Distrito', '2018-10-25'),
	(11, 'Esplanada', '2018-10-25'),
	(12, 'Estação', '2018-10-25'),
	(13, 'Estrada', '2018-10-25'),
	(14, 'Favela', '2018-10-25'),
	(15, 'Fazenda', '2018-10-25'),
	(16, 'Feira', '2018-10-25'),
	(17, 'Jardim', '2018-10-25'),
	(18, 'Ladeira', '2018-10-25'),
	(19, 'Lago', '2018-10-25'),
	(20, 'Lagoa', '2018-10-25'),
	(21, 'Largo', '2018-10-25'),
	(22, 'Loteamento', '2018-10-25'),
	(23, 'Morro', '2018-10-25'),
	(24, 'Núcleo', '2018-10-25'),
	(25, 'Parque', '2018-10-25'),
	(26, 'Passarela', '2018-10-25'),
	(27, 'Pátio', '2018-10-25'),
	(28, 'Praça', '2018-10-25'),
	(29, 'Quadra', '2018-10-25'),
	(30, 'Recanto', '2018-10-25'),
	(31, 'Residencial', '2018-10-25'),
	(32, 'Rodovia', '2018-10-25'),
	(33, 'Rua', '2018-10-25'),
	(34, 'Setor', '2018-10-25'),
	(35, 'Sítio', '2018-10-25'),
	(36, 'Travessa', '2018-10-25'),
	(37, 'Trecho', '2018-10-25'),
	(38, 'Trevo', '2018-10-25'),
	(39, 'Vale', '2018-10-25'),
	(40, 'Vereda', '2018-10-25'),
	(41, 'Via', '2018-10-25'),
	(42, 'Viaduto', '2018-10-25'),
	(43, 'Viela', '2018-10-25'),
	(44, 'Vila', '2018-10-25');
/*!40000 ALTER TABLE `logradourostipos` ENABLE KEYS */;

-- Copiando estrutura para tabela ilp54020212t.marcasveiculos
DROP TABLE IF EXISTS `marcasveiculos`;
CREATE TABLE IF NOT EXISTS `marcasveiculos` (
  `cpmarca` int(6) NOT NULL,
  `txnomemarca` varchar(90) COLLATE utf8_bin NOT NULL,
  `cefabricante` int(3) DEFAULT NULL,
  `dtcadmarcaveiculo` date NOT NULL,
  PRIMARY KEY (`cpmarca`),
  KEY `ifabricantes` (`cefabricante`),
  CONSTRAINT `marcasveiculosce1` FOREIGN KEY (`cefabricante`) REFERENCES `fabricantes` (`cpfabricante`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Cadastro das Marcas de Veículos.';

-- Copiando dados para a tabela ilp54020212t.marcasveiculos: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `marcasveiculos` DISABLE KEYS */;
INSERT INTO `marcasveiculos` (`cpmarca`, `txnomemarca`, `cefabricante`, `dtcadmarcaveiculo`) VALUES
	(1, 'Gol', 6, '2015-04-21'),
	(2, 'Up', 6, '2015-04-21'),
	(3, 'Golf', 6, '2015-04-21');
/*!40000 ALTER TABLE `marcasveiculos` ENABLE KEYS */;

-- Copiando estrutura para tabela ilp54020212t.medicos
DROP TABLE IF EXISTS `medicos`;
CREATE TABLE IF NOT EXISTS `medicos` (
  `cpmedico` int(6) NOT NULL,
  `txnomemedico` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ceespecialidade` int(4) DEFAULT NULL,
  `nucrm` int(8) NOT NULL,
  `aosituacao` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ceinstens` int(3) NOT NULL,
  `celogradouromoradia` bigint(20) unsigned DEFAULT NULL,
  `txcomplementomoradia` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `nucepmoradia` char(8) NOT NULL DEFAULT '',
  `celogradouroclinica` bigint(20) unsigned DEFAULT NULL,
  `txcomplementoclinica` varchar(50) DEFAULT NULL,
  `nucepclinica` char(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `nutelefone` char(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `dtcadmedico` date NOT NULL,
  PRIMARY KEY (`cpmedico`),
  KEY `iespecialidades` (`ceespecialidade`),
  KEY `medicosce2` (`ceinstens`),
  KEY `medicosce3` (`celogradouromoradia`),
  KEY `medicosce4` (`celogradouroclinica`),
  CONSTRAINT `medicosce1` FOREIGN KEY (`ceespecialidade`) REFERENCES `especmedicas` (`cpespecialidade`) ON UPDATE CASCADE,
  CONSTRAINT `medicosce2` FOREIGN KEY (`ceinstens`) REFERENCES `instituicaodeensino` (`cpinstens`) ON UPDATE CASCADE,
  CONSTRAINT `medicosce3` FOREIGN KEY (`celogradouromoradia`) REFERENCES `logradouros` (`cplogradouro`) ON UPDATE CASCADE,
  CONSTRAINT `medicosce4` FOREIGN KEY (`celogradouroclinica`) REFERENCES `logradouros` (`cplogradouro`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cadastro dos Livros.';

-- Copiando dados para a tabela ilp54020212t.medicos: ~21 rows (aproximadamente)
/*!40000 ALTER TABLE `medicos` DISABLE KEYS */;
INSERT INTO `medicos` (`cpmedico`, `txnomemedico`, `ceespecialidade`, `nucrm`, `aosituacao`, `ceinstens`, `celogradouromoradia`, `txcomplementomoradia`, `nucepmoradia`, `celogradouroclinica`, `txcomplementoclinica`, `nucepclinica`, `nutelefone`, `dtcadmedico`) VALUES
	(1, 'José de Azevedo', 1, 2134132, 'A', 1, 1, '100', '12312312', 14, '14521', '1234333', '11234234234', '2010-10-10'),
	(2, 'Ana Maria de Castro Neves', 1, 1451245, 'A', 1, 3, '155', '11224567', 2, '150', '23452345', '23452345234', '2015-04-21'),
	(3, 'Luis Marcos de Athaide', 2, 41245124, 'A', 2, 3, '142', '', 14, '245', '23452345', '34563456345', '2015-04-21'),
	(4, 'José Antonio Porto', 2, 41245124, 'A', 1, 4, '452', '', 14, '457', '34563456', '24563245645', '2015-04-21'),
	(5, 'Marcos José do Couto e Silva', 2, 75848562, 'A', 1, 2, '754', '', 1, '450', '04512452', '1174587452', '2015-04-21'),
	(6, 'Alberto Cinsinatti', 3, 6526253, 'A', 2, 3, '745', '', 2, '560', '45645645', '35345345345', '2015-04-21'),
	(7, 'Beatriz Nogueira', 3, 5414521, 'A', 1, 4, '120', '19999999', 3, '480', '34564356', '34563456345', '2015-04-21'),
	(8, 'Sofia de Albuquerque Lins', 1, 9545124, 'A', 1, 2, '130', '12312323', 2, '890', '23451251', '123451245', '2015-04-21'),
	(10, 'Carlos José Kobayashi Jr', 2, 9451522, 'A', 2, 10, '1450', '12312322', 3, '7880', '23452345', '23452345', '2015-04-21'),
	(11, 'Abelardo Barbosa de Almeida', 2, 4152422, 'D', 1, 14, '654', '12345678', 6, '654', '87654321', '11985125468', '2018-10-27'),
	(12, 'Aquiles Benedito Montezuma', 6, 2147483647, 'A', 2, 9, '450', '', 17, '2450', '04512745', '1145278563', '2018-10-27'),
	(13, 'Benedito Correa Alves da Silva', 4, 767867867, 'A', 1, 8, '450', '', 5, '2450', '04512745', '1145278563', '2018-10-27'),
	(14, 'Carlos de Abreu Soares Oliveira', 3, 767867867, 'A', 1, 8, '450-A - casa 3', '12234123', 5, '2450', '04512745', '1145278563', '2018-10-27'),
	(16, 'Napoleão Torquoise Bertrant', 3, 2147483647, 'D', 1, 2, '500', '01145125', 21, '452', '14512421', '', '2021-03-29'),
	(17, 'Jonathan Alves de Lima', 4, 12312312, 'A', 2, 23, '345', '12131312', 25, '67867', '123123', '', '2021-01-04'),
	(18, 'Leonidas de Esparta', 2, 14541, 'A', 2, 5, '4525', '11224567', 5, '4520', '11224567', '', '2021-04-02'),
	(19, 'Valeria de Almeida', 5, 12345678, 'A', 1, 22, '840', '12345124', 22, '1234', '12345124', '11458748985', '2021-03-01'),
	(20, 'Ruberval Taylor', 5, 12345678, 'A', 1, 22, '840', '12345124', 22, '1234', '12345124', '11458748985', '2021-03-01'),
	(21, 'Paulo de Araujo Limas', 2, 7454545, 'A', 1, 22, '1856', '11142421', 22, '454', '11142421', '11489755455', '2021-04-01'),
	(24, 'Marcos Emanuel de Souza', 3, 6546546, 'A', 1, 2, '125', '34656575', 21, '550 Ap. 525', '11324560', '1154356546', '2021-04-25'),
	(26, 'dfghsdfghxsfdg', 3, 0, 'A', 5, 16, 'asdfasdfasf', '12312312', 18, 'sdfg sdg ', '12312312', '1234123', '2021-05-18');
/*!40000 ALTER TABLE `medicos` ENABLE KEYS */;

-- Copiando estrutura para tabela ilp54020212t.modelosveiculos
DROP TABLE IF EXISTS `modelosveiculos`;
CREATE TABLE IF NOT EXISTS `modelosveiculos` (
  `cpmodelo` int(4) NOT NULL,
  `cemarca` int(6) DEFAULT NULL,
  `txdescricaomodelo` varchar(250) COLLATE utf8_bin NOT NULL,
  `aotipocombustivel` char(1) COLLATE utf8_bin NOT NULL,
  `dtcadmodeloveiculo` date NOT NULL,
  PRIMARY KEY (`cpmodelo`) USING BTREE,
  KEY `imarcas` (`cemarca`) USING BTREE,
  CONSTRAINT `modelosveiculosce1` FOREIGN KEY (`cemarca`) REFERENCES `marcasveiculos` (`cpmarca`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Cadastro dos modelos de veiculos.';

-- Copiando dados para a tabela ilp54020212t.modelosveiculos: ~15 rows (aproximadamente)
/*!40000 ALTER TABLE `modelosveiculos` DISABLE KEYS */;
INSERT INTO `modelosveiculos` (`cpmodelo`, `cemarca`, `txdescricaomodelo`, `aotipocombustivel`, `dtcadmodeloveiculo`) VALUES
	(1, 1, 'Quatro Portas, motor 1.0', 'G', '2015-04-21'),
	(2, 1, 'Duas Portas, motor 1.0', 'G', '2015-04-21'),
	(3, 1, 'Duas Portas, motor 1.6', 'G', '2015-04-21'),
	(4, 1, 'Duas Portas, motor 1.0', 'F', '2015-04-21'),
	(5, 1, 'Duas Portas, motor 1.6', 'F', '2015-04-21'),
	(6, 1, 'Quatro Portas, motor 1.0', 'F', '2015-04-21'),
	(7, 1, 'Quatro Portas, motor 1.6', 'F', '2015-04-21'),
	(8, 2, 'Duas Portas, motor 2.0', 'G', '2015-04-21'),
	(9, 2, 'Duas Portas, motor 1.8', 'G', '2015-04-21'),
	(10, 2, 'Quatro Portas, motor 2.0', 'G', '2015-04-21'),
	(11, 2, 'Quatro Portas, motor 1.8', 'G', '2015-04-21'),
	(12, 2, 'Duas Portas, motor 2.0', 'F', '2015-04-21'),
	(13, 2, 'Duas Portas, motor 1.8', 'F', '2015-04-21'),
	(14, 2, 'Quatro Portas, motor 2.0', 'F', '2015-04-21'),
	(15, 2, 'Quatro Portas, motor 1.8', 'F', '2015-04-21');
/*!40000 ALTER TABLE `modelosveiculos` ENABLE KEYS */;

-- Copiando estrutura para tabela ilp54020212t.movimentos
DROP TABLE IF EXISTS `movimentos`;
CREATE TABLE IF NOT EXISTS `movimentos` (
  `cpmovimento` int(6) NOT NULL,
  `celivro` int(9) NOT NULL,
  `cefuncionario` int(5) unsigned DEFAULT NULL,
  `dtmovimento` date NOT NULL,
  `cemovimentotipo` int(3) NOT NULL,
  `dtprevistadevolucao` date NOT NULL,
  `dtrealdevolucao` date NOT NULL,
  `dtcadmovimento` date NOT NULL,
  PRIMARY KEY (`cpmovimento`) USING BTREE,
  KEY `ilivros` (`celivro`) USING BTREE,
  KEY `ifuncionarios` (`cefuncionario`) USING BTREE,
  KEY `itiposmovimentos` (`cemovimentotipo`) USING BTREE,
  CONSTRAINT `movimentosce1` FOREIGN KEY (`cefuncionario`) REFERENCES `funcionarios` (`cpfuncionario`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `movimentosce2` FOREIGN KEY (`celivro`) REFERENCES `livros` (`cplivro`) ON UPDATE CASCADE,
  CONSTRAINT `movimentosce3` FOREIGN KEY (`cemovimentotipo`) REFERENCES `movimentostipos` (`cpmovimentotipo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Cadastro dos Movimentos de Livros no acervo de uma biblioteca.';

-- Copiando dados para a tabela ilp54020212t.movimentos: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `movimentos` DISABLE KEYS */;
INSERT INTO `movimentos` (`cpmovimento`, `celivro`, `cefuncionario`, `dtmovimento`, `cemovimentotipo`, `dtprevistadevolucao`, `dtrealdevolucao`, `dtcadmovimento`) VALUES
	(1, 6, 90, '2015-06-19', 2, '2015-06-29', '2015-06-25', '2015-06-19'),
	(2, 1, 370, '2015-06-19', 1, '2015-06-24', '0000-00-00', '2015-06-19'),
	(3, 6, 200, '2017-10-21', 7, '2017-10-22', '0000-00-00', '2017-10-21'),
	(4, 7, 120, '2018-12-06', 6, '2018-12-06', '0000-00-00', '2018-12-12'),
	(5, 1, 160, '2018-12-03', 2, '2018-11-29', '0000-00-00', '2018-12-13');
/*!40000 ALTER TABLE `movimentos` ENABLE KEYS */;

-- Copiando estrutura para tabela ilp54020212t.movimentostipos
DROP TABLE IF EXISTS `movimentostipos`;
CREATE TABLE IF NOT EXISTS `movimentostipos` (
  `cpmovimentotipo` int(3) NOT NULL,
  `txnomemovimentipo` varchar(80) COLLATE utf8_bin NOT NULL,
  `aopermiteretirada` char(1) COLLATE utf8_bin NOT NULL,
  `dtcadmovimentipo` date NOT NULL,
  PRIMARY KEY (`cpmovimentotipo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Cadastro dos Tipos de Movimentos.';

-- Copiando dados para a tabela ilp54020212t.movimentostipos: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `movimentostipos` DISABLE KEYS */;
INSERT INTO `movimentostipos` (`cpmovimentotipo`, `txnomemovimentipo`, `aopermiteretirada`, `dtcadmovimentipo`) VALUES
	(1, 'Consulta na Biblioteca', 'N', '2015-04-21'),
	(2, 'Retirada da Biblioteca para Consulta', 'S', '2015-04-21'),
	(3, 'Retirada da Biblioteca para Manutenção do Exemplar', 'S', '2015-04-21'),
	(4, 'Retirada da Biblioteca para Emprestimo', 'S', '2015-04-21'),
	(5, 'Devolução de Uma Consulta na Biblioteca', 'N', '2015-04-21'),
	(6, 'Devolução de uma Retirada da Biblioteca para Consulta', 'N', '2015-04-21'),
	(7, 'Devolução de uma Retirada da Biblioteca para Manutenção do Exemplar', 'N', '2015-04-21'),
	(8, 'Devolução de uma Retirada da Biblioteca para Emprestimo', 'N', '2015-04-21');
/*!40000 ALTER TABLE `movimentostipos` ENABLE KEYS */;

-- Copiando estrutura para tabela ilp54020212t.oficinas
DROP TABLE IF EXISTS `oficinas`;
CREATE TABLE IF NOT EXISTS `oficinas` (
  `cpoficina` smallint(5) unsigned NOT NULL COMMENT 'PK da Tabela',
  `txnomeoficina` varchar(250) NOT NULL COMMENT 'Razão social da Oficina',
  `txapelido` varchar(60) NOT NULL COMMENT 'Nome usual (ou apelido) da oficina',
  `celogradouro` bigint(20) unsigned DEFAULT NULL COMMENT 'FK com o código do Logradouro da Oficina',
  `txcomplemento` varchar(80) NOT NULL COMMENT 'Número do imóvel, localização referencial (outros imóveis próximos)',
  `nucep` char(8) NOT NULL COMMENT 'Número do CEP do logradouro da oficina',
  `dtcadoficina` date NOT NULL COMMENT 'Data de geração do registro',
  PRIMARY KEY (`cpoficina`),
  KEY `icelogradouro` (`celogradouro`) USING BTREE,
  CONSTRAINT `oficinasce1` FOREIGN KEY (`celogradouro`) REFERENCES `logradouros` (`cplogradouro`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Cadastro das oficinas que prestam serviços de reparos em veículos';

-- Copiando dados para a tabela ilp54020212t.oficinas: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `oficinas` DISABLE KEYS */;
INSERT INTO `oficinas` (`cpoficina`, `txnomeoficina`, `txapelido`, `celogradouro`, `txcomplemento`, `nucep`, `dtcadoficina`) VALUES
	(5, 'Oficina Mecânica de Reparos Gerais Luiz Porto S/C Ltda.', 'Luizinho', 2, '1450', '12345678', '2010-10-10'),
	(10, 'Oficina de Reparos Gerais', 'Marreco', 4, '2560', '12316789', '2015-10-10'),
	(15, 'Auto-oficina Mecânica Luiz Paraná S/C Ltda.', 'Luizinho', 2, '860', '01521567', '2010-10-10'),
	(20, 'Oficina de Caminhões e Ônibus "Jamanta" S/C Ltda.', 'Jamanta', 4, '4560', '12313678', '2015-10-10'),
	(25, 'Oficinas de Motos Mourisco S/C Ltda.', 'Mourisco', 5, '12565', '01456756', '2010-10-10');
/*!40000 ALTER TABLE `oficinas` ENABLE KEYS */;

-- Copiando estrutura para tabela ilp54020212t.palavraschaves
DROP TABLE IF EXISTS `palavraschaves`;
CREATE TABLE IF NOT EXISTS `palavraschaves` (
  `cppalavra` int(6) NOT NULL,
  `txpalavrachave` varchar(15) COLLATE utf8_bin NOT NULL,
  `dtcadpalavrachave` date NOT NULL,
  PRIMARY KEY (`cppalavra`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Cadastro das Palavras Chaves.';

-- Copiando dados para a tabela ilp54020212t.palavraschaves: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `palavraschaves` DISABLE KEYS */;
INSERT INTO `palavraschaves` (`cppalavra`, `txpalavrachave`, `dtcadpalavrachave`) VALUES
	(1, 'Matemática', '2015-04-21'),
	(2, 'Português', '2015-04-21'),
	(3, 'História', '2015-04-21'),
	(4, 'Geografia', '2015-04-21'),
	(5, 'Sociologia', '2015-04-21'),
	(6, 'Química', '2015-04-21'),
	(7, 'Física', '2015-04-21'),
	(8, 'Amor', '2017-10-26'),
	(9, 'Paixão', '2017-10-26'),
	(10, 'Caridade', '2017-10-26'),
	(11, 'Lealdade', '2017-10-26'),
	(12, 'Fidelidade', '2017-10-26');
/*!40000 ALTER TABLE `palavraschaves` ENABLE KEYS */;

-- Copiando estrutura para tabela ilp54020212t.palavraslivros
DROP TABLE IF EXISTS `palavraslivros`;
CREATE TABLE IF NOT EXISTS `palavraslivros` (
  `cppalavralivro` int(6) NOT NULL,
  `cepalavra` int(11) NOT NULL,
  `celivro` int(11) NOT NULL,
  `dtcadpalavralivro` date NOT NULL,
  PRIMARY KEY (`cppalavralivro`),
  KEY `ipalavras` (`cepalavra`) USING BTREE,
  KEY `ilivros` (`celivro`) USING BTREE,
  CONSTRAINT `palavraslivrosce1` FOREIGN KEY (`celivro`) REFERENCES `livros` (`cplivro`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `palavraslivrosce2` FOREIGN KEY (`cepalavra`) REFERENCES `palavraschaves` (`cppalavra`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Cadastro das Palavras Chaves de Pesquisas ligadas aos Livros.';

-- Copiando dados para a tabela ilp54020212t.palavraslivros: ~121 rows (aproximadamente)
/*!40000 ALTER TABLE `palavraslivros` DISABLE KEYS */;
INSERT INTO `palavraslivros` (`cppalavralivro`, `cepalavra`, `celivro`, `dtcadpalavralivro`) VALUES
	(1, 2, 1, '2018-06-18'),
	(2, 4, 1, '2018-06-20'),
	(3, 10, 1, '2018-06-26'),
	(4, 1, 1, '2018-06-17'),
	(5, 6, 1, '2018-06-22'),
	(6, 3, 1, '2018-06-19'),
	(7, 5, 1, '2018-06-21'),
	(8, 7, 1, '2018-06-23'),
	(9, 9, 1, '2018-06-25'),
	(10, 8, 10, '2018-06-24'),
	(11, 2, 2, '2018-06-19'),
	(12, 4, 2, '2018-06-21'),
	(13, 10, 2, '2018-06-27'),
	(14, 1, 2, '2018-06-18'),
	(15, 6, 2, '2018-06-23'),
	(16, 3, 2, '2018-06-20'),
	(17, 5, 2, '2018-06-22'),
	(18, 7, 2, '2018-06-24'),
	(19, 9, 2, '2018-06-26'),
	(20, 8, 2, '2018-06-25'),
	(21, 2, 3, '2018-06-20'),
	(22, 4, 3, '2018-06-22'),
	(23, 10, 3, '2018-06-28'),
	(24, 1, 3, '2018-06-19'),
	(25, 6, 3, '2018-06-24'),
	(26, 3, 3, '2018-06-21'),
	(27, 5, 3, '2018-06-23'),
	(28, 7, 3, '2018-06-25'),
	(29, 9, 3, '2018-06-27'),
	(30, 8, 3, '2018-06-26'),
	(31, 2, 4, '2018-06-21'),
	(32, 4, 4, '2018-06-23'),
	(33, 10, 4, '2018-06-29'),
	(34, 1, 4, '2018-06-20'),
	(35, 6, 4, '2018-06-25'),
	(36, 3, 4, '2018-06-22'),
	(37, 5, 4, '2018-06-24'),
	(38, 7, 4, '2018-06-26'),
	(39, 9, 4, '2018-06-28'),
	(40, 8, 4, '2018-06-27'),
	(41, 2, 5, '2018-06-22'),
	(42, 4, 5, '2018-06-24'),
	(43, 10, 5, '2018-06-30'),
	(44, 1, 5, '2018-06-21'),
	(45, 6, 5, '2018-06-26'),
	(46, 3, 5, '2018-06-23'),
	(47, 5, 5, '2018-06-25'),
	(49, 9, 5, '2018-06-29'),
	(50, 8, 5, '2018-06-28'),
	(51, 2, 6, '2018-06-23'),
	(52, 4, 6, '2018-06-25'),
	(53, 10, 6, '2018-07-01'),
	(54, 1, 6, '2018-06-22'),
	(55, 6, 6, '2018-06-27'),
	(56, 3, 6, '2018-06-24'),
	(57, 5, 6, '2018-06-26'),
	(58, 7, 6, '2018-06-28'),
	(59, 9, 6, '2018-06-30'),
	(61, 2, 7, '2018-06-24'),
	(62, 4, 7, '2018-06-26'),
	(63, 10, 7, '2018-07-02'),
	(64, 1, 7, '2018-06-23'),
	(65, 6, 7, '2018-06-28'),
	(66, 3, 7, '2018-06-25'),
	(67, 5, 7, '2018-06-27'),
	(68, 7, 7, '2018-06-29'),
	(69, 9, 7, '2018-07-01'),
	(70, 8, 7, '2018-06-30'),
	(71, 2, 8, '2018-06-25'),
	(72, 4, 8, '2018-06-27'),
	(73, 10, 8, '2018-07-03'),
	(74, 1, 8, '2018-06-24'),
	(75, 6, 8, '2018-06-29'),
	(76, 3, 8, '2018-06-26'),
	(77, 5, 8, '2018-06-28'),
	(78, 7, 8, '2018-06-30'),
	(79, 9, 8, '2018-07-02'),
	(80, 8, 8, '2018-07-01'),
	(81, 2, 9, '2018-06-26'),
	(82, 4, 9, '2018-06-28'),
	(83, 10, 9, '2018-07-04'),
	(84, 1, 9, '2018-06-25'),
	(85, 6, 9, '2018-06-30'),
	(86, 3, 9, '2018-06-27'),
	(87, 5, 9, '2018-06-29'),
	(88, 7, 9, '2018-07-01'),
	(89, 9, 9, '2018-07-03'),
	(91, 2, 10, '2018-06-27'),
	(92, 4, 10, '2018-06-29'),
	(93, 10, 10, '2018-07-05'),
	(94, 1, 10, '2018-06-26'),
	(95, 6, 10, '2018-07-01'),
	(96, 3, 10, '2018-06-28'),
	(97, 5, 10, '2018-06-30'),
	(98, 7, 10, '2018-07-02'),
	(99, 9, 10, '2018-07-04'),
	(100, 8, 10, '2018-07-03'),
	(101, 2, 11, '2018-06-28'),
	(102, 4, 11, '2018-06-30'),
	(103, 10, 11, '2018-07-06'),
	(104, 1, 11, '2018-06-27'),
	(105, 6, 11, '2018-07-02'),
	(106, 3, 11, '2018-06-29'),
	(107, 5, 11, '2018-07-01'),
	(108, 7, 11, '2018-07-03'),
	(109, 9, 11, '2018-07-05'),
	(110, 8, 11, '2018-07-04'),
	(111, 2, 12, '2018-06-29'),
	(112, 4, 12, '2018-07-01'),
	(113, 10, 12, '2018-07-07'),
	(114, 1, 12, '2018-06-28'),
	(115, 6, 12, '2018-07-03'),
	(116, 3, 12, '2018-06-30'),
	(117, 5, 12, '2018-07-02'),
	(118, 7, 12, '2018-07-04'),
	(119, 9, 12, '2018-07-06'),
	(120, 8, 12, '2018-07-05'),
	(121, 7, 6, '2018-10-29'),
	(122, 7, 1, '2018-10-29'),
	(123, 7, 1, '2018-10-30'),
	(124, 8, 1, '2018-11-05');
/*!40000 ALTER TABLE `palavraslivros` ENABLE KEYS */;

-- Copiando estrutura para tabela ilp54020212t.participa
DROP TABLE IF EXISTS `participa`;
CREATE TABLE IF NOT EXISTS `participa` (
  `cpparticipa` int(11) unsigned NOT NULL,
  `cefuncionario` int(11) unsigned DEFAULT NULL,
  `ceprojeto` smallint(6) unsigned DEFAULT NULL,
  `dtinicio` date DEFAULT NULL,
  `dttermino` date DEFAULT NULL,
  `dtcadparticipa` date DEFAULT NULL,
  PRIMARY KEY (`cpparticipa`),
  KEY `Index 2` (`cefuncionario`),
  KEY `Index 3` (`ceprojeto`),
  CONSTRAINT `participace1` FOREIGN KEY (`cefuncionario`) REFERENCES `funcionarios` (`cpfuncionario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `participace2` FOREIGN KEY (`ceprojeto`) REFERENCES `projetos` (`cpprojeto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela ilp54020212t.participa: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `participa` DISABLE KEYS */;
INSERT INTO `participa` (`cpparticipa`, `cefuncionario`, `ceprojeto`, `dtinicio`, `dttermino`, `dtcadparticipa`) VALUES
	(1, 280, 1, '2021-04-20', '2021-04-25', '2021-05-07'),
	(2, 200, 2, '2021-04-23', NULL, '2021-04-30'),
	(3, 330, 1, '2021-04-26', '2021-04-30', '2021-05-07'),
	(4, 200, 3, '2021-04-28', '2021-05-10', '2021-05-07'),
	(5, 200, 1, '2021-04-05', '2021-04-22', '2021-04-20'),
	(6, 520, 1, '2021-04-05', '2021-04-22', '2021-04-26'),
	(8, 70, 3, '2021-03-08', '2021-03-12', '2021-03-15');
/*!40000 ALTER TABLE `participa` ENABLE KEYS */;

-- Copiando estrutura para tabela ilp54020212t.planosdesaude
DROP TABLE IF EXISTS `planosdesaude`;
CREATE TABLE IF NOT EXISTS `planosdesaude` (
  `cpplanodesaude` int(4) NOT NULL,
  `txnomeplano` varchar(200) COLLATE utf8_bin NOT NULL,
  `txrazaosocial` varchar(250) COLLATE utf8_bin NOT NULL,
  `celogradouro` bigint(20) unsigned DEFAULT NULL,
  `txcomplemento` varchar(50) COLLATE utf8_bin NOT NULL,
  `txbairro` varchar(40) COLLATE utf8_bin NOT NULL,
  `nutelefone` char(11) COLLATE utf8_bin DEFAULT NULL,
  `txnomecontato` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `nucep` char(8) COLLATE utf8_bin NOT NULL,
  `dtcadplanodesaude` date NOT NULL,
  PRIMARY KEY (`cpplanodesaude`) USING BTREE,
  KEY `icelogradouro` (`celogradouro`) USING BTREE,
  CONSTRAINT `planosdesaudece1` FOREIGN KEY (`celogradouro`) REFERENCES `logradouros` (`cplogradouro`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Cadastro dos Planos de Saúde dos funcionarios que fazem consultas.';

-- Copiando dados para a tabela ilp54020212t.planosdesaude: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `planosdesaude` DISABLE KEYS */;
INSERT INTO `planosdesaude` (`cpplanodesaude`, `txnomeplano`, `txrazaosocial`, `celogradouro`, `txcomplemento`, `txbairro`, `nutelefone`, `txnomecontato`, `nucep`, `dtcadplanodesaude`) VALUES
	(1, 'Administradora de Saúde Golden Cross S.A.', '', 4, '2344', 'Vila Nova California', '21231231', 's', '23423423', '2021-05-27'),
	(2, 'Sulamerica ', 'Sulamerica Serviços de Saúde S.A.', 22, '3450 - 5ºAnd Conj.520', 'Vila Nova Saldanha', NULL, NULL, '04512786', '2015-04-20'),
	(3, 'CiaSaude', 'Cooperativa Companhia da Saúde S.A.', 5, '450', 'Centro', '1574587485', 'José Almeida', '45124512', '2020-04-20'),
	(4, 'UniMed-São Paulo', 'Cooperativa De Livros Unidos - São Paulo S.A.', 5, '450', 'Centro', '1574587485', 'José Almeida', '45124512', '2020-04-20'),
	(5, 'Unimed Ourinhos', 'Cooperativa de Livros de Ourinhos e Região S.A.', 4, '3455', 'Vila Nova California', '11748574545', 'Juvenal', '01441414', '2021-05-27');
/*!40000 ALTER TABLE `planosdesaude` ENABLE KEYS */;

-- Copiando estrutura para tabela ilp54020212t.professores
DROP TABLE IF EXISTS `professores`;
CREATE TABLE IF NOT EXISTS `professores` (
  `cpprofessor` int(3) NOT NULL,
  `txnomeprofessor` varchar(250) COLLATE utf8_bin NOT NULL,
  `ceescola` int(3) DEFAULT NULL,
  `celogradouro` bigint(20) unsigned DEFAULT NULL,
  `txcomplemento` varchar(50) COLLATE utf8_bin NOT NULL,
  `nutelefone` char(11) COLLATE utf8_bin NOT NULL,
  `txbairro` varchar(40) COLLATE utf8_bin NOT NULL,
  `nucep` char(8) COLLATE utf8_bin NOT NULL,
  `dtnascimento` date NOT NULL,
  `dtcadprofessor` date NOT NULL,
  PRIMARY KEY (`cpprofessor`),
  KEY `iescolas` (`ceescola`),
  KEY `ilogradouros` (`celogradouro`),
  CONSTRAINT `professoresce1` FOREIGN KEY (`ceescola`) REFERENCES `instituicaodeensino` (`cpinstens`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `professoresce2` FOREIGN KEY (`celogradouro`) REFERENCES `logradouros` (`cplogradouro`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Cadastro dos Professores que ministram disciplinas em cursos.';

-- Copiando dados para a tabela ilp54020212t.professores: ~15 rows (aproximadamente)
/*!40000 ALTER TABLE `professores` DISABLE KEYS */;
INSERT INTO `professores` (`cpprofessor`, `txnomeprofessor`, `ceescola`, `celogradouro`, `txcomplemento`, `nutelefone`, `txbairro`, `nucep`, `dtnascimento`, `dtcadprofessor`) VALUES
	(1, 'Agrepino de Souza Filho', 1, 12, '346', '1433264585', 'Centro', '14512451', '1973-09-10', '2009-11-10'),
	(2, 'Sandra Maria Vescio', 1, 13, '256', '1433568745', 'Vila Marieta', '14512451', '1978-10-10', '2010-01-10'),
	(3, 'Maria Evangelina da Silva', 2, 14, '345', '11985658745', 'Vila Esperança', '14512451', '1957-04-10', '1999-08-10'),
	(4, 'Silvana Alves de Lima', 1, 14, '386', '14987758485', 'Centro', '14512451', '1980-10-05', '2000-11-06'),
	(5, 'Angela Rosa de Moraes', 2, 14, '45', '14963863763', 'Vila Marieta', '14512451', '1984-10-10', '2001-05-10'),
	(6, 'Mariza Gomes Afonso', 2, 15, '345', '11954784475', 'Vila Esperança', '14512451', '1969-05-30', '2010-05-26'),
	(7, 'Luciano Angelo De Godoi', 1, 15, '346', '1433264585', 'Centro', '14512451', '1985-10-10', '1991-06-10'),
	(8, 'Mario Sérgio de Souto Correa', 1, 15, '45', '1676768787', 'Vila Julieta', '14512451', '1962-10-10', '2006-05-10'),
	(9, 'Luiza Maria do Couto e Silva', NULL, 14, '345', '', 'Vila Esperança', '14512451', '1967-10-10', '2000-05-10'),
	(10, 'Lucas Francisco Souza Lima', 1, 12, '346', '12342434132', 'Centro', '14512451', '1962-10-10', '1998-12-10'),
	(11, 'Bruno De Oliveira Goncales', 2, 13, '456 - debaixo da escada', '1324123', 'centro', '12341233', '1971-08-20', '1996-01-10'),
	(12, 'Angela Pontes Simões', NULL, 10, '45', '', 'Vila Marieta', '14512451', '1969-09-22', '2004-09-10'),
	(13, 'Wilson Marques Salvador', 2, 10, '3345', '11954784475', 'Vila Esperança', '14512451', '1969-10-10', '1996-02-10'),
	(14, 'Eurípedes Nabucodonozor Marques', NULL, 11, '456 - Casa 2', '1324123', 'centrol', '12341233', '1971-05-24', '2000-01-10'),
	(15, 'Cezário de Albuquerque Lima', 1, 8, '7541', '1498652314', 'Vila Perino', '14512415', '1988-12-05', '2018-12-10');
/*!40000 ALTER TABLE `professores` ENABLE KEYS */;

-- Copiando estrutura para tabela ilp54020212t.projetos
DROP TABLE IF EXISTS `projetos`;
CREATE TABLE IF NOT EXISTS `projetos` (
  `cpprojeto` smallint(6) unsigned NOT NULL,
  `txnomeprojeto` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `vlprojeto` decimal(20,3) DEFAULT NULL,
  `dtcadprojeto` date DEFAULT NULL,
  PRIMARY KEY (`cpprojeto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela ilp54020212t.projetos: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `projetos` DISABLE KEYS */;
INSERT INTO `projetos` (`cpprojeto`, `txnomeprojeto`, `vlprojeto`, `dtcadprojeto`) VALUES
	(1, 'Des. Softa Educativo - Tigres', 35000.000, '2021-05-07'),
	(2, 'Des. Soft  Adm Padaria', 50000.000, '2021-05-07'),
	(3, 'Des. Soft Ger. de Salão de Beleza', 60000.000, '2021-05-07');
/*!40000 ALTER TABLE `projetos` ENABLE KEYS */;

-- Copiando estrutura para tabela ilp54020212t.seguradoras
DROP TABLE IF EXISTS `seguradoras`;
CREATE TABLE IF NOT EXISTS `seguradoras` (
  `cpseguradora` int(4) NOT NULL,
  `txnomeseguradora` varchar(250) COLLATE utf8_bin NOT NULL,
  `celogradouro` bigint(20) unsigned DEFAULT NULL,
  `txcomplemento` varchar(50) COLLATE utf8_bin NOT NULL,
  `txbairro` varchar(40) COLLATE utf8_bin NOT NULL,
  `nucep` char(8) COLLATE utf8_bin NOT NULL,
  `nutelefone` char(11) COLLATE utf8_bin NOT NULL,
  `txnomecontato` varchar(50) COLLATE utf8_bin NOT NULL,
  `dtcadseguradora` date NOT NULL,
  PRIMARY KEY (`cpseguradora`) USING BTREE,
  KEY `ilogradouros` (`celogradouro`) USING BTREE,
  CONSTRAINT `seguradorasce1` FOREIGN KEY (`celogradouro`) REFERENCES `logradouros` (`cplogradouro`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Cadastro das Seguradoras de valores.';

-- Copiando dados para a tabela ilp54020212t.seguradoras: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `seguradoras` DISABLE KEYS */;
INSERT INTO `seguradoras` (`cpseguradora`, `txnomeseguradora`, `celogradouro`, `txcomplemento`, `txbairro`, `nucep`, `nutelefone`, `txnomecontato`, `dtcadseguradora`) VALUES
	(1, 'Porto Seguro S.A. ', 16, '1345-23', 'Bela Vista', '04512452', '', '', '2010-10-10'),
	(2, 'Mafre Seguros S.C. Ltda.', 17, '2345', 'Pinheiros', '04514215', '', '', '2010-10-10'),
	(3, 'Sulamerica Corretora de Seguros', 12, '1467', 'Bela Vista', '04512422', '', '', '2010-10-10'),
	(8, 'Seguradora Maritima S/C Ltda.', 14, '14520', 'Vila Berrini', '14251521', '', '', '2010-10-10');
/*!40000 ALTER TABLE `seguradoras` ENABLE KEYS */;

-- Copiando estrutura para tabela ilp54020212t.seguros
DROP TABLE IF EXISTS `seguros`;
CREATE TABLE IF NOT EXISTS `seguros` (
  `cpnumeroapolice` int(6) NOT NULL,
  `ceveiculo` int(6) unsigned DEFAULT NULL,
  `ceseguradora` int(4) DEFAULT NULL,
  `dtcontratacao` date NOT NULL,
  `dtlimitecobertura` date NOT NULL,
  `vlcobertura` float(15,2) NOT NULL,
  `dtcadseguro` date NOT NULL,
  PRIMARY KEY (`cpnumeroapolice`) USING BTREE,
  KEY `iveiculos` (`ceveiculo`) USING BTREE,
  KEY `iseguradoras` (`ceseguradora`) USING BTREE,
  CONSTRAINT `segurosce1` FOREIGN KEY (`ceseguradora`) REFERENCES `seguradoras` (`cpseguradora`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `segurosce2` FOREIGN KEY (`ceveiculo`) REFERENCES `veiculos` (`cpveiculo`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Cadastro dos Seguros feitos para os veiculos.';

-- Copiando dados para a tabela ilp54020212t.seguros: ~30 rows (aproximadamente)
/*!40000 ALTER TABLE `seguros` DISABLE KEYS */;
INSERT INTO `seguros` (`cpnumeroapolice`, `ceveiculo`, `ceseguradora`, `dtcontratacao`, `dtlimitecobertura`, `vlcobertura`, `dtcadseguro`) VALUES
	(1, 11, 1, '2015-06-26', '2016-06-26', 45000.00, '2015-06-27'),
	(2, 12, 1, '2015-06-27', '2016-06-27', 45000.00, '2015-06-28'),
	(3, 13, 1, '2015-06-28', '2016-06-28', 45000.00, '2015-06-29'),
	(4, 14, 1, '2015-06-29', '2016-06-29', 54000.00, '2015-06-30'),
	(5, 15, 1, '2015-06-30', '2016-06-30', 45000.00, '2015-07-01'),
	(6, 16, 1, '2015-07-01', '2016-07-01', 45000.00, '2015-07-02'),
	(7, 17, 1, '2015-07-02', '2016-07-02', 45000.00, '2015-07-03'),
	(8, 18, 1, '2015-07-03', '2016-07-03', 45000.00, '2015-07-04'),
	(9, 20, 1, '2015-07-05', '2016-07-05', 45000.00, '2015-07-06'),
	(10, 21, 1, '2015-07-06', '2016-07-06', 45000.00, '2015-07-07'),
	(12, 13, 2, '2015-06-28', '2016-06-28', 45000.00, '2015-06-29'),
	(13, 14, 2, '2015-06-29', '2016-06-29', 45000.00, '2015-06-30'),
	(14, 15, 2, '2015-06-30', '2016-06-30', 45000.00, '2015-07-01'),
	(15, 16, 2, '2015-07-01', '2016-07-01', 45000.00, '2015-07-02'),
	(16, 17, 2, '2015-07-02', '2016-07-02', 45000.00, '2015-07-03'),
	(17, 18, 2, '2015-07-03', '2016-07-03', 45000.00, '2015-07-04'),
	(18, 20, 2, '2015-07-05', '2016-07-05', 45000.00, '2015-07-06'),
	(19, 21, 2, '2015-07-06', '2016-07-06', 45000.00, '2015-07-07'),
	(20, 13, 3, '2015-06-28', '2016-06-28', 45000.00, '2015-06-29'),
	(22, 15, 3, '2015-06-30', '2016-06-30', 45000.00, '2015-07-01'),
	(23, 16, 3, '2015-07-01', '2016-07-01', 45000.00, '2015-07-02'),
	(24, 17, 3, '2015-07-02', '2016-07-02', 45000.00, '2015-07-03'),
	(25, 18, 3, '2015-07-03', '2016-07-03', 45000.00, '2015-07-04'),
	(26, 20, 3, '2015-07-05', '2016-07-05', 45000.00, '2015-07-06'),
	(27, 21, 3, '2015-07-06', '2016-07-06', 45000.00, '2015-07-07'),
	(28, 18, 8, '2015-07-03', '2016-07-03', 45000.00, '2015-07-04'),
	(29, 20, 8, '2015-07-05', '2016-07-05', 45000.00, '2015-07-06'),
	(30, 21, 8, '2015-07-06', '2016-07-06', 45000.00, '2015-07-07'),
	(31, 14, 3, '2017-12-10', '2018-12-10', 25000.00, '2018-12-10'),
	(32, 10, 1, '2017-02-01', '2018-02-01', 15000.00, '2017-02-01');
/*!40000 ALTER TABLE `seguros` ENABLE KEYS */;

-- Copiando estrutura para tabela ilp54020212t.servicos
DROP TABLE IF EXISTS `servicos`;
CREATE TABLE IF NOT EXISTS `servicos` (
  `cpservico` smallint(5) unsigned NOT NULL COMMENT 'PK da Tabela.',
  `txnomeservico` varchar(90) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Nome completo e sem abreviações',
  `txdescricao` varchar(250) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Texto descrevendo o setor de atuação',
  `dtcadservico` date NOT NULL COMMENT 'Data de geração do registro',
  PRIMARY KEY (`cpservico`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Cadastro dos Serviços de Manutenção feitos pelas oficinas nos veículos dos funcionários. ';

-- Copiando dados para a tabela ilp54020212t.servicos: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `servicos` DISABLE KEYS */;
INSERT INTO `servicos` (`cpservico`, `txnomeservico`, `txdescricao`, `dtcadservico`) VALUES
	(1, 'Troca de amortecedores', 'Avaliação e troca de amortecedores de veículos', '2018-02-01'),
	(2, 'Troca de Pneus', 'Avaliação e troca dos pneus', '2018-02-01'),
	(3, 'Balanceamento de rodas de carros', 'Balanceamento de rodas de carros ou veículos leves', '2018-02-01'),
	(4, 'Troca de funilaria', 'Troca de peças inteiras da funilaria de veículos', '2018-02-01');
/*!40000 ALTER TABLE `servicos` ENABLE KEYS */;

-- Copiando estrutura para tabela ilp54020212t.sinistros
DROP TABLE IF EXISTS `sinistros`;
CREATE TABLE IF NOT EXISTS `sinistros` (
  `cpsinistro` int(4) NOT NULL,
  `txnomesinistro` varchar(90) COLLATE utf8_bin NOT NULL,
  `txdescricao` varchar(250) COLLATE utf8_bin NOT NULL,
  `dtcadsinistro` date NOT NULL,
  PRIMARY KEY (`cpsinistro`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Cadastro dos Sinistros (ocorrências que podem gerar abertura de pedidos para restaurar valores de seguros).';

-- Copiando dados para a tabela ilp54020212t.sinistros: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `sinistros` DISABLE KEYS */;
INSERT INTO `sinistros` (`cpsinistro`, `txnomesinistro`, `txdescricao`, `dtcadsinistro`) VALUES
	(1, 'Colisão de veículo com bem público ou de terceiro', 'Veículo colide com bens públicos ou de terceiros', '2018-02-02'),
	(2, 'Colisão de veículos sem dano de terceiro', 'Veículo colide com outro veículo somente causando dano ao outro veículo.', '2018-02-02'),
	(3, 'Colisão de veículos com dano de terceiro', 'Veículo colide com outro veículo causando dano ao outro veículo, bem público ou de terceiro.', '2018-02-02'),
	(4, 'Atropelamento sem vítima fatal', 'Atropelamento sem vítimas fatais', '2018-02-02'),
	(5, 'Atropelamento com vítima fatal', 'Atropelamento com vítimas fatais', '2018-02-02');
/*!40000 ALTER TABLE `sinistros` ENABLE KEYS */;

-- Copiando estrutura para tabela ilp54020212t.sinistrosveiculos
DROP TABLE IF EXISTS `sinistrosveiculos`;
CREATE TABLE IF NOT EXISTS `sinistrosveiculos` (
  `cpocorrencia` int(4) NOT NULL,
  `cesinistro` int(4) NOT NULL,
  `ceveiculo` int(6) unsigned NOT NULL,
  `cenumeroapolice` int(7) NOT NULL,
  `celogradouroprincipal` bigint(20) unsigned DEFAULT NULL,
  `celogradourosecundario` bigint(20) unsigned DEFAULT NULL,
  `dtcadsinistroveiculo` date NOT NULL,
  PRIMARY KEY (`cpocorrencia`) USING BTREE,
  KEY `isinistros` (`cesinistro`) USING BTREE,
  KEY `iveiculos` (`ceveiculo`) USING BTREE,
  KEY `iseguros` (`cenumeroapolice`) USING BTREE,
  KEY `ilogradouros1` (`celogradouroprincipal`) USING BTREE,
  KEY `ilogradouros2` (`celogradourosecundario`) USING BTREE,
  CONSTRAINT `sinistrosveiculosce1` FOREIGN KEY (`cenumeroapolice`) REFERENCES `seguros` (`cpnumeroapolice`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sinistrosveiculosce2` FOREIGN KEY (`cesinistro`) REFERENCES `sinistros` (`cpsinistro`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sinistrosveiculosce3` FOREIGN KEY (`ceveiculo`) REFERENCES `veiculos` (`cpveiculo`) ON UPDATE CASCADE,
  CONSTRAINT `sinistrosveiculosce4` FOREIGN KEY (`celogradouroprincipal`) REFERENCES `logradouros` (`cplogradouro`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `sinistrosveiculosce5` FOREIGN KEY (`celogradourosecundario`) REFERENCES `logradouros` (`cplogradouro`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Cadastro dos Sinistros ocorridos com veiculos.';

-- Copiando dados para a tabela ilp54020212t.sinistrosveiculos: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `sinistrosveiculos` DISABLE KEYS */;
INSERT INTO `sinistrosveiculos` (`cpocorrencia`, `cesinistro`, `ceveiculo`, `cenumeroapolice`, `celogradouroprincipal`, `celogradourosecundario`, `dtcadsinistroveiculo`) VALUES
	(1, 1, 8, 7, 2, 20, '2018-10-25'),
	(2, 2, 1, 3, 24, 12, '2018-10-25'),
	(3, 3, 13, 1, 12, 14, '2018-10-25'),
	(4, 1, 14, 8, 15, 26, '2018-10-25'),
	(5, 5, 1, 31, 14, 14, '2018-12-10'),
	(6, 5, 10, 14, 14, NULL, '2021-04-20'),
	(7, 3, 7, 1, 11, NULL, '2015-04-01');
/*!40000 ALTER TABLE `sinistrosveiculos` ENABLE KEYS */;

-- Copiando estrutura para tabela ilp54020212t.usaservicos
DROP TABLE IF EXISTS `usaservicos`;
CREATE TABLE IF NOT EXISTS `usaservicos` (
  `cpusaservico` bigint(20) unsigned NOT NULL,
  `ceveiculo` int(10) unsigned DEFAULT NULL,
  `cefeitospor` smallint(5) unsigned DEFAULT NULL,
  `dtinicio` date DEFAULT NULL,
  `dttermino` date DEFAULT NULL,
  `dtcadusaservico` date DEFAULT NULL,
  PRIMARY KEY (`cpusaservico`),
  KEY `usaservicosce1` (`ceveiculo`),
  KEY `usaservicosce2` (`cefeitospor`),
  CONSTRAINT `usaservicosce1` FOREIGN KEY (`ceveiculo`) REFERENCES `veiculos` (`cpveiculo`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `usaservicosce2` FOREIGN KEY (`cefeitospor`) REFERENCES `feitospor` (`cpfeitospor`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Cadastro dos serviços feitos oficinas usados por veículos dos funcionários. ';

-- Copiando dados para a tabela ilp54020212t.usaservicos: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `usaservicos` DISABLE KEYS */;
INSERT INTO `usaservicos` (`cpusaservico`, `ceveiculo`, `cefeitospor`, `dtinicio`, `dttermino`, `dtcadusaservico`) VALUES
	(1, 1, 13, '2017-10-20', '2017-11-25', '2018-01-20'),
	(2, 2, 13, '2017-10-20', '2017-11-25', '2018-01-20'),
	(3, 3, 13, '2017-10-20', '2017-11-25', '2018-01-20'),
	(4, 4, 13, '2017-10-20', '2017-11-25', '2018-01-20'),
	(5, 5, 13, '2017-10-20', '2017-11-25', '2018-01-20'),
	(6, 6, 13, '2017-10-20', '2017-11-25', '2018-01-20'),
	(7, 7, 13, '2017-10-20', '2017-11-25', '2018-01-20'),
	(8, 8, 13, '2017-10-20', '2017-11-25', '2018-01-20'),
	(9, 9, 13, '2017-10-20', '2017-11-25', '2018-01-20'),
	(10, 10, 13, '2017-10-20', '2017-11-25', '2018-01-20'),
	(11, 11, 13, '2017-10-20', '2017-11-25', '2018-01-20'),
	(12, 12, 13, '2017-10-20', '2017-11-25', '2018-01-20'),
	(13, 13, 13, '2017-10-20', '2017-11-25', '2018-01-20'),
	(14, 14, 13, '2017-10-20', '2017-11-25', '2018-01-20'),
	(15, 15, 13, '2017-10-20', '2017-11-25', '2018-01-20'),
	(16, 16, 13, '2017-10-20', '2017-11-25', '2018-01-20'),
	(17, 17, 13, '2017-10-20', '2017-11-25', '2018-01-20'),
	(18, 18, 13, '2017-10-20', '2017-11-25', '2018-01-20'),
	(19, 20, 13, '2017-10-20', '2017-11-25', '2018-01-20'),
	(20, 21, 13, '2017-10-20', '2017-11-25', '2018-01-20'),
	(21, 1, 14, '2017-10-20', '2017-11-25', '2018-01-20'),
	(22, 2, 14, '2017-10-20', '2017-11-25', '2018-01-20'),
	(23, 3, 14, '2017-10-20', '2017-11-25', '2018-01-20'),
	(24, 4, 14, '2017-10-20', '2017-11-25', '2018-01-20'),
	(25, 5, 14, '2017-10-20', '2017-11-25', '2018-01-20'),
	(26, 6, 14, '2017-10-20', '2017-11-25', '2018-01-20'),
	(27, 7, 14, '2017-10-20', '2017-11-25', '2018-01-20'),
	(28, 8, 14, '2017-10-20', '2017-11-25', '2018-01-20'),
	(29, 9, 14, '2017-10-20', '2017-11-25', '2018-01-20'),
	(30, 10, 14, '2017-10-20', '2017-11-25', '2018-01-20'),
	(31, 11, 14, '2017-10-20', '2017-11-25', '2018-01-20'),
	(32, 12, 14, '2017-10-20', '2017-11-25', '2018-01-20'),
	(33, 13, 14, '2017-10-20', '2017-11-25', '2018-01-20'),
	(34, 14, 14, '2017-10-20', '2017-11-25', '2018-01-20'),
	(35, 15, 14, '2017-10-20', '2017-11-25', '2018-01-20'),
	(36, 16, 14, '2017-10-20', '2017-11-25', '2018-01-20'),
	(37, 17, 14, '2017-10-20', '2017-11-25', '2018-01-20'),
	(38, 18, 14, '2017-10-20', '2017-11-25', '2018-01-20'),
	(39, 20, 14, '2017-10-20', '2017-11-25', '2018-01-20'),
	(40, 21, 14, '2017-10-20', '2017-11-25', '2018-01-20'),
	(41, 1, 15, '2017-10-20', '2017-11-25', '2018-01-20'),
	(42, 2, 15, '2017-10-20', '2017-11-25', '2018-01-20'),
	(43, 3, 15, '2017-10-20', '2017-11-25', '2018-01-20'),
	(44, 4, 15, '2017-10-20', '2017-11-25', '2018-01-20'),
	(45, 5, 15, '2017-10-20', '2017-11-25', '2018-01-20'),
	(46, 6, 15, '2017-10-20', '2017-11-25', '2018-01-20'),
	(47, 7, 15, '2017-10-20', '2017-11-25', '2018-01-20'),
	(48, 8, 15, '2017-10-20', '2017-11-25', '2018-01-20'),
	(49, 9, 15, '2017-10-20', '2017-11-25', '2018-01-20'),
	(50, 10, 15, '2017-10-20', '2017-11-25', '2018-01-20'),
	(51, 11, 15, '2017-10-20', '2017-11-25', '2018-01-20'),
	(52, 12, 15, '2017-10-20', '2017-11-25', '2018-01-20'),
	(53, 13, 15, '2017-10-20', '2017-11-25', '2018-01-20'),
	(54, 14, 15, '2017-10-20', '2017-11-25', '2018-01-20'),
	(55, 15, 15, '2017-10-20', '2017-11-25', '2018-01-20'),
	(56, 16, 15, '2017-10-20', '2017-11-25', '2018-01-20'),
	(57, 17, 15, '2017-10-20', '2017-11-25', '2018-01-20'),
	(58, 18, 15, '2017-10-20', '2017-11-25', '2018-01-20'),
	(59, 20, 15, '2017-10-20', '2017-11-25', '2018-01-20'),
	(60, 21, 15, '2017-10-20', '2017-11-25', '2018-01-20'),
	(61, 1, 16, '2017-10-20', '2017-11-25', '2018-01-20'),
	(62, 2, 16, '2017-10-20', '2017-11-25', '2018-01-20'),
	(63, 3, 16, '2017-10-20', '2017-11-25', '2018-01-20'),
	(64, 4, 16, '2017-10-20', '2017-11-25', '2018-01-20'),
	(65, 5, 16, '2017-10-20', '2017-11-25', '2018-01-20'),
	(66, 6, 16, '2017-10-20', '2017-11-25', '2018-01-20'),
	(67, 7, 16, '2017-10-20', '2017-11-25', '2018-01-20'),
	(68, 8, 16, '2017-10-20', '2017-11-25', '2018-01-20'),
	(69, 9, 16, '2017-10-20', '2017-11-25', '2018-01-20'),
	(70, 10, 16, '2017-10-20', '2017-11-25', '2018-01-20'),
	(71, 11, 16, '2017-10-20', '2017-11-25', '2018-01-20'),
	(72, 12, 16, '2017-10-20', '2017-11-25', '2018-01-20'),
	(73, 13, 16, '2017-10-20', '2017-11-25', '2018-01-20'),
	(74, 14, 16, '2017-10-20', '2017-11-25', '2018-01-20'),
	(75, 15, 16, '2017-10-20', '2017-11-25', '2018-01-20'),
	(76, 16, 16, '2017-10-20', '2017-11-25', '2018-01-20'),
	(77, 17, 16, '2017-10-20', '2017-11-25', '2018-01-20'),
	(78, 18, 16, '2017-10-20', '2017-11-25', '2018-01-20'),
	(79, 20, 16, '2017-10-20', '2017-11-25', '2018-01-20'),
	(80, 21, 16, '2017-10-20', '2017-11-25', '2018-01-20'),
	(81, 1, 1, '2017-10-20', '2017-11-25', '2018-01-20'),
	(82, 2, 1, '2017-10-20', '2017-11-25', '2018-01-20'),
	(83, 3, 1, '2017-10-20', '2017-11-25', '2018-01-20'),
	(84, 4, 1, '2017-10-20', '2017-11-25', '2018-01-20'),
	(85, 5, 1, '2017-10-20', '2017-11-25', '2018-01-20'),
	(86, 6, 1, '2017-10-20', '2017-11-25', '2018-01-20'),
	(87, 7, 1, '2017-10-20', '2017-11-25', '2018-01-20'),
	(88, 8, 1, '2017-10-20', '2017-11-25', '2018-01-20'),
	(89, 9, 1, '2017-10-20', '2017-11-25', '2018-01-20'),
	(90, 10, 1, '2017-10-20', '2017-11-25', '2018-01-20'),
	(91, 11, 1, '2017-10-20', '2017-11-25', '2018-01-20'),
	(92, 12, 1, '2017-10-20', '2017-11-25', '2018-01-20'),
	(93, 13, 1, '2017-10-20', '2017-11-25', '2018-01-20'),
	(94, 14, 1, '2017-10-20', '2017-11-25', '2018-01-20'),
	(95, 15, 1, '2017-10-20', '2017-11-25', '2018-01-20'),
	(96, 16, 1, '2017-10-20', '2017-11-25', '2018-01-20'),
	(97, 17, 1, '2017-10-20', '2017-11-25', '2018-01-20'),
	(98, 18, 1, '2017-10-20', '2017-11-25', '2018-01-20'),
	(99, 20, 1, '2017-10-20', '2017-11-25', '2018-01-20'),
	(100, 21, 1, '2017-10-20', '2017-11-25', '2018-01-20'),
	(101, 1, 2, '2017-10-20', '2017-11-25', '2018-01-20'),
	(102, 2, 2, '2017-10-20', '2017-11-25', '2018-01-20'),
	(103, 3, 2, '2017-10-20', '2017-11-25', '2018-01-20'),
	(104, 4, 2, '2017-10-20', '2017-11-25', '2018-01-20'),
	(105, 5, 2, '2017-10-20', '2017-11-25', '2018-01-20'),
	(106, 6, 2, '2017-10-20', '2017-11-25', '2018-01-20'),
	(107, 7, 2, '2017-10-20', '2017-11-25', '2018-01-20'),
	(108, 8, 2, '2017-10-20', '2017-11-25', '2018-01-20'),
	(109, 9, 2, '2017-10-20', '2017-11-25', '2018-01-20'),
	(110, 10, 2, '2017-10-20', '2017-11-25', '2018-01-20'),
	(111, 11, 2, '2017-10-20', '2017-11-25', '2018-01-20'),
	(112, 12, 2, '2017-10-20', '2017-11-25', '2018-01-20'),
	(113, 13, 2, '2017-10-20', '2017-11-25', '2018-01-20'),
	(114, 14, 2, '2017-10-20', '2017-11-25', '2018-01-20'),
	(115, 15, 2, '2017-10-20', '2017-11-25', '2018-01-20'),
	(116, 16, 2, '2017-10-20', '2017-11-25', '2018-01-20'),
	(117, 17, 2, '2017-10-20', '2017-11-25', '2018-01-20'),
	(118, 18, 2, '2017-10-20', '2017-11-25', '2018-01-20'),
	(119, 20, 2, '2017-10-20', '2017-11-25', '2018-01-20'),
	(120, 21, 2, '2017-10-20', '2017-11-25', '2018-01-20'),
	(121, 1, 3, '2017-10-20', '2017-11-25', '2018-01-20'),
	(122, 2, 3, '2017-10-20', '2017-11-25', '2018-01-20'),
	(123, 3, 3, '2017-10-20', '2017-11-25', '2018-01-20'),
	(124, 4, 3, '2017-10-20', '2017-11-25', '2018-01-20'),
	(125, 5, 3, '2017-10-20', '2017-11-25', '2018-01-20'),
	(126, 6, 3, '2017-10-20', '2017-11-25', '2018-01-20'),
	(127, 7, 3, '2017-10-20', '2017-11-25', '2018-01-20'),
	(128, 8, 3, '2017-10-20', '2017-11-25', '2018-01-20'),
	(129, 9, 3, '2017-10-20', '2017-11-25', '2018-01-20'),
	(130, 10, 3, '2017-10-20', '2017-11-25', '2018-01-20'),
	(131, 11, 3, '2017-10-20', '2017-11-25', '2018-01-20'),
	(132, 12, 3, '2017-10-20', '2017-11-25', '2018-01-20'),
	(133, 13, 3, '2017-10-20', '2017-11-25', '2018-01-20'),
	(134, 14, 3, '2017-10-20', '2017-11-25', '2018-01-20'),
	(135, 15, 3, '2017-10-20', '2017-11-25', '2018-01-20'),
	(136, 16, 3, '2017-10-20', '2017-11-25', '2018-01-20'),
	(137, 17, 3, '2017-10-20', '2017-11-25', '2018-01-20'),
	(138, 18, 3, '2017-10-20', '2017-11-25', '2018-01-20'),
	(139, 20, 3, '2017-10-20', '2017-11-25', '2018-01-20'),
	(140, 21, 3, '2017-10-20', '2017-11-25', '2018-01-20'),
	(141, 1, 4, '2017-10-20', '2017-11-25', '2018-01-20'),
	(142, 2, 4, '2017-10-20', '2017-11-25', '2018-01-20'),
	(143, 3, 4, '2017-10-20', '2017-11-25', '2018-01-20'),
	(144, 4, 4, '2017-10-20', '2017-11-25', '2018-01-20'),
	(145, 5, 4, '2017-10-20', '2017-11-25', '2018-01-20'),
	(146, 6, 4, '2017-10-20', '2017-11-25', '2018-01-20'),
	(147, 7, 4, '2017-10-20', '2017-11-25', '2018-01-20'),
	(148, 8, 4, '2017-10-20', '2017-11-25', '2018-01-20'),
	(149, 9, 4, '2017-10-20', '2017-11-25', '2018-01-20'),
	(150, 10, 4, '2017-10-20', '2017-11-25', '2018-01-20'),
	(151, 11, 4, '2017-10-20', '2017-11-25', '2018-01-20'),
	(152, 12, 4, '2017-10-20', '2017-11-25', '2018-01-20'),
	(153, 13, 4, '2017-10-20', '2017-11-25', '2018-01-20'),
	(154, 14, 4, '2017-10-20', '2017-11-25', '2018-01-20'),
	(155, 15, 4, '2017-10-20', '2017-11-25', '2018-01-20'),
	(156, 16, 4, '2017-10-20', '2017-11-25', '2018-01-20'),
	(157, 17, 4, '2017-10-20', '2017-11-25', '2018-01-20'),
	(158, 18, 4, '2017-10-20', '2017-11-25', '2018-01-20'),
	(159, 20, 4, '2017-10-20', '2017-11-25', '2018-01-20'),
	(160, 21, 4, '2017-10-20', '2017-11-25', '2018-01-20'),
	(161, 1, 17, '2017-10-20', '2017-11-25', '2018-01-20'),
	(162, 2, 17, '2017-10-20', '2017-11-25', '2018-01-20'),
	(163, 3, 17, '2017-10-20', '2017-11-25', '2018-01-20'),
	(164, 4, 17, '2017-10-20', '2017-11-25', '2018-01-20'),
	(165, 5, 17, '2017-10-20', '2017-11-25', '2018-01-20'),
	(166, 6, 17, '2017-10-20', '2017-11-25', '2018-01-20'),
	(167, 7, 17, '2017-10-20', '2017-11-25', '2018-01-20'),
	(168, 8, 17, '2017-10-20', '2017-11-25', '2018-01-20'),
	(169, 9, 17, '2017-10-20', '2017-11-25', '2018-01-20'),
	(170, 10, 17, '2017-10-20', '2017-11-25', '2018-01-20'),
	(171, 11, 17, '2017-10-20', '2017-11-25', '2018-01-20'),
	(172, 12, 17, '2017-10-20', '2017-11-25', '2018-01-20'),
	(173, 13, 17, '2017-10-20', '2017-11-25', '2018-01-20'),
	(174, 14, 17, '2017-10-20', '2017-11-25', '2018-01-20'),
	(175, 15, 17, '2017-10-20', '2017-11-25', '2018-01-20'),
	(176, 16, 17, '2017-10-20', '2017-11-25', '2018-01-20'),
	(177, 17, 17, '2017-10-20', '2017-11-25', '2018-01-20'),
	(178, 18, 17, '2017-10-20', '2017-11-25', '2018-01-20'),
	(179, 20, 17, '2017-10-20', '2017-11-25', '2018-01-20'),
	(180, 21, 17, '2017-10-20', '2017-11-25', '2018-01-20'),
	(181, 1, 18, '2017-10-20', '2017-11-25', '2018-01-20'),
	(182, 2, 18, '2017-10-20', '2017-11-25', '2018-01-20'),
	(183, 3, 18, '2017-10-20', '2017-11-25', '2018-01-20'),
	(184, 4, 18, '2017-10-20', '2017-11-25', '2018-01-20'),
	(185, 5, 18, '2017-10-20', '2017-11-25', '2018-01-20'),
	(186, 6, 18, '2017-10-20', '2017-11-25', '2018-01-20'),
	(187, 7, 18, '2017-10-20', '2017-11-25', '2018-01-20'),
	(188, 8, 18, '2017-10-20', '2017-11-25', '2018-01-20'),
	(189, 9, 18, '2017-10-20', '2017-11-25', '2018-01-20'),
	(190, 10, 18, '2017-10-20', '2017-11-25', '2018-01-20'),
	(191, 11, 18, '2017-10-20', '2017-11-25', '2018-01-20'),
	(192, 12, 18, '2017-10-20', '2017-11-25', '2018-01-20'),
	(193, 13, 18, '2017-10-20', '2017-11-25', '2018-01-20'),
	(194, 14, 18, '2017-10-20', '2017-11-25', '2018-01-20'),
	(195, 15, 18, '2017-10-20', '2017-11-25', '2018-01-20'),
	(196, 16, 18, '2017-10-20', '2017-11-25', '2018-01-20'),
	(197, 17, 18, '2017-10-20', '2017-11-25', '2018-01-20'),
	(198, 18, 18, '2017-10-20', '2017-11-25', '2018-01-20'),
	(199, 20, 18, '2017-10-20', '2017-11-25', '2018-01-20'),
	(200, 21, 18, '2017-10-20', '2017-11-25', '2018-01-20'),
	(201, 1, 19, '2017-10-20', '2017-11-25', '2018-01-20'),
	(202, 2, 19, '2017-10-20', '2017-11-25', '2018-01-20'),
	(203, 3, 19, '2017-10-20', '2017-11-25', '2018-01-20'),
	(204, 4, 19, '2017-10-20', '2017-11-25', '2018-01-20'),
	(205, 5, 19, '2017-10-20', '2017-11-25', '2018-01-20'),
	(206, 6, 19, '2017-10-20', '2017-11-25', '2018-01-20'),
	(207, 7, 19, '2017-10-20', '2017-11-25', '2018-01-20'),
	(208, 8, 19, '2017-10-20', '2017-11-25', '2018-01-20'),
	(209, 9, 19, '2017-10-20', '2017-11-25', '2018-01-20'),
	(210, 10, 19, '2017-10-20', '2017-11-25', '2018-01-20'),
	(211, 11, 19, '2017-10-20', '2017-11-25', '2018-01-20'),
	(212, 12, 19, '2017-10-20', '2017-11-25', '2018-01-20'),
	(213, 13, 19, '2017-10-20', '2017-11-25', '2018-01-20'),
	(214, 14, 19, '2017-10-20', '2017-11-25', '2018-01-20'),
	(215, 15, 19, '2017-10-20', '2017-11-25', '2018-01-20'),
	(216, 16, 19, '2017-10-20', '2017-11-25', '2018-01-20'),
	(217, 17, 19, '2017-10-20', '2017-11-25', '2018-01-20'),
	(218, 18, 19, '2017-10-20', '2017-11-25', '2018-01-20'),
	(219, 20, 19, '2017-10-20', '2017-11-25', '2018-01-20'),
	(220, 21, 19, '2017-10-20', '2017-11-25', '2018-01-20'),
	(221, 1, 20, '2017-10-20', '2017-11-25', '2018-01-20'),
	(222, 2, 20, '2017-10-20', '2017-11-25', '2018-01-20'),
	(223, 3, 20, '2017-10-20', '2017-11-25', '2018-01-20'),
	(224, 4, 20, '2017-10-20', '2017-11-25', '2018-01-20'),
	(225, 5, 20, '2017-10-20', '2017-11-25', '2018-01-20'),
	(226, 6, 20, '2017-10-20', '2017-11-25', '2018-01-20'),
	(227, 7, 20, '2017-10-20', '2017-11-25', '2018-01-20'),
	(228, 8, 20, '2017-10-20', '2017-11-25', '2018-01-20'),
	(229, 9, 20, '2017-10-20', '2017-11-25', '2018-01-20'),
	(230, 10, 20, '2017-10-20', '2017-11-25', '2018-01-20'),
	(231, 11, 20, '2017-10-20', '2017-11-25', '2018-01-20'),
	(232, 12, 20, '2017-10-20', '2017-11-25', '2018-01-20'),
	(233, 13, 20, '2017-10-20', '2017-11-25', '2018-01-20'),
	(234, 14, 20, '2017-10-20', '2017-11-25', '2018-01-20'),
	(235, 15, 20, '2017-10-20', '2017-11-25', '2018-01-20'),
	(236, 16, 20, '2017-10-20', '2017-11-25', '2018-01-20'),
	(237, 17, 20, '2017-10-20', '2017-11-25', '2018-01-20'),
	(238, 18, 20, '2017-10-20', '2017-11-25', '2018-01-20'),
	(239, 20, 20, '2017-10-20', '2017-11-25', '2018-01-20'),
	(240, 21, 20, '2017-10-20', '2017-11-25', '2018-01-20'),
	(241, 1, 9, '2017-10-20', '2017-11-25', '2018-01-20'),
	(242, 2, 9, '2017-10-20', '2017-11-25', '2018-01-20'),
	(243, 3, 9, '2017-10-20', '2017-11-25', '2018-01-20'),
	(244, 4, 9, '2017-10-20', '2017-11-25', '2018-01-20'),
	(245, 5, 9, '2017-10-20', '2017-11-25', '2018-01-20'),
	(246, 6, 9, '2017-10-20', '2017-11-25', '2018-01-20'),
	(247, 7, 9, '2017-10-20', '2017-11-25', '2018-01-20'),
	(248, 8, 9, '2017-10-20', '2017-11-25', '2018-01-20'),
	(249, 9, 9, '2017-10-20', '2017-11-25', '2018-01-20'),
	(250, 10, 9, '2017-10-20', '2017-11-25', '2018-01-20'),
	(251, 11, 9, '2017-10-20', '2017-11-25', '2018-01-20'),
	(252, 12, 9, '2017-10-20', '2017-11-25', '2018-01-20'),
	(253, 13, 9, '2017-10-20', '2017-11-25', '2018-01-20'),
	(254, 14, 9, '2017-10-20', '2017-11-25', '2018-01-20'),
	(255, 15, 9, '2017-10-20', '2017-11-25', '2018-01-20'),
	(256, 16, 9, '2017-10-20', '2017-11-25', '2018-01-20'),
	(257, 17, 9, '2017-10-20', '2017-11-25', '2018-01-20'),
	(258, 18, 9, '2017-10-20', '2017-11-25', '2018-01-20'),
	(259, 20, 9, '2017-10-20', '2017-11-25', '2018-01-20'),
	(260, 21, 9, '2017-10-20', '2017-11-25', '2018-01-20'),
	(261, 1, 10, '2017-10-20', '2017-11-25', '2018-01-20'),
	(262, 2, 10, '2017-10-20', '2017-11-25', '2018-01-20'),
	(263, 3, 10, '2017-10-20', '2017-11-25', '2018-01-20'),
	(264, 4, 10, '2017-10-20', '2017-11-25', '2018-01-20'),
	(265, 5, 10, '2017-10-20', '2017-11-25', '2018-01-20'),
	(266, 6, 10, '2017-10-20', '2017-11-25', '2018-01-20'),
	(267, 7, 10, '2017-10-20', '2017-11-25', '2018-01-20'),
	(268, 8, 10, '2017-10-20', '2017-11-25', '2018-01-20'),
	(269, 9, 10, '2017-10-20', '2017-11-25', '2018-01-20'),
	(270, 10, 10, '2017-10-20', '2017-11-25', '2018-01-20'),
	(271, 11, 10, '2017-10-20', '2017-11-25', '2018-01-20'),
	(272, 12, 10, '2017-10-20', '2017-11-25', '2018-01-20'),
	(273, 13, 10, '2017-10-20', '2017-11-25', '2018-01-20'),
	(274, 14, 10, '2017-10-20', '2017-11-25', '2018-01-20'),
	(275, 15, 10, '2017-10-20', '2017-11-25', '2018-01-20'),
	(276, 16, 10, '2017-10-20', '2017-11-25', '2018-01-20'),
	(277, 17, 10, '2017-10-20', '2017-11-25', '2018-01-20'),
	(278, 18, 10, '2017-10-20', '2017-11-25', '2018-01-20'),
	(279, 20, 10, '2017-10-20', '2017-11-25', '2018-01-20'),
	(280, 21, 10, '2017-10-20', '2017-11-25', '2018-01-20'),
	(281, 1, 11, '2017-10-20', '2017-11-25', '2018-01-20'),
	(282, 2, 11, '2017-10-20', '2017-11-25', '2018-01-20'),
	(283, 3, 11, '2017-10-20', '2017-11-25', '2018-01-20'),
	(284, 4, 11, '2017-10-20', '2017-11-25', '2018-01-20'),
	(285, 5, 11, '2017-10-20', '2017-11-25', '2018-01-20'),
	(286, 6, 11, '2017-10-20', '2017-11-25', '2018-01-20'),
	(287, 7, 11, '2017-10-20', '2017-11-25', '2018-01-20'),
	(288, 8, 11, '2017-10-20', '2017-11-25', '2018-01-20'),
	(289, 9, 11, '2017-10-20', '2017-11-25', '2018-01-20'),
	(290, 10, 11, '2017-10-20', '2017-11-25', '2018-01-20'),
	(291, 11, 11, '2017-10-20', '2017-11-25', '2018-01-20'),
	(292, 12, 11, '2017-10-20', '2017-11-25', '2018-01-20'),
	(293, 13, 11, '2017-10-20', '2017-11-25', '2018-01-20'),
	(294, 14, 11, '2017-10-20', '2017-11-25', '2018-01-20'),
	(295, 15, 11, '2017-10-20', '2017-11-25', '2018-01-20'),
	(296, 16, 11, '2017-10-20', '2017-11-25', '2018-01-20'),
	(297, 17, 11, '2017-10-20', '2017-11-25', '2018-01-20'),
	(298, 18, 11, '2017-10-20', '2017-11-25', '2018-01-20'),
	(299, 20, 11, '2017-10-20', '2017-11-25', '2018-01-20'),
	(300, 21, 11, '2017-10-20', '2017-11-25', '2018-01-20'),
	(301, 1, 12, '2017-10-20', '2017-11-25', '2018-01-20'),
	(302, 2, 12, '2017-10-20', '2017-11-25', '2018-01-20'),
	(303, 3, 12, '2017-10-20', '2017-11-25', '2018-01-20'),
	(304, 4, 12, '2017-10-20', '2017-11-25', '2018-01-20'),
	(305, 5, 12, '2017-10-20', '2017-11-25', '2018-01-20'),
	(306, 6, 12, '2017-10-20', '2017-11-25', '2018-01-20'),
	(307, 7, 12, '2017-10-20', '2017-11-25', '2018-01-20'),
	(308, 8, 12, '2017-10-20', '2017-11-25', '2018-01-20'),
	(309, 9, 12, '2017-10-20', '2017-11-25', '2018-01-20'),
	(310, 10, 12, '2017-10-20', '2017-11-25', '2018-01-20'),
	(311, 11, 12, '2017-10-20', '2017-11-25', '2018-01-20'),
	(312, 12, 12, '2017-10-20', '2017-11-25', '2018-01-20'),
	(313, 13, 12, '2017-10-20', '2017-11-25', '2018-01-20'),
	(314, 14, 12, '2017-10-20', '2017-11-25', '2018-01-20'),
	(315, 15, 12, '2017-10-20', '2017-11-25', '2018-01-20'),
	(316, 16, 12, '2017-10-20', '2017-11-25', '2018-01-20'),
	(317, 17, 12, '2017-10-20', '2017-11-25', '2018-01-20'),
	(318, 18, 12, '2017-10-20', '2017-11-25', '2018-01-20'),
	(319, 20, 12, '2017-10-20', '2017-11-25', '2018-01-20'),
	(320, 21, 12, '2017-10-20', '2017-11-25', '2018-01-20'),
	(321, 1, 5, '2017-10-20', '2017-11-25', '2018-01-20'),
	(322, 2, 5, '2017-10-20', '2017-11-25', '2018-01-20'),
	(323, 3, 5, '2017-10-20', '2017-11-25', '2018-01-20'),
	(324, 4, 5, '2017-10-20', '2017-11-25', '2018-01-20'),
	(325, 5, 5, '2017-10-20', '2017-11-25', '2018-01-20'),
	(326, 6, 5, '2017-10-20', '2017-11-25', '2018-01-20'),
	(327, 7, 5, '2017-10-20', '2017-11-25', '2018-01-20'),
	(328, 8, 5, '2017-10-20', '2017-11-25', '2018-01-20'),
	(329, 9, 5, '2017-10-20', '2017-11-25', '2018-01-20'),
	(330, 10, 5, '2017-10-20', '2017-11-25', '2018-01-20'),
	(331, 11, 5, '2017-10-20', '2017-11-25', '2018-01-20'),
	(332, 12, 5, '2017-10-20', '2017-11-25', '2018-01-20'),
	(333, 13, 5, '2017-10-20', '2017-11-25', '2018-01-20'),
	(334, 14, 5, '2017-10-20', '2017-11-25', '2018-01-20'),
	(335, 15, 5, '2017-10-20', '2017-11-25', '2018-01-20'),
	(336, 16, 5, '2017-10-20', '2017-11-25', '2018-01-20'),
	(337, 17, 5, '2017-10-20', '2017-11-25', '2018-01-20'),
	(338, 18, 5, '2017-10-20', '2017-11-25', '2018-01-20'),
	(339, 20, 5, '2017-10-20', '2017-11-25', '2018-01-20'),
	(340, 21, 5, '2017-10-20', '2017-11-25', '2018-01-20'),
	(341, 1, 6, '2017-10-20', '2017-11-25', '2018-01-20'),
	(342, 2, 6, '2017-10-20', '2017-11-25', '2018-01-20'),
	(343, 3, 6, '2017-10-20', '2017-11-25', '2018-01-20'),
	(344, 4, 6, '2017-10-20', '2017-11-25', '2018-01-20'),
	(345, 5, 6, '2017-10-20', '2017-11-25', '2018-01-20'),
	(346, 6, 6, '2017-10-20', '2017-11-25', '2018-01-20'),
	(347, 7, 6, '2017-10-20', '2017-11-25', '2018-01-20'),
	(348, 8, 6, '2017-10-20', '2017-11-25', '2018-01-20'),
	(349, 9, 6, '2017-10-20', '2017-11-25', '2018-01-20'),
	(350, 10, 6, '2017-10-20', '2017-11-25', '2018-01-20'),
	(351, 11, 6, '2017-10-20', '2017-11-25', '2018-01-20'),
	(352, 12, 6, '2017-10-20', '2017-11-25', '2018-01-20'),
	(353, 13, 6, '2017-10-20', '2017-11-25', '2018-01-20'),
	(354, 14, 6, '2017-10-20', '2017-11-25', '2018-01-20'),
	(355, 15, 6, '2017-10-20', '2017-11-25', '2018-01-20'),
	(356, 16, 6, '2017-10-20', '2017-11-25', '2018-01-20'),
	(357, 17, 6, '2017-10-20', '2017-11-25', '2018-01-20'),
	(358, 18, 6, '2017-10-20', '2017-11-25', '2018-01-20'),
	(359, 20, 6, '2017-10-20', '2017-11-25', '2018-01-20'),
	(360, 21, 6, '2017-10-20', '2017-11-25', '2018-01-20'),
	(361, 1, 7, '2017-10-20', '2017-11-25', '2018-01-20'),
	(362, 2, 7, '2017-10-20', '2017-11-25', '2018-01-20'),
	(363, 3, 7, '2017-10-20', '2017-11-25', '2018-01-20'),
	(364, 4, 7, '2017-10-20', '2017-11-25', '2018-01-20'),
	(365, 5, 7, '2017-10-20', '2017-11-25', '2018-01-20'),
	(366, 6, 7, '2017-10-20', '2017-11-25', '2018-01-20'),
	(367, 7, 7, '2017-10-20', '2017-11-25', '2018-01-20'),
	(368, 8, 7, '2017-10-20', '2017-11-25', '2018-01-20'),
	(369, 9, 7, '2017-10-20', '2017-11-25', '2018-01-20'),
	(370, 10, 7, '2017-10-20', '2017-11-25', '2018-01-20'),
	(371, 11, 7, '2017-10-20', '2017-11-25', '2018-01-20'),
	(372, 12, 7, '2017-10-20', '2017-11-25', '2018-01-20'),
	(373, 13, 7, '2017-10-20', '2017-11-25', '2018-01-20'),
	(374, 14, 7, '2017-10-20', '2017-11-25', '2018-01-20'),
	(375, 15, 7, '2017-10-20', '2017-11-25', '2018-01-20'),
	(376, 16, 7, '2017-10-20', '2017-11-25', '2018-01-20'),
	(377, 17, 7, '2017-10-20', '2017-11-25', '2018-01-20'),
	(378, 18, 7, '2017-10-20', '2017-11-25', '2018-01-20'),
	(379, 20, 7, '2017-10-20', '2017-11-25', '2018-01-20'),
	(380, 21, 7, '2017-10-20', '2017-11-25', '2018-01-20'),
	(381, 1, 8, '2017-10-20', '2017-11-25', '2018-01-20'),
	(382, 2, 8, '2017-10-20', '2017-11-25', '2018-01-20'),
	(383, 3, 8, '2017-10-20', '2017-11-25', '2018-01-20'),
	(384, 4, 8, '2017-10-20', '2017-11-25', '2018-01-20'),
	(385, 5, 8, '2017-10-20', '2017-11-25', '2018-01-20'),
	(386, 6, 8, '2017-10-20', '2017-11-25', '2018-01-20'),
	(387, 7, 8, '2017-10-20', '2017-11-25', '2018-01-20'),
	(388, 8, 8, '2017-10-20', '2017-11-25', '2018-01-20'),
	(389, 9, 8, '2017-10-20', '2017-11-25', '2018-01-20'),
	(390, 10, 8, '2017-10-20', '2017-11-25', '2018-01-20'),
	(391, 11, 8, '2017-10-20', '2017-11-25', '2018-01-20'),
	(392, 12, 8, '2017-10-20', '2017-11-25', '2018-01-20'),
	(393, 13, 8, '2017-10-20', '2017-11-25', '2018-01-20'),
	(394, 14, 8, '2017-10-20', '2017-11-25', '2018-01-20'),
	(395, 15, 8, '2017-10-20', '2017-11-25', '2018-01-20'),
	(396, 16, 8, '2017-10-20', '2017-11-25', '2018-01-20'),
	(397, 17, 8, '2017-10-20', '2017-11-25', '2018-01-20'),
	(398, 18, 8, '2017-10-20', '2017-11-25', '2018-01-20'),
	(399, 20, 8, '2017-10-20', '2017-11-25', '2018-01-20'),
	(400, 21, 8, '2017-10-20', '2017-11-25', '2018-01-20');
/*!40000 ALTER TABLE `usaservicos` ENABLE KEYS */;

-- Copiando estrutura para tabela ilp54020212t.veiculos
DROP TABLE IF EXISTS `veiculos`;
CREATE TABLE IF NOT EXISTS `veiculos` (
  `cpveiculo` int(6) unsigned NOT NULL,
  `ccplaca` char(7) COLLATE utf8_bin NOT NULL,
  `cefuncionario` int(6) unsigned NOT NULL,
  `cetipoveiculo` tinyint(3) unsigned DEFAULT NULL,
  `cemodelo` int(4) DEFAULT NULL,
  `cecor` int(11) DEFAULT NULL,
  `aostatus` char(1) COLLATE utf8_bin NOT NULL,
  `nuanofabricacao` year(4) NOT NULL,
  `dtcadveiculo` date NOT NULL,
  PRIMARY KEY (`cpveiculo`) USING HASH,
  UNIQUE KEY `ukplaca` (`ccplaca`) USING BTREE,
  KEY `ifuncionarios` (`cefuncionario`) USING BTREE,
  KEY `imodelos` (`cemodelo`) USING BTREE,
  KEY `icores` (`cecor`) USING BTREE,
  KEY `veiculosce4` (`cetipoveiculo`),
  CONSTRAINT `veiculosce1` FOREIGN KEY (`cefuncionario`) REFERENCES `funcionarios` (`cpfuncionario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `veiculosce2` FOREIGN KEY (`cemodelo`) REFERENCES `modelosveiculos` (`cpmodelo`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `veiculosce3` FOREIGN KEY (`cecor`) REFERENCES `cores` (`cpcor`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `veiculosce4` FOREIGN KEY (`cetipoveiculo`) REFERENCES `veiculostipos` (`cptipoveiculo`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Cadastro dos veiculos';

-- Copiando dados para a tabela ilp54020212t.veiculos: ~22 rows (aproximadamente)
/*!40000 ALTER TABLE `veiculos` DISABLE KEYS */;
INSERT INTO `veiculos` (`cpveiculo`, `ccplaca`, `cefuncionario`, `cetipoveiculo`, `cemodelo`, `cecor`, `aostatus`, `nuanofabricacao`, `dtcadveiculo`) VALUES
	(1, 'ABC1234', 70, 6, 3, 3, 'P', '1996', '2009-01-10'),
	(2, 'ASD-234', 280, NULL, 4, NULL, 'S', '2010', '2012-10-10'),
	(3, 'WSX2345', 60, NULL, 1, NULL, 'S', '2005', '2005-10-10'),
	(4, 'QSC1234', 80, NULL, 4, NULL, 'S', '2010', '2014-03-13'),
	(5, 'WDV1234', 80, NULL, 4, NULL, 'S', '2010', '2014-03-13'),
	(6, 'RFV1234', 80, NULL, 4, NULL, 'P', '2010', '2014-03-13'),
	(7, 'TRG3424', 290, NULL, 1, NULL, 'S', '1998', '2014-05-26'),
	(8, 'HTE6789', 270, NULL, 1, NULL, 'S', '2005', '2014-05-26'),
	(9, 'WUH6512', 90, NULL, NULL, NULL, 'S', '2010', '2010-10-10'),
	(10, 'WSI9876', 100, NULL, NULL, NULL, 'S', '2010', '2010-10-10'),
	(11, 'QSD2346', 60, NULL, NULL, NULL, 'P', '2010', '2010-10-10'),
	(12, 'RFT5610', 150, NULL, NULL, NULL, 'P', '2012', '2012-06-25'),
	(13, 'QAW4598', 80, NULL, NULL, NULL, 'S', '2012', '2012-01-10'),
	(14, 'YHU7890', 150, NULL, NULL, NULL, 'S', '2012', '2012-05-23'),
	(15, 'QWS2387', 70, NULL, NULL, NULL, 'S', '2012', '2012-05-23'),
	(16, 'WCF6789', 150, NULL, NULL, NULL, 'S', '2010', '2010-10-10'),
	(17, 'WSD1245', 160, NULL, NULL, NULL, 'P', '2010', '2012-05-23'),
	(18, 'GTY4512', 170, NULL, NULL, NULL, 'S', '2011', '2011-02-20'),
	(20, 'QWE6546', 120, NULL, NULL, NULL, 'P', '2010', '2010-05-12'),
	(21, 'QYJ2309', 110, NULL, 3, NULL, 'P', '2011', '2010-10-10'),
	(22, 'QWE9890', 150, NULL, NULL, NULL, 'S', '2010', '2018-11-06'),
	(24, 'TRT7897', 460, 6, 6, 3, 'S', '1998', '2017-11-09');
/*!40000 ALTER TABLE `veiculos` ENABLE KEYS */;

-- Copiando estrutura para tabela ilp54020212t.veiculostipos
DROP TABLE IF EXISTS `veiculostipos`;
CREATE TABLE IF NOT EXISTS `veiculostipos` (
  `cptipoveiculo` tinyint(3) unsigned NOT NULL COMMENT 'CP da Tabela',
  `txdescricao` varchar(250) COLLATE utf8_bin NOT NULL COMMENT 'Texto descrevendo o tipo de veiculo (carro, caminhonete, motocicleta, etc)',
  `dtcadveiculotipo` date NOT NULL COMMENT 'Data de geração do registro',
  PRIMARY KEY (`cptipoveiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Cadastro dos tipos de veículos.';

-- Copiando dados para a tabela ilp54020212t.veiculostipos: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `veiculostipos` DISABLE KEYS */;
INSERT INTO `veiculostipos` (`cptipoveiculo`, `txdescricao`, `dtcadveiculotipo`) VALUES
	(1, 'Aquático movido à vela', '2018-02-01'),
	(2, 'Aquático movido à motor diesel', '2018-02-01'),
	(3, 'Aquático movido à motor de gasolina', '2018-02-01'),
	(4, 'Aquático movido à motor elétrico', '2018-02-01'),
	(5, 'Terrestre movido à motor diesel', '2018-02-01'),
	(6, 'Terrestre movido à motor de gasolina', '2018-02-01'),
	(7, 'Terrestre movido à motor elétrico', '2018-02-01'),
	(8, 'Aéreo movido à motor diesel', '2018-02-01'),
	(9, 'Aéreo movido à motor de gasolina', '2018-02-01'),
	(10, 'Aéreo movido à jato', '2018-02-01'),
	(11, 'Aéreo movido à motor de querosene', '2018-02-01');
/*!40000 ALTER TABLE `veiculostipos` ENABLE KEYS */;

-- Copiando estrutura para view ilp54020212t.logradourocompleto
DROP VIEW IF EXISTS `logradourocompleto`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `logradourocompleto` (
	`cplogradouro` BIGINT(20) UNSIGNED NOT NULL,
	`txnomelogrcompleto` TEXT NOT NULL COLLATE 'utf8_bin',
	`cecidade` SMALLINT(5) UNSIGNED NULL,
	`dtcadlogradouro` DATE NOT NULL
) ENGINE=MyISAM;

-- Copiando estrutura para view ilp54020212t.logradourocompleto
DROP VIEW IF EXISTS `logradourocompleto`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `logradourocompleto`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `logradourocompleto` AS SELECT L.cplogradouro,
       CONCAT(LT.txnometipologradouro," ",L.txnomelogradouro) AS txnomelogrcompleto,
		 L.cecidade,
		 L.dtcadlogradouro
		 FROM logradouros AS L INNER JOIN logradourostipos AS LT ON L.cetipologradouro=LT.cptipologradouro ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
