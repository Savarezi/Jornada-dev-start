FUNCTION Main()

   LOCAL cValor := ""
   LOCAL nValor := 0
   LOCAL nTotal := 0
   LOCAL nQtd := 0

   // O programa continua até o usuário digitar 0.
   DO WHILE .T.

      ACCEPT "Digite um valor (0 para encerrar): " TO cValor
      nValor := Val(cValor)

      // O valor 0 encerra a leitura.
      IF nValor == 0
         EXIT
      ENDIF

      // Acumulador da soma e contador de valores digitados.
      nTotal += nValor
      nQtd++

   ENDDO

   QOut("")
   QOut("===== RESULTADO =====")
   QOut("Soma total: " + Str(nTotal, 10, 0))
   QOut("Quantidade de valores: " + Str(nQtd, 10, 0))

RETURN NIL