-- Inserindo fases
INSERT INTO fase (titulo_fase) VALUES 
('Pré-História'),
('Idade Antiga'),
('Idade Média'),
('Idade Moderna'),
('Idade Contemporânea');

-- Inserindo níveis para cada fase
INSERT INTO nivel (titulo_nivel, id_fase) VALUES 
('Caça e Coleta', 1),
('Domínio do Fogo', 1),
('Arte Rupestre', 1),
('Civilizações Mesopotâmicas', 2),
('Egito Antigo', 2),
('Grécia Antiga', 2),
('Roma Antiga', 2),
('Feudalismo', 3),
('Cruzadas', 3),
('Peste Negra', 3),
('Renascimento', 4),
('Reformas Religiosas', 4),
('Grandes Navegações', 4),
('Revolução Francesa', 5),
('Era Industrial', 5),
('Guerras Mundiais', 5);

-- Inserindo conquistas
INSERT INTO conquista (nome_conquista) VALUES 
('Primeiros Passos'),
('Explorador Iniciante'),
('Caçador de Conquistas'),
('Mestre do Tempo'),
('Historiador Nato'),
('Arqueólogo Digital'),
('Detetive do Passado'),
('Guardião da História'),
('Viajante Temporal'),
('Sábio das Eras');

-- Inserindo progressos
INSERT INTO progresso (conquistaUsuario, id_fase, id_nivel) VALUES 
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 4),
(5, 2, 5),
(1, 2, 6),
(2, 2, 7),
(3, 3, 8),
(4, 3, 9),
(5, 3, 10),
(1, 4, 11),
(2, 4, 12),
(3, 4, 13),
(4, 5, 14),
(5, 5, 15),
(1, 5, 16),
(2, 1, 1),
(3, 1, 2),
(4, 2, 4),
(5, 2, 5);

-- Inserindo jogadores
INSERT INTO jogador (nome_jogador, email_jogador, senha_jogador, progresso_id) VALUES 
('Ana Silva', 'ana.silva@email.com', 'ana123', 1),
('Carlos Oliveira', 'carlos.oliveira@email.com', 'carlos1', 2),
('Mariana Santos', 'mariana.santos@email.com', 'mari202', 3),
('João Pereira', 'joao.pereira@email.com', 'joao321', 4),
('Fernanda Lima', 'fernanda.lima@email.com', 'fer456', 5),
('Ricardo Alves', 'ricardo.alves@email.com', 'ric789', 6),
('Juliana Costa', 'juliana.costa@email.com', 'juli000', 7),
('Pedro Mendes', 'pedro.mendes@email.com', 'pedro12', 8),
('Camila Rocha', 'camila.rocha@email.com', 'camila1', 9),
('Lucas Barbosa', 'lucas.barbosa@email.com', 'lucas99', 10),
('Amanda Souza', 'amanda.souza@email.com', 'amanda1', 11),
('Bruno Carvalho', 'bruno.carvalho@email.com', 'bruno22', 12),
('Patrícia Dias', 'patricia.dias@email.com', 'pat333', 13),
('Rodrigo Martins', 'rodrigo.martins@email.com', 'rod444', 14),
('Tatiane Nunes', 'tatiane.nunes@email.com', 'tati55', 15),
('Diego Ramos', 'diego.ramos@email.com', 'diego66', 16),
('Letícia Ferreira', 'leticia.ferreira@email.com', 'lele77', 17),
('Gabriel Santos', 'gabriel.santos@email.com', 'gab888', 18),
('Isabela Oliveira', 'isabela.oliveira@email.com', 'isa999', 19),
('Vinícius Costa', 'vinicius.costa@email.com', 'vini101', 20);

-- Inserindo histórico
INSERT INTO historico (id_jogador, tempo) VALUES 
(1, '2024-01-15 10:30:00'),
(2, '2024-01-15 11:45:00'),
(3, '2024-01-16 09:15:00'),
(4, '2024-01-16 14:20:00'),
(5, '2024-01-17 16:30:00'),
(6, '2024-01-17 18:45:00'),
(7, '2024-01-18 08:30:00'),
(8, '2024-01-18 12:15:00'),
(9, '2024-01-19 15:40:00'),
(10, '2024-01-19 17:25:00'),
(11, '2024-01-20 10:10:00'),
(12, '2024-01-20 13:35:00'),
(13, '2024-01-21 16:50:00'),
(14, '2024-01-21 19:05:00'),
(15, '2024-01-22 09:40:00'),
(16, '2024-01-22 11:55:00'),
(17, '2024-01-23 14:20:00'),
(18, '2024-01-23 16:45:00'),
(19, '2024-01-24 10:30:00'),
(20, '2024-01-24 12:45:00'),
(1, '2024-01-25 15:00:00'),
(2, '2024-01-25 17:15:00'),
(3, '2024-01-26 08:40:00'),
(4, '2024-01-26 11:05:00'),
(5, '2024-01-27 13:30:00'),
(6, '2024-01-27 15:45:00'),
(7, '2024-01-28 18:10:00'),
(8, '2024-01-28 20:25:00'),
(9, '2024-01-29 09:50:00'),
(10, '2024-01-29 12:15:00');