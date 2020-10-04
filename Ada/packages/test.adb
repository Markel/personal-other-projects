WITH laboratorio03, Ada.Text_IO, Ada.Integer_Text_IO;
 USE laboratorio03, Ada.Text_IO, Ada.Integer_Text_IO;

procedure test IS
  -- tipo_triangulo
  a1 : Float := 65.0;
  a2 : Float := 65.0;
  a3 : Float := 50.0;
  resultado : T_TRIANGULO;
  -- Multiplos_de_tres_entre
  N1 : Integer := 1;
  N2 : Integer := 10;
  suma_result : Natural;
  -- sin_blancos
  frise : String := "Hello I you should stop looking at me :(.";
  -- ISBN
  isbn : Integer := 842053211;
  con_ISBN : Character;
BEGIN
  -- tipo_triangulo
  resultado := tipo_triangulo(a1, a2, a3);
  Put(T_TRIANGULO'Image(resultado));
  New_Line;
  -- Multiplos_de_tres_entre
  Put("Multiplos 3");
  New_Line;
  Multiplos_de_tres_entre(N1, N2, suma_result);
  Put(suma_result);
  New_Line;
  -- sin_blancos
  -- sin_blancos;
  New_Line;
  -- pares_impares
  Put("Pares e impares:"); New_Line;
  pares_impares;
  -- Put("Pares-impares");
  -- Put(pares);
  -- Put(impares);
  New_Line;
  -- ISBN
  con_ISBN := control_ISBN(isbn);
  Put(con_ISBN);
END test;