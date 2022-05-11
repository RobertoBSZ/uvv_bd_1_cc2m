DROP DATABASE IF EXISTS uvv;
DROP USER IF EXISTS roberto;

/* Criando o usuário roberto para usar o banco de dados UVV*/
CREATE USER roberto WITH
CREATEDB
INHERIT
LOGIN
PASSWORD '123';

/* Criando o banco de dados UVV como criador o usuário roberto e as configurações dadas no pset:
template 0, encoding 'UTF8', LC_COLLATE 'pt_BR.UTF-8', LC_CTYPE 'pt_BR.UTF-8', ALLOW_CONNECTIONS true.*/
CREATE DATABASE uvv WITH
OWNER roberto
TEMPLATE template0
ENCODING 'UTF8'
LC_COLLATE 'pt_BR.UTF-8'
LC_CTYPE 'pt_BR.UTF-8'
ALLOW_CONNECTIONS true;

/* Conectando com o banco de dados UVV com o usuário roberto, com a senha '123'*/
\connect "dbname=uvv user=roberto password=123";

/* Criando o esquema elmasri e autorizando o usuário roberto*/
CREATE SCHEMA elmasri AUTHORIZATION roberto;

/* Tornando o esquema elmasi padrão */
ALTER USER roberto
SET SEARCH_PATH TO elmasri, "$user", public;

SET SEARCH_PATH TO elmasri, "$user", public;

/*Criando as tabelas do projeto elmasri*/

/*Criando tabela funcionario e adicionando CHECK em alguns atributos:
sexo só pode M ou F, salário não pode ser negativo e cpf_supervisor tem que ser diferente que o cpf*/
CREATE TABLE elmasri.funcionario (
                cpf CHAR(11) NOT NULL,
                primeiro_nome VARCHAR(15) NOT NULL,
                nome_meio CHAR(1),
                ultimo_nome VARCHAR(15) NOT NULL,
                data_nascimento DATE,
                endereco VARCHAR(60),
                sexo CHAR(1) CHECK (sexo = 'M' OR sexo = 'F'),
                salario DECIMAL(10,2) CHECK (salario > 0),
                cpf_supervisor CHAR(11) CHECK (cpf_supervisor != cpf),
                numero_departamento INTEGER NOT NULL,
                CONSTRAINT funcionario_pk PRIMARY KEY (cpf)
);
/*Criando os comentários da tabela funcionario e dos atributos/colunas*/
COMMENT ON TABLE elmasri.funcionario IS 'Tabela que armazena as informações dos funcionários.';
COMMENT ON COLUMN elmasri.funcionario.cpf IS 'CPF do funcionário. Será a PK da tabela.';
COMMENT ON COLUMN elmasri.funcionario.primeiro_nome IS 'Primeiro nome do funcionário.';
COMMENT ON COLUMN elmasri.funcionario.nome_meio IS 'Inicial do nome do meio.';
COMMENT ON COLUMN elmasri.funcionario.ultimo_nome IS 'Sobrenome do funcionário.';
COMMENT ON COLUMN elmasri.funcionario.data_nascimento IS 'Data de nascimento do funcionário.';
COMMENT ON COLUMN elmasri.funcionario.endereco IS 'Endereço do funcionário.';
COMMENT ON COLUMN elmasri.funcionario.sexo IS 'Sexo do funcionário.';
COMMENT ON COLUMN elmasri.funcionario.salario IS 'Salário do funcionário.';
COMMENT ON COLUMN elmasri.funcionario.cpf_supervisor IS 'CPF do supervisor. Será uma FK para a própria tabela (um auto-relacionamento).';
COMMENT ON COLUMN elmasri.funcionario.numero_departamento IS 'Número do departamento do funcionário.';

