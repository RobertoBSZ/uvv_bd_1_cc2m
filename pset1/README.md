# PSET 1
# Início do pset 
###### O início do pset1 foi da seguinte forma, comecei lendo o livro GitPro para responder as primeiras questões do pset1, que era em relação ao Git e GitHub. Logo em seguida, depois de responder as questões, fui ler o capítulo 3,1, que explicava que todo o trabalho tinha que ser em scripts e enviado ao repositório Git/Github.
###### A partir daí, fui para a criação do repositório uvv_bd_1_cc2m, onde teria que ser público e posuísse os README, onde haveria a explicação introdutória do trabalho, o que ele contém, e como foi resolvido passo a passo.
# PowerArchitect
###### Após a criação do repositório, o próximo passo foi a criação do Modelo Elmasri do Power Architect, onde foi criado toda as tabelas, a funcionario, localizacoes_departamento, departamento, projeto, trabalha_em e dependente. E, junto com a criação das tabelas, também foram criadas todos os atributos, primary key, foreign key e as unique key das suas respectivas tabelas(informações mais a fundo dos atributos está disponível no arquivo enviado pelo professor).
###### Logo após a implementação do projeto lógico elmasri no PowerArchitect e a conclusão das questões discussivas, chega a hora de implementar nos bancos de dados MariaDB e no PostgreSQL.
# PostgresSQL
###### Primeiramente, a implementação no PostgreSQL foi a primeira da vez. Antes de adicionar os comandos disponibilizados pelo PowerArchitet, foi necessário criar o usuário 'roberto', com a permissão de criar banco de dados e uma senha '123', e o banco de dados 'uvv', colocando como criador o usuário roberto, encoding 'UTF8', LC_COLLATE 'pt BR.UTF-8', LC_CTYPE 'pt_BR.UTF-8' e ALLOW_CONECTIONS true. Depois disso, usou-se o comando \connect uvv roberto para se conectar ao banco de dados uvv com o usuário roberto (relembrando que a senha é '123'). Logo depois foi criado o esquema elmasri e autorizando o usuário roberto a configurá-lo e, por fim, foi usado o comando 'SET SEARCH_PATH TO elmasri, roberto, public;', para colocar o esquema elmasri como padrão.
###### Depois disso, foi adicionado as tabelas, os atributos, as restrições,os comentários e as chaves, que foram disponibilizadas pelo PowerArchitect.
###### Finalizando, foi adicionado os dados de cada tabela. Esses dados foram dados no arquivo problema do professor.
# MariaDB
### Primeiro Script
###### Finalizando o projeto, agora é hora de implementar no MariaDB. Como já houve a implementação do PostgresSQL, o MariaDB acabou sendo um "pouco" mais tranquilo. Primeiramente, os códigos foram separados em dois scripts, o primeiro era a criação do usuário 'roberto'@'localhost' com a senha '123', a criação do banco de dados 'uvv' com as seguintes características: 'SET utf8mb4 COLLATE utf8mb4_unicode_ci;'. E foi adicionado os privilégios de todas as tabelas do banco de dados uvv para o usuário roberto. E, o último código do primeiro script era o 'SYSTEM mysql -u roberto -p;', que conecta o usuário roberto ao sistema, em vez de usar o root.
### Segundo Script
###### No segundo script foi adicionado as tabelas, os atributos, primary key, foreign key ,as unique key e os dados das suas respectivas tabelas. Os códigos foram disponibilizados pelo PowerArchitect.

# Grupo que me ajudou no projeto
- Yuri Soares
- Pedro Lima
###### fim!
