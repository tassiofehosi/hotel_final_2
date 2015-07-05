-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 05-Jul-2015 às 19:22
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
  `Codigo_tipo` varchar(10) COLLATE utf8_bin NOT NULL,
  `Andar` bigint(10) NOT NULL,
  `Tipo_cama` varchar(20) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `apartamento`
--

INSERT INTO `apartamento` (`Numero_apto`, `Codigo_tipo`, `Andar`, `Tipo_cama`) VALUES
(101, 'QUADUP', 1, 'Solteiro'),
(102, 'QUADUP', 1, 'Solteiro'),
(103, 'QUATRI', 1, 'Solteiro'),
(104, 'QUATRI', 1, 'Solteiro'),
(105, 'SUCAS', 1, 'Casal'),
(106, 'SUCAS', 1, 'Casal'),
(107, 'SUIND', 1, 'Solteiro'),
(108, 'SUIND', 1, 'Solteiro'),
(201, 'SUPRE', 2, 'Casal'),
(202, 'SUPRE', 2, 'Casal');

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

-- --------------------------------------------------------

--
-- Estrutura da tabela `hospedagem_reserva`
--

CREATE TABLE IF NOT EXISTS `hospedagem_reserva` (
`Numero_registro` bigint(20) NOT NULL,
  `CPF_cliente` varchar(11) COLLATE utf8_bin NOT NULL,
  `Numero_apto` bigint(10) NOT NULL,
  `Codigo_tipo` varchar(10) COLLATE utf8_bin NOT NULL,
  `Data_entrada` date NOT NULL,
  `Data_saida` date NOT NULL,
  `Motivo_viagem` varchar(50) COLLATE utf8_bin NOT NULL,
  `Agencia` varchar(50) COLLATE utf8_bin NOT NULL,
  `Meio_transporte` varchar(50) COLLATE utf8_bin NOT NULL,
  `Situacao_reserva_efetiva` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `nota_fiscal`
--

CREATE TABLE IF NOT EXISTS `nota_fiscal` (
  `Numero_nota` bigint(10) NOT NULL,
  `Data_nota` date NOT NULL,
  `Valor_total_nota` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `servico`
--

CREATE TABLE IF NOT EXISTS `servico` (
  `Codigo_servico` varchar(10) COLLATE utf8_bin NOT NULL,
  `Nome_servico` varchar(20) COLLATE utf8_bin NOT NULL,
  `Indicador_de_cobranca` varchar(20) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_apartamento`
--

CREATE TABLE IF NOT EXISTS `tipo_apartamento` (
  `Codigo_tipo` varchar(10) COLLATE utf8_bin NOT NULL,
  `Nome_tipo` varchar(20) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `tipo_apartamento`
--

INSERT INTO `tipo_apartamento` (`Codigo_tipo`, `Nome_tipo`) VALUES
('QUADUP', 'Quarto Duplo'),
('QUATRI', 'Quarto Triplo'),
('SUCAS', 'Suite Casal'),
('SUIND', 'Suite individual'),
('SUPRE', 'Suíte Presidencial');

-- --------------------------------------------------------

--
-- Estrutura da tabela `utilizacao_servicos`
--

CREATE TABLE IF NOT EXISTS `utilizacao_servicos` (
  `Numero_registro` bigint(20) NOT NULL,
  `CPF_cliente` varchar(11) COLLATE utf8_bin NOT NULL,
  `Numero_apto` bigint(10) NOT NULL,
  `Codigo_tipo` varchar(10) COLLATE utf8_bin NOT NULL,
  `Codigo_servico` varchar(10) COLLATE utf8_bin NOT NULL,
  `Data_utilizacao` date NOT NULL,
  `Numero_nota` bigint(10) NOT NULL,
  `Valor_total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apartamento`
--
ALTER TABLE `apartamento`
 ADD PRIMARY KEY (`Numero_apto`,`Codigo_tipo`), ADD KEY `fk_tipoApto_apto_idx` (`Codigo_tipo`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
 ADD PRIMARY KEY (`CPF_cliente`);

--
-- Indexes for table `hospedagem_reserva`
--
ALTER TABLE `hospedagem_reserva`
 ADD PRIMARY KEY (`Numero_registro`,`CPF_cliente`,`Numero_apto`,`Codigo_tipo`), ADD KEY `fk_cliente_hospefagem_idx` (`CPF_cliente`), ADD KEY `fk_apartamento_hospedagem_idx` (`Numero_apto`), ADD KEY `fk_apartamentoTipo_hospedagem_idx` (`Codigo_tipo`);

--
-- Indexes for table `nota_fiscal`
--
ALTER TABLE `nota_fiscal`
 ADD PRIMARY KEY (`Numero_nota`);

--
-- Indexes for table `servico`
--
ALTER TABLE `servico`
 ADD PRIMARY KEY (`Codigo_servico`);

--
-- Indexes for table `tipo_apartamento`
--
ALTER TABLE `tipo_apartamento`
 ADD PRIMARY KEY (`Codigo_tipo`);

--
-- Indexes for table `utilizacao_servicos`
--
ALTER TABLE `utilizacao_servicos`
 ADD PRIMARY KEY (`Numero_registro`,`CPF_cliente`,`Numero_apto`,`Codigo_tipo`,`Codigo_servico`,`Data_utilizacao`), ADD KEY `fk_cliente_utilizServico_idx` (`CPF_cliente`), ADD KEY `fk_hospedagem_utilizServicos_idx` (`Numero_apto`), ADD KEY `fk_hospedagem_UtilizServicos_Codigo_idx` (`Codigo_tipo`), ADD KEY `fk_Servico_utlizServico_idx` (`Codigo_servico`), ADD KEY `fk_notaFiscal_utlizServocos_idx` (`Numero_nota`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hospedagem_reserva`
--
ALTER TABLE `hospedagem_reserva`
MODIFY `Numero_registro` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `apartamento`
--
ALTER TABLE `apartamento`
ADD CONSTRAINT `fk_tipoApto_apto` FOREIGN KEY (`Codigo_tipo`) REFERENCES `tipo_apartamento` (`Codigo_tipo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `hospedagem_reserva`
--
ALTER TABLE `hospedagem_reserva`
ADD CONSTRAINT `fk_apartamentoTipo_hospedagem` FOREIGN KEY (`Codigo_tipo`) REFERENCES `apartamento` (`Codigo_tipo`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_apartamento_hospedagem` FOREIGN KEY (`Numero_apto`) REFERENCES `apartamento` (`Numero_apto`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_cliente_hospedagem` FOREIGN KEY (`CPF_cliente`) REFERENCES `cliente` (`CPF_cliente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `utilizacao_servicos`
--
ALTER TABLE `utilizacao_servicos`
ADD CONSTRAINT `fk_Servico_utlizServico` FOREIGN KEY (`Codigo_servico`) REFERENCES `servico` (`Codigo_servico`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_cliente_utilizServico` FOREIGN KEY (`CPF_cliente`) REFERENCES `cliente` (`CPF_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_hospedagem_UtilizServicos_Codigo` FOREIGN KEY (`Codigo_tipo`) REFERENCES `hospedagem_reserva` (`Codigo_tipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_hospedagem_utilizServicos` FOREIGN KEY (`Numero_apto`) REFERENCES `hospedagem_reserva` (`Numero_apto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_notaFiscal_utlizServocos` FOREIGN KEY (`Numero_nota`) REFERENCES `nota_fiscal` (`Numero_nota`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
