USE cadastro;
CREATE TABLE IF NOT EXISTS cursos (
	nome VARCHAR(30) NOT NULL UNIQUE,
    descricao TEXT,
    carga INT UNSIGNED,
    totaulas INT,
    ano YEAR DEFAULT '2021'
) DEFAULT CHARSET = utf8;