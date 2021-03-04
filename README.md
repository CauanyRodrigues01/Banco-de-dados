# Banco de dados com MySQL
 Material desenvolvido durante meus estudos de Bando de Dados

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
  CREATE TABLE nomeDaTabela (colunasDaTabela);
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

  Serve para inserir dados em uma tabela já existente. Os valores devem estar entre aspas e precisam estar na mesma ordem que o nome das colunas.

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

#### Chave primária na criação de tabela

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

| Tipos          | Forma alternativa                         | Definição                                                    |
| :------------- | ----------------------------------------- | :----------------------------------------------------------- |
| BIT            | BIT(M)                                    | Número inteiro que pode ser somente 0 (falso) ou 1 (verdadeiro). |
| TINYINT        | TINYINT[(M)] [UNSIGNED] [ZEROFILL]        | Caso haja valor negativo, a margem de uso dele é de -128 até 127. Caso seja apenas positivo, vai de 0 a 255. |
| SMALLINT       | SMALLINT[(M)] [UNSIGNED] [ZEROFILL]       | Número inteiro com ou sem sinal negativo. Caso haja sinal negativo, vai de -32768 até 32767. Sem sinal, vai de 0 até 65535. |
| MEDIUMINT      | MEDIUMINT                                 | Número inteiro, com ou sem sinal negativo. Com sinal vai de -8.388.608 até 8.388.607. Sem sinal vai de 0 até 16777215. |
| INT ou INTEGER | INT ou INTEGER[(M)] [UNSIGNED] [ZEROFILL] | Número inteiro, positivo ou negativo. Caso haja número negativo, sua margem vai de -2147483648 até 2147483647. Caso sejam só positivos, é de 0 até 429.496.295. |
| BIGINT         | BIGINT[(M)] [UNSIGNED] [ZEROFILL]         | Número inteiro, com ou sem sinal negativo. Com sinal vai de -9.223.372.036.854.775.808 até 9.223.372.036.854.775.807. Sem sinal vai de 0 até 18.446.744.073.709.551.615. |
| FLOAT          | FLOAT[(M [ , D])] [UNSIGNED] [ZEROFILL]   | Número pequeno em vírgula flutuante de precisão simples. Os valores válidos vão desde -3.402823466E+38 até -1.175494351E-38,0 até desde 175494351E-38 até 3.402823466E+38. |
| DOUBLE         | DOUBLE[(M[ , D])] [UNSIGNED] [ZEROFILL]   | Número em vírgula flutuante de dupla precisão. Os valores permitidos vão desde -1.7976931348623157E+308 até -2.2250738585072014E-308, 0 e desde 2.2250738585072014E-308 até 1.7976931348623157E+308 |
| DECIMAL        | DECIMAL[(M[ , D])] [UNSIGNED] [ZEROFILL]  | Número em vírgula flutuante desempacotado. O número armazena-se como uma cadeia. |

### Tipo temporal

| Tipo             | Formato             | Definição                                                    |
| :--------------- | :------------------ | :----------------------------------------------------------- |
| DATE             | AAAA-MM-DD          | Armazena uma data com valor entre ‘1000-01-01’ e ‘9999-12-31’ |
| TIME [(fsp)]     | HH:MM:SS            | Armazena uma hora. A margem de horas vai desde -838 horas, 59 minutos e 59 segundos. |
| YEAR [(4)]       | YYYY                | Armazena um ano. A margem de valores permitidos vai desde o ano 1901 ao ano 2155. |
| DATETIME[(fsp)]  | AAAA-MM-DD HH:MM:SS | Armazena a data e hora combinadas. Suporta valores entre ‘1000-01-01 00:00:00’ e ‘9999-12-31 23:59:59’ |
| TIMESTAMP[(fsp)] | aaaammddhhmmss      | Combinação de data e hora. A margem vai desde o 1 de Janeiro de 1970 ao ano 2037. O formato de armazenamento depende do tamanho do campo. |

### Tipo texto

| Tipo       | Forma alternativa                                            | Definição                                                    |
| :--------- | ------------------------------------------------------------ | :----------------------------------------------------------- |
| CHAR       | [NATIONAL] CHAR[(M)] [CHARACTER SET charset_name] [COLLATE collation_name] | Armazena uma string de tamanho fixo. A cadeia poderá conter de 0 até 255 caracteres. |
| VARCHAR    | [NATIONAL] VARCHAR[(M)] [CHARACTER SET charset_name] [COLLATE collation_name] | Armazena uma string de tamanho variável. Vai de 0 a 255 caracteres. |
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

###### Fonte:

- [Documentação MySQL](https://dev.mysql.com/doc/refman/5.7/en/charset-applications.html)
- [Os 10 comandos SQL que você não pode viver sem!](https://becode.com.br/comandos-sql-nao-pode-viver-sem/)
- [Restrição SQL PRIMARY KEY](https://www.w3schools.com/sql/sql_primarykey.asp)
- [Restrição SQL NOT NULL](https://www.w3schools.com/sql/sql_notnull.asp)
- [Instrução SQL DROP DATABASE](https://www.w3schools.com/sql/sql_drop_db.asp)
- [Tipos de dados MySQL](http://www.w3big.com/mysql/mysql-data-types.html)
- [Banco de Dados MySQL Tipos de Dados](https://devcontent.com.br/artigos/banco-de-dados/mysql/tipos-de-dados)
- [MySQL — Tipos de dados: Introdução e dados numéricos (1 de 3)](https://medium.com/mandabugs/mysql-tipos-de-dados-introdu%C3%A7%C3%A3o-e-dados-num%C3%A9ricos-1-de-3-a6e48fb5e1d3)
- [MySQL — Tipos de dados: data/hora (2 de 3)](https://medium.com/mandabugs/mysql-tipos-de-dados-data-hora-2-de-3-c147a8d90f93)
- [MySQL — Tipos de dados: strings (3 de 3)](https://medium.com/mandabugs/mysql-tipos-de-dados-strings-3-de-3-13cba7dccf2f)
- [[Tipos de dados no MySQL](https://www.diegomacedo.com.br/tipos-de-dados-no-mysql/)](https://www.diegomacedo.com.br/tipos-de-dados-no-mysql/#:~:text=TinyInt%20%E2%80%93%20Caso%20haja%20valor%20negativo,vai%20de%20%2D2147483648%20at%C3%A9%202147483647.)
- [Restrição MySQL NOT NULL](https://www.mysqltutorial.org/mysql-not-null-constraint/#:~:text=The%20NOT%20NULL%20constraint%20is,a%20column%20are%20not%20NULL%20.&text=A%20column%20may%20contain%20only,MySQL%20will%20issue%20an%20error.)

###### Principais links:

- [Documentação MySQL](https://dev.mysql.com/doc/)
- [MySQL TUTORIAL](https://www.mysqltutorial.org/)

