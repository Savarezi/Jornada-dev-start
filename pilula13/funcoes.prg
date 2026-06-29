FUNCTION Main()

   LOCAL nMedia

   nMedia := CalcularMedia(8, 7, 9)

   ? "Media:", nMedia

RETURN NIL


FUNCTION CalcularMedia(nN1, nN2, nN3)

   LOCAL nMedia := (nN1 + nN2 + nN3) / 3

RETURN nMedia