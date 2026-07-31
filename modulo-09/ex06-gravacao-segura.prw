#INCLUDE "TOTVS.CH"

User Function EX06()
    Local lOk := .T.
    
    // Inicia a transação no banco de dados
    Begin Transaction
    
        
        If !lOk
            DisarmTransaction()
            Help(,,"ERRO",,"A transação foi abortada com sucesso.",1,0)
        EndIf
        
    End Transaction
    
    If lOk
        MsgInfo("Transação concluída e gravada com sucesso!", "Atenção")
    EndIf

Return