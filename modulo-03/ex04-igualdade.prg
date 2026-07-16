FUNCTION Main()

   LOCAL cTexto1 := "Harbour"
   LOCAL cTexto2 := "Harb"

   QOut("=== Comparação entre = e == ===")
   QOut("")

   QOut("Texto 1: " + cTexto1)
   QOut("Texto 2: " + cTexto2)
   QOut("")

   // "=" verifica igualdade parcial entre strings
   IF cTexto1 = cTexto2
      QOut('Usando "=" : Verdadeiro (.T.)')
   ELSE
      QOut('Usando "=" : Falso (.F.)')
   ENDIF

   // "==" verifica igualdade exata
   IF cTexto1 == cTexto2
      QOut('Usando "==" : Verdadeiro (.T.)')
   ELSE
      QOut('Usando "==" : Falso (.F.)')
   ENDIF

RETURN NIL