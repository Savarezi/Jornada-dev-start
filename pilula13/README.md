# 💊 Pílula #13 — Dividir para conquistar: programe com Lego, não com concreto

Imagine um programa de **1000 linhas** escrito inteiro dentro de uma única função.

Como encontrar um bug no meio disso?  
Como reaproveitar só uma parte?  
Como trabalhar em equipe sem um atropelar o outro?

A resposta é simples: **funções**.

---

## 🧱→🧩 Lego em vez de concreto

Um código monolítico é como um **bloco de concreto**:

- pesado  
- difícil de modificar  
- impossível de reaproveitar partes

Já um código dividido em funções funciona como **Lego**:

- cada peça faz uma coisa
- cada peça tem um nome
- você monta e desmonta quando quiser

Essa é a base de um código limpo.

---

## Como é uma função

Uma função recebe valores (**parâmetros**), executa uma lógica e devolve um resultado.

Exemplo:

```advpl
FUNCTION CalcularMedia(nN1, nN2, nN3)

   LOCAL nMedia := (nN1 + nN2 + nN3) / 3

RETURN nMedia
```

Aqui:

- `nN1`, `nN2`, `nN3` são os valores recebidos
- a função calcula a média
- devolve o resultado

---

## Reutilizando a função

Depois de criada, você pode usar quantas vezes quiser:

```advpl
nMedia := CalcularMedia(8, 7, 9)
```

Resultado:

```text
8
```

Sem repetir a fórmula.

---

## O efeito mágico no código principal

Quando seu programa é dividido em funções com nomes claros, o código principal fica muito mais fácil de ler:

```advpl
ExibirCabecalho()
nMedia := CalcularMedia(8, 7, 9)
MostrarResultado(nMedia)
```

Quase parece uma frase em português.

Você entende o fluxo sem precisar olhar o detalhe interno.

Isso vale ouro.

---

## Benefícios na prática

### 🔁 Reuso

Escreve uma vez e usa quantas vezes precisar.

---

### 🛠 Manutenção

Se der bug, ele fica isolado em uma peça pequena.

Mais fácil de corrigir.

---

### 🧪 Testabilidade

Você testa cada função separadamente.

Menos risco.

---

### 🤝 Colaboração

Cada pessoa pode trabalhar em funções diferentes.

Sem bagunça.

---

## Regra de ouro 💡

Uma função deve fazer **uma única coisa bem feita**.

Se ela:

- valida
- calcula
- salva
- envia e-mail

... então provavelmente você tem várias funções misturadas.

Separar é melhor.

---

## Por que isso importa?

No Protheus, é comum criar bibliotecas reutilizáveis, como:

- `NomeCliente()`
- `ProximoCodigo()`
- `BuscarProduto()`

Isso deixa o sistema:

- limpo
- organizado
- profissional

Pensar em funções é pensar como desenvolvedor de verdade.

🧩