/*Criando a tabela dependente e adicionando CHECK no sexo: sexo só pode ser M ou F*/
CREATE TABLE elmasri.dependente (
                cpf_funcionario CHAR(11) NOT NULL,
                nome_dependente VARCHAR(15) NOT NULL,
                sexo CHAR(1) CHECK (sexo = 'M' OR sexo = 'F'),                                 
                data_nascimento DATE,
                parentesco VARCHAR(15),
                CONSTRAINT dependente_pk PRIMARY KEY (cpf_funcionario, nome_dependente)
);
/*Criando os comentários da tabela dependentes e dos atributos/colunas*/
COMMENT ON TABLE elmasri.dependente IS 'Tabela que armazena as informações dos dependentes dos funcionários.';
COMMENT ON COLUMN elmasri.dependente.cpf_funcionario IS 'CPF do funcionário. Faz parte da PK desta tabela e é uma FK para a tabela funcionário.';
COMMENT ON COLUMN elmasri.dependente.nome_dependente IS 'Nome do dependente. Faz parte da PK desta tabela.';
COMMENT ON COLUMN elmasri.dependente.sexo IS 'Sexo do dependente.';
COMMENT ON COLUMN elmasri.dependente.data_nascimento IS 'Data de nascimento do dependente.';
COMMENT ON COLUMN elmasri.dependente.parentesco IS 'Descrição do parentesco do dependente com o funcionário.';

/*Criando a tabela departamento e adcionando CHECK no numero_departamento, onde o numero_departamento não pode ser negativo*/
CREATE TABLE elmasri.departamento (
                numero_departamento INTEGER NOT NULL CHECK (numero_departamento >= 0),
                nome_departamento VARCHAR(15) NOT NULL,
                cpf_gerente CHAR(11) NOT NULL,
                data_inicio_gerente DATE,
                CONSTRAINT departamento_pk PRIMARY KEY (numero_departamento)
);
/*Criando os comentários da tabela departamento e dos atributos/colunas*/
COMMENT ON TABLE elmasri.departamento IS 'Tabela que armazena as informações dos departamentos.';
COMMENT ON COLUMN elmasri.departamento.numero_departamento IS 'Número do departamento. É a PK desta tabela.';
COMMENT ON COLUMN elmasri.departamento.nome_departamento IS 'Nome do departamento. Deve ser único.';
COMMENT ON COLUMN elmasri.departamento.cpf_gerente IS 'CPF do gerente do departamento. É uma FK para a tabela funcionários.';
COMMENT ON COLUMN elmasri.departamento.data_inicio_gerente IS 'Data do início do gerente no departamento.';

/*Criando a chave única no atributo nome_departamento da tabela departamento*/
CREATE UNIQUE INDEX departamento_ak
 ON elmasri.departamento
 ( nome_departamento );

/*Criando a tabela projeto e adicionando CHECK no numero_projeto e no numero_departamento, impedindo que sejam negativos*/
CREATE TABLE elmasri.projeto (
                numero_projeto INTEGER NOT NULL CHECK (numero_projeto >= 0),
                nome_projeto VARCHAR(15) NOT NULL,
                local_projeto VARCHAR(15),
                numero_departamento INTEGER NOT NULL CHECK (numero_departamento >= 0),
                CONSTRAINT projeto_pk PRIMARY KEY (numero_projeto)
);
/*Criando os comentários da tabela projeto e dos atributos*/
COMMENT ON TABLE elmasri.projeto IS 'Tabela que armazena as informações sobre os projetos dos departamentos.';
COMMENT ON COLUMN elmasri.projeto.numero_projeto IS 'Número do projeto. É a PK desta tabela.';
COMMENT ON COLUMN elmasri.projeto.nome_projeto IS 'Nome do projeto. Deve ser único.';
COMMENT ON COLUMN elmasri.projeto.local_projeto IS 'Localização do projeto.';
COMMENT ON COLUMN elmasri.projeto.numero_departamento IS 'Número do departamento. É uma FK para a tabela departamento.';

/*Criando a chave única no atributo nome_projeto da tabela projeto*/
CREATE UNIQUE INDEX projeto_ak
 ON elmasri.projeto
 ( nome_projeto );

/*Criando a tabela trabalha_em e adicionando CHECK no numero projeto para */
CREATE TABLE elmasri.trabalha_em (
                cpf_funcionario CHAR(11) NOT NULL,
                numero_projeto INTEGER NOT NULL CHECK (numero_projeto >= 0),
                horas DECIMAL(3,1) CHECK (horas >= 0),
                CONSTRAINT trabalha_em_pk PRIMARY KEY (cpf_funcionario, numero_projeto)
);
/*Criando os comentários da tabela trabalha_em e dos atributos*/
COMMENT ON TABLE elmasri.trabalha_em IS 'Tabela para armazenar quais funcionários trabalham em quais projetos.';
COMMENT ON COLUMN elmasri.trabalha_em.cpf_funcionario IS 'CPF do funcionário. Faz parte da PK desta tabela e é uma FK para a tabela funcionário.';
COMMENT ON COLUMN elmasri.trabalha_em.numero_projeto IS 'Número do projeto. Faz parte da PK desta tabela e é uma FK para a tabela projeto.';
COMMENT ON COLUMN elmasri.trabalha_em.horas IS 'Horas trabalhadas pelo funcionário neste projeto.';

