FUNCTION Main()

   LOCAL nEstoque := 10
   LOCAL nVenda := 2

   ? "=== SISTEMA ERP ==="
   ? "Estoque inicial:", nEstoque

   nEstoque := nEstoque - nVenda

   ? "Venda realizada:", nVenda
   ? "Estoque atual:", nEstoque

RETURN NIL