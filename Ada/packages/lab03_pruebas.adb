with Laboratorio03, Ada.Text_IO, Ada.Integer_Text_IO;
use Laboratorio03, Ada.Text_IO, Ada.Integer_Text_IO;
procedure Lab03_Pruebas is
   triang: T_Triangulo;
   la_suma, la_cuenta, la_longitud: Integer;
begin
   Triang:= Tipo_Triangulo(30.0, 60.0, 90.0); --Escaleno
   Put_Line(T_Triangulo'Image(Triang)); --Para imprimir el tipo enumerado T_triangulo
   --poner m�s casos para probar la funci�n t_triangulo y asegurar que funciona

   --Ejercicio 2 sin parte opcional
   Multiplos_De_Tres_Entre(1,10,La_Suma);
   Put("La suma de los multiplos de 3 entre 1 y 10 es "); Put(La_Suma);New_Line;
   --Ejercicio 2 con parte opcional:
--   Multiplos_De_Tres_Entre(1,10,La_Suma, la_cuenta);
--   Put("La suma de los "; put(la_cuenta,0); Put(" multiplos de 3 entre 1 y 10 es "); Put(La_Suma); New_Line;

   Put_Line("Escribe un mensaje a quitarle blancos que termine en punto (.):");
   Sin_Blancos;
   Put_Line("Fin del mensaje sin blancos");
   -- si se escribe: Hola  esto es una      prueba.
   -- debe escribir: Holaestoesunaprueba.

   Put_Line("Escribe una serie de enteros que termina en 0:");
   pares_impares;
   Put_Line("Fin de pares_impares");
   --si se escribe 6 -6 -8 -7 4 9 0 debe devolver (numero de)pares=4 y (suma de)impares=2


  --  Put_Line("La serie de Collatz comenzando en 18:");
  --  Secuencia_Collatz(18, La_Suma, La_Longitud);
  --  Put("La longitud es:"); Put(la_longitud); New_line;
  --  Put("la suma es:"); Put(la_suma); New_Line;
  --  Put_Line("Fin de la serie de Collatz");
   --debe salir: 18 9 28 14 7 22 11 34 17 52 26 13 40 20 10 5 16 8 4 2 1; longitud=21; suma=357


  --  Put_Line("Codigo de Control de ISBN de 842053211-");
  --  Put(control_ISBN(8,4,2,0,5,3,2,1,1));
  --  New_Line; -- debe salir 8

   --Version mas dificil porque el numero no esta dividido en digitos
   Put_Line("Codigo de Control de ISBN de 842053211-");
   Put(control_ISBN(842053211));
   New_Line; -- debe salir 8


end Lab03_Pruebas;

