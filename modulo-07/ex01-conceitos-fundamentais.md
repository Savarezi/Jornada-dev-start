# Exercício 1 — Conceitos fundamentais

## Respostas

### a. Qual é a função do AppServer?
O AppServer é o servidor de aplicação do Protheus. Ele é responsável por processar as regras de negócio, executar os programas em ADVPL, gerenciar as conexões dos usuários e fazer a ponte entre o SmartClient (interface) e o banco de dados/dicionário.

### b. O que é o RPO?
O RPO (TOTVS Repository) é o repositório de objetos onde ficam armazenados todos os fontes compilados do sistema, além de funções de sistema e dicionários de metadados, permitindo que o AppServer execute as rotinas.

### c. Para que serve o Configurador (SIGACFG)?
O Configurador é o módulo administrativo do Protheus onde gerenciamos o Dicionário de Dados (tabelas, campos e índices), usuários, permissões, empresas, filiais e parâmetros do sistema.

### d. Qual a diferença entre campo Real e campo Virtual no SX3?
* **Campo Real:** É aquele que possui uma coluna física correspondente na tabela do banco de dados, armazenando o dado de fato.
* **Campo Virtual:** É calculado ou exibido em tempo de execução pelo sistema (via dicionário ou código), sem ocupar um espaço de armazenamento físico na tabela do banco.