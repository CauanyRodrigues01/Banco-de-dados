USE cadastro;
describe gafanhotos;

ALTER TABLE gafanhotos
ADD COLUMN cursopreferido INT;

#adicioando uma chave estrangeira
ALTER TABLE gafanhotos
ADD FOREIGN KEY (cursopreferido)
REFERENCES cursos(idcurso);

SELECT * FROM gafanhotos;
SELECT * FROM cursos;

UPDATE gafanhotos SET cursopreferido = '6' WHERE id = '1';

#trocar o id pelo nome do curso
SELECT gafanhotos.nome, cursos.nome, cursos.ano
FROM gafanhotos JOIN cursos
ON cursos.idcurso = gafanhotos.cursopreferido;

SELECT g.nome, c.nome, c.ano
FROM gafanhotos AS g INNER JOIN cursos AS c
ON c.idcurso = g.cursopreferido
ORDER BY g.nome;

SELECT g.nome, c.nome, c.ano
FROM gafanhotos AS g LEFT OUTER JOIN cursos AS c
ON c.idcurso = g.cursopreferido
ORDER BY g.nome;

SELECT g.nome, c.nome, c.ano
FROM gafanhotos AS g RIGHT OUTER JOIN cursos AS c
ON c.idcurso = g.cursopreferido
ORDER BY g.nome;

CREATE TABLE gafanhoto_assiste_curso (
	id INT AUTO_INCREMENT,
    data DATE,
    idgafanhoto INT,
    idcurso INT,
    PRIMARY KEY (id),
    FOREIGN KEY (idgafanhoto) REFERENCES gafanhotos(id),
    FOREIGN KEY (idcurso) REFERENCES cursos(idcurso)
) DEFAULT CHARSET = utf8;

INSERT INTO gafanhoto_assiste_curso VALUES (DEFAULT, '2014-03-01','1','2');

SELECT g.nome, idcurso FROM gafanhotos g
JOIN gafanhoto_assiste_curso a
ON g.id = a.idgafanhoto;

SELECT g.nome, c.nome FROM gafanhotos g
JOIN gafanhoto_assiste_curso a
ON g.id = a.idgafanhoto
JOIN cursos c
ON c.idcurso = a.idcurso;

SELECT * FROM gafanhoto_assiste_curso;