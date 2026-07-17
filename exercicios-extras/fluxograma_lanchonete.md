# 📊 Fluxograma - Sistema de Pedido da Lanchonete Dev

```mermaid
flowchart TD

A[Início] --> B[Exibir Menu da Lanchonete]

B --> C[Receber opção do usuário]

C --> D{Opção válida?}

D -- Não --> E[Mostrar "Opção inválida"]
E --> B

D -- Sim --> F{Qual produto escolhido?}

F -- 1 --> G[Hambúrguer<br/>Preço R$ 18,00]
F -- 2 --> H[Batata frita<br/>Preço R$ 12,00]
F -- 3 --> I[Refrigerante<br/>Preço R$ 7,00]

G --> J[Informar quantidade]
H --> J
I --> J

J --> K[Calcular valor do item]

K --> L[Adicionar valor ao total da compra]

L --> M{Deseja fazer outro pedido?}

M -- Sim --> B

M -- Não --> N{Total maior que R$ 50?}

N -- Sim --> O[Aplicar desconto de 10%]

N -- Não --> P[Manter valor sem desconto]

O --> Q[Exibir resumo do pedido]
P --> Q

Q --> R[Mostrar subtotal, desconto e total a pagar]

R --> S[Fim]
```