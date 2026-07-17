FUNCTION Main()

   LOCAL cSalario := ""
   LOCAL nSalario := 0
   LOCAL nReajuste := 0
   LOCAL nNovoSalario := 0

   ACCEPT "Digite o salário atual: " TO cSalario
   nSalario := Val(cSalario)

   // Define o percentual de reajuste conforme a faixa salarial
   IF nSalario < 1000

      nReajuste := 0.15

   ELSEIF nSalario <= 2000

      nReajuste := 0.12

   ELSEIF nSalario <= 4000

      nReajuste := 0.08

   ELSE

      nReajuste := 0.05

   ENDIF

   // Calcula o novo salário
   nNovoSalario := nSalario + (nSalario * nReajuste)

   QOut("")
   QOut("===== Reajuste Salarial =====")
   QOut("Salário Atual: R$ " + Str(nSalario, 10, 2))
   QOut("Percentual: " + Str(nReajuste * 100, 6, 2) + "%")
   QOut("Novo Salário: R$ " + Str(nNovoSalario, 10, 2))

RETURN NIL