// Crio 1 gaveteiro com 30 gavetas
LOCAL aGaveteiro := Array(30)

// Guardo coisas em cada gaveta pela posição
aGaveteiro[1] := "Caneta" // Gaveta 1
aGaveteiro[5] := "Caderno" // Gaveta 5 
aGaveteiro[30] := "Livro" // Gaveta 30

// Pego o que tem na gaveta 5
QOut("Na gaveta 5 tem: " + aGaveteiro[5])