# PSET 2
## Início do pset 2
######Este repositório apresenta todos os SELECT's das 15 questões presentes no pset 2, formando os relatórios exigidos em cada questão. Essa resolução foi feita com base nas consultas feitas no Livro de Sistemas De Banco De Dados by Ramez Elmasri, Shamkant B. Navathe e através de pesquisas na internet.
------------
## Saídas de cada questão
###### Abaixo está todos os relatórios de cada questão presentes no script.
### Questão 1:
######Um relatório que mostra a média salarial dos funcionários em cada departamento.

 |departamento  | média_salarial|
|---|---|
 |Pesquisa      |       33250.00|
 |Administração |       31000.00|
 |Matriz   |    55000.00|
------------
### Questão 2:
###### Um relatório que mostra a média salarial dos homens e das mulheres.
|sexo    | média_salarial| 
|---|---|
|Feminino  |       31000.00|
|Masculino |       37600.00|
------------
### Questão 3:
###### Um relatório que mostra o nome dos departamentos e as seguintes informações dos seus respectivos funcionários: o nome completo, a data de nascimento, a idade em anos completos e o salário.
|departamento  |       nome       | data_nascimento | idade | salario |
|---|---|
|Matriz        | Jorge E Brito    | 1937-11-10      |    84 | 55000.00
|Pesquisa      | Fernando T Wong  | 1955-12-08      |    66 | 40000.00
|Pesquisa      | João B Silva     | 1965-01-09      |    57 | 30000.00
|Administração | Jennifer S Souza | 1941-06-20      |    80 | 43000.00
|Administração | André V Pereira  | 1937-11-10      |    84 | 25000.00
|Administração | Alice J Zelaya   | 1968-01-19      |    54 | 25000.00
|Pesquisa      | Ronaldo K Lima   | 1962-09-15      |    59 | 38000.00
|Pesquisa      | Joice A Leite    | 1972-07-31      |    49 | 25000.00
------------
###Questão 4:
###### Um relatório que mostra o nome completo dos funcionários, a idade em anos completos, o salário atual e o salário reajustado com as seguintes condições (Se o salário do funcionário for menor que 35.000, deve haver um reajuste de 20%, e se for igual ou superior, de 15%).
 | nome       | idade | salario  | salario_reajustado |
|---|---|
| Alice J Zelaya   |    54 | 25000.00 |           30000.00
 |Jorge E Brito    |    84 | 55000.00 |           63250.00
 |João B Silva     |    57 | 30000.00 |           36000.00
 |Jennifer S Souza |    80 | 43000.00 |           49450.00
 |André V Pereira  |    84 | 25000.00 |           30000.00
 |Joice A Leite    |    49 | 25000.00 |           30000.00
 |Fernando T Wong  |    66 | 40000.00 |           46000.00
 |Ronaldo K Lima   |    59 | 38000.00 |           43700.00
------------
### Questão 5:
###### Um relatório que mostra, de cada departamento, o nome do gerente e o nome de seus funcionários, ordenado por nome do departamento (em ordem crescente) e por salário dos funcionários (em ordem decrescente).
|departamento  |       nome       | salario  | gerente 
|---|---|
| Administração | Jennifer S Souza | 43000.00 | *
 |Administração | Alice J Zelaya   | 25000.00 | --
 |Administração | André V Pereira  | 25000.00 | --
 |Matriz        | Jorge E Brito    | 55000.00 | *
 |Pesquisa      | Fernando T Wong  | 40000.00 | *
 |Pesquisa      | Ronaldo K Lima   | 38000.00 | --
 |Pesquisa      | João B Silva     | 30000.00 | --
 |Pesquisa      | Joice A Leite    | 25000.00 | --
