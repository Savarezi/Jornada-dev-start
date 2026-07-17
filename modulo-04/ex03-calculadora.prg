FUNCTION Main()

   LOCAL cValor1 := ""
   LOCAL cValor2 := ""
   LOCAL cOperacao := ""

   LOCAL nValor1 := 0
   LOCAL nValor2 := 0
   LOCAL nResultado := 0

   ACCEPT "Digite o primeiro valor: " TO cValor1
   nValor1 := Val(cValor1)

   ACCEPT "Digite a operação (+, -, *, /, ^, R): " TO cOperacao

   // A raiz quadrada utiliza apenas um valor
   IF Upper(cOperacao) <> "R"

      ACCEPT "Digite o segundo valor: " TO cValor2
      nValor2 := Val(cValor2)

   ENDIF

   DO CASE

      CASE cOperacao == "+"
         nResultado := nValor1 + nValor2

      CASE cOperacao == "-"
         nResultado := nValor1 - nValor2

      CASE cOperacao == "*"
         nResultado := nValor1 * nValor2

      CASE cOperacao == "/"

         IF nValor2 == 0
            QOut("Erro: divisão por zero.")
            RETURN NIL
         ENDIF

         nResultado := nValor1 / nValor2

      CASE cOperacao == "^"
         nResultado := nValor1 ^ nValor2

      CASE Upper(cOperacao) == "R"
         nResultado := Sqrt(nValor1)

      OTHERWISE
         QOut("Operação inválida.")
         RETURN NIL

   ENDCASE

   QOut("")
   QOut("===== Calculadora =====")
   QOut("Resultado: " + Str(nResultado, 10, 2))

RETURN NIL