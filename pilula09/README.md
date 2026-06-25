# Pílula #09 — Lógica Booleana: O cérebro do sistema

Programar é ensinar o computador a tomar decisões. A lógica booleana é o que permite que o sistema verifique cenários complexos, como verificar se você tem dinheiro E se a loja está aberta antes de realizar uma transação.

## O Código
```harbour
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
RETURN# Pílula #09 — Lógica Booleana: O cérebro do sistema

Programar é ensinar o computador a tomar decisões. A lógica booleana é o que permite que o sistema verifique cenários complexos, como verificar se você tem dinheiro E se a loja está aberta antes de realizar uma transação.

## O Código
```harbour
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