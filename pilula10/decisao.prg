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