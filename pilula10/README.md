# Pílula #10 — Estruturas de Decisão: O "Coração" do Software

Agora que você já domina a lógica booleana, vamos ver como estruturar decisões de forma clara. O `IF/ELSE` é a forma básica de dar um "caminho" para o código seguir.

## O Código
```harbour
PROCEDURE Main()
    LOCAL nNota := 8 

    IF nNota >= 9
        ? "Conceito A: Excelente!"
    ELSEIF nNota >= 7
        ? "Conceito B: Aprovado!"
    ELSE
        ? "Conceito C: Precisa melhorar."
    ENDIF
RETURN