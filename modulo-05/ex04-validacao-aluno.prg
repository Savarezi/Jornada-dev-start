FUNCTION Main()

   LOCAL cNome := ""
   LOCAL cDisc := ""
   LOCAL cNota1 := ""
   LOCAL cNota2 := ""

   LOCAL nNota1 := 0
   LOCAL nNota2 := 0
   LOCAL nMedia := 0

   // Continua pedindo o nome até que ele seja preenchido.
   DO WHILE .T.

      ACCEPT "Nome do aluno: " TO cNome

      IF Len(AllTrim(cNome)) > 0
         EXIT
      ENDIF

      QOut("Nome inválido!")

   ENDDO

   // A disciplina deve ter exatamente 3 letras maiúsculas.
   DO WHILE .T.

      ACCEPT "Disciplina (Ex.: MAT): " TO cDisc

      IF Len(AllTrim(cDisc)) == 3 .AND. cDisc == Upper(cDisc)
         EXIT
      ENDIF

      QOut("Disciplina inválida!")

   ENDDO

   // A primeira nota deve estar entre 0 e 10.
   DO WHILE .T.

      ACCEPT "Nota 1: " TO cNota1
      nNota1 := Val(cNota1)

      IF nNota1 >= 0 .AND. nNota1 <= 10
         EXIT
      ENDIF

      QOut("Nota inválida!")

   ENDDO

   // A segunda nota também deve estar entre 0 e 10.
   DO WHILE .T.

      ACCEPT "Nota 2: " TO cNota2
      nNota2 := Val(cNota2)

      IF nNota2 >= 0 .AND. nNota2 <= 10
         EXIT
      ENDIF

      QOut("Nota inválida!")

   ENDDO

   nMedia := (nNota1 + nNota2) / 2

   QOut("")
   QOut("===== DADOS DO ALUNO =====")
   QOut("Nome: " + cNome)
   QOut("Disciplina: " + cDisc)
   QOut("Nota 1: " + Str(nNota1, 5, 2))
   QOut("Nota 2: " + Str(nNota2, 5, 2))
   QOut("Média: " + Str(nMedia, 5, 2))

RETURN NIL