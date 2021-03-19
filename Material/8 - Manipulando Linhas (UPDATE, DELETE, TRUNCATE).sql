USE cadastro;

INSERT INTO cursos VALUES
('1', 'HTML4', 'Curso de HTML5', '40', '37', '2014'),
('2', 'Algoritmos', 'Lógica de Programação', '20', '15', '2014'),
('3', 'Photoshop', 'Ducas de Photoshop CC', '10', '8', '2014'),
('4', 'PGP', 'Curso de PHP para iniciantes', '40', '20', '2010'),
('5', 'Jarva', 'Introdução à linguagem Java', '10', '29', '2000'),
('6', 'MySQL', 'Banco de dados MySQL', '30', '15', '2016'),
('7', 'Word', 'Curso completo de word', '40', '30', '2016'),
('8', 'Sapateado', 'Danças Rítimicas', '40', '30', '2018'),
('9', 'Cozinha Árabe', 'Aprenda a fazer kibe', '40', '30', '2018'),
('10', 'YouTuber', 'Gerar polêmica e ganhar inscritos', '5', '2', '2018');

SELECT * FROM cursos;

#MODIFICANDO LINHAS INCORRETAS

#modifique os cursos configurando o nome para HTML5 onde o idcurso seja 1
UPDATE cursos 
SET nome = 'HTML5'  
WHERE idcurso = '1';

UPDATE cursos
SET nome = 'PHP', ano = '2015'
WHERE idcurso = '4';

UPDATE cursos
SET nome = 'Java', carga = '40', ano = '2015'
WHERE idcurso = '5'
LIMIT 1; #não afete mais de uma linha

SELECT * FROM cursos;

#REMOVENDO LINHAS
DELETE FROM cursos
WHERE idcurso = '8';

DELETE FROM cursos
WHERE idcurso = '9' OR idcurso = '10';

SELECT * FROM cursos;

#DELETAR TODAS AS LINHAS DA TABELA
TRUNCATE cursos;

SELECT * FROM cursos;