/*Criando a tabela localizacoes_departamento*/
CREATE TABLE elmasri.localizacoes_departamento (
                numero_departamento INTEGER NOT NULL CHECK (numero_departamento >= 0),
                local VARCHAR(15) NOT NULL,
                CONSTRAINT localizacoes_departamento_pk PRIMARY KEY (numero_departamento, local)
);
/*Criando os comentários na tabela localizacoes_departamento*/
COMMENT ON TABLE elmasri.localizacoes_departamento IS 'Tabela que armazena as possíveis localizações dos departamentos.';
COMMENT ON COLUMN elmasri.localizacoes_departamento.numero_departamento IS 'Número do departamento. Faz parta da PK desta tabela e também é uma FK para a tabela departamento.';
COMMENT ON COLUMN elmasri.localizacoes_departamento.local IS 'Localização do departamento. Faz parte da PK desta tabela.';

/*Adicionando uma foreign key no atributo cpf_gerente da tabela departamento e conectando com a pk cpf da tabela funcionario*/
ALTER TABLE elmasri.departamento ADD CONSTRAINT funcionario_departamento_fk
FOREIGN KEY (cpf_gerente)
REFERENCES elmasri.funcionario (cpf)
ON DELETE CASCADE
ON UPDATE CASCADE;

/*Adicionando uma foreign key no atributo cpf_funcionario da tabela trabalha_em e conectando com a pk cpf da tabela funcionario*/
ALTER TABLE elmasri.trabalha_em ADD CONSTRAINT funcionario_trabalha_em_fk
FOREIGN KEY (cpf_funcionario)
REFERENCES elmasri.funcionario (cpf)
ON DELETE CASCADE
ON UPDATE CASCADE;

/*Adicionando uma foreign key no atributo cpf_funcionario da tabela dependente e conectando com a pk cpf da tabela funcionario*/
ALTER TABLE elmasri.dependente ADD CONSTRAINT funcionario_dependente_fk
FOREIGN KEY (cpf_funcionario)
REFERENCES elmasri.funcionario (cpf)
ON DELETE CASCADE
ON UPDATE CASCADE;

/*Adicionando uma foreign key no atributo cpf_supervisor da tabela funcionario e conectando com a pk CPF da tabela funcionario*/
ALTER TABLE elmasri.funcionario ADD CONSTRAINT funcionario_funcionario_fk
FOREIGN KEY (cpf_supervisor)
REFERENCES elmasri.funcionario (cpf)
ON DELETE CASCADE
ON UPDATE CASCADE;

/*Adicionando uma foreign key no atributo numero_departamento da tabela localizacoes_departamento e conectando com a pk numero_departamento da tabela departamento*/
ALTER TABLE elmasri.localizacoes_departamento ADD CONSTRAINT departamento_localizacoes_departamento_fk
FOREIGN KEY (numero_departamento)
REFERENCES elmasri.departamento (numero_departamento)
ON DELETE CASCADE
ON UPDATE CASCADE;

/*Adicionando uma foreign key no atributo numero_departamento da tabela projeto e conectando com a pk numero_departamento da tabela departamento*/
ALTER TABLE elmasri.projeto ADD CONSTRAINT departamento_projeto_fk
FOREIGN KEY (numero_departamento)
REFERENCES elmasri.departamento (numero_departamento)
ON DELETE CASCADE
ON UPDATE CASCADE;

/*Adicionando uma foreign key no atributo numero_projeto da tabela trabalha_em e conectando com a pk numero_projeto da tabela projeto*/
ALTER TABLE elmasri.trabalha_em ADD CONSTRAINT projeto_trabalha_em_fk
FOREIGN KEY (numero_projeto)
REFERENCES elmasri.projeto (numero_projeto)
ON DELETE CASCADE
ON UPDATE CASCADE;

