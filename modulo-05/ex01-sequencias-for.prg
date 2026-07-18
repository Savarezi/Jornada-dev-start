FUNCTION Main()

   LOCAL nNumero := 0

   // Sequência de 1 até 100
   QOut("=== Números de 1 a 100 ===")

   FOR nNumero := 1 TO 100
      QOut(nNumero)
   NEXT

   QOut("")

   // Sequência de -50 até 50
   QOut("=== Números de -50 a 50 ===")

   FOR nNumero := -50 TO 50
      QOut(nNumero)
   NEXT

   QOut("")

   // STEP -1 faz a contagem em ordem decrescente
   QOut("=== Números de 80 a 5 ===")

   FOR nNumero := 80 TO 5 STEP -1
      QOut(nNumero)
   NEXT
