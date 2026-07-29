# Exercício 2 — A tabela ZA1 (Pets)

## Respostas

### a. Estrutura de campos da tabela ZA1
Como toda tabela padrão do Protheus exige o controle de filiais e as boas práticas de customização exigem identificadores claros, a estrutura da tabela ZA1 foi desenhada da seguinte forma:

| Nome do Campo | Tipo | Tamanho | Descrição / Observação |
| :--- | :---: | :---: | :--- |
| **ZA1_FILIAL** | C | 2 | Campo obrigatório de filial para controle multi-filial da empresa. |
| **ZA1_CODIGO** | C | 6 | Código único de identificação do pet (Chave primária/Identificador). |
| **ZA1_NOME** | C | 30 | Nome do pet cadastrado. |
| **ZA1_RACA** | C | 20 | Raça ou espécie do animal. |
| **ZA1_NASC** | D | 8 | Data de nascimento do pet (armazenada no formato padrão de data). |

---

### b. Índice ideal para a tabela ZA1 e Justificativa
* **Definição do Índice:** Ordem por **Filial + Código (`ZA1_FILIAL + ZA1_CODIGO`)** ou secundariamente por **Filial + Nome (`ZA1_FILIAL + ZA1_NOME`)**.
* **Justificativa:** Assim como em uma lista telefônica, precisamos de uma chave lógica estruturada que evite duplicações e permita que o banco de dados e o framework do Protheus localizem registros de forma extremamente rápida. Indexar pela filial garante o isolamento dos dados por unidade de negócio, enquanto o código ou o nome garante a unicidade e a ordenação eficiente nas consultas e telas de *Browse*.

---

### c. O significado do prefixo "Z" na convenção do Protheus
No ecossistema TOTVS Protheus, todas as tabelas oficiais de sistema começam com letras específicas (como SF, SA, SC, etc.). A letra **Z** é reservada por convenção para **tabelas customizadas (do cliente ou do desenvolvedor)**. Isso garante que, em futuras atualizações (*updates* ou *patches* de pacotes da TOTVS), os dicionários oficiais da empresa não sobrescrevam ou corrompan as tabelas criadas sob medida para a aplicação.

---

### d. Por que os campos iniciam com o prefixo do nome da tabela (ex: ZA1_)
O uso do prefixo correspondente à tabela (`ZA1_`) em cada campo é uma regra de arquitetura do Dicionário de Dados do Protheus. Isso evita conflitos de escopo no banco de dados e no dicionário (SX3), garantindo que o sistema saiba exatamente a qual entidade lógica o campo pertence, facilitando mapeamentos, consultas via ADVPL e relatórios gerenciais sem ambiguidade.