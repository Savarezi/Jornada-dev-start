FUNCTION Main()

   LOCAL cNome := ""
   LOCAL cData := ""
   LOCAL cPreco := ""

   LOCAL dNascimento := CToD("")
   LOCAL nPreco := 0
   LOCAL nIdade := 0
   LOCAL nDesconto := 0
   LOCAL nTotal := 0

   // Define o formato da data para o padrão brasileiro (dd/mm/aaaa)
   SET DATE BRITISH

   ACCEPT "Digite o nome do cliente: " TO cNome

   ACCEPT "Digite a data de nascimento (dd/mm/aaaa): " TO cData
   dNascimento := CToD(cData)

   // Verifica se a data foi convertida corretamente
   IF Empty(dNascimento)
      QOut("Data de nascimento invalida!")
      RETURN NIL
   ENDIF

   ACCEPT "Digite o preco do produto: " TO cPreco
   nPreco := Val(cPreco)

   // Calcula a idade aproximada
   nIdade := Int((Date() - dNascimento) / 365)

   // Aplica desconto de 12,5% para maiores de 60 anos
   IF nIdade > 60
      nDesconto := nPreco * 0.125
   ELSE
      nDesconto := 0
   ENDIF

   // Calcula o valor final
   nTotal := nPreco - nDesconto

   QOut("")
   QOut("===== Resumo da Compra =====")
   QOut("Cliente: " + cNome)
   QOut("Idade: " + LTrim(Str(nIdade)))
   QOut("Preco: R$ " + Str(nPreco, 10, 2))
   QOut("Desconto: R$ " + Str(nDesconto, 10, 2))
   QOut("Total: R$ " + Str(nTotal, 10, 2))

RETURN NIL