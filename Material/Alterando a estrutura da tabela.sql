ALTER TABLE pessoas
ADD COLUMN profissao VARCHAR(10);

ALTER TABLE pessoas
DROP COLUMN profissao;

ALTER TABLE pessoas
ADD COLUMN profissao VARCHAR(10) AFTER nome;

ALTER TABLE pessoas
ADD COLUMN codigo INT FIRST;

ALTER TABLE pessoas
MODIFY COLUMN profissao varchar(20) NOT NULL DEFAULT '';

ALTER TABLE pessoas
CHANGE COLUMN profissao prof VARCHAR(20);

ALTER TABLE pessoas
DROP COLUMN profissao;

ALTER TABLE pessoas
RENAME TO people;

SELECT * FROM pessoas;
DESC pessoas;