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

- ##### DESCRIBE:

  Descreve a estrutura de tabelas com suas colunas e tipo de dados.

  ```mysql
  DESCRIBE nomeDaTabela;
  ```

- ##### DROP DATABASE:

  Deleta um banco de dados.

  ```mysql
  DROP DATABASE nomeDoBanco;
  ```

## Chave primária

A restrição `PRIMARY KEY` identifica a exclusividade de cada registro em uma tabela. Por isso tem valores únicos e não podem conter valores `NULL`.

Uma tabela pode ter apenas uma chave primária; e na tabela, essa chave primária pode consistir em uma ou várias colunas (campos).

#### Chave primária no criação de tabela

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

**Precisão simples ** contempla uma precisão de aproximadamente 7 casas decimais.

**Precisão dupla** contempla aproximadamente 15 casas decimais.

**Atributos numéricos:**

ZEROFILL é responsável por preencher com *zeros* à esquerda *do valor informado* sempre que utilizado, o dado automaticamente recebe o atributo *UNSIGNED*.

SIGNED aceita dados negativos.

UNSIGNED não aceita dados negativos.

### Tipo de valores numéricos

| *Tipos*                                   | Tamanho                                | **Usar**                                       |
| :---------------------------------------- | :------------------------------------- | :--------------------------------------------- |
| BIT(M)                                    | M ou o valor padrão que é 1            | Dado do tipo bit                               |
| TINYINT[(M)] [UNSIGNED] [ZEROFILL]        | 1 byte                                 | Valores inteiros pequenos                      |
| SMALLINT[(M)] [UNSIGNED] [ZEROFILL]       | 2 bytes                                | Valor inteiro                                  |
| MEDIUMINT                                 | 3 bytes                                | Valor inteiro                                  |
| INT ou INTEGER[(M)] [UNSIGNED] [ZEROFILL] | 4 bytes                                | Valor inteiro                                  |
| BIGINT[(M)] [UNSIGNED] [ZEROFILL]         | 8 bytes                                | Valor inteiro máximo                           |
| FLOAT[(M [ , D])] [UNSIGNED] [ZEROFILL]   | 4 bytes                                | Valores de ponto flutuante de precisão única   |
| DOUBLE[(M[ , D])] [UNSIGNED] [ZEROFILL]   | 8 bytes                                | Valores de ponto flutuante de precisão dupla   |
| DECIMAL[(M[ , D])] [UNSIGNED] [ZEROFILL]  | Se M > D, M + 2 é caso contrário D + 2 | Valor decimal que depende dos valores de M e D |

### Tipo temporal

| Tipo                    | Tamanho | Formato               | Usar                                                       |
| :---------------------- | :------ | :-------------------- | :--------------------------------------------------------- |
| DATE                    | 3 byte  | YYYY-MM-DD            | Valores de data                                            |
| TIME [(***fsp\***)]     | 3 byte  | HH: MM: SS            | Valor de tempo ou a duração                                |
| YEAR [(4)]              | 1 byte  | YYYY                  | Valor do ano                                               |
| DATETIME[(***fsp\***)]  | 8 byte  | YYYY-MM-DD HH: MM: SS | Combinando valores de data e hora                          |
| TIMESTAMP[(***fsp\***)] | 4 byte  | YYYYMMDD HHMMSS       | Misturando valor de data e hora, um carimbo de data / hora |

### Tipo texto

| Tipo                                                         | Tamanho            | Usar                                                 |
| :----------------------------------------------------------- | :----------------- | :--------------------------------------------------- |
| [NATIONAL] CHAR[(M)] [CHARACTER SET charset_name] [COLLATE collation_name] | 0-255 bytes        | String de comprimento fixo                           |
| [NATIONAL] VARCHAR[(M)] [CHARACTER SET charset_name] [COLLATE collation_name] | 0-65535 bytes      | Strings de comprimento variável                      |
| TINYBLOB                                                     | 0-255 bytes        | Não mais do que 255 caracteres em string binária     |
| TINYTEXT                                                     | 0-255 bytes        | Strings de texto curtas                              |
| BLOB [(M)]                                                   | 0-65535 bytes      | Dados de texto longo em formato binário              |
| TEXT [(M)] [CHARACTER SET charset_name] [COLLATE collation_name] | 0-65535 bytes      | Dados de texto longo                                 |
| MEDIUMBLOB                                                   | 0-16777215 bytes   | Forma binária de dados de texto de comprimento médio |
| MEDIUMTEXT                                                   | 0-16777215 bytes   | Dados de texto de comprimento médio                  |
| LONGBLOB                                                     | 0-4294967295 bytes | Longos dados de texto em formato binário             |
| LONGTEXT                                                     | 0-4294967295 bytes | Longos dados de texto                                |

### Tipo ENUM

Só aceita os valores que enumerarmos na criação do campo.

### Tipo NULL

O null é um tipo especial suportado pelo banco de dados para representar o vazio, e o padrão do MySQL é permitir null nas colunas.

### Tipo Bool ou Boolean

Na prática é o mesmo que usar um TINYINT(1).

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

