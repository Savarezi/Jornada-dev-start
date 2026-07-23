function ExibirMenu()
    local cOpcao := ""

    clear screen
    @ 1, 2 say "=== MINI-CONTROLE DE ESTOQUE ==="
    @ 3, 2 say "1 - Cadastrar produto"
    @ 4, 2 say "2 - Listar produtos"
    @ 5, 2 say "3 - Entrada de estoque"
    @ 6, 2 say "4 - Saida de estoque"
    @ 7, 2 say "5 - Buscar produto por codigo"
    @ 8, 2 say "6 - Relatorio (Valor em estoque)"
    @ 9, 2 say "0 - Sair"
    @ 11, 2 say "Escolha uma opcao: " get cOpcao pict "9"
    read

return val(cOpcao)

function CadastrarProduto(aEstoque)
    local nCodigo, cNome, nQtd, nPreco
    local nPos, cEncNome

    clear screen
    @ 1, 2 say "=== CADASTRAR NOVO PRODUTO ==="
    
    @ 3, 2 say "Codigo (numerico): " get nCodigo pict "99999"
    read
    if nCodigo <= 0
        Alert("Codigo invalido!")
        return
    endif

    nPos := BuscarPorCodigo(aEstoque, nCodigo)
    if nPos > 0
        Alert("Erro: Ja existe um produto com este codigo!")
        return
    endif

    @ 4, 2 say "Nome do produto:  " get cNome
    read
    cEncNome := alltrim(cNome)
    if empty(cEncNome)
        Alert("Nome nao pode estar vazio!")
        return
    endif

    @ 5, 2 say "Quantidade inicial: " get nQtd pict "999999"
    read
    if nQtd < 0
        Alert("Quantidade nao pode ser negativa!")
        return
    endif

    @ 6, 2 say "Preco unitario:   " get nPreco pict "@E 999,999.99"
    read
    if nPreco < 0
        Alert("Preco nao pode ser negativo!")
        return
    endif

    aadd(aEstoque, {nCodigo, cEncNome, nQtd, nPreco})
    Alert("Produto cadastrado com sucesso!")

return

function ListarProdutos(aEstoque)
    local i
    local nLinha := 4

    clear screen
    @ 1, 2 say "=== LISTA DE PRODUTOS ==="
    
    if len(aEstoque) == 0
        @ 3, 2 say "Nenhum produto cadastrado."
        inkey(0)
        return
    endif

    @ 3, 2 say "Cod   Nome                   Qtd       Preco Unit."
    @ 4, 2 say "--------------------------------------------------"
    nLinha := 5

    for i := 1 to len(aEstoque)
        if nLinha > 20
            @ 22, 2 say "Pressione qualquer tecla para continuar..."
            inkey(0)
            clear screen
            @ 1, 2 say "=== LISTA DE PRODUTOS (Continuacao) ==="
            @ 3, 2 say "Cod   Nome                   Qtd       Preco Unit."
            @ 4, 2 say "--------------------------------------------------"
            nLinha := 5
        endif

        @ nLinha, 2  say aEstoque[i][1] pict "99999"
        @ nLinha, 8  say padr(aEstoque[i][2], 20)
        @ nLinha, 31 say aEstoque[i][3] pict "999999"
        @ nLinha, 39 say aEstoque[i][4] pict "@E 999,999.99"
        
        nLinha++
    next

    @ nLinha + 1, 2 say "Pressione qualquer tecla para voltar..."
    inkey(0)

return

function EntradaEstoque(aEstoque)
    local nCodigo, nQtd, nPos

    clear screen
    @ 1, 2 say "=== ENTRADA DE ESTOQUE ==="
    
    if len(aEstoque) == 0
        @ 3, 2 say "Cadastre produtos primeiro."
        inkey(0)
        return
    endif

    @ 3, 2 say "Codigo do produto: " get nCodigo pict "99999"
    read

    nPos := BuscarPorCodigo(aEstoque, nCodigo)
    if nPos == 0
        Alert("Produto nao encontrado!")
        return
    endif

    @ 4, 2 say "Produto: " + aEstoque[nPos][2]
    @ 5, 2 say "Quantidade atual: " + ltrim(str(aEstoque[nPos][3]))
    
    @ 7, 2 say "Quantidade a adicionar: " get nQtd pict "999999"
    read

    if nQtd <= 0
        Alert("A quantidade de entrada deve ser maior que zero!")
        return
    endif

    aEstoque[nPos][3] += nQtd
    Alert("Estoque atualizado com sucesso!")

