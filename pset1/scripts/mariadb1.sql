/* PRIMEIRO SCRIPT DO MARIADB: Criação do usuário, do banco de dados, a adição de privilégios e a troca parar o usuário criado*/
/*Criando o usuário 'roberto' para futuramente usar o banco de dados UVV*/
CREATE USER 'roberto'@'localhost' IDENTIFIED BY '123';

/*Criando o banco de dados/esquema UVV com as configurações dadas no pset:
 SET utf8mb4 e COLLATE utfmb4_unicode_ci*/
CREATE DATABASE uvv CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

/*Colocando todos os privilégios do banco de dados 'uvv' para o usuário 'roberto'*/
GRANT ALL PRIVILEGES ON uvv.* to 'roberto'@'localhost';

/* Conectando o usuário roberto para ele entrar no banco de dados*/
SYSTEM mysql -u roberto -p;

