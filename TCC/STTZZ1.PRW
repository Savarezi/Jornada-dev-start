#INCLUDE "protheus.ch"

/* =====================================================================
   Programa: STTZZ1.PRW
   Autor: Patricia
   Data: 08/2026
   Descrição: Rotina de mBrowse para a tabela ZZ1 (Controle de Fornecimento).
              Permite visualizar, incluir, alterar, excluir e gerenciar 
              os certificados de qualidade dos fornecedores (ISO 9001),
              contando com legendas dinâmicas e tratamento de erros.
===================================================================== */

USER FUNCTION STTZZ1()
    Local cAlias   := "ZZ1"
    Local cTitulo  := "Controle de Fornecimento - ISO 9001"
    Local aCores   := {}
    Local aRotAdic := {}

    // Bloco BEGIN SEQUENCE para garantir tratamento de exceções (M9)
    BEGIN SEQUENCE
        
        // Define as cores da legenda com base nas regras do certificado
        // Vermelho: Vencido | Amarelo: Vence em 30 dias | Verde: OK
        aCores := {;
            { "ZZ1_VALCER < dDataBase", "BR_VERMELHO" },;
            { "ZZ1_VALCER <= dDataBase + 30", "BR_AMARELO" },;
            { "!Empty(ZZ1_VALCER)", "BR_VERDE" };
        }

        // Adiciona um botão personalizado na barra de menu da mBrowse para "Ocorrências"
        // Este botão chamará a rotina da ZZ2 filtrando pelo código da ZZ1 selecionada
        aAdd(aRotAdic, { "Ocorrências", "U_STTZZ2FLT(ZZ1->ZZ1_CODIGO)", 0, 2 })

        // Executa a mBrowse padrão do Protheus exibindo a tabela ZZ1
        mBrowse( 6, 1, 22, 75, cAlias,,,,, aCores,, aRotAdic )

    RECOVER
        // Caso ocorra algum erro crítico, grava no log técnico utilizando a biblioteca
        If ExistBlock("GravarLogTCC")
            U_GravarLogTCC("STTZZ1", oError)
        EndIf
        MsgStop("Ocorreu um erro inesperado ao executar a rotina de Controle de Fornecimento.", "Atenção")
    END SEQUENCE

RETURN NIL

/* ---------------------------------------------------------------------
   Função: ValidacoesZZ1
   Objetivo: Concentrar as validações de campos da tabela ZZ1 para 
             garantir a integridade antes de gravar no banco de dados.
--------------------------------------------------------------------- */
USER FUNCTION ValidacoesZZ1()
    Local lRet := .T.

    BEGIN SEQUENCE
        // Validação 1: O fornecedor deve existir obrigatoriamente na tabela SA2
        If !Empty(M->ZZ1_FORNEC)
            If !ExistCpo("SA2", xFilial("SA2") + M->ZZ1_FORNEC + M->ZZ1_LOJAFO, 1)
                MsgStop("O Fornecedor/Loja informado não está cadastrado na base.", "Validação")
                lRet := .F.
                Break
            EndIf
        EndIf

        // Validação 2: A data de validade do certificado não pode ser anterior à data atual na inclusão
        If INCLUI .And. !Empty(M->ZZ1_VALCER)
            If M->ZZ1_VALCER < dDataBase
                MsgStop("A validade do certificado não pode ser inferior à data atual.", "Validação")
                lRet := .F.
                Break
            EndIf
        EndIf

        // Validação 3: A tolerância em percentual deve estar estritamente entre 0 e 100
        If M->ZZ1_TOLERA < 0 .Or. M->ZZ1_TOLERA > 100
            MsgStop("A tolerância (%) deve estar compreendida entre 0 e 100.", "Validação")
            lRet := .F.
            Break
        EndIf

    RECOVER
        lRet := .F.
    END SEQUENCE

RETURN lRet