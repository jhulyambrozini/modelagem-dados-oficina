use osmecanica;

-- Dados para a tabela clients
INSERT INTO clients (fName, mInit, lName, phoneNumber, adress) 
VALUES 
('João', 'A.', 'Silva', '1234567890', 'Rua Principal, 123'),
('Maria', 'B.', 'Santos', '9876543210', 'Avenida Central, 456'),
('Ana', 'M.', 'Oliveira', '1112223333', 'Rua das Flores, 789'),
('Pedro', NULL, 'Santana', '4445556666', 'Avenida do Sol, 321'),
('Mariana', 'C.', 'Almeida', '7778889999', 'Praça Central, 456'),
('Carlos', 'R.', 'Ribeiro', '9998887777', 'Alameda das Árvores, 987');

-- Dados para a tabela orders
INSERT INTO orders (idClient, orderDescription, orderName, priority, orderType) 
VALUES 
(1, 'Troca de óleo e filtro', 'Ordem 1', 'Média', 'Manutenção'),
(2, 'Reparo do motor', 'Ordem 2', 'Alta', 'Concerto'),
(3, 'Revisão geral do veículo', 'Ordem 3', 'Alta', 'Revisão'),
(4, 'Troca de pneus', 'Ordem 4', 'Baixa', 'Substituição'),
(1, 'Conserto do sistema de freios', 'Ordem 5', 'Média', 'Concerto');

-- Dados para a tabela responsible
INSERT INTO responsible (sector, registration, office, forwardSector) 
VALUES 
('Mecânica', 'M123', 'Técnico', 'Elétrica'),
('Elétrica', 'E456', 'Eletricista', 'Hidráulica'),
('Mecânica', 'M234', 'Técnico', 'Elétrica'),
('Hidráulica', 'H567', 'Encanador', 'Elétrica'),
('Elétrica', 'E890', 'Eletricista', 'Mecânica');

-- Dados para a tabela responsibleOrder
INSERT INTO responsibleOrder (idResponsible, idOrder, comments) 
VALUES 
(1, 1, 'Responsável pela troca de óleo'),
(2, 2, 'Responsável pela reparação do motor'),
(1, 3, 'Responsável pela revisão geral'),
(2, 4, 'Responsável pela troca de pneus'),
(3, 5, 'Responsável pelo conserto dos freios');

-- Dados para a tabela orderService
INSERT INTO orderService (idResponsibleOrder, OSdescription, priority) 
VALUES 
(1, 'Troca de óleo e filtro', 'Média'),
(2, 'Reparo do motor', 'Alta'),
(1, 'Revisão completa do veículo', 'Alta'),
(2, 'Troca de todos os pneus', 'Baixa'),
(3, 'Conserto do sistema de freios', 'Média');
