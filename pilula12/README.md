# 🥚 Arrays — A cartela de ovos da programação

## A analogia da cartela de ovos

Um **array** é como uma cartela de ovos: uma única estrutura com vários compartimentos numerados, cada um guardando um valor.

Em vez de ter várias caixas espalhadas, você tem tudo organizado em posições.

Exemplo:

```advpl
aNotas := {8, 7, 9, 6, 10}
```

Isso cria um array com **5 notas** de uma vez só.

---

## Acessando os valores

Cada posição dentro do array possui um número chamado **índice**.

Você acessa assim:

```advpl
QOut(aNotas[1])   // mostra 8 (primeira nota)
QOut(aNotas[3])   // mostra 9 (terceira nota)
```

O índice indica exatamente qual posição queremos acessar.

---

## Percorrendo um array com loop

Podemos usar um `FOR` para percorrer todas as posições:

```advpl
FOR nI := 1 TO 5
   QOut(aNotas[nI])
NEXT
```

O loop passa por cada posição e mostra cada valor armazenado.

---

## Por que isso importa?

Arrays permitem organizar grandes quantidades de dados de forma simples.

Exemplo:

- notas de alunos
- lista de produtos
- nomes de clientes
- valores de vendas

Sem arrays, precisaríamos criar uma variável para cada informação.

Com arrays, usamos uma única estrutura organizada.

---

## Regra de ouro 💡

Array é coleção.  
Índice é posição.  
Loop é o caminho para percorrer tudo.