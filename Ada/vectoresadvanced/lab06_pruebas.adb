---------------------------------------------------------------------------------
-- Leyenda => V: Test correcto ; X: Test fallido ; E: Programa no implementado --
---------------------------------------------------------------------------------

WITH Laboratorio06b, Ada.Text_IO, Ada.Wide_Wide_Text_IO, Ada.Integer_Text_IO, Ada.Exceptions, Ada.Characters.Latin_1;
 USE Laboratorio06b, Ada.Text_IO, Ada.Integer_Text_IO, Ada.Exceptions, Ada.Characters.Latin_1;

pragma Wide_Character_Encoding (UTF8);

procedure lab06_pruebas IS
  v, x: Natural := 0;
  hay_exclamaciones: Boolean := true;
  procedure red IS begin Put(ASCII.ESC & "[31m"); end red;
  procedure green IS begin Put(ASCII.ESC & "[32m"); end green;
  procedure white IS begin Put(ASCII.ESC & "[00m"); end white;
  procedure end_credits(aciertos, fallos: in Natural) IS begin New_Line;Put(aciertos,0);if aciertos/=1 then Put(" exitos, ");else Put(" exito, ");end if;Put(fallos,0);if fallos/=1 then Put(" fallos (");else Put(" fallo (");end if;if fallos/=0 then Put(aciertos*100/(aciertos+fallos), 0);Put("%).");else Put(ASCII.ESC & "[04m");Put(aciertos*100/(aciertos+fallos), 0);Put("%");white;Put(").");end if;New_Line;if hay_exclamaciones then Put("Resultados con ! en el titulo pueden contener falsos negativos.");end if;end end_credits;

  type Int_Array_Decl  is array (Integer range <>) of Integer;
  type Flo_Array_Decl  is array (Integer range <>) of Float;
  type Bool_Array_Decl    is array (Integer range <>) of Boolean;
  type Int_10_ArrayS_Decl is array (Integer range <>) of T_Vector_Enteros(-5..4);
  type Int_5_Matriz_Decl is array (Integer range <>) of T_Matriz(0..4, 11..15);
  type pala_7_Array_Decl is array (Integer range <>) of T_Info_texto;
  type letra_7_Array_Decl is array (Integer range <>) of T_Letra;
  
  Int_Array_5, Int_Array_5_R_1, Int_Array_5_R_2, Int_Array_5_R_3: Int_Array_Decl (1..5);
  Int_Array_8 : Int_Array_Decl(1..8);
  Flo_Array_5: Flo_Array_Decl(1..5);
  Int_ArrayS_5, Int_ArrayS_5_R : Int_10_ArrayS_Decl(1..5);
  Int_ArrayS_8 : Int_10_ArrayS_Decl(1..8);
  Int_MatriS_3 : Int_5_Matriz_Decl(1..3);
  Pala_Array_3 : pala_7_Array_Decl(1..3);
  Letra_array_3 : letra_7_Array_Decl(1..3);
  Bool_Array_3_R  : Bool_Array_Decl (1..3);
  Bool_Array_8_R  : Bool_Array_Decl (1..8);

  grados_sex : T_Grados_Sex;
  -- int_1, int_2: Integer;
  bool_1 : Boolean;
  vector_en : T_Vector_Enteros (-5..4);
  letra : T_Letra;
  --Ejemplo_de_variable_de_texto: T_Info_texto := (Cuantas=>5,Palabras=>((Long=>5,Letras=>"Lorem"&(6..30=>'z')),(Long=>5,Letras=>"ipsum"&(6..30=>'z')),(Long=>5,Letras=>"dolor"&(6..30=>'z')),(Long=>3,Letras=>"sit"&(4..30=>'z')),(Long=>4,Letras=>"amet"&(5..30=>'z')),others=>(Long=>0,Letras=>(others=>'z'))));
