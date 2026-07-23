// Calcula o fatorial de um número.
FUNCTION FatorialN( nN )

   LOCAL nResultado := 1
   LOCAL nI

   FOR nI := 1 TO nN

      nResultado *= nI

   NEXT

RETURN nResultado


// Verifica se um número é primo.
FUNCTION EhPrimo( nN )

   LOCAL nI

   IF nN < 2
      RETURN .F.
   ENDIF

   FOR nI := 2 TO nN - 1

      IF nN % nI == 0
         RETURN .F.
      ENDIF

   NEXT

RETURN .T.


// Calcula o máximo divisor comum.
FUNCTION MDC( nA, nB )

   LOCAL nResto

   DO WHILE nB != 0

      nResto := nA % nB
      nA := nB
      nB := nResto

   ENDDO

RETURN nA


// Calcula o mínimo múltiplo comum.
FUNCTION MMC( nA, nB )

RETURN ( nA * nB ) / MDC( nA, nB )