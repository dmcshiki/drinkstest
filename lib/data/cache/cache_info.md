Nessa pasta usamos o tipo de data cache para obtermos as informações necessárias do projeto.
O arquivo drink_cds (drink cache data source) utliza o Hive para fazermos nossa lógica de get&set 
das informações utlizadas no projeto através do armazenamento interno do dispositivo através do cache do mesmo.
Fazemos isso para que seja mais fácil acessar os dados, considerando que uma vez carregados, eles não terão de ser carregados novamente.
Também para facilitar o acesso caso o mesmo não consiga acessar os dados através da web.