# Banco de dados com MySQL
 Material desenvolvido durante meus estudos de Bando de Dados.

## Índice

1. [Principais comandos](#Principais-comandos)
2. [DML](#DML)
3. [Chave primária](#Chave-primária)
4. [NOT NULL em CREATE TABLE](#NOT-NULL-em-CREATE-TABLE)
5. [Tipos de dados](#Tipos-de-dados)
6. [Atributos](#Atributos)
7. [Configurando o conjunto de caracteres e agrupamento](#Configurando-o-conjunto-de-caracteres-e-agrupamento)
8. [Alterando dados da tabela](#Alterando-dados-da-tabela)
9. [Criando tabela com IF NOT EXISTS](#Criando-tabela-com-IF-NOT-EXISTS)
10. [Apagando tabela com IF EXISTS](#Apagando-tabela-com-IF-EXISTS)
11. [Manipulando linhas ou registros](#Manipulando-linhas-ou-registros)
12. [Selecionando dados no banco](#Selecionando-dados-no-banco)
13. [Principais links](#Principais-links)
14. [Chave estrangeira](#Chave-estrangeira)

## Principais comandos

- ##### CREATE DATABASE:

  Criar um banco de dados

  ```mysql
  CREATE DATABASE nomeDoBanco;
  ```

- ##### USE:

  Selecionar qual banco de dados vai ser utilizado. Assim, todos os comandos executados surtirão efeito no banco de dados escolhido. É útil quando estamos trabalhando com diversos bancos de dados e necessitamos trocar de um para outro, ou melhor, saber o que há em uma base de dados e o que está contido na outra.

  ```mysql
  USE nomeDoBanco;
  ```

- ##### CREATE TABLE:

  Cria uma tabela. Recebe como parâmetro os nomes das colunas da tabela e seu tipo de dados.

  ```mysql
  CREATE TABLE nomeDaTabela (
      coluna1 tipo restrições,
      coluna2 tipo restrições
      ...
  );
  ```

- ##### DESCRIBE ou DESC:

  Descreve a estrutura de tabelas com suas colunas e tipo de dados.

  ```mysql
  DESCRIBE nomeDaTabela;
  ```

- ##### DROP DATABASE:

  Deleta um banco de dados.

  ```mysql
  DROP DATABASE nomeDoBanco;
  ```

## DML

- ##### INSERT INTO

  Serve para inserir dados em uma tabela já existente. Os valores devem estar entre aspas simples e precisam estar na mesma ordem que o nome das colunas.

  ```mysql
  INSERT INTO nomeTabela ('coluna1', 'coluna2'...) VALUES ('valor1', 'valor2'...);
  ```

  Quando estamos inserindo valores em todas as colunas da tabela, não é preciso indicá-las no comando:

  ```mysql
  INSERT INTO nomeTabela VALUES (valoresInseridos);
  ```

  É possível adicionar várias linhas com um só comando. O importante é que os parênteses devem ser separados por vírgula. Veja o exemplo de uma tabela que tem uma coluna:

  ```mysql
  INSERT INTO nomeTabela VALUES ('linha1'), ('linha2'), ('linha3');
  ```

## Chave primária

A restrição `PRIMARY KEY` identifica a exclusividade de cada registro em uma tabela. Por isso tem valores únicos e não podem conter valores `NULL`.

Uma tabela pode ter apenas uma chave primária; e na tabela, essa chave primária pode consistir em uma ou várias colunas (campos).

### Chave primária na criação de tabela

Deve-se criar um atributo id com `NOT NULL` para que ele seja único e com `AUTO_INCREMENT`, para que o MySQL crie o id automaticamente para cada instância. No final, `PRIMARY KEY`recebe o id criado anteriormente.

```mysql
CREATE TABLE nomeTabela (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    PRIMARY KEY (id)
);
```

## NOT NULL em CREATE TABLE

Por padrão do MySQL, uma coluna possui valores `NULL`. Mas podemos usar a restrição `NOT NULL` para forçar uma coluna a não aceitar valores `NULL`. Veja como fica a estrutura:

```mysql
CREATE TABLE nomeTabela (
    atributo1 VARCHAR(30) NOT NULL,
    atributo2 VARCHAR(30)
);
```

## Tipos de dados

OBS.: 

**M** é o tamanho do dado ou seu valor máximo: para inteiros está relacionado ao comprimento máximo de exibição, para números de ponto fixo ou flutuante é a quantidade de dígitos que poderão ser armazenados e para strings indica o tamanho máximo da string.

**D** aplica-se a números de ponto fixo ou flutuante e indica a quantidade de dígitos que virão depois da vírgula.

**fsp** são destinados a dados que indicam tempo e data, representa a precisão fracional dos segundos.

**Precisão simples** contempla uma precisão de aproximadamente 7 casas decimais.

**Precisão dupla** contempla aproximadamente 15 casas decimais.

**Atributos numéricos:**

ZEROFILL é responsável por preencher com *zeros* à esquerda *do valor informado* sempre que utilizado, o dado automaticamente recebe o atributo *UNSIGNED*.

SIGNED aceita dados negativos.

UNSIGNED não aceita dados negativos.

### Tipo de valores numéricos

| Tipos          | Forma alternativa                         | Definição                                                    | Valores possíveis                                            |
| :------------- | ----------------------------------------- | :----------------------------------------------------------- | ------------------------------------------------------------ |
| BIT            | BIT(M)                                    | Valores de bits                                              | 1 a 64                                                       |
| TINYINT        | TINYINT[(M)] [UNSIGNED] [ZEROFILL]        | Número inteiro                                               | Com valor negativo: -128 até 127. Apenas valores positivos: 0 a 255 |
| SMALLINT       | SMALLINT[(M)] [UNSIGNED] [ZEROFILL]       | Número inteiro                                               | Com valor negativo: -32768 até 32767. Apenas valores positivos: 0 até 65535 |
| MEDIUMINT      | MEDIUMINT                                 | Número inteiro                                               | Com valor negativo: -8.388.608 até 8.388.607. Apenas valores positivos: 0 até 16777215 |
| INT ou INTEGER | INT ou INTEGER[(M)] [UNSIGNED] [ZEROFILL] | Número inteiro                                               | Com valor negativo: -2147483648 até 2147483647. Apenas valores positivos: 0 até 429.496.295. |
| BIGINT         | BIGINT[(M)] [UNSIGNED] [ZEROFILL]         | Número inteiro                                               | Com valor negativo: 9.223.372.036.854.775.808 até 9.223.372.036.854.775.807. Apenas valores positivos: 0 até 18.446.744.073.709.551.615. |
| FLOAT          | FLOAT[(M [ , D])] [UNSIGNED] [ZEROFILL]   | Número de valor aproximado com vírgula flutuante de precisão simples | Baseado nas especificações do comando ou no Hardware e Sistema Operacional |
| DOUBLE         | DOUBLE[(M[ , D])] [UNSIGNED] [ZEROFILL]   | Número de valor aproximado com vírgula flutuante de dupla precisão | Baseado nas especificações do comando ou no Hardware e Sistema Operacional |
| DECIMAL        | DECIMAL[(M[ , D])] [UNSIGNED] [ZEROFILL]  | Número de valor exato em formato binário                     | Baseado nas especificações do comando ou no Hardware e Sistema Operacional |

### Tipo temporal

| Tipo             | Formato             | Definição                                                    |
| :--------------- | :------------------ | :----------------------------------------------------------- |
| DATE             | AAAA-MM-DD          | Armazena uma data com valor entre ‘1000-01-01’ e ‘9999-12-31’ |
| TIME [(fsp)]     | HH:MM:SS            | Armazena uma hora. A margem de horas vai desde -838 horas, 59 minutos e 59 segundos. |
| YEAR [(4)]       | YYYY                | Armazena um ano. A margem de valores permitidos vai desde o ano 1901 ao ano 2155. |
| DATETIME[(fsp)]  | AAAA-MM-DD HH:MM:SS | Armazena a data e hora combinadas. Suporta valores entre ‘1000-01-01 00:00:00’ e ‘9999-12-31 23:59:59’ |
| TIMESTAMP[(fsp)] | AAAA-MM-DD HH:MM:SS | Combinação de data e hora. A margem vai desde o 1 de Janeiro de 1970 ao ano 2037. O formato de armazenamento depende do tamanho do campo. |

### Tipo texto

| Tipo       | Forma alternativa                                            | Definição                                                    |
| :--------- | ------------------------------------------------------------ | :----------------------------------------------------------- |
| CHAR       | [NATIONAL] CHAR[(M)] [CHARACTER SET charset_name] [COLLATE collation_name] | String de tamanho fixo. Faixa de 0 até 255 caracteres.       |
| VARCHAR    | [NATIONAL] VARCHAR[(M)] [CHARACTER SET charset_name] [COLLATE collation_name] | String de tamanho variável. Faixa de 0 a 65.535 caracteres.  |
| TINYBLOB   |                                                              | String de tamanho binário fixo de 0 a 255 caracteres.        |
| TINYTEXT   |                                                              | String de tamanho fixo de 0 a 255 caracteres.                |
| BLOB [(M)] |                                                              | Um texto com um máximo de 65.535 caracteres em formato binário. |
| TEXT       | TEXT [(M)] [CHARACTER SET charset_name] [COLLATE collation_name] | Um texto com um máximo de 65.535 caracteres.                 |
| MEDIUMBLOB |                                                              | Um texto com um máximo de 16.777.215 caracteres em forma binária. |
| MEDIUMTEXT |                                                              | Um texto com um máximo de 16.777.215 caracteres.             |
| LONGBLOB   |                                                              | Um texto com um máximo de caracteres 4.294.967.295. em formato binário |
| LONGTEXT   |                                                              | Um texto com um máximo de caracteres 4.294.967.295.          |

### Tipo ENUM

Só aceita os valores que enumerarmos na criação do campo.

### Tipo NULL

O null é um tipo especial suportado pelo banco de dados para representar o vazio. Conceitualmente, `NULL` significa “ um valor desconhecido ausente ” e o padrão do MySQL é permitir null nas colunas.

### Tipo Bool ou Boolean

Na prática é o mesmo que usar um TINYINT(1).

## Atributos

- ##### NOT NULL

  É uma restrição de coluna que garante que os valores nela armazenados não sejam `NULL`.

- ##### AUTO_INCREMENT

  Pode ser usado para gerar uma identidade única para novas linhas da coluna, como o id:

  ```mysql
  CREATE TABLE pessoas (
      id INT AUTO_INCREMENT,
      nome VARCHAR(30) NOT NULL,
      PRIMARY KEY (id)
  ) 
  ```

  Quando for inserir novas colunas, não é necessário especificar o id, porque este possui o`AUTO_INCREMENT`. Mas se for o caso, pode usar o valor `DEFAULT`:

  ```mysql
  INSERT INTO pessoas VALUES ('Maria');
  ```

  ou

  ```mysql
  INSERT INTO pessoas VALUES (DEFAULT, 'Maria');
  ```

- ##### DEFAULT 

  É uma restrição utilizada para inserirmos um valor padrão em uma coluna. Esse valor padrão é inserido automaticamente nos registros, se nenhum valor for especificado para a coluna.

## Configurando o conjunto de caracteres e agrupamento

Se for necessário que o armazenamento de dados use um conjunto de caracteres ou agrupamento diferente, você pode configurar as informações quando for criar o banco ou tabela, usando os comandos `CHARACTER SET` e `COLLATE`:

```mysql
CREATE DATABASE nomeDoBanco 
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;
```

```mysql
CREATE TABLE pessoas (
    nome VARCHAR(30) NOT NULL
) DEFAULT CHARSET = utf8;
```

Nesses exemplos, configuramos o conjunto de caracteres UTF8 que possui símbolos latinos.

## Alterando dados da tabela

A instrução `ALTER TABLE` é usada para adicionar, excluir ou modificar colunas em uma tabela existente, adicionar e eliminar várias restrições. Essa instrução possui as seguintes especificações opcionais:

- FIRST

  Serve para posicionar uma coluna **antes** de outra existente.

- AFTER

  Serve para posicionar uma coluna **depois** de outra existente.

### Adicionar coluna

```mysql
ALTER TABLE nomeTabela
ADD COLUMN nomeNovaColuna Tipo;
```

Nesse caso, a palavra `COLUMN` é opcional e pode ser omitida.

Por padrão, essa instrução vai adicionar a coluna por último. 

### Adicionar várias colunas

```mysql
ALTER TABLE nomeTabela
ADD nomeNovaColuna Tipo,
...
ADD nomeNovaColuna Tipo;
```

### Modificar uma coluna

```mysql
ALTER TABLE nomeTabela
MODIFY nomeColunaExistente NovasDefinições;
```

### Modificar várias colunas

```mysql
ALTER TABLE nomeTabela
MODIFY nomeColunaExistente NovasDefinições,
...
MODIFY nomeColunaExistente NovasDefinições;
```

### Renomear coluna

```mysql
ALTER TABLE nomeTabela
CHANGE COLUMN nomeColuna novoNome definições;
```

As definições declaradas nesse comando vão substituir as antigas. Se quiser mantê-las é preciso declará-las novamente.

### Renomear tabela

```mysql
ALTER TABLE nomeTabela
RENAME TO novoNome;
```

### Remover coluna

```mysql
ALTER TABLE nomeTabela
DROP nomeColuna;
```

### Remover tabela

```mysql
DROP TABLE nomeTabela;
```

## Criando tabela com IF NOT EXISTS

Essa instrução permite que o MySQL verifique se a tabela que está sendo criada já existe no banco de dados. Se for o caso, o MySQL irá ignorar a instrução inteira e não criará nenhuma nova tabela:

```mysql
CREATE TABLE IF NOT EXISTS nomeTabela (
	nomeColuna,
    ...
    nomeColuna
);
```

## Apagando tabela com IF EXISTS

```mysql
DROP TABLE IF EXISTS  nomeTabela;
```

A tabela só vai ser deletada se ela existir.

## Manipulando linhas ou registros

Usamos a instrução `UPDATE` para modificar as linhas de uma tabela. O comando `WHERE` serve para filtrar qual ou quais linhas serão modificadas. Caso esse comando não seja informado todos os dados da coluna serão alterados.

```mysql
UPDATE nomeTabela 
SET campo = 'novoValorEntreAspas'  
WHERE coluna = 'valorParaFiltro';
```

### Alterando mais de um campo

```mysql
UPDATE nomeTabela 
SET campo1 = 'novoValor', campo2 = 'novoValor' ...
WHERE coluna = 'valorParaFiltro';
```

### Usando o LIMIT

Podemos limitar o número de linhas que podem ser atualizadas. O intuito de us-á-lo é de ter mais segurança, pois quando os dados são alterados não tem como voltar dando `Ctrl Z`.

```mysql
UPDATE nomeTabela 
SET campo = 'novoValorEntreAspas'  
WHERE coluna = 'valorParaFiltro'
LIMIT 2;
```

Nesse caso, apenas 2 linhas podem ser afetadas.

### Removendo linhas

```mysql
DELETE FROM nomeTabela
WHERE coluna = 'valorParaFiltro';
```

### Operadores lógicos no WHERE

Podemos adicionar ou deletar usando mais de um filtro no comando `where` e para isso usamos os operadores lógicos:

```mysql
DELETE FROM nomeTabela
WHERE coluna1 = 'valorParaFiltro1' = '9' OR coluna2 = 'valorParaFiltro1';
```

No caso, a linha será removida caso corresponda ao filtro 1 OU ao filtro 2.

Para saber mais sobre os operadores lógicos no MySQL consulte a documentação [clicando aqui](https://dev.mysql.com/doc/refman/8.0/en/logical-operators.html).

### Deletando todas as linhas da tabela

```mysql
TRUNCATE cursos;
```

Diferente do comando `DROP`, o `TRUNCATE` não apaga a estrutura da tabela, apenas as linhas. Em outras palavras, limpa a tabela.

## Selecionando dados no banco

O comando `SELECT` é usado para recuperar linhas selecionadas de uma ou mais tabelas e pode incluir instruções e subconsultas.

### SELECT simples

```mysql
SELECT * FROM nome_tabela;
```

Esse comando seleciona todas as linhas e colunas da tabela

### SELECT e WHERE

O comado `WHERE` permite passar condições de filtragem.

```mysql
SELECT * FROM nome_tabela
WHERE nome_coluna = 'valor';
```

Esse comando seleciona todas as colunas da tabela, mas apenas as linhas que tem a coluna indicada no comado igual ao valor indicado.

#### Usando operadores na filtragem

```mysql
SELECT nome_coluna1, nome_coluna2 carga FROM nome_tabela
WHERE nome_coluna <= 'valor';
```

```mysql
SELECT * FROM nome_tabela
WHERE nome_coluna > valor AND totaulas < valor;
```

```mysql
SELECT nome_coluna1, nome_coluna2 FROM nome_tabela
WHERE nome_coluna BETWEEN valor AND valor;
```

```mysql
SELECT nome_coluna1, nome_coluna2 FROM nome_tabela
WHERE nome_coluna IN ('valor1', 'valor2', 'valor3');
```

### SELECT e ordenação

```mysql
SELECT * FROM nome_tabela ORDER BY nome_coluna;
```

Esse comando seleciona todas as linhas e colunas da tabela organizando as linhas na ordem da coluna indicada. Por exemplo, se ela for um nome, será ordenada alfabeticamente.

### SELECT e ordenação inversa

```mysql
SELECT * FROM nome_tabela ORDER BY nome_coluna DESC;
```

Esse comando seleciona todas as linhas e colunas da tabela organizando as linhas na ordem inversa da coluna indicada.

### SELECT com apenas algumas colunas

```mysql
SELECT nome_coluna1, nome_coluna2, nome_coluna3 FROM nome_tabela;
```

Esse comando seleciona todas as linhas apenas das colunas indicadas no comando.

### Filtro de texto

O SELECT fornece o operador LIKE para busca parcial de string.

```mysql
SELECT nome_coluna1, nome_coluna2 FROM nome_tabela
WHERE nome_coluna LIKE ‘string%’
```

O % quer dizer que pode existir mais strings ou nada no lugar em que ele está.

### SELECT e DISTINCT 

```mysql
SELECT DISTINCT nome_coluna FROM nome_tabela;
```

Esse comando seleciona as primeiras ocorrências de valores repetidos ou não na tabela.

### SELECT e  count()

```mysql
SELECT count(*) FROM nome_tabela;
```

Esse comando informa quantas linhas tem a tabela, por que o `*` está dentro dos parênteses.

### Junção de tabelas com JOIN

O SELECT permite juntar duas ou mais tabelas no mesmo resultado. É útil para verificar as chaves estrangeiras.

```mysql
SELECT A.CODIGO, A.DESCRICAO, B.DESCRICAO, B.QTD
FROM PRODUTOS A
INNER JOIN COMPONENTES B
ON (A.CODIGO = B.CODPRODUTO)
```

Versão resumida:

```mysql
SELECT A.CODIGO, A.NOME, B.DATA, B.VALOR
FROM CLIENTES A, PEDIDOS B
WHERE A.CODIGO = B.CODCLIENTE
```

# Chave estrangeira

### Criando tabelas

```mysql
CREATE TABLE nome_tabela (
    id AUTO_INCREMENT PRIMARY KEY,
    chaveEstrangeira INT NOT NULL,
    CONSTRAINT tabelaDaChave_chave_fk
    FOREIGN KEY (chaveEstrangeira)REFERENCES nome_tabela_da_chave (nome_chave_na_origem)
);
```

##### [Voltar para o topo](#Banco-de-dados-com-MySQL)

###### Principais links:

- [Documentação MySQL](https://dev.mysql.com/doc/)
- [MySQL TUTORIAL](https://www.mysqltutorial.org/)

