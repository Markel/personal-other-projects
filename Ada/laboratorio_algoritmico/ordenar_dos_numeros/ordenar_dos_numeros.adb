WITH Ada.Integer_Text_IO, Ada.Text_IO;
 USE Ada.Integer_Text_IO, Ada.Text_IO;

PROCEDURE ordenar_dos_numeros IS
  procedure ordenar (
    Num1, Num2: in Positive;
    Primero, Segundo: out Positive) IS
  BEGIN
    if Num1 = Num2 then
      Primero := Num1;
      Segundo := Num2;
    elsif Num1 < Num2 then
      Primero := Num1;
      Segundo := Num2;
    else
      Primero := Num2;
      Segundo := Num1;
    end if;
  END ordenar;

  Num1, Num2: Positive;
BEGIN
  Put("Introduzca el primer entero: ");
  Get(Num1);
  Put("Introduzca el segundo entero: ");
  Get(Num2);
  -- Sobreescribimos los valores con una procedure
  ordenar(Num1, Num2, Primero=>Num1, Segundo=>Num2);
  Put("El orden de menor a mayor es: ");
  Put(Num1, Width=>0);
  Put(", ");
  Put(Num2, Width=>0);
END ordenar_dos_numeros;