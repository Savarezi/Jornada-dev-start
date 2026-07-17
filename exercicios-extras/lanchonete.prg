FUNCTION Main()

// Variáveis para receber os valores digitados pelo usuário
LOCAL cOpcao := ""
LOCAL cQuantidade := ""
LOCAL cContinuar := ""

// Variáveis numéricas utilizadas nos cálculos
LOCAL nOpcao := 0
LOCAL nQuantidade := 0
LOCAL nTotal := 0
LOCAL nDesconto := 0

// Loop principal para permitir fazer mais de um pedido
DO WHILE .T.

```
  // Exibe o menu da lanchonete
  QOut("")
  QOut("=== LANCHONETE DEV ===")
  QOut("1 - Hambúrguer .... R$ 18,00")
  QOut("2 - Batata frita .. R$ 12,00")
  QOut("3 - Refrigerante ... R$  7,00")

  // Recebe a opção escolhida pelo usuário
  ACCEPT "Escolha seu pedido: " TO cOpcao
  nOpcao := Val(cOpcao)

  // Verifica qual opção foi escolhida no menu
  DO CASE

     CASE nOpcao == 1

        // Recebe a quantidade de hambúrgueres
        ACCEPT "Digite a quantidade: " TO cQuantidade
        nQuantidade := Val(cQuantidade)

        // Soma o valor do pedido ao total
        nTotal += nQuantidade * 18

        // Exibe os detalhes do pedido realizado
        QOut("")
        QOut("Pedido: Hambúrguer")
        QOut("Quantidade: " + LTrim(Str(nQuantidade)))

     CASE nOpcao == 2

        // Recebe a quantidade de batatas fritas
        ACCEPT "Digite a quantidade: " TO cQuantidade
        nQuantidade := Val(cQuantidade)

        // Soma o valor do pedido ao total
        nTotal += nQuantidade * 12

        // Exibe os detalhes do pedido realizado
        QOut("")
        QOut("Pedido: Batata frita")
        QOut("Quantidade: " + LTrim(Str(nQuantidade)))

     CASE nOpcao == 3

        // Recebe a quantidade de refrigerantes
        ACCEPT "Digite a quantidade: " TO cQuantidade
        nQuantidade := Val(cQuantidade)

        // Soma o valor do pedido ao total
        nTotal += nQuantidade * 7

        // Exibe os detalhes do pedido realizado
        QOut("")
        QOut("Pedido: Refrigerante")
        QOut("Quantidade: " + LTrim(Str(nQuantidade)))

     OTHERWISE

        // Informa quando o usuário digita uma opção que não existe
        QOut("Opção inválida.")

        // Volta para o início do menu
        LOOP

  ENDCASE

  // Pergunta se o usuário deseja fazer outro pedido
  ACCEPT "Deseja fazer outro pedido? (S/N): " TO cContinuar

  // Encerra o loop caso a resposta não seja S
  IF Upper(cContinuar) <> "S"
     EXIT
  ENDIF
```

ENDDO

// Aplica um desconto de 10% quando o total ultrapassa R$ 50
IF nTotal > 50
nDesconto := nTotal * 0.10
ENDIF

// Exibe o resumo final do pedido
QOut("")
QOut("===== RESUMO DO PEDIDO =====")
QOut("Subtotal: R$ " + Str(nTotal, 10, 2))
QOut("Desconto: R$ " + Str(nDesconto, 10, 2))
QOut("Total a pagar: R$ " + Str(nTotal - nDesconto, 10, 2))

RETURN NIL
