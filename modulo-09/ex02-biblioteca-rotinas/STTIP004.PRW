#INCLUDE "TOTVS.CH"

User Function STTIP003()
    Local aRotina := {}
    Local aColors := {}
    
    // Definição do menu funcional do mBrowse
    // Adicionando o botão personalizado "Interações" que chama a rotina STTIP004 passando o contato atual
    aAdd(aRotina, {"Pesquisar", "AxPesqui", 0, 1})
    aAdd(aRotina, {"Visualizar", "AxVisual", 0, 2})
    aAdd(aRotina, {"Incluir", "AxInclui", 0, 3})
    aAdd(aRotina, {"Alterar", "AxAltera", 0, 4})
    aAdd(aRotina, {"Excluir", "AxDeleta", 0, 5})
    aAdd(aRotina, {"Interações", "U_STTIP004", 0, 6}) // Botão customizado para abrir as interações do contato
    
    // Legendas coloridas para o browse (Exemplo: Ativo vs Inativo ou status)
    aAdd(aColors, {"Z1_STATUS == '1'", "BR_GREEN"})
    aAdd(aColors, {"Z1_STATUS == '2'", "BR_RED"})

    // Executa o mBrowse para a tabela SZ1 (Contatos)
    mBrowse(1, 1, 22, 75, "SZ1", , , , , , aColors)

Return NIL