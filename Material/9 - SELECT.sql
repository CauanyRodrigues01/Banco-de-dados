USE cadastro;

#Seleciona todas as colunas da tabela
SELECT * FROM cursos;

#Seleciona todas as colunas da tabela organizando as linhas em ordem alfabética dos nomes
SELECT * FROM cursos ORDER BY nome;

#Seleciona todas as colunas da tabela organizando as linhas em ordem alfabética inversa dos nomes
SELECT * FROM cursos ORDER BY nome DESC;

#Seleciona as colunas nome, carga e ano da tabela cursos organizando as linhas em ordem alfabética dos nomes
SELECT nome, carga, ano FROM cursos ORDER BY nome;

#Seleciona as colunas ano, nome e carga da tabela cursos organizando as linhas em ordem crescente dos anoes e depois por ordem alfabética dos nomes
SELECT ano, nome, carga FROM cursos ORDER BY ano, nome;

#Seleciona todas as colunas da tabela cursos que tem o ano igual a 2016
SELECT * FROM cursos
WHERE ano = '2016';

#Seleciona as colunas nome, descricao e carga da tabela cursos, mas só as linhas que tem o ano igual a 2016
SELECT nome, descricao, carga FROM cursos
WHERE ano = '2016';

#Seleciona as colunas nome, descricao e carga da tabela cursos, mas só as linhas que tem o ano menor que 2015
SELECT nome, descricao, carga FROM cursos
WHERE ano <= '2015';

#Seleciona as colunas nome e ano da tabela cursos, mas só as linhas que tem o ano entre 2014 e 2016 organizando as linhas em ordem crescente dos anos e os nome em ordem alfabética
SELECT nome, ano FROM cursos
WHERE ano BETWEEN 2014 AND 2016
ORDER BY ano DESC, nome;

#Seleciona as colunas nome e ano da tabela cursos, mas só as linhas que tem o ano igual a 2014, 2016 e 2018
SELECT nome, ano FROM cursos
WHERE ano IN ('2014', '2016', '2018');

#Seleciona as colunas nome e ano da tabela cursos, mas só as linhas que tem a carga maior que 35 e o total de aulas menor que 30 organizando as linhas em ordem alfabética
SELECT * FROM cursos
WHERE carga > 35 AND totaulas < 30
ORDER BY nome;

#Seleciona todas as colunas da tabela, mas só as linhas em que o nome começa com P
SELECT * FROM cursos
WHERE nome LIKE 'P%';

#Seleciona todas as colunas da tabela, mas só as linhas em que o nome termina com A
SELECT * FROM cursos
WHERE nome LIKE '%a';

#Seleciona todas as colunas da tabela, mas só as linhas em que o nome tem a letra A na sua composição
SELECT * FROM cursos
WHERE nome LIKE '%a%';

#Seleciona todas as colunas da tabela, mas só as linhas em que o nome NÃO tem a letra A na sua composição
SELECT * FROM cursos
WHERE nome NOT LIKE '%a%';

#Seleciona todas as colunas da tabela, mas só as linhas em que o nome começa com PH e termina com P
SELECT * FROM cursos
WHERE nome  LIKE 'PH%P';

SELECT DISTINCT nacionalidade FROM gafanhotos;

SELECT count(*) FROM cursos;