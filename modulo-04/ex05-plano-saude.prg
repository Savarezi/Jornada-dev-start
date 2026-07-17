FUNCTION Main()

   LOCAL cIdade := ""
   LOCAL cDependentes := ""

   LOCAL nIdade := 0
   LOCAL nDependentes := 0

   LOCAL nValorPlano := 0
   LOCAL nValorDependentes := 0
   LOCAL nValorTotal := 0

   ACCEPT "Digite a idade: " TO cIdade
   nIdade := Val(cIdade)

   ACCEPT "Digite a quantidade de dependentes: " TO cDependentes
   nDependentes := Val(cDependentes)

   // Define o valor do plano de acordo com a faixa etária
   IF nIdade <= 25

      nValorPlano := 180

   ELSEIF nIdade <= 40

      nValorPlano := 260

   ELSEIF nIdade <= 60

      nValorPlano := 380

   ELSE

      nValorPlano := 520

   ENDIF

   // Calcula o valor dos dependentes
   nValorDependentes := nDependentes * 90

   // Calcula o valor total do plano
   nValorTotal := nValorPlano + nValorDependentes

   QOut("")
   QOut("===== Plano de Saúde =====")
   QOut("Idade: " + LTrim(Str(nIdade)))
   QOut("Dependentes: " + LTrim(Str(nDependentes)))
   QOut("Valor do Plano: R$ " + Str(nValorPlano, 10, 2))
   QOut("Valor dos Dependentes: R$ " + Str(nValorDependentes, 10, 2))
   QOut("Valor Total: R$ " + Str(nValorTotal, 10, 2))

RETURN NIL