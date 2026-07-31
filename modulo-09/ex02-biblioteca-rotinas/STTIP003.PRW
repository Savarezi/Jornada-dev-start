#INCLUDE "TOTVS.CH"

// Retorna o nome do cliente posicionado
User Function NomeCliente(cCodCliente)
    Local cNome := ""
    Default cCodCliente := ""
    
    If !Empty(cCodCliente)
        // Exemplo buscando da tabela padrão de clientes (SA1) ou SZ1 conforme o contexto
        cNome := Posicione("SA1", 1, xFilial("SA1") + cCodCliente, "A1_NOME")
    EndIf
Return cNome


// Retorna o próximo código sequencial para a tabela SZ1
User Function ProxCodigoSZ1()
    Local cAliasSZ1 := GetNextAlias()
    Local cCod := "000001"
    
    BeginSql Alias cAliasSZ1
        SELECT MAX(Z1_CODIGO) AS MAX_COD 
        FROM %Table:SZ1% 
        WHERE %NotDel%
    EndSql
    
    If !Empty((cAliasSZ1)->MAX_COD)
        cCod := Soma1((cAliasSZ1)->MAX_COD)
    EndIf
    
    (cAliasSZ1)->(DbCloseArea())
Return cCod


// Retorna o próximo sequencial para as interações da SZ2 baseadas no contato
User Function ProxSequenSZ2(cContato)
    Local cAliasSZ2 := GetNextAlias()
    Local cSeq := "001"
    Default cContato := ""
    
    BeginSql Alias cAliasSZ2
        SELECT MAX(Z2_SEQUEN) AS MAX_SEQ 
        FROM %Table:SZ2% 
        WHERE Z2_CONTAT = %Exp:cContato% 
          AND %NotDel%
    EndSql
    
    If !Empty((cAliasSZ2)->MAX_SEQ)
        cSeq := Soma1((cAliasSZ2)->MAX_SEQ)
    EndIf
    
    (cAliasSZ2)->(DbCloseArea())
Return cSeq


// Retorna a descrição amigável do tipo de interação (Domínio SX5 - Z2)
User Function DescTipoInteracao(cTipo)
    Local cDesc := ""
    
    Do Case
        Case cTipo == "E"
            cDesc := "E-mail"
        Case cTipo == "L"
            cDesc := "Ligação"
        Case cTipo == "R"
            cDesc := "Reunião"
        Case cTipo == "V"
            cDesc := "Visita"
        Case cTipo == "W"
            cDesc := "WhatsApp"
        Other
            cDesc := "Outros"
    EndCase
Return cDesc


// Função de gravação de log exigida no tratamento de erros
User Function U_GRAVARLOG(cFuncao, oErro)
    Local cMensagem := "Função: " + cFuncao + " | Erro: " + oErro:Description + " | Data/Hora: " + DToC(Date()) + " " + Time()
    // Grava no console do servidor ou em arquivo de log dedicado
    ConOut("[LOG ERRO] " + cMensagem)
Return NIL