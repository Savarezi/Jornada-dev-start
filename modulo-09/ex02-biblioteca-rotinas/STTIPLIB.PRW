#INCLUDE "TOTVS.CH"

User Function STTIP004()
    Local aRotina := {}
    Local cFiltro := ""
    
    // Se houver um registro posicionado na SZ1, filtra as interações apenas para este contato
    If SZ1->(ColumnPos("Z1_CODIGO")) > 0 .And. !Empty(SZ1->Z1_CODIGO)
        cFiltro := "Z2_CONTAT == '" + SZ1->Z1_CODIGO + "'"
    EndIf

    // Menu padrão do browse para a tabela de Interações (SZ2)
    aAdd(aRotina, {"Pesquisar", "AxPesqui", 0, 1})
    aAdd(aRotina, {"Visualizar", "AxVisual", 0, 2})
    aAdd(aRotina, {"Incluir", "AxInclui", 0, 3})
    aAdd(aRotina, {"Alterar", "AxAltera", 0, 4})
    aAdd(aRotina, {"Excluir", "AxDeleta", 0, 5})

    // Executa o mBrowse aplicando o filtro dinâmico do contato selecionado
    mBrowse(1, 1, 22, 75, "SZ2", , , , , , , , , , , .F., , , cFiltro)

Return NIL