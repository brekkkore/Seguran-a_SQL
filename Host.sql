-- Banco da farmácia (rode como root)
CREATE DATABASE farmacia_seg;
USE farmacia_seg;
 
-- Produtos: todos os funcionários podem ver
CREATE TABLE produto (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  preco DECIMAL(7,2) NOT NULL,
  estoque INT NOT NULL
);
 
-- Funcionários: tem salário, é dado sensível
CREATE TABLE funcionario (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  cargo VARCHAR(30) NOT NULL,
  salario DECIMAL(8,2) NOT NULL
);
 
INSERT INTO produto (nome, preco, estoque) VALUES
  ('Dipirona 500mg', 12.90, 40),
  ('Protetor solar FPS 50', 59.90, 15),
  ('Vitamina C', 24.50, 30),
  ('Álcool em gel', 9.90, 60),
  ('Termômetro digital', 34.00, 8);
 
INSERT INTO funcionario (nome, cargo, salario) VALUES
  ('Renata Lopes', 'Gerente', 6200.00),
  ('Caio Mendes', 'Atendente', 2300.00),
  ('Paula Reis', 'Farmacêutica', 5100.00);
  
  
  SELECT * FROM produto;   
  SELECT * FROM funcionario;

-- Verificação de quem esta conectado no servidor do Banco de Dados
SELECT user, host FROM mysql.user;

-- Quem sou eu? -- Eu não sei...lamento.
SELECT current_user();

-- Vamos criar o acesso do atendente luiz
CREATE USER 'atendente'@'localhost'
IDENTIFIED BY 'Atend@2026';

-- O que o luiz consegue fazer? 
SHOW GRANTS FOR 'atendente'@'localhost';

-- Vamos adicionar algumas permissões para o Luiz
GRANT SELECT ON farmacia_seg.produto
TO 'atendente'@'localhost';
 
-- Criar o acesso do gerente Davi Cerimonial
CREATE USER 'gerente'@'localhost'
IDENTIFIED BY 'Geren@2026'; 

-- O que o davo tem de permissão 
GRANT SELECT, INSERT, UPDATE ON farmacia_seg.*
TO 'gerente'@'localhost';

-- Verificar
SHOW GRANTS FOR 'gerente'@'localhost';

-- Tirar uma permissão 
REVOKE UPDATE ON farmacia_seg.* 
FROM 'gerente'@'localhost';

-- TROCAR SENHA 
ALTER USER 'gerente'@'localhost'
identified BY 'Nova@senha26'; 

-- Bloquear sem apagar
ALTER USER 'atendente'@'localhost' ACCOUNT LOCK;

ALTER USER 'atendente'@'localhost' ACCOUNT UNLOCK;

-- apagar 
DROP USER 'gerente'@'localhost';
