# 🧠 Exercício 01 — AxCadastro × mBrowse

## a) Quando você usaria AxCadastro e quando usaria mBrowse? Dê um exemplo de cada.

**AxCadastro** é usado quando quero criar rapidamente uma rotina de cadastro utilizando o dicionário de dados do Protheus. Ele já fornece inclusão, alteração, exclusão e consulta automaticamente.

**Exemplo:** Cadastro de Pets (ZA1).

**mBrowse** é usado quando preciso de uma tela de consulta mais personalizada, com filtros, cores, botões próprios e regras específicas.

**Exemplo:** Uma tela para listar pets cadastrados com filtros por raça ou idade.

---

## b) Cite três coisas que o mBrowse faz e o AxCadastro não faz.

- Permite criar botões personalizados.
- Permite utilizar filtros específicos.
- Permite aplicar legendas e cores nas linhas do browse.

---

## c) Na configuração de legendas (aColors), por que a regra ".T." deve ficar por último?

Porque ela representa a condição padrão (sempre verdadeira). Se ela ficar antes das outras regras, todas as linhas atenderão essa condição e as demais nunca serão avaliadas.

---

## d) Qual a diferença entre um campo Virtual (X3_RELACAO) e um gatilho (SX7) para preencher o nome do cliente?

O campo Virtual apenas consulta e exibe uma informação de outra tabela, sem gravá-la no banco.

O gatilho (SX7) executa uma ação automaticamente quando um campo é alterado, podendo preencher outros campos durante o cadastro.