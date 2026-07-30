#include 'protheus.ch'

/* =================================================================ut
   Programa: Ex05Bro
   Autor: Patricia
   Objetivo: Criar a tela de listagem (mBrowse) para a tabela de Pets (ZA1),
             permitindo visualizar, incluir, alterar e excluir registros.
   ================================================================ */

User Function Ex05Bro()
    
    // Variável que guarda o título que vai aparecer lá no topo da janela do Protheus
    Local cCadastro := "Cadastro de Pets - Tabela ZA1"
    
    // Vetor (lista) que vai armazenar os botões que aparecerão na barra de tarefas (aRotina)
    Local aRotina   := {}

    // Adicionando os botões padrão do Protheus na nossa rotina:
    // Sintaxe básica: {"Nome do Botao", "Funcao Padrao do Protheus", 0, Operacao}
    
    // 1. Botão para pesquisar registros na tabela
    AAdd( aRotina, { "Pesquisar",  "AxPesqui", 0, 1 } )
    
    // 2. Botão para apenas visualizar os dados do registro selecionado
    AAdd( aRotina, { "Visualizar", "AxVisual", 0, 2 } )
    
    // 3. Botão para cadastrar um novo Pet
    AAdd( aRotina, { "Incluir",    "AxInclui", 0, 3 } )
    
    // 4. Botão para alterar os dados de um Pet que já existe
    AAdd( aRotina, { "Alterar",    "AxAltera", 0, 4 } )
    
    // 5. Botão para excluir o registro selecionado
    AAdd( aRotina, { "Excluir",    "AxDeleta", 0, 5 } )

    // Selecionando a nossa tabela customizada de Pets (ZA1) para trabalhar com ela
    dbSelectArea("ZA1")
    
    // Definindo a ordem de exibição dos dados (Ordem 1, geralmente por Código)
    dbSetOrder(1)
    
    // Comando mBrowse: Desenha a tela em formato de tabela/grade (linhas e colunas)
    // Parâmetros de tamanho da tela, alias da tabela e os botões da aRotina
    mBrowse(6, 1, 22, 75, "ZA1",,,,,, aRotina)

Return