return

function SaidaEstoque(aEstoque)
    local nCodigo, nQtd, nPos

    clear screen
    @ 1, 2 say "=== SAIDA DE ESTOQUE ==="
    
    if len(aEstoque) == 0
        @ 3, 2 say "Cadastre produtos primeiro."
        inkey(0)
        return
    endif

    @ 3, 2 say "Codigo do produto: " get nCodigo pict "99999"
    read

    nPos := BuscarPorCodigo(aEstoque, nCodigo)
    if nPos == 0
        Alert("Produto nao encontrado!")
        return
    endif

    @ 4, 2 say "Produto: " + aEstoque[nPos][2]
    @ 5, 2 say "Quantidade atual: " + ltrim(str(aEstoque[nPos][3]))
    
    @ 7, 2 say "Quantidade a retirar: " get nQtd pict "999999"
    read

    if nQtd <= 0
        Alert("A quantidade de saida deve ser maior que zero!")
        return
    endif

    if nQtd > aEstoque[nPos][3]
        Alert("Estoque insuficiente para esta baixa!")
        return
    endif

    aEstoque[nPos][3] -= nQtd
    Alert("Saida realizada com sucesso!")

return

function BuscarPorCodigo(aEstoque, nCodigo)
    local i

    for i := 1 to len(aEstoque)
        if aEstoque[i][1] == nCodigo
            return i
        endif
    next

return 0

function ExecutarBusca(aEstoque)
    local nCodigo, nPos

    clear screen
    @ 1, 2 say "=== BUSCAR PRODUTO ==="
    @ 3, 2 say "Codigo do produto: " get nCodigo pict "99999"
    read

    nPos := BuscarPorCodigo(aEstoque, nCodigo)
    if nPos > 0
        @ 5, 2 say "Produto Encontrado na posicao: " + ltrim(str(nPos))
        @ 6, 2 say "Nome:     " + aEstoque[nPos][2]
        @ 7, 2 say "Qtd:      " + ltrim(str(aEstoque[nPos][3]))
        @ 8, 2 say "Preco:    " + transform(aEstoque[nPos][4], "@E 999,999.99")
    else
        Alert("Produto nao encontrado.")
    endif
    inkey(0)

return

function RelatorioEstoque(aEstoque)
    local i
    local nTotalGeral := 0
    local nTotalItem  := 0
    local nLinha      := 4

    clear screen
    @ 1, 2 say "=== RELATORIO DE VALOR EM ESTOQUE ==="
    
    if len(aEstoque) == 0
        @ 3, 2 say "Nenhum produto cadastrado."
        inkey(0)
        return
    endif

    @ 3, 2 say "Cod   Nome                 Qtd      Preco        Total Item"
    @ 4, 2 say "------------------------------------------------------------"
    nLinha := 5

    for i := 1 to len(aEstoque)
        if nLinha > 20
            @ 22, 2 say "Pressione qualquer tecla para continuar..."
            inkey(0)
            clear screen
            @ 1, 2 say "=== RELATORIO (Continuacao) ==="
            @ 3, 2 say "Cod   Nome                 Qtd      Preco        Total Item"
            @ 4, 2 say "------------------------------------------------------------"
            nLinha := 5
        endif

        nTotalItem := aEstoque[i][3] * aEstoque[i][4]
        nTotalGeral += nTotalItem

        @ nLinha, 2  say aEstoque[i][1] pict "99999"
        @ nLinha, 8  say padr(aEstoque[i][2], 20)
        @ nLinha, 29 say aEstoque[i][3] pict "999999"
        @ nLinha, 37 say aEstoque[i][4] pict "@E 999,99.99"
        @ nLinha, 49 say nTotalItem    pict "@E 999,99.99"
        
        nLinha++
    next

    @ nLinha + 1, 2 say "------------------------------------------------------------"
    @ nLinha + 2, 2 say "TOTAL GERAL DO ESTOQUE:"
    @ nLinha + 2, 49 say nTotalGeral pict "@E 999,999.99"

    @ nLinha + 4, 2 say "Pressione qualquer tecla para voltar..."
    inkey(0)

return