BEGIN
  ----------------
  -- Cent_A_Sex --
  ----------------
  Put("Cent a Sex! ");
  -- Casos de prueba (este falla porque Ada es estúpido y suele fallar en operaciones con Floats)
  -- Lo mejor que he llegado a conseguir es que solo falle el último
  Flo_Array_5     := (43.425, 180.0, 15.339,  42.600,  30278.28273);
  Int_Array_5_R_1 := (  43,    180,    15,      42,       30278   );
  Int_Array_5_R_2 := (  25,     0,     20,      36,         16    );
  Int_Array_5_R_3 := (  30,     0,     20,      0,          58    );
  -- Test
  for i in Flo_Array_5'range loop
    begin
      Cent_A_Sex(Flo_Array_5(i), grados_sex);
      if grados_sex.Grados = Int_Array_5_R_1(i) and grados_sex.Minutos = Int_Array_5_R_2(i) and grados_sex.Segundos = Int_Array_5_R_3(i) then
        green; green; Put("V"); v:=v+1;
      else 
        red; Put("X"); x:=x+1;
      end if;
    exception
      when Error: Program_Error => red; Put("E"); x:=x+1;
      when Error: others => red; Put(Exception_Information(Error)); x:=x+1;
    end;
  end loop;
  -- Finish
  white; New_line;

  -------------------
  -- Rotar_Derecha --
  -------------------
  Put("Rotar Derecha: ");
  -- Casos de prueba
  Int_ArrayS_5    := ((67,45,23,78,12,40,55,24,89,34), (435,453,23,582,0,82,123456,920,27,74), (1,2,3,4,5,6,7,8,9,10), (63,91,273,27,29,19,28,19,0,1), (7,28,48,28,50,28,12,49,21,-5));
  Int_ArrayS_5_R  := ((34,67,45,23,78,12,40,55,24,89), (74,435,453,23,582,0,82,123456,920,27), (10,1,2,3,4,5,6,7,8,9), (1,63,91,273,27,29,19,28,19,0), (-5,7,28,48,28,50,28,12,49,21));
  -- Test
  for i in Int_ArrayS_5'range loop
    begin
      Rotar_Derecha(Int_ArrayS_5(i));
      if Int_ArrayS_5(i) = Int_ArrayS_5_R(i) then
        green; Put("V"); v:=v+1;
      else 
        red; Put("X"); x:=x+1;
      end if;
    exception
      when Error: Program_Error => red; Put("E"); x:=x+1;
      when Error: others => red; Put(Exception_Information(Error)); x:=x+1;
    end;
  end loop;
  -- Finish
  white; New_Line;
  
  -----------------------------
  -- esta_en_vector_ordenado --
  -----------------------------
  Put("Esta en Vector Ordenado: ");
  -- Casos de prueba
  -- El último, dobles, primero, no está (antes), no está (después), no está (en medio), en medio, velocidad.
  Int_ArrayS_8 := ((-2,-1,3,4,5,6,7,8,9,10),(-1,2,4,5,6,8,8,9,10,10),(1,2,3,4,5,6,7,8,9,10),(14,17,18,24,26,32,41,51,61,67),(7,14,21,28,35,42,49,56,63,70),(5,10,15,20,25,30,35,40,45,50),(1,2,3,4,5,6,7,8,9,10),(2147483636,2147483637,2147483638,2147483639,2147483640,2147483641,2147483642,2147483643,2147483644,2147483645));
  Int_Array_8 := (10, 9, 1, 13, 90, 23, 8, 2147483644);
  Bool_Array_8_R := (true, true, true, false, false, false, true, true);
  -- Test
  for i in Int_ArrayS_8'range loop
    begin
      bool_1 := esta_en_vector_ordenado(Int_ArrayS_8(i), Int_Array_8(i));
      if bool_1 = Bool_Array_8_R(i) then
        green; Put("V"); v:=v+1;
      else 
        red; Put("X"); x:=x+1;
      end if;
    exception
      when Error: Program_Error => red; Put("E"); x:=x+1;
      when Error: others => red; Put(Exception_Information(Error)); x:=x+1;
    end;
  end loop;
  -- Finish
  white; New_Line;

  --------------------------------
  -- eliminar_elemento_ordenado --
  --------------------------------
  Put("Eliminar Elemento Ordenado: ");
  -- Casos de prueba (puede que este sea !, pero no creo)
  Int_ArrayS_5 := ((Integer'First,-1,3,4,5,6,7,8,9,10),(-1,2,4,5,6,8,8,9,10,Integer'First),(1,2,3,4,Integer'First,6,7,8,9,10),(1,2,3,Integer'First,56,26,32,41,51,67),(7,14,21,28,35,Integer'First,49,56,63,70));
  Int_Array_5 := (2, 0, -3, -5, 3); -- Pos (absoluta, vector -5..4)
  Int_Array_5_R_1 := (-5,3,-2,-3,0); -- Dónde está el First (-5..4)
  Int_Array_5_R_2 := (8, 8, 4, 2, 63); -- Lo que hay en Pos (-5..4)
  -- Result (está comentado!) := ((Integer'First,-1,3,4,5,6,7,8,9,10),(-1,2,4,5,6,8,9,10,Integer'First,Integer'First),(1,2,4,Integer'First,Integer'First,6,7,8,9,10),(2,3,Integer'First,56,26,32,41,51,67,67),(7,14,21,28,35,Integer'First,49,56,63,70));
  -- Test
  for i in Int_ArrayS_5'range loop
    begin
      eliminar_elemento_ordenado(Int_Array_5(i), Int_ArrayS_5(i));
      vector_en := Int_ArrayS_5(i);
      if vector_en(Int_Array_5_R_1(i)) = Integer'First and vector_en(Int_Array_5(i)) = Int_Array_5_R_2(i) then
        green; Put("V"); v:=v+1;
      else 
        red; Put("X"); x:=x+1;
      end if;
    exception
      when Error: Program_Error => red; Put("E"); x:=x+1;
      when Error: others => red; Put(Exception_Information(Error)); x:=x+1;
    end;
  end loop;
  -- Finish
  white; New_Line;

  --------------------------------
  -- insertar_elemento_ordenado --
  --------------------------------
  Put("Insertar Elemento Ordenado! ");
  -- Casos de prueba
  Int_ArrayS_5 := ((-2,-1,3,4,5,6,7,8,Integer'First,10),(-1,2,4,5,6,8,Integer'First,9,10,10),(1,2,3,4,5,6,7,8,Integer'First,10),(14,Integer'First,18,24,26,32,41,51,61,67),(7,14,21,Integer'First,35,42,49,56,63,70));
  Int_Array_5 := (1, 3, -2, 5, 30);
  Int_ArrayS_5_R := ((-2,-1,1,3,4,5,6,7,8,Integer'First),(-1,2,3,4,5,6,8,Integer'First,9,10),(-2,1,2,3,4,5,6,7,8,Integer'First),(5,14,Integer'First,18,24,26,32,41,51,61),(7,14,21,30,Integer'First,35,42,49,56,63));
  -- Test
  for i in Int_ArrayS_5'range loop
    begin
      insertar_elemento_ordenado(Int_Array_5(i), Int_ArrayS_5(i));
      if Int_ArrayS_5(i) = Int_ArrayS_5_R(i) then
        green; Put("V"); v:=v+1;
      else 
        red; Put("X"); x:=x+1;
      end if;
    exception
      when Error: Program_Error => red; Put("E"); x:=x+1;
      when Error: others => red; Put(Exception_Information(Error)); x:=x+1;
    end;
  end loop;
  -- Finish
  white; New_Line;

  ------------------------
  -- Eliminar_Repetidos --
  ------------------------
  Put("Eliminar Repetidos! ");
  -- Casos de prueba
  Int_ArrayS_5    := ((67,45,23,78,45,40,55,24,23,34),(435,435,23,582,0,82,0,920,27,23),(1,2,3,4,5,6,3,8,4,10),(63,91,273,27,29,19,28,20,0,1),(7,28,48,28,50,28,12,49,21,7));
  Int_ArrayS_5_R  := ((67,45,23,78,40,55,24,34,Integer'First,Integer'First),(435,23,582,0,82,920,27,Integer'First,Integer'First,Integer'First),(1,2,3,4,5,6,8,10,Integer'First,Integer'First),(63,91,273,27,29,19,28,20,0,1),(7,28,48,50,12,49,21,Integer'First,Integer'First,Integer'First));
  -- Test
  for i in Int_ArrayS_5'range loop
    begin
      Eliminar_Repetidos(Int_ArrayS_5(i));
      if Int_ArrayS_5(i) = Int_ArrayS_5_R(i) then
        green; Put("V"); v:=v+1;
      else 
        red; Put("X"); x:=x+1;
      end if;
    exception
      when Error: Program_Error => red; Put("E"); x:=x+1;
      when Error: others => red; Put(Exception_Information(Error)); x:=x+1;
    end;
  end loop;
  -- Finish
  white; New_Line;

  
  ------------------------
  -- Letra_Mas_Repetida --
  ------------------------
  Put("Letra Mas Repetida: ");
  -- Casos de prueba
  Pala_Array_3  := ((Cuantas=>5,Palabras=>((Long=>5,Letras=>"Lorem"&(6..30=>'z')),(Long=>5,Letras=>"ipsum"&(6..30=>'z')),(Long=>5,Letras=>"dolor"&(6..30=>'z')),(Long=>3,Letras=>"sit"&(4..30=>'z')),(Long=>4,Letras=>"amet"&(5..30=>'z')),others=>(Long=>0,Letras=>(others=>'z')))),(Cuantas=>9,Palabras=>((Long=>11,Letras=>"consectetur"&(12..30=>'z')),(Long=>10,Letras=>"adipiscing"&(11..30=>'z')),(Long=>5,Letras=>"elit."&(6..30=>'z')),(Long=>5,Letras=>"Donec"&(6..30=>'z')),(Long=>7,Letras=>"pretium"&(8..30=>'z')),(Long=>4,Letras=>"urna"&(5..30=>'z')),(Long=>2,Letras=>"ac"&(3..30=>'z')),(Long=>4,Letras=>"nunc"&(5..30=>'z')),(Long=>7,Letras=>"iaculis"&(8..30=>'z')),others=>(Long=>0,Letras=>(others=>'z')))),(Cuantas=>20,Palabras=>((Long=>5,Letras=>"vitae"&(6..30=>'z')),(Long=>8,Letras=>"volutpat"&(9..30=>'z')),(Long=>5,Letras=>"neque"&(6..30=>'z')),(Long=>9,Letras=>"molestie."&(10..30=>'z')),(Long=>5,Letras=>"Donec"&(6..30=>'z')),(Long=>9,Letras=>"sagittis,"&(10..30=>'z')),(Long=>4,Letras=>"eros"&(5..30=>'z')),(Long=>2,Letras=>"at"&(3..30=>'z')),(Long=>9,Letras=>"tristique"&(10..30=>'z')),(Long=>7,Letras=>"auctor,"&(8..30=>'z')),(Long=>4,Letras=>"quam"&(5..30=>'z')),(Long=>5,Letras=>"justo"&(6..30=>'z')),(Long=>7,Letras=>"laoreet"&(8..30=>'z')),(Long=>5,Letras=>"eros,"&(6..30=>'z')),(Long=>2,Letras=>"in"&(3..30=>'z')),(Long=>8,Letras=>"volutpat"&(9..30=>'z')),(Long=>4,Letras=>"quam"&(5..30=>'z')),(Long=>5,Letras=>"justo"&(6..30=>'z')),(Long=>3,Letras=>"sed"&(4..30=>'z')),(Long=>7,Letras=>"tortor."&(8..30=>'z')),others=>(Long=>0,Letras=>(others=>'z')))));
  Letra_Array_3 := ('M', 'C', 'T');
  -- Test
  for i in Pala_Array_3'range loop
    begin
      letra := Letra_Mas_Repetida(Pala_Array_3(i));
      if letra = Letra_Array_3(i) then
        green; Put("V"); v:=v+1;
      else 
        red; Put("X"); x:=x+1;
      end if;
    exception
      when Error: Program_Error => red; Put("E"); x:=x+1;
      when Error: others => red; Put(Exception_Information(Error)); x:=x+1;
    end;
  end loop;
  -- Finish
  white; New_Line;

  -----------------------
  -- Ordenar_Insercion --
  -----------------------
  Put("Ordenar Insercion: ");
  -- Casos de prueba
  Int_ArrayS_5    := ((67,45,23,78,12,40,55,24,89,34), (435,453,23,582,0,82,123456,920,27,74), (1,2,3,4,5,6,7,8,9,10), (63,91,273,27,29,19,28,19,0,1), (7,28,48,28,50,28,12,49,21,-5));
  Int_ArrayS_5_R  := ((12,23,24,34,40,45,55,67,78,89), (0,23,27,74,82,435,453,582,920,123456), (1,2,3,4,5,6,7,8,9,10), (0,1,19,19,27,28,29,63,91,273), (-5,7,12,21,28,28,28,48,49,50));
  -- Test
  for i in Int_ArrayS_5'range loop
    begin
      Ordenar_Insercion(Int_ArrayS_5(i));
      if Int_ArrayS_5(i) = Int_ArrayS_5_R(i) then
        green; Put("V"); v:=v+1;
      else 
        red; Put("X"); x:=x+1;
      end if;
    exception
      when Error: Program_Error => red; Put("E"); x:=x+1;
      when Error: others => red; Put(Exception_Information(Error)); x:=x+1;
    end;
  end loop;
  -- Finish
  white; New_Line;

  -----------------
  -- Es_Toeplitz --
  -----------------
  Put("Es Toeplitz: ");
  -- Casos de prueba
  Int_MatriS_3 := (((1,2,3,4,5),
                    (6,1,2,3,4),
                    (7,6,1,2,3),
                    (8,7,6,1,2),
                    (9,8,7,6,1)),
                   ((1,2,3,4,5),
                    (6,1,2,3,4),
                    (7,1,1,2,3),
                    (8,2,6,4,2),
                    (9,1,7,6,1)),
                   ((1,2,3,4,5),
                    (6,1,2,4,5),
                    (7,6,1,4,5),
                    (8,7,6,1,5),
                    (9,8,7,6,1)));
  Bool_Array_3_R := (true, false, false);
  -- Test
  for i in Int_MatriS_3'range loop
    begin
      bool_1 := Es_Toeplitz(Int_MatriS_3(i));
      if bool_1 = Bool_Array_3_R(i) then
        green; Put("V"); v:=v+1;
      else 
        red; Put("X"); x:=x+1;
      end if;
    exception
      when Error: Program_Error => red; Put("E"); x:=x+1;
      when Error: others => red; Put(Exception_Information(Error)); x:=x+1;
    end;
  end loop;
  -- Finish
  white; New_Line; end_credits(v,x);

exception
  when Error: others => red; Put_Line(Exception_Information(Error));
  Put("No ha sido posible finalizar el test. Abortando...");
END lab06_pruebas;
