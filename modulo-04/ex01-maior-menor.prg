FUNCTION Main()

   LOCAL cValor1 := ""
   LOCAL cValor2 := ""

   LOCAL nValor1 := 0
   LOCAL nValor2 := 0

   ACCEPT "Digite o primeiro valor: " TO cValor1
   nValor1 := Val(cValor1)

   ACCEPT "Digite o segundo valor: " TO cValor2
   nValor2 := Val(cValor2)

   // Primeiro verifica se os valores são iguais
   IF nValor1 == nValor2

      QOut("Os dois valores são iguais.")

   ELSE

      // Descobre qual é o maior e o menor
      IF nValor1 > nValor2

         QOut("Maior valor: " + Str(nValor1, 10, 2))
         QOut("Menor valor: " + Str(nValor2, 10, 2))

      ELSE

         QOut("Maior valor: " + Str(nValor2, 10, 2))
         QOut("Menor valor: " + Str(nValor1, 10, 2))

      ENDIF

   ENDIF

RETURN NIL             