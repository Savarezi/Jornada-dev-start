FUNCTION Main()

   LOCAL aEstrutura := {;
      { "NOME",  "C", 30, 0 },;
      { "IDADE", "N",  3, 0 },;
      { "ATIVO", "L",  1, 0 };
   }

   // Cria a tabela somente se ela ainda não existir.
   IF ! File( "AGENDA.DBF" )
      DbCreate( "AGENDA.DBF", aEstrutura )
   ENDIF

   // Abre a tabela para trabalhar com os registros.
   USE AGENDA.DBF NEW ALIAS AGENDA

   // Adiciona um novo registro.
   DbAppend()

   AGENDA->NOME  := "Ana Paula"
   AGENDA->IDADE := 27
   AGENDA->ATIVO := .T.

   // Percorre os registros gravados no arquivo DBF.
   DbGoTop()

   DO WHILE ! Eof()

      QOut( "Nome: " + AGENDA->NOME )
      QOut( "Idade: " + LTrim( Str( AGENDA->IDADE ) ) )
      QOut( "Ativo: " + If( AGENDA->ATIVO, "Sim", "Não" ) )
      QOut( "" )

      DbSkip()

   ENDDO

   DbCloseArea()

RETURN NIL