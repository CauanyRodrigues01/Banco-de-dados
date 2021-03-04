CREATE TABLE IF NOT EXISTS teste (
	id INT,
    nome VARCHAR(10),
    idade INT
);

INSERT INTO teste VALUE 
('1', 'Pedro', '22'),
('2', 'Maria', '62'),
('3', 'Joao', '72');

DROP TABLE IF EXISTS  alunos;

DROP TABLE IF EXISTS  teste;