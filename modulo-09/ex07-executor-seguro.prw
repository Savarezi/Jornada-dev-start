#INCLUDE "TOTVS.CH"

User Function EX07()
    Local bBloco := { || MsgInfo("Executando bloco de código com segurança!", "EX07") }
    Local xRet
    
    // Utiliza a função de execução segura para evitar crash em caso de erros no bloco
    xRet := Eval(bBloco)
    
    If xRet
        ConOut("Rotina executada com sucesso.")
    EndIf

Return