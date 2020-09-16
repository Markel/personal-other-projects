-- Nota: Uso GNAT para compilar, por lo que puede dar errores en AdaGIDE (tildes, etc...)
WITH Ada.Integer_Text_IO, Ada.Text_IO, Ada.Float_Text_IO;
USE Ada.Integer_Text_IO, Ada.Text_IO; -- Float_Text no se usa para evitar errores de decisión

PROCEDURE Suma IS
   -- precondicion: entrada de entero1 y entero2 (>0)
   -- postcondicion: suma = entero1 + entero2
   Entero1   : Integer;
   Entero2   : Integer;
   Operacion : Integer;
   Resultado : Integer := 0; 
   FloatRes : Float := 0.0;
BEGIN
   Put("Operacion a realizar");
   New_Line;
   Put("1: Suma. 2: Division entera. 3: Division Real");
   New_Line;
   Get(Operacion);
   Put("Introduce el primer entero");
   New_Line;
   Get(Entero1);
   Put("Introduce el segundo entero");
   New_Line;
   Get(Entero2);
   CASE Operacion IS
      WHEN 1 =>
         Resultado:= Entero1 + Entero2;
      WHEN 2 =>
         Resultado:= Entero1 / Entero2;
      WHEN 3 =>
         FloatRes:= float(Entero1) / float(Entero2);
      WHEN OTHERS =>
         -- Lo óptimo es lanzar el error antes de pedir los números, pero prefiero dejarlo limpio
         Put("Introduzca una operacion disponible"); 
         delay 1.0;
         return;
   END CASE;
   Put("El resultado es: ");
   IF Resultado /= 0 THEN
      Put(Resultado);
   ELSIF FloatRes /= 0.0 THEN
      Ada.Float_Text_IO.Put(FloatRes);
   ELSE
      Put("0");
   END IF;
   delay 1.0;
END Suma;
