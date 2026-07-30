#INCLUDE "protheus.ch"

USER FUNCTION STTIP001()
    PRIVATE cCadastro := "Pets"

    dbSelectArea("ZA1")
    dbSetOrder(1)

    AxCadastro("ZA1", "Pets", , "1", , , , .F.)
Return NIL