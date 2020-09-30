WITH Ada.Integer_Text_IO, Ada.Text_IO;
 USE Ada.Integer_Text_IO, Ada.Text_IO;

PROCEDURE producto IS
  function obtener_producto (
    Entero1, Entero2: in Integer)
    return Integer IS
  BEGIN
    return Entero1*Entero2;
  END obtener_producto;

  Entero1, Entero2, Resultado: Integer;
BEGIN
  Put("Introduzca el primer entero: ");
  Get(Entero1);
  Put("Introduzca el segundo entero: ");
  Get(Entero2);
  Resultado := obtener_producto(Entero1, Entero2);
  Put("El producto es: ");
  Put(Resultado, Width=>0);
END producto;