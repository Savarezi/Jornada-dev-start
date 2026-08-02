#INCLUDE "protheus.ch"

/* =====================================================================
   Programa: STTZZ2.PRW
   Autor: Patricia
   Data: 08/2026
   Descrição: Rotina de mBrowse para a tabela ZZ2 (Ocorrências de 
              Não Conformidade). Permite registrar falhas nas entregas 
              de materiais, calculando automaticamente percentuais 
              e aplicando legendas dinâmicas comparadas à tolerância da ZZ1.
===================================================================== */

USER FUNCTION STTZZ2()
    Local cAlias  := "ZZ2"
    Local cTitulo := "Ocorrências de Fornecedores - ISO 9001"
    Local aCores  := {}

    BEGIN SEQUENCE
        // Define as cores da legenda da ZZ2:
        // Vermelho: percentual de não conformidade acima da tolerância permitida na ZZ1
        // Verde: dentro dos limites aceitáveis de tolerância
        aCores := {;
            { "U_PercNaoConforme(ZZ2_QTDOK, ZZ2_QTDNOK) > ZZ1->ZZ1_TOLERA", "BR_VERMELHO" },;
            { "U_PercNaoConforme(ZZ2_QTDOK, ZZ2_QTDNOK) <= ZZ1->ZZ1_TOLERA", "BR_VERDE" };
        }

        // Exibe a mBrowse padrão da tabela de ocorrências com as legendas
        mBrowse( 6, 1, 22, 75, cAlias,,,,, aCores )

    RECOVER
        If ExistBlock("GravarLogTCC")
            U_GravarLogTCC("STTZZ2", oError)
        EndIf
        MsgStop("Ocorreu um erro ao carregar as ocorrências de fornecedores.", "Atenção")
    END SEQUENCE

RETURN NIL

/* ---------------------------------------------------------------------
   Função: STTZZ2FLT
   Parâmetros: cCodigoZZ1 (Código do controle ZZ1 selecionado)
   Objetivo: Versão filtrada chamada pelo botão "Ocorrências" da STTZZ1.
             Exibe apenas as ocorrências da ZZ2 vinculadas à ZZ1 selecionada.
--------------------------------------------------------------------- */
USER FUNCTION STTZZ2FLT(cCodigoZZ1)
    Local cAlias  := "ZZ2"
    Local cFiltro := ""
    
    DEFAULT cCodigoZZ1 := ""

    BEGIN SEQUENCE
        If !Empty(cCodigoZZ1)
            // Monta a expressão de filtro para exibir apenas os registros do controle atual
            cFiltro := "ZZ2_CONFOR == '" + cCodigoZZ1 + "'"
            
            // Define o filtro ativo na tabela ZZ2 temporariamente para a visualização
            DbSelectArea(cAlias)
            Set Filter To &cFiltro
            
            // Abre o browse filtrado
            mBrowse( 6, 1, 22, 75, cAlias )
            
            // Limpa o filtro ao sair da tela para não afetar outras rotinas
            Set Filter To
        Else
            MsgAlert("Nenhum controle de fornecimento foi selecionado.", "Aviso")
        EndIf

    RECOVER
        If ExistBlock("GravarLogTCC")
            U_GravarLogTCC("STTZZ2FLT", oError)
        EndIf
        MsgStop("Ocorreu um erro ao filtrar as ocorrências.", "Erro")
    END SEQUENCE

Return NIL

/* ---------------------------------------------------------------------
   Função: ValidaZZ2
   Objetivo: Validar a integridade dos dados inseridos na tabela ZZ2, 
             garantindo relacionamento correto com ZZ1 e SB1 (Produto), 
             além de impedir datas futuras.
--------------------------------------------------------------------- */
USER FUNCTION ValidaZZ2()
    Local lRet := .T.

    BEGIN SEQUENCE
        // Validação 1: O código do controle (ZZ2_CONFOR) deve existir na tabela ZZ1
        If !Empty(M->ZZ2_CONFOR)
            If !ExistCpo("ZZ1", xFilial("ZZ1") + M->ZZ2_CONFOR, 1)
                MsgStop("O Controle de Fornecimento informado não existe.", "Validação")
                lRet := .F.
                Break
            EndIf
        EndIf

        // Validação 2: O código do produto deve existir obrigatoriamente na tabela SB1
        If !Empty(M->ZZ2_CODPRO)
            If !ExistCpo("SB1", xFilial("SB1") + M->ZZ2_CODPRO, 1)
                MsgStop("O Produto informado não está cadastrado no sistema.", "Validação")
                lRet := .F.
                Break
            EndIf
        EndIf

        // Validação 3: A data da ocorrência não pode ser uma data futura
        If !Empty(M->ZZ2_DATA)
            If M->ZZ2_DATA > dDataBase
                MsgStop("A data da ocorrência não pode ser superior à data atual.", "Validação")
                lRet := .F.
                Break
            EndIf
        EndIf

    RECOVER
        lRet := .F.
    END SEQUENCE

RETURN lRet