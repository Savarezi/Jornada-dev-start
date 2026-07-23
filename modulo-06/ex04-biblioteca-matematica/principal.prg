// Inclui a biblioteca com as funções matemáticas.
SET PROCEDURE TO matematica.prg


FUNCTION Main()

   // Testa o cálculo do fatorial.
   QOut( "Fatorial de 5: " + ;
      LTrim( Str( FatorialN( 5 ) ) ) )

   // Verifica se o número é primo.
   IF EhPrimo( 7 )

      QOut( "7 é primo." )

   ELSE

      QOut( "7 não é primo." )

   ENDIF

   // Calcula o mínimo múltiplo comum.
   QOut( "MMC de 12 e 18: " + ;
      LTrim( Str( MMC( 12, 18 ) ) ) )

   // Calcula o máximo divisor comum.
   QOut( "MDC de 12 e 18: " + ;
      LTrim( Str( MDC( 12, 18 ) ) ) )

RETURN NIL