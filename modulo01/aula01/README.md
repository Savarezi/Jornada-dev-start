# 📘 Aula 01 — Configuração do Ambiente

## 🎯 Objetivo

Configurar o ambiente de desenvolvimento e validar que tudo está funcionando corretamente.

---

## 📂 Arquivos

| Arquivo | Descrição |
|---------|-----------|
| `teste.prg` | Primeiro programa utilizado para validar o ambiente. |

---

## 💻 Código

```advpl
FUNCTION Main()

    QOut("Ambiente funcionando! Pronto para a Aula 1.")

RETURN NIL
```

---

## ▶️ Como executar

Compile:

```bash
hbmk2 teste.prg
```

Execute:

```bash
./teste
```

---

## 📚 Conceitos aprendidos

- Configuração do ambiente Harbour
- Estrutura básica de um programa
- `FUNCTION Main()`
- `QOut()`
- `RETURN NIL`
- Compilação com `hbmk2`