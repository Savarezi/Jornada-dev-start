
FUNCTION Main()

   LOCAL aNotas := {8, 7, 9, 6, 10}
   LOCAL nI

   ? "Primeira nota:", aNotas[1]
   ? "Terceira nota:", aNotas[3]

   ? "Todas as notas:"

   FOR nI := 1 TO 5
      ? aNotas[nI]
   NEXT

RETURN NIL