/*Inserindo os dados dos funcionários, colocando os superiores primeiro, para que não se inclua cpf supervisores antes dos próprios supervisores*/
INSERT INTO funcionario (primeiro_nome, nome_meio, ultimo_nome, cpf, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento) VALUES ('Jorge', 'E', 'Brito', '88866555576', '1937-11-10', 'Rua do Horto, 35, São Paulo, SP', 'M', 55000, null, 1),
			('Fernando', 'T', 'Wong', '33344555587', '1955-12-08', 'Rua da Lapa, 34, São Paulo, SP', 'M', 40000, '88866555576', 5),
			('João', 'B', 'Silva', '12345678966', '1965-01-09', 'Rua das Flores, 751, São Paulo, SP', 'M', 30000, '33344555587', 5),
			('Jennifer', 'S', 'Souza', '98765432168', '1941-06-20', 'Av.Arthur de Lima, 54, Santo André, SP', 'F', '43000', '88866555576', 4),
			('André', 'V', 'Pereira', '98798798733', '1937-11-10', 'Rua Timbira, 35, São Paulo, SP', 'M', 25000, '98765432168', 4),
			('Alice', 'J', 'Zelaya', '99988777767', '1968-01-19', 'Rua Souza Lima, 35, Curitiba, PR', 'F', 25000, '98765432168', 4),
			('Ronaldo', 'K', 'Lima', '66688444476', '1962-09-15', 'Rua Rebouças, 65, Piracicaba, SP', 'M', 38000, '33344555587', 5),
			('Joice', 'A', 'Leite', '45345345376', '1972-07-31', 'Av. Lucas Obes, 74, São Paulo, SP', 'F', 25000, '33344555587', 5);
			
/*Inserindo os dados dos departamento*/
INSERT INTO departamento (nome_departamento, numero_departamento, cpf_gerente, data_inicio_gerente) VALUES ('Pesquisa', 5, '33344555587', '1988-05-22'), 
			('Administração', 4, '98765432168', '1995-01-01'), 
			('Matriz', 1, '88866555576', '1981-06-19');
			
/*Inserindo os dados das localizações dos departamentos*/
INSERT INTO localizacoes_departamento (numero_departamento, local) VALUES (1, 'São Paulo'), (4, 'Mauá'), (5, 'Santo André'), 
			(5, 'Itu'), (5, 'São Paulo');
			
/*Inserindo os dados do projeto*/
INSERT INTO projeto (nome_projeto, numero_projeto, local_projeto, numero_departamento) VALUES ('ProdutoX', 1, 'Santo André', 5),
			('ProdutoY', 2, 'Itu', 5), 
			('ProdutoZ', 3, 'São Paulo', 5),
			('Informatização', 10, 'Mauá', 4),
			('Reorganização', 20, 'São Paulo', 1),
			('Novosbenefícios', 30, 'Mauá', 4);
			
/*Inserindo os dados dos dependentes dos funcionários*/
INSERT INTO dependente (cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco) VALUES ('33344555587', 'Alicia', 'F', '1986-04-05', 'Filha'),
			  ('33344555587', 'Tiago', 'M', '1983-10-25', 'Filho'),
    		  ('33344555587', 'Janaína', 'F', '1958-05-03', 'Esposa'),
    		  ('98765432168', 'Antonio', 'M', '1942-02-28', 'Marido'),
			  ('12345678966', 'Michael', 'M', '1988-01-04', 'Filho'),
			  ('12345678966', 'Alicia', 'F', '1988-12-30', 'Filha'),
			  ('12345678966', 'Elizabeth', 'F', '1967-05-05', 'Esposa');

/*Inserindo os dados na tabela trabalha_em*/
INSERT INTO trabalha_em (cpf_funcionario, numero_projeto, horas) VALUES ('12345678966', 1, 32.5),
    		 ('12345678966', 2, 7.5),
			 ('66688444476', 3, 40.0),
			 ('45345345376', 1, 20.0),
			 ('45345345376', 2, 20.0),
			 ('33344555587', 2, 10.0),
			 ('33344555587', 3, 10.0),
			 ('33344555587', 10, 10.0),
			 ('33344555587', 20, 10.0),
			 ('99988777767', 30, 30.0),
			 ('99988777767', 10, 10.0),
			 ('98798798733', 10, 35.0),
			 ('98798798733', 30, 5.0),
			 ('98765432168', 30, 20.0),
			 ('98765432168', 20, 15.0),
			 ('88866555576', 20, null);
