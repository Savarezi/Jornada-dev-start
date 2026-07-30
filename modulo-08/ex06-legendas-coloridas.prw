#include "protheus.ch"

/* =================================================================ut
   Programa: STTIP002 (Exercício 6 - mBrowse com Legendas Coloridas)
   Autor: Patricia
   Objetivo: Exibir a listagem da tabela ZA1 (Pets) com cores baseadas na data de nascimento.
   ================================================================= */
User Function STTIP002()
    
    // Declaração de variáveis locais que serão usadas na rotina
    Local cCadastro := "Cadastro de Pets - Legendas"
    Local aRotina   := {}
    Local aColors   := {}
    Local cFiltro   := ""

    // -------------------------------------------------------------
    // 1. MONTAGEM DO MENU (aRotina)
    // Define os botões que aparecem na barra superior do mBrowse
    // Sintaxe: {"Nome na Tela", "Função do Sistema", 0, Operação}
    // -------------------------------------------------------------
    AAdd( aRotina, { "Pesquisar",  "AxPesqui", 0, 1 } ) // Operação 1: Pesquisa
    AAdd( aRotina, { "Visualizar", "AxVisual", 0, 2 } ) // Operação 2: Visualização
    AAdd( aRotina, { "Incluir",    "AxInclui", 0, 3 } ) // Operação 3: Inclusão
    AAdd( aRotina, { "Alterar",    "AxAltera", 0, 4 } ) // Operação 4: Alteração
    AAdd( aRotina, { "Excluir",    "AxDeleta", 0, 5 } ) // Operação 5: Exclusão

    // -------------------------------------------------------------
    // 2. MONTAGEM DAS LEGENDAS (aColors)
    // Avaliado de cima para baixo. A regra ".T." deve ficar por último.
    // Cores padrão: BR_RED (Vermelho), BR_YELLOW (Amarelo), BR_GREEN (Verde)
    // -------------------------------------------------------------
    aColors := {;
        { "ZA1->ZA1_DTNASC < dDataBase - 30", "BR_RED"    },; // Vermelho: Pets com nascimento há mais de 30 dias
        { "ZA1->ZA1_DTNASC == dDataBase",    "BR_YELLOW" },; // Amarelo: Pets cadastrados/nascidos hoje
        { ".T.",                             "BR_GREEN"  } ; // Verde: Demais registros (regra padrão no fim)
    }

    // -------------------------------------------------------------
    // 3. POSICIONAMENTO DA TABELA
    // Seleciona a área da tabela ZA1 e define a ordem de exibição (Índice 1)
    // -------------------------------------------------------------
    dbSelectArea("ZA1")
    dbSetOrder(1) // Ordem 1: ZA1_FILIAL + ZA1_COD

    // -------------------------------------------------------------
    // 4. CHAMADA DA FUNÇÃO MBROWSE
    // Abre a interface visual em grade com as legendas e o filtro aplicado
    // -------------------------------------------------------------
    mBrowse( 1, 1, 22, 75, "ZA1", /*aCpo*/, /*cTitulo*/, /*nOpcE*/, /*nOpcG*/, /*bFiltro*/, aColors, /*lCanSave*/, /*lNoShow*/, /*nMaximized*/, /*bInit*/, /*lPanel*/, /*nFreeze*/, /*bEdit*/, cFiltro )

Return NIL