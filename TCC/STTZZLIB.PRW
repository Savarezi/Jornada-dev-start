#INCLUDE "protheus.ch"

/* =====================================================================
   Programa: STTZZLIB.PRW
   Autor: Patricia
   Data: 08/2026
   Descrição: Biblioteca de funções comuns do TCC (ISO 9001). 
              Centraliza funções reutilizáveis para evitar duplicação 
              de código, atendendo aos diferenciais de excelência.
===================================================================== */

USER FUNCTION STTZZLIB()
    // Função principal apenas para manter a estrutura padrão do fonte
RETURN NIL

/* ---------------------------------------------------------------------
   Função: NomeFornecedor
   Parâmetros: cFornec (Código do Fornecedor), cLoja (Loja do Fornecedor)
   Objetivo: Buscar o nome do fornecedor na tabela padrão SA2 utilizando 
             a função POSICIONE, conforme exigido no dicionário virtual.
--------------------------------------------------------------------- */
USER FUNCTION NomeFornecedor(cFornec, cLoja)
    Local cNome := ""
    
    // Garante valores padrão caso venham vazios para evitar erros
    DEFAULT cFornec := ""
    DEFAULT cLoja   := ""
    
    // Se o código do fornecedor foi preenchido, executa a busca
    If !Empty(cFornec)
        cNome := POSICIONE("SA2", 1, xFilial("SA2") + cFornec + cLoja, "A2_NOME")
    EndIf
    
RETURN cNome

/* ---------------------------------------------------------------------
   Função: NomeProduto
   Parâmetros: cCodPro (Código do Produto)
   Objetivo: Buscar a descrição detalhada do produto na tabela padrão SB1
             utilizando a função POSICIONE.
--------------------------------------------------------------------- */
USER FUNCTION NomeProduto(cCodPro)
    Local cDesc := ""
    
    DEFAULT cCodPro := ""
    
    If !Empty(cCodPro)
        cDesc := POSICIONE("SB1", 1, xFilial("SB1") + cCodPro, "B1_DESC")
    EndIf
    
Return cDesc

/* ---------------------------------------------------------------------
   Função: PercNaoConforme
   Parâmetros: nOk (Quantidade Conforme), nNok (Quantidade Não Conforme)
   Objetivo: Calcular o percentual de não conformidade da entrega com base
             na fórmula: (Qtd Não Conforme / Total Geral) * 100.
--------------------------------------------------------------------- */
USER FUNCTION PercNaoConforme(nOk, nNok)
    Local nPerc := 0
    
    DEFAULT nOk  := 0
    DEFAULT nNok := 0
    
    // Valida se o denominador é maior que zero para evitar divisão por zero
    If (nOk + nNok) > 0
        nPerc := (nNok / (nOk + nNok)) * 100
    EndIf
    
Return nPerc

/* ---------------------------------------------------------------------
   Função: CertificadoVencendo
   Parâmetros: dValCer (Data de Validade do Certificado)
   Objetivo: Verificar se o certificado do fornecedor está prestes a vencer
             dentro de uma janela de 30 dias a partir da data base do sistema.
--------------------------------------------------------------------- */
USER FUNCTION CertificadoVencendo(dValCer)
    Local lVence := .F.
    
    If !Empty(dValCer)
        // Retorna verdadeiro se a validade estiver entre hoje e os próximos 30 dias
        If dValCer >= dDataBase .And. dValCer <= (dDataBase + 30)
            lVence := .T.
        EndIf
    EndIf
    
Return lVence

/* ---------------------------------------------------------------------
   Função: GravarLogTCC
   Parâmetros: cFuncao (Nome da função onde ocorreu o erro), 
               oErro (Objeto de erro capturado pelo BEGIN SEQUENCE)
   Objetivo: Gravar logs técnicos de exceções em arquivo de texto para 
             atender aos requisitos de tratamento de erros do M9.
--------------------------------------------------------------------- */
USER FUNCTION GravarLogTCC(cFuncao, oErro)
    Local cMensagem := ""
    
    DEFAULT cFuncao := "DESCONHECIDA"
    
    If oErro <> NIL
        // Monta a estrutura da linha de log com data, hora, função e descrição
        cMensagem := "[" + DToC(Date()) + " - " + Time() + "] " +;
                     "Funcao: " + cFuncao + " | Erro: " + oErro:Description + CRLF
        
        // Escreve as informações no arquivo de log do projeto
        MemoWrite("tcc_erro.log", cMensagem)
    EndIf
    
Return NIL