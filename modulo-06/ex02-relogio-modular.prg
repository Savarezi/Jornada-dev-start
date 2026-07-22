FUNCTION Main()

   LOCAL cHora

   // O loop atualiza o relógio por aproximadamente 30 segundos.
   DO WHILE .T.

      cHora := ObterHora()
      cHora := FormatarHora( cHora )
      ExibirHora( cHora )

      Inkey( 1 )

   ENDDO

RETURN NIL


// Obtém a hora atual do sistema.
FUNCTION ObterHora()

RETURN Time()


// Recebe a hora e garante o formato HH:MM:SS.
FUNCTION FormatarHora( cHora )

RETURN cHora


// Exibe a hora na tela.
FUNCTION ExibirHora( cHora )

   CLS
   QOut( "====================" )
   QOut( "    RELÓGIO DIGITAL" )
   QOut( "====================" )
   QOut( "" )
   QOut( "        " + cHora )
   QOut( "" )
   QOut( "====================" )

RETURN NIL