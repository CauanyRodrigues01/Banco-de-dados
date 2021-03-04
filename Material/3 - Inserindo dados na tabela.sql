/*pessoas(id, nome, nascimento, sexo, peso, altura, nacionalidade)*/

USE cadastro;
INSERT INTO pessoas
(nome, nascimento, sexo, peso, altura, nacionalidade)
VALUES
('cauany', '2003-06-29', 'F', '54.5', '1.53', 'Brasil');

INSERT INTO pessoas
(id, nome, nascimento, sexo, peso, altura, nacionalidade)
VALUES
(DEFAULT, 'José', '1957-06-29', 'M', '60', '1.80', 'Alemanha');

INSERT INTO pessoas VALUES
(DEFAULT, 'Claudia', '1990-06-29', 'F', '58', '1.40', 'Alemanha');

INSERT INTO pessoas VALUES
(DEFAULT, 'Claudiana', '1999-06-29', 'F', '70', '1.77', DEFAULT),
(DEFAULT, 'Josefino', '2957-06-29', 'M', '75', '1.56', 'Estados Unidos'),
(DEFAULT, 'Marcelo', '2987-06-29', 'M', '80', '1.88', 'Russia');

DESC pessoas;