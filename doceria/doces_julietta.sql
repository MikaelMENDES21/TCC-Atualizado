-- Host: 127.0.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- Banco de dados: `docesjullieta`

-- Estrutura do banco de dados

--
-- Estrutura da tabela `tb_carrinho_pertence`
--

USE DOCE_JULIETTA;

CREATE TABLE `tb_carrinho_pertence` (
  `Car_Codigo` int(11) NOT NULL,
  `Car_Quantidade` int(11) DEFAULT NULL,
  `fk_TB_Compra_Com_Codigo` int(11) NOT NULL,
  `fk_TB_Doces_Doc_Codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Estrutura da tabela `tb_cliente`
--

CREATE TABLE `tb_cliente` (
  `Cli_Codigo` int(11) NOT NULL,
  `Cli_Email` varchar(50) DEFAULT NULL,
  `Cli_Senha` varchar(12) DEFAULT NULL,
  `Cli_Nome` varchar(50) DEFAULT NULL,
  `Cli_Endereco` varchar(50) DEFAULT NULL,
  `Cli_Bairro` varchar(50) DEFAULT NULL,
  `Cli_Numero` int DEFAULT NULL,
  `Cli_Cep` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Estrutura da tabela `tb_compra`
--

CREATE TABLE `tb_compra` (
  `Com_Codigo` int(11) NOT NULL,
  `Com_Data` date DEFAULT NULL,
  `Com_Metodo_de_pagamento` varchar(20) DEFAULT NULL,
  `fk_TB_Cliente_CLI_Codigo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Estrutura da tabela `tb_doces`
--

CREATE TABLE `tb_doces` (
  `Doc_Codigo` int(11) NOT NULL,
  `Doc_Nome` varchar(50) DEFAULT NULL,
  `Doc_Preco` decimal(10,0) DEFAULT NULL,
  `Doc_Descricao` varchar(180) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tb_carrinho_pertence`
--
ALTER TABLE `tb_carrinho_pertence`
  ADD PRIMARY KEY (`Car_Codigo`,`fk_TB_Compra_Com_Codigo`,`fk_TB_Doces_Doc_Codigo`),
  ADD KEY `FK_TB_Carrinho_Pertence_2` (`fk_TB_Compra_Com_Codigo`),
  ADD KEY `FK_TB_Carrinho_Pertence_3` (`fk_TB_Doces_Doc_Codigo`);

--
-- Índices para tabela `tb_cliente`
--
ALTER TABLE `tb_cliente`
  ADD PRIMARY KEY (`Cli_Codigo`);

--
-- Índices para tabela `tb_compra`
--
ALTER TABLE `tb_compra`
  ADD PRIMARY KEY (`Com_Codigo`),
  ADD KEY `FK_TB_Compra_2` (`fk_TB_Cliente_CLI_Codigo`);

--
-- Índices para tabela `tb_doces`
--
ALTER TABLE `tb_doces`
  ADD PRIMARY KEY (`Doc_Codigo`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tb_carrinho_pertence`
--
ALTER TABLE `tb_carrinho_pertence`
  ADD CONSTRAINT `FK_TB_Carrinho_Pertence_2` FOREIGN KEY (`fk_TB_Compra_Com_Codigo`) REFERENCES `tb_compra` (`Com_Codigo`),
  ADD CONSTRAINT `FK_TB_Carrinho_Pertence_3` FOREIGN KEY (`fk_TB_Doces_Doc_Codigo`) REFERENCES `tb_doces` (`Doc_Codigo`);

--
-- Limitadores para a tabela `tb_compra`
--
ALTER TABLE `tb_compra`
  ADD CONSTRAINT `FK_TB_Compra_2` FOREIGN KEY (`fk_TB_Cliente_CLI_Codigo`) REFERENCES `tb_cliente` (`Cli_Codigo`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
