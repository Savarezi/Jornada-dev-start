# 💊 Pílula #15 — O mapa do tesouro: o Protheus se monta sozinho

Hoje vamos falar de um conceito central do Protheus e que costuma surpreender quem vem de outras linguagens:

o **Dicionário de Dados**. 🗺️

É ele que faz boa parte da mágica acontecer.

---

## O jeito tradicional (outras linguagens)

Na maioria das linguagens, para criar uma tabela no banco de dados você precisa:

- definir colunas
- definir tipos
- definir tamanhos
- criar índices
- programar validações
- montar telas

Tudo manualmente.

Mais trabalho, mais código e mais chance de erro.

---

## O jeito Protheus: você descreve, ele constrói

No Protheus existe o **Dicionário de Dados**.

Nele, você não constrói tudo na mão.

Você apenas descreve o que quer.

O sistema faz o resto.

Essa é a grande diferença.

---

## As principais tabelas do Dicionário

### SX2

Define quais tabelas existem no sistema.

Exemplo:

> Quero criar uma tabela de Contatos.

É aqui que isso começa.

---

### SX3

Define os campos da tabela.

Aqui você configura:

- código
- nome
- data
- tipo
- tamanho

É a tabela mais usada.

---

### SX5

Lista de valores fixos.

Exemplo:

- E = E-mail
- L = Ligação
- R = Reunião

Ajuda a padronizar informações.

---

### SX7

São os gatilhos automáticos.

Exemplo:

> Quando preencher o código do cliente, buscar automaticamente o nome dele.

Automação pura.

---

## O poder do SX3

No SX3 você não define apenas:

> esse campo é texto e tem tamanho 40

Você também define:

- título na tela
- regra de validação
- se aparece na listagem
- se possui consulta F3
- comportamento do campo

Ou seja:

você configura uma vez.

O sistema reaproveita em vários lugares.

Isso economiza muito trabalho.

---

## A mudança de mentalidade 🧠

No começo, isso parece estranho.

Você procura o código que cria a tabela...

e ele não existe.

Porque está tudo no dicionário.

A lógica muda:

antes:

> construir tudo manualmente

agora:

> descrever corretamente e deixar o sistema trabalhar

Quando isso faz sentido na sua cabeça, vira um superpoder.

---

## Por que isso importa?

Entender o Dicionário de Dados é entender o Protheus.

Ele é literalmente o mapa da estrutura do sistema.

Grande parte do trabalho de um desenvolvedor ADVPL acontece aqui.

No seu projeto final, você vai usar:

- SX2
- SX3
- SX7

para criar suas próprias estruturas.

É aqui que começa o desenvolvimento real no Protheus.

✨

---

## Curiosidade 💡

Todas essas tabelas começam com:

```text
SX