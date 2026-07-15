FUNCTION Main()

   LOCAL cValor := ""
   LOCAL nValorCompra := 0
   LOCAL nValorFinal := 0

   ACCEPT "Digite o valor da compra: " TO cValor

   nValorCompra := Val(cValor)

   IF nValorCompra > 100
      nValorFinal := nValorCompra * 0.90
   ELSE
      nValorFinal := nValorCompra
   ENDIF

   ? "Valor final a pagar: R$", nValorFinal

RETURN NIL