------------
### Questão 6
###### Um relatório que mostra o nome completo dos funcionários que POSSUEM dependentes, os departamentos onde trabalham e o nome completo de seus dependentes, a idade deles em ANOS e o sexo (aparecendo Masculino em vez de M e Feminino em vez de F).
|nome_funcionario | departamentos | nome_dependente |   sexo    | idade 
|---|---|
|Fernando T Wong  | Pesquisa      | Alicia          | Feminino  |    36
|Fernando T Wong  | Pesquisa      | Tiago           | Masculino |    38
 |Fernando T Wong  | Pesquisa      | Janaína         | Feminino  |    64
 |Jennifer S Souza | Administração | Antonio         | Masculino |    80
 |João B Silva     | Pesquisa      | Michael         | Masculino |    34
 |João B Silva     | Pesquisa      | Alicia          | Feminino  |    33
 |João B Silva     | Pesquisa      | Elizabeth       | Feminino  |    55
------------
### Questão 7
###### Um relatório que mostra o nome completo dos funcionários que NÃO POSSUEM dependentes, os departamentos onde trabalham e seu salário.
 |nome       | departamento  | salario
|---|---|
 |Jorge E Brito   | Matriz        | 55000.00
 |André V Pereira | Administração | 25000.00
 |Alice J Zelaya  | Administração | 25000.00
 |Ronaldo K Lima  | Pesquisa      | 38000.00
 |Joice A Leite   | Pesquisa      | 25000.00
------------
### Questão 8:
###### Um relatório que mostra os projetos de cada departamento e os funcionários que estão trabalhando NO PROJETO, e o número de horas trabalhadas por cada funcionário em cada projeto.
|departamento  |     projeto     |       nome       | horas 
|---|---|
 |Administração | Informatização  | Fernando T Wong  |  10.0
 |Administração | Informatização  | André V Pereira  |  35.0
 |Administração | Informatização  | Alice J Zelaya   |  10.0
 |Administração | Novosbenefícios | Jennifer S Souza |  20.0
 |Administração | Novosbenefícios | André V Pereira  |   5.0
 |Administração | Novosbenefícios | Alice J Zelaya   |  30.0
 |Matriz        | Reorganização   | Jorge E Brito    |
 |Matriz        | Reorganização   | Fernando T Wong  |  10.0
 |Matriz        | Reorganização   | Jennifer S Souza |  15.0
 |Pesquisa      | ProdutoX        | João B Silva     |  32.5
 |Pesquisa      | ProdutoX        | Joice A Leite    |  20.0
 |Pesquisa      | ProdutoY        | Joice A Leite    |  20.0
 |Pesquisa      | ProdutoY        | Fernando T Wong  |  10.0
 |Pesquisa      | ProdutoY        | João B Silva     |   7.5
 |Pesquisa      | ProdutoZ        | Ronaldo K Lima   |  40.0
 |Pesquisa      | ProdutoZ        | Fernando T Wong  |  10.0
------------
### Questão 9:
###### Um relatório que mostra a soma total das horas de cada projeto em cada departamento, exibindo o nome do departamento, o nome do projeto e a soma total das horas.
|departamento  |     projeto     | total_horas 
|---|---|
 |Administração | Informatização  |        55.0
 |Administração | Novosbenefícios |        55.0
 |Matriz        | Reorganização   |        25.0
 |Pesquisa      | ProdutoX        |        52.5
 |Pesquisa      | ProdutoY        |        37.5
 |Pesquisa      | ProdutoZ        |        50.0
------------
### Questão 10:
###### Um relatório que mostra a média salarial dos funcionários em cada departamento (mesma coisa que a primeira questão!).
|departamento  | média_salarial 
|---|---|
 |Pesquisa      |       33250.00
 |Administração |       31000.00
 |Matriz        |       55000.00
