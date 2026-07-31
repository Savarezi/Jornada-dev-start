FUNCTION Main()
    LOCAL nA := 10, nB := 0, nRes
    
    // Inicia o bloco protegido para tratamento de erros
    BEGIN SEQUENCE
        // Provoca de propósito uma divisão por zero
        nRes := nA / nB
        QOut("Resultado: " + Str(nRes))
        
    RECOVER USING oErro
        // Captura o erro e exibe a descrição amigável/técnica
        QOut("Erro capturado: " + oErro:Description)
    END SEQUENCE
    
    // Confirma que o programa continua executando após o erro
    QOut("O programa continua de pé!")
    
RETURN NIL