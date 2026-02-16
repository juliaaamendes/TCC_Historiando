-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3309
-- Tempo de geração: 14/10/2025 às 14:31
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `historiando`
--

DELIMITER $$
--
-- Procedimentos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ListarFases` ()   SELECT titulo_fase FROM fase$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ListarNiveisFase` (INOUT `id_fase` INT(11))   SELECT titulo_nivel FROM nivel WHERE nivel.id_fase = id_fase$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `conquista`
--

CREATE TABLE `conquista` (
  `id_conquista` int(11) NOT NULL,
  `nome_conquista` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `conquista`
--

INSERT INTO `conquista` (`id_conquista`, `nome_conquista`) VALUES
(1, 'Primeiros Passos'),
(2, 'Explorador Iniciante'),
(3, 'Caçador de Conquistas'),
(4, 'Mestre do Tempo'),
(5, 'Historiador Nato'),
(6, 'Arqueólogo Digital'),
(7, 'Detetive do Passado'),
(8, 'Guardião da História'),
(9, 'Viajante Temporal'),
(10, 'Sábio das Eras');

-- --------------------------------------------------------

--
-- Estrutura para tabela `fase`
--

CREATE TABLE `fase` (
  `id_fase` int(11) NOT NULL,
  `titulo_fase` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `fase`
--

INSERT INTO `fase` (`id_fase`, `titulo_fase`) VALUES
(1, 'Pré-História'),
(2, 'Idade Antiga'),
(3, 'Idade Média'),
(4, 'Idade Moderna'),
(5, 'Idade Contemporânea');

-- --------------------------------------------------------

--
-- Estrutura para tabela `historico`
--

CREATE TABLE `historico` (
  `id_historico` int(11) NOT NULL,
  `id_jogador` int(11) NOT NULL,
  `tempo` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `historico`
--

INSERT INTO `historico` (`id_historico`, `id_jogador`, `tempo`) VALUES
(1, 1, '2024-01-15 10:30:00'),
(2, 2, '2024-01-15 11:45:00'),
(3, 3, '2024-01-16 09:15:00'),
(4, 4, '2024-01-16 14:20:00'),
(5, 5, '2024-01-17 16:30:00'),
(6, 6, '2024-01-17 18:45:00'),
(7, 7, '2024-01-18 08:30:00'),
(8, 8, '2024-01-18 12:15:00'),
(9, 9, '2024-01-19 15:40:00'),
(10, 10, '2024-01-19 17:25:00'),
(11, 11, '2024-01-20 10:10:00'),
(12, 12, '2024-01-20 13:35:00'),
(13, 13, '2024-01-21 16:50:00'),
(14, 14, '2024-01-21 19:05:00'),
(15, 15, '2024-01-22 09:40:00'),
(16, 16, '2024-01-22 11:55:00'),
(17, 17, '2024-01-23 14:20:00'),
(18, 18, '2024-01-23 16:45:00'),
(19, 19, '2024-01-24 10:30:00'),
(20, 20, '2024-01-24 12:45:00'),
(21, 1, '2024-01-25 15:00:00'),
(22, 2, '2024-01-25 17:15:00'),
(23, 3, '2024-01-26 08:40:00'),
(24, 4, '2024-01-26 11:05:00'),
(25, 5, '2024-01-27 13:30:00'),
(26, 6, '2024-01-27 15:45:00'),
(27, 7, '2024-01-28 18:10:00'),
(28, 8, '2024-01-28 20:25:00'),
(29, 9, '2024-01-29 09:50:00'),
(30, 10, '2024-01-29 12:15:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `jogador`
--

CREATE TABLE `jogador` (
  `id_jogador` int(11) NOT NULL,
  `nome_jogador` varchar(50) NOT NULL,
  `email_jogador` varchar(50) NOT NULL,
  `senha_jogador` varchar(8) NOT NULL,
  `progresso_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `jogador`
--

INSERT INTO `jogador` (`id_jogador`, `nome_jogador`, `email_jogador`, `senha_jogador`, `progresso_id`) VALUES
(1, 'Ana Silva', 'ana.silva@email.com', 'ana123', 1),
(2, 'Carlos Oliveira', 'carlos.oliveira@email.com', 'carlos1', 2),
(3, 'Mariana Santos', 'mariana.santos@email.com', 'mari202', 3),
(4, 'João Pereira', 'joao.pereira@email.com', 'joao321', 4),
(5, 'Fernanda Lima', 'fernanda.lima@email.com', 'fer456', 5),
(6, 'Ricardo Alves', 'ricardo.alves@email.com', 'ric789', 6),
(7, 'Juliana Costa', 'juliana.costa@email.com', 'juli000', 7),
(8, 'Pedro Mendes', 'pedro.mendes@email.com', 'pedro12', 8),
(9, 'Camila Rocha', 'camila.rocha@email.com', 'camila1', 9),
(10, 'Lucas Barbosa', 'lucas.barbosa@email.com', 'lucas99', 10),
(11, 'Amanda Souza', 'amanda.souza@email.com', 'amanda1', 11),
(12, 'Bruno Carvalho', 'bruno.carvalho@email.com', 'bruno22', 12),
(13, 'Patrícia Dias', 'patricia.dias@email.com', 'pat333', 13),
(14, 'Rodrigo Martins', 'rodrigo.martins@email.com', 'rod444', 14),
(15, 'Tatiane Nunes', 'tatiane.nunes@email.com', 'tati55', 15),
(16, 'Diego Ramos', 'diego.ramos@email.com', 'diego66', 16),
(17, 'Letícia Ferreira', 'leticia.ferreira@email.com', 'lele77', 17),
(18, 'Gabriel Santos', 'gabriel.santos@email.com', 'gab888', 18),
(19, 'Isabela Oliveira', 'isabela.oliveira@email.com', 'isa999', 19),
(20, 'Vinícius Costa', 'vinicius.costa@email.com', 'vini101', 20);

-- --------------------------------------------------------

--
-- Estrutura para tabela `nivel`
--

CREATE TABLE `nivel` (
  `id_nivel` int(11) NOT NULL,
  `titulo_nivel` varchar(50) NOT NULL,
  `id_fase` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `nivel`
--

INSERT INTO `nivel` (`id_nivel`, `titulo_nivel`, `id_fase`) VALUES
(1, 'Caça e Coleta', 1),
(2, 'Domínio do Fogo', 1),
(3, 'Arte Rupestre', 1),
(4, 'Civilizações Mesopotâmicas', 2),
(5, 'Egito Antigo', 2),
(6, 'Grécia Antiga', 2),
(7, 'Roma Antiga', 2),
(8, 'Feudalismo', 3),
(9, 'Cruzadas', 3),
(10, 'Peste Negra', 3),
(11, 'Renascimento', 4),
(12, 'Reformas Religiosas', 4),
(13, 'Grandes Navegações', 4),
(14, 'Revolução Francesa', 5),
(15, 'Era Industrial', 5),
(16, 'Guerras Mundiais', 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `progresso`
--

CREATE TABLE `progresso` (
  `id_progresso` int(11) NOT NULL,
  `conquistaUsuario` int(11) NOT NULL,
  `id_fase` int(11) NOT NULL,
  `id_nivel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `progresso`
--

INSERT INTO `progresso` (`id_progresso`, `conquistaUsuario`, `id_fase`, `id_nivel`) VALUES
(1, 1, 1, 1),
(2, 2, 1, 2),
(3, 3, 1, 3),
(4, 4, 2, 4),
(5, 5, 2, 5),
(6, 1, 2, 6),
(7, 2, 2, 7),
(8, 3, 3, 8),
(9, 4, 3, 9),
(10, 5, 3, 10),
(11, 1, 4, 11),
(12, 2, 4, 12),
(13, 3, 4, 13),
(14, 4, 5, 14),
(15, 5, 5, 15),
(16, 1, 5, 16),
(17, 2, 1, 1),
(18, 3, 1, 2),
(19, 4, 2, 4),
(20, 5, 2, 5);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `conquista`
--
ALTER TABLE `conquista`
  ADD PRIMARY KEY (`id_conquista`);

--
-- Índices de tabela `fase`
--
ALTER TABLE `fase`
  ADD PRIMARY KEY (`id_fase`);

--
-- Índices de tabela `historico`
--
ALTER TABLE `historico`
  ADD PRIMARY KEY (`id_historico`,`id_jogador`),
  ADD KEY `id_jogador` (`id_jogador`);

--
-- Índices de tabela `jogador`
--
ALTER TABLE `jogador`
  ADD PRIMARY KEY (`id_jogador`),
  ADD KEY `progresso_id` (`progresso_id`);

--
-- Índices de tabela `nivel`
--
ALTER TABLE `nivel`
  ADD PRIMARY KEY (`id_nivel`),
  ADD KEY `id_fase` (`id_fase`);

--
-- Índices de tabela `progresso`
--
ALTER TABLE `progresso`
  ADD PRIMARY KEY (`id_progresso`),
  ADD KEY `id_fase` (`id_fase`),
  ADD KEY `id_nivel` (`id_nivel`),
  ADD KEY `conquistaUsuario` (`conquistaUsuario`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `conquista`
--
ALTER TABLE `conquista`
  MODIFY `id_conquista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `fase`
--
ALTER TABLE `fase`
  MODIFY `id_fase` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `historico`
--
ALTER TABLE `historico`
  MODIFY `id_historico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de tabela `jogador`
--
ALTER TABLE `jogador`
  MODIFY `id_jogador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `nivel`
--
ALTER TABLE `nivel`
  MODIFY `id_nivel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `progresso`
--
ALTER TABLE `progresso`
  MODIFY `id_progresso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `historico`
--
ALTER TABLE `historico`
  ADD CONSTRAINT `historico_ibfk_1` FOREIGN KEY (`id_jogador`) REFERENCES `jogador` (`id_jogador`);

--
-- Restrições para tabelas `jogador`
--
ALTER TABLE `jogador`
  ADD CONSTRAINT `jogador_ibfk_1` FOREIGN KEY (`progresso_id`) REFERENCES `progresso` (`id_progresso`);

--
-- Restrições para tabelas `nivel`
--
ALTER TABLE `nivel`
  ADD CONSTRAINT `nivel_ibfk_1` FOREIGN KEY (`id_fase`) REFERENCES `fase` (`id_fase`);

--
-- Restrições para tabelas `progresso`
--
ALTER TABLE `progresso`
  ADD CONSTRAINT `progresso_ibfk_1` FOREIGN KEY (`id_fase`) REFERENCES `fase` (`id_fase`),
  ADD CONSTRAINT `progresso_ibfk_2` FOREIGN KEY (`id_nivel`) REFERENCES `nivel` (`id_nivel`),
  ADD CONSTRAINT `progresso_ibfk_3` FOREIGN KEY (`conquistaUsuario`) REFERENCES `conquista` (`id_conquista`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
