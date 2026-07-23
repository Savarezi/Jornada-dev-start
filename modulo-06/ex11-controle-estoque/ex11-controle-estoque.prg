procedure Main()
    local aEstoque := {} 
    local nOpcao   := -1

    do while .T.
        nOpcao := ExibirMenu()

        if nOpcao == 0
            exit
        endif

        do case
            case nOpcao == 1
                CadastrarProduto(aEstoque)
            case nOpcao == 2
                ListarProdutos(aEstoque)
            case nOpcao == 3
                EntradaEstoque(aEstoque)
            case nOpcao == 4
                SaidaEstoque(aEstoque)
            case nOpcao == 5
                ExecutarBusca(aEstoque)
            case nOpcao == 6
                RelatorioEstoque(aEstoque)
            otherwise
                Alert("Opcao invalida! Tente novamente.")
        endcase
    enddo

    clear screen
    @ 5, 5 say "Sistema encerrado. Ate logo!"
    inkey(0) // Pausa definitiva para o programa esperar você ler e fechar manualmente

return