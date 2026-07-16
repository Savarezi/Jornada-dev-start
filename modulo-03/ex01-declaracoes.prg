
/*cNomeFuncionario ? Caractere (String)
  nSalarioBruto ? Numérico
  lAtivo ? Lógico (.T. / .F.)
  dAdmissao ? Data
  cDepartamento ? Caractere (String)*/



FUNCTION Main()

   // Declaração das variáveis utilizando os prefixos corretos

   LOCAL cNomeFuncionario := "Patricia Oliveira"
   LOCAL nSalarioBruto    := 5500.00
   LOCAL lAtivo           := .T.
   LOCAL dAdmissao        := CToD("01/07/2026")
   LOCAL cDepartamento    := "Tecnologia"


   QOut("=== Cadastro de Funcionário ===")
   QOut("Nome: " + cNomeFuncionario)
   QOut("Salário: R$ " + Str(nSalarioBruto, 10, 2))
   QOut("Ativo: " + IIf(lAtivo, "Sim", "Não"))
   QOut("Data de Admissão: " + DToC(dAdmissao))
   QOut("Departamento: " + cDepartamento)


RETURN NIL