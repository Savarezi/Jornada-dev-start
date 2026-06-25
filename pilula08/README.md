# Pílula #08 — Variáveis: guardando informações na memória

Para que um programa seja útil, ele precisa "lembrar" de coisas. As variáveis são como escaninhos etiquetados na memória do computador onde guardamos valores para usar depois.

## O Código
```harbour
PROCEDURE Main()
    LOCAL cNome := "Patricia"
    LOCAL nIdade := 28
    LOCAL lEstudando := .T.

    ? "Nome: " + cNome
    ? "Idade: " + ALLTRIM(STR(nIdade))
    ? "Esta estudando? " + IF(lEstudando, "Sim", "Nao")
RETURN