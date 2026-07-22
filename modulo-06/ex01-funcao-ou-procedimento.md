# 🧱 Exercício 1 — Função ou Procedimento?

> **Módulo 6 — Funções e Arrays**  
> **Parte A — Funções (Modularização)**

---

## 🎯 Objetivo

Identificar a diferença entre uma **função** e um **procedimento** no Harbour.

- 🔹 **Função:** executa uma operação e **retorna um valor**.
- 🔹 **Procedimento:** executa uma **ação**, sem retornar um valor utilizado pelo programa.

---

## 📋 Classificação

| Comando/Função | Tipo | Justificativa |
|---|---|---|
| `Str()` | 🟢 Função | Converte um número em string e retorna o resultado. |
| `QOut()` | 🔵 Procedimento | Exibe um texto na tela e executa uma ação. |
| `Date()` | 🟢 Função | Retorna a data atual. |
| `Len()` | 🟢 Função | Retorna o tamanho de uma string ou array. |
| `Upper()` | 🟢 Função | Retorna uma string convertida para letras maiúsculas. |
| `ClearScreen()` | 🔵 Procedimento | Executa a ação de limpar a tela. |

---

## 🧠 Resumo

### 🟢 Função

Uma função **retorna um valor** que pode ser utilizado pelo programa.

```harbour

cTexto := Str( 42 )

```
Nesse exemplo, Str() converte o número 42 em texto e retorna o resultado.

---

### Procedimento

Um procedimento executa uma ação diretamente.

```harbour

QOut( "Olá, mundo!" ) 

```
Nesse caso, QOut() exibe a mensagem na tela.
---

## ✅ Conclusão

A principal diferença é:

> Função retorna um valor.
> Procedimento executa uma ação.











Nesse caso, QOut() exibe a mensagem na tela.