------------
### Questão 11:
###### Um relatório que mostra o nome completo do funcionário, o nome do projeto, e o valor total que o funcionário recebe (sabendo que o valor pago é de 50 reais a hora).
|  nome       |     projeto     | total_valor 
|---|---|
 |João B Silva     | ProdutoX        |     1625.00
 |João B Silva     | ProdutoY        |      375.00
 |Ronaldo K Lima   | ProdutoZ        |     2000.00
 |Joice A Leite    | ProdutoX        |     1000.00
 |Joice A Leite    | ProdutoY        |     1000.00
 |Fernando T Wong  | ProdutoY        |      500.00
 |Fernando T Wong  | ProdutoZ        |      500.00
 |Fernando T Wong  | Informatização  |      500.00
 |Fernando T Wong  | Reorganização   |      500.00
 |Alice J Zelaya   | Novosbenefícios |     1500.00
 |Alice J Zelaya   | Informatização  |      500.00
 |André V Pereira  | Informatização  |     1750.00
 |André V Pereira  | Novosbenefícios |      250.00
 |Jennifer S Souza | Novosbenefícios |     1000.00
 |Jennifer S Souza | Reorganização   |      750.00
 |Jorge E Brito    | Reorganização   |         --
------------
### Questão 12:
###### Um relatório que mostra o nome do departamento, o nome do projeto, e o nome do funcionário que, mesmo estando em um projeto, não tem nenhuma hora trabalhada registrada.
 |departamento |    projeto    |     nome
|---|---|
 |Matriz       | Reorganização | Jorge E Brito
------------
### Questão 13:
###### Um relatório que mostra o nome completo dos funcionários e dependentes, o sexo deles e a idade em anos completos(para todos receberem um presente adequado!), sendo esse relatório ordenado pela idade em anos completos, de forma decrescente.
|  nome       |   sexo    | idade 
|---|---|
 |André V Pereira  | Masculino |    84
 |Jorge E Brito    | Masculino |    84
 |Jennifer S Souza | Feminino  |    80
 |Antonio          | Masculino |    80
 |Fernando T Wong  | Masculino |    66
 |Janaína          | Feminino  |    64
 |Ronaldo K Lima   | Masculino |    59
 |João B Silva     | Masculino |    57
 |Elizabeth        | Feminino  |    55
 |Alice J Zelaya   | Feminino  |    54
 |Joice A Leite    | Feminino  |    49
 |Tiago            | Masculino |    38
 |Alicia           | Feminino  |    36
 |Michael          | Masculino |    34
 |Alicia           | Feminino  |    33
------------
### Questão 14: 
###### Um relatório que mostra quantos funcionários cada departamento tem.
| departamento  | quantidade_funcionarios 
|---|---|
 |Pesquisa      |                       4
 |Administração |                       3
 |Matriz        |                       1
------------
### Questão 15:
###### Um relatório que mostra o nome completo do funcionário, o departamento do mesmo, e o nome dos projetos que cada funcionário está alocado(OBS: Se houver algum funcionário que não está alocado em nenhum projeto, o nome completo e o departamento também aparecem no relatório).
|       nome       | departamento  |     projeto
|---|---|
|Alice J Zelaya   | Administração | Informatização
 |Alice J Zelaya   | Administração | Novosbenefícios
 |André V Pereira  | Administração | Novosbenefícios
 |André V Pereira  | Administração | Informatização
 |Fernando T Wong  | Pesquisa      | ProdutoZ
 |Fernando T Wong  | Pesquisa      | ProdutoY
 |Fernando T Wong  | Pesquisa      | Informatização
 |Fernando T Wong  | Pesquisa      | Reorganização
 |Jennifer S Souza | Administração | Reorganização
 |Jennifer S Souza | Administração | Novosbenefícios
| João B Silva     | Pesquisa      | ProdutoX
 |João B Silva     | Pesquisa      | ProdutoY
 |Joice A Leite    | Pesquisa      | ProdutoY
 |Joice A Leite    | Pesquisa      | ProdutoX
 |Jorge E Brito    | Matriz        | Reorganização
 |Ronaldo K Lima   | Pesquisa      | ProdutoZ

# Grupo que me ajudou no projeto
- Yuri Soares
- Pedro Lima
###### fim!
