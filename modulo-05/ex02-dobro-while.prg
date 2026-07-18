FUNCTION Main()

   LOCAL cValor := ""
   LOCAL nValor := 0

   // Como não sabemos quantas vezes o usuário irá digitar,
   // o WHILE é a melhor escolha para este exercício.
   DO WHILE .T.

      ACCEPT "Digite um valor inteiro: " TO cValor
      nValor := Val(cValor)

      // Encerra o programa quando o valor for zero ou negativo.
      IF nValor <= 0
         EXIT
      ENDIF

      QOut("Dobro: " + Str(nValor * 2, 10, 0))
      QOut("")

   ENDDO

   QOut("Programa encerrado.")

RETURN NIL