PROCEDURE Main()
    LOCAL cNome := "Patricia"
    LOCAL nIdade := 28
    LOCAL lEstudando := .T.

    ? "Nome: " + cNome
    ? "Idade: " + ALLTRIM(STR(nIdade))
    ? "Esta estudando? " + IF(lEstudando, "Sim", "Nao")
RETURN