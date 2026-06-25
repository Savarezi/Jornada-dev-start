PROCEDURE Main()
    LOCAL nIdade := 28
    LOCAL nDinheiro := 50
    LOCAL lLojaAberta := .T.

    // Comparações simples
    ? "E maior de idade? " + IF(nIdade >= 18, "Sim", "Nao")
    
    // Usando operadores lógicos (.AND.)
    // "Se tenho dinheiro E a loja esta aberta, eu compro"
    IF (nDinheiro >= 20 .AND. lLojaAberta)
        ? "Posso fazer a compra!"
    ELSE
        ? "Nao posso comprar."
    ENDIF

RETURN