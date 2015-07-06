-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 06-Jul-2015 às 02:51
-- Versão do servidor: 5.6.21
-- PHP Version: 5.5.19

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
  `Andar` bigint(10) NOT NULL
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
  `Profissao` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`CPF_cliente`, `Nome_cliente`, `Sexo`, `Email`, `CEP`, `Endereco`, `Telefone`, `Cidade`, `Estado`, `Profissao`) VALUES
('5454545454', 'Cliente', 'Feminino', '@email', '54454', 'Rua', '43434343434', 'Cidade', 'Estado', 'Profissao');

-- --------------------------------------------------------

--
-- Estrutura da tabela `hospedagem_reserva`
--

CREATE TABLE IF NOT EXISTS `hospedagem_reserva` (
`Numero_registro` bigint(20) NOT NULL,
  `CPF_cliente` varchar(11) COLLATE utf8_bin NOT NULL,
  `Numero_apto` bigint(10) NOT NULL,
  `Data_entrada` date NOT NULL,
  `Data_saida` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `hospedagem_reserva`
--

INSERT INTO `hospedagem_reserva` (`Numero_registro`, `CPF_cliente`, `Numero_apto`, `Data_entrada`, `Data_saida`) VALUES
(3, '5454545454', 106, '2015-07-24', '2015-07-31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apartamento`
--
ALTER TABLE `apartamento`
 ADD PRIMARY KEY (`Numero_apto`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
 ADD PRIMARY KEY (`CPF_cliente`), ADD UNIQUE KEY `CPF_cliente` (`CPF_cliente`);

--
-- Indexes for table `hospedagem_reserva`
--
ALTER TABLE `hospedagem_reserva`
 ADD PRIMARY KEY (`Numero_registro`,`CPF_cliente`,`Numero_apto`), ADD KEY `fk_cliente_hospefagem_idx` (`CPF_cliente`), ADD KEY `fk_apartamento_hospedagem_idx` (`Numero_apto`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hospedagem_reserva`
--
ALTER TABLE `hospedagem_reserva`
MODIFY `Numero_registro` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
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
