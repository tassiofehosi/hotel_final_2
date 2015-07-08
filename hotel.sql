-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 08-Jul-2015 às 06:34
-- Versão do servidor: 5.6.15-log
-- PHP Version: 5.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hotel`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `apartamento`
--

CREATE TABLE IF NOT EXISTS `apartamento` (
  `Numero_apto` bigint(10) NOT NULL,
  `Andar` bigint(10) NOT NULL,
  PRIMARY KEY (`Numero_apto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `apartamento`
--

INSERT INTO `apartamento` (`Numero_apto`, `Andar`) VALUES
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(201, 2),
(202, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `CPF_cliente` varchar(11) COLLATE utf8_bin NOT NULL,
  `Nome_cliente` varchar(50) COLLATE utf8_bin NOT NULL,
  `Sexo` varchar(10) COLLATE utf8_bin NOT NULL,
  `Email` varchar(50) COLLATE utf8_bin NOT NULL,
  `CEP` varchar(20) COLLATE utf8_bin NOT NULL,
  `Endereco` varchar(100) COLLATE utf8_bin NOT NULL,
  `Telefone` varchar(20) COLLATE utf8_bin NOT NULL,
  `Cidade` varchar(50) COLLATE utf8_bin NOT NULL,
  `Estado` varchar(50) COLLATE utf8_bin NOT NULL,
  `Profissao` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`CPF_cliente`),
  UNIQUE KEY `CPF_cliente` (`CPF_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`CPF_cliente`, `Nome_cliente`, `Sexo`, `Email`, `CEP`, `Endereco`, `Telefone`, `Cidade`, `Estado`, `Profissao`) VALUES
('0987654321', 'jose da silva', 'Masculino', 'jose@msn.com', '57062-300', 'Rua sem saida, 100 ', '3221-2121', 'MaceiÃ³', 'AL', 'Vendedor'),
('9988776655', 'Fred Cone', 'Masculino', 'fred@flu.com', '69000-123', 'Copacabana', '9876-0011', 'Rio de Janeiro', 'RJ', 'jogador');

-- --------------------------------------------------------

--
-- Estrutura da tabela `contato`
--

CREATE TABLE IF NOT EXISTS `contato` (
  `Reg_Nr` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(30) NOT NULL,
  `Email` varchar(15) NOT NULL,
  `Assunto` varchar(30) NOT NULL,
  `Mensagem` varchar(250) NOT NULL,
  `Data` date NOT NULL,
  PRIMARY KEY (`Reg_Nr`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `contato`
--

INSERT INTO `contato` (`Reg_Nr`, `Nome`, `Email`, `Assunto`, `Mensagem`, `Data`) VALUES
(4, 'Wellington Teles dos Santos', 'wteless@msn.com', 'Teste de envio 1', 'testando envio de mensagem. OK!', '2015-07-08'),
(5, 'JosÃ© da Silva', 'jose@msn.com', 'teste 2', 'testando envio 2', '2015-07-08'),
(6, 'Maria JoÃ£o', 'Maria@msn.com', 'teste3', 'teste teste teste', '2015-07-08');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE IF NOT EXISTS `funcionario` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) NOT NULL,
  `email` varchar(15) NOT NULL,
  `usuario` varchar(15) NOT NULL,
  `senha` varchar(15) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`user_id`, `nome`, `email`, `usuario`, `senha`) VALUES
(1, 'Wellington Teles dos Santos', 'wteless@msn.com', 'wteless', '123456'),
(8, 'tassio', 'tassio@gmail.co', 'tassio', '123456');

-- --------------------------------------------------------

--
-- Estrutura da tabela `hospedagem_reserva`
--

CREATE TABLE IF NOT EXISTS `hospedagem_reserva` (
  `Numero_registro` bigint(20) NOT NULL AUTO_INCREMENT,
  `CPF_cliente` varchar(11) COLLATE utf8_bin NOT NULL,
  `Numero_apto` bigint(10) NOT NULL,
  `Data_entrada` date NOT NULL,
  `Data_saida` date NOT NULL,
  PRIMARY KEY (`Numero_registro`,`CPF_cliente`,`Numero_apto`),
  KEY `fk_cliente_hospefagem_idx` (`CPF_cliente`),
  KEY `fk_apartamento_hospedagem_idx` (`Numero_apto`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=9 ;

--
-- Extraindo dados da tabela `hospedagem_reserva`
--

INSERT INTO `hospedagem_reserva` (`Numero_registro`, `CPF_cliente`, `Numero_apto`, `Data_entrada`, `Data_saida`) VALUES
(5, '0987654321', 102, '2015-08-10', '2015-08-12'),
(7, '9988776655', 202, '2015-12-12', '2015-12-20');

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `hospedagem_reserva`
--
ALTER TABLE `hospedagem_reserva`
  ADD CONSTRAINT `fk_apartamento_hospedagem` FOREIGN KEY (`Numero_apto`) REFERENCES `apartamento` (`Numero_apto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cliente_hospedagem` FOREIGN KEY (`CPF_cliente`) REFERENCES `cliente` (`CPF_cliente`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
