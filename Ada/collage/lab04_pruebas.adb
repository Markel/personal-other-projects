-- Documentation color (5º comentario): http://computer-programming-forum.com/44-ada/49fb40fdf84656d7.htm

-- NOTA: Si la consola no soporta ASCII esto se verá horrible, recomiendo usar la nueva
-- terminal de Windows https://www.microsoft.com/en-us/p/windows-terminal/9n0dx20hk701
-- Ejemplo de un funcionamiento correcto: https://i.imgur.com/fYsJxbt.png
WITH laboratorio04, Ada.Integer_text_io, Ada.Text_Io;
USE laboratorio04, Ada.Integer_text_io, Ada.Text_Io;
procedure Lab04_pruebas is
  type Index_20 is new Integer range 1..20;
  type Index_15 is new Integer range 1..15;
  type Index_10 is new Integer range 1..10;
  type Index_5  is new Integer range 1..5;

  type Int_Array_Decl_5    is array (Index_5)   of Integer;
  type Int_Array_Decl_15   is array (Index_15)  of Integer;
  type Bool_Array_Decl_15  is array (Index_15)  of Boolean;
  type Bool_Array_Decl_5   is array (Index_5)   of Boolean;
  
  Int_Array_5     : Int_Array_Decl_5;
  Int_Array_5_1   : Int_Array_Decl_5;
  Int_Array_5_R   : Int_Array_Decl_5;
  Int_Array_15    : Int_Array_Decl_15;
  Int_Array_15_R  : Int_Array_Decl_15;
  Bool_Array_15_R : Bool_Array_Decl_15;
  Bool_Array_5_R  : Bool_Array_Decl_5;

  i_esima_parte: T_Digito;
  n_resultado: Natural;
  boolean_result: Boolean;
  el_omirp: Positive;
  Pos: Natural;
begin
	--------------
  -- Digito_I --
  --------------
  Put("Digito I: ");
  -- Casos de prueba
  Int_Array_5   := (846753211, 846753, 45678282, 53917263, 654);
  Int_Array_5_1 := (3, 5, 7, 2, 1);
  Int_Array_5_R := (6, 5, 8, 3, 6);
  -- Test
  for i in Index_5'First..Index_5'Last loop
    Ada.Text_IO.Put (ASCII.ESC & "[32m"); -- Green
    i_esima_parte := Digito_I(Int_Array_5(i), Int_Array_5_1(i));
    if i_esima_parte = Int_Array_5_R(i) then
      Ada.Text_IO.Put ("V");
    else 
      Ada.Text_IO.Put (ASCII.ESC & "[31m"); -- Red
      Ada.Text_IO.Put ("X");
    end if;
  end loop;
  -- Finish
  Ada.Text_IO.Put (ASCII.ESC & "[00m");
  New_line;

  ------------------
  -- Digito_I (2) --
  ------------------
  Put("Digito I (2): ");
  -- Casos de prueba
  Int_Array_5   := (846753211, 846753, 45678282, 53917263, 654);
  Int_Array_5_1 := (3, 5, 7, 2, 1);
  Int_Array_5_R := (2, 4, 5, 6, 4);
  -- Test
  for i in Index_5'First..Index_5'Last loop
    Ada.Text_IO.Put (ASCII.ESC & "[32m"); -- Green
    Digito_I(Int_Array_5(i), Int_Array_5_1(i), i_esima_parte);
    if i_esima_parte = Int_Array_5_R(i) then
      Ada.Text_IO.Put ("V");
    else 
      Ada.Text_IO.Put (ASCII.ESC & "[31m"); -- Red
      Ada.Text_IO.Put ("X");
    end if;
  end loop;
  -- Finish
  Ada.Text_IO.Put (ASCII.ESC & "[00m");
  New_line;

  --------------------
  -- Contar_Digitos --
  --------------------
  Put("Contar Digitos: ");
  -- Casos de prueba
  Int_Array_5   := (846753211, 846753, 45678282, 53917263, 654);
  Int_Array_5_R := (9, 6, 8, 8, 3);
  -- Test
  for i in Index_5'First..Index_5'Last loop
    Ada.Text_IO.Put (ASCII.ESC & "[32m"); -- Green
    n_resultado := Contar_Digitos(Int_Array_5(i));
    if n_resultado = Int_Array_5_R(i) then
      Ada.Text_IO.Put ("V");
    else 
      Ada.Text_IO.Put (ASCII.ESC & "[31m"); -- Red
      Ada.Text_IO.Put ("X");
    end if;
  end loop;
  -- Finish
  Ada.Text_IO.Put (ASCII.ESC & "[00m");
  New_line;

  ------------------------
  -- Contar_Digitos (2) --
  ------------------------
  Put("Contar Digitos (2): ");
  -- Casos de prueba
  Int_Array_5   := (846753211, 846753, 45678282, 53917263, 654);
  Int_Array_5_R := (9, 6, 8, 8, 3);
  -- Test
  for i in Index_5'First..Index_5'Last loop
    Ada.Text_IO.Put (ASCII.ESC & "[32m"); -- Green
    Contar_Digitos(Int_Array_5(i), n_resultado);
    if n_resultado = Int_Array_5_R(i) then
      Ada.Text_IO.Put ("V");
    else 
      Ada.Text_IO.Put (ASCII.ESC & "[31m"); -- Red
      Ada.Text_IO.Put ("X");
    end if;
  end loop; 
  -- Finish
  Ada.Text_IO.Put (ASCII.ESC & "[00m");
  New_line;

  ------------------------
  -- Iteracion_Kaprekar --
  ------------------------
  Put("Iteracion Kaprekar: ");
  -- Casos de prueba
  Int_Array_15   := (4532, 3087, 2222, 4441, 8293, 6282, 6729, 0987, 4919, 6629, 9273, 7201, 7392, 0375, 4242);
  Int_Array_15_R := (3087, 8352,    0, 2997, 7443, 6354, 7083, 9081, 8442, 6993, 7353, 7083, 7353, 7173, 2178);
  -- Test
  for i in Index_15'First..Index_15'Last loop
    Ada.Text_IO.Put (ASCII.ESC & "[32m"); -- Green
    Iteracion_Kaprekar(Int_Array_15(i), n_resultado);
    if n_resultado = Int_Array_15_R(i) then
      Ada.Text_IO.Put ("V");
    else 
      Ada.Text_IO.Put (ASCII.ESC & "[31m"); -- Red
      Ada.Text_IO.Put ("X");
    end if;
  end loop;
  -- Finish
  Ada.Text_IO.Put (ASCII.ESC & "[00m");
  New_line;

  ----------------
  -- es_Capicua --
  ----------------
  Put("Es Capicua: ");
  -- Casos de prueba
  Int_Array_15 := (161, 2992, 3003, 91019, 5005, 292, 2882, 2442, 9102019,
    4567, 8374, 5273, 9743, 2572, 6726);
  Bool_Array_15_R := (true, true, true, true, true, true, true, true,
    true, false, false, false, false, false, false);
  -- Test
  for i in Index_15'First..Index_15'Last loop
    Ada.Text_IO.Put (ASCII.ESC & "[32m"); -- Green
    boolean_result := es_Capicua(Int_Array_15(i));
    if boolean_result = Bool_Array_15_R(i) then
      Ada.Text_IO.Put ("V");
    else 
      Ada.Text_IO.Put (ASCII.ESC & "[31m"); -- Red
      Ada.Text_IO.Put ("X");
    end if;
  end loop;
  -- Finish
  Ada.Text_IO.Put (ASCII.ESC & "[00m");
  New_line;

  --------------
  -- es_Omirp --
  --------------
  Put("Es Omirp: ");
  boolean_result := es_Omirp(83210);
  -- Casos de prueba
  Int_Array_5 := (83210, 13, 1597, 53, 7951);
  Bool_Array_5_R := (false, true, true, false, true);
  -- Test
  for i in Index_5'First..Index_5'Last loop
    Ada.Text_IO.Put (ASCII.ESC & "[32m"); -- Green
    boolean_result := es_Omirp(Int_Array_5(i));
    if boolean_result = Bool_Array_5_R(i) then
      Ada.Text_IO.Put ("V");
    else 
      Ada.Text_IO.Put (ASCII.ESC & "[31m"); -- Red
      Ada.Text_IO.Put ("X");
    end if;
  end loop;
  -- Finish
  Ada.Text_IO.Put (ASCII.ESC & "[00m");
  New_line;

  ---------------
  -- es_odioso --
  ---------------
  Put("Es Odioso: ");
  -- Casos de prueba
  Int_Array_5 := (946, 947, 42, 1, 3);
  Bool_Array_5_R := (false, true, true, true, false);
  -- Test
  for i in Index_5'First..Index_5'Last loop
    Ada.Text_IO.Put (ASCII.ESC & "[32m"); -- Green
    boolean_result := es_odioso(Int_Array_5(i));
    if boolean_result = Bool_Array_5_R(i) then
      Ada.Text_IO.Put ("V");
    else 
      Ada.Text_IO.Put (ASCII.ESC & "[31m"); -- Red
      Ada.Text_IO.Put ("X");
    end if;
  end loop;
  -- Finish
  Ada.Text_IO.Put (ASCII.ESC & "[00m");
  New_line;

  ----------------------
  -- lleva_a_kaprekar --
  ----------------------
  Put("Lleva a Kaprekar (manual): ");
  Put("Desactivado debido a que es manual"); New_line;
  -- lleva_a_kaprekar;
  -- 5342 8730 2111 1111 0 => TRUE (3), TRUE (2), TRUE (5), FALSE (0)
  -- El número nunca debería superar 7


  ----------------
  -- es_collatz --
  ----------------
  Put("Es Collatz (manual): ");
  Put("Desactivado debido a que es manual"); New_line;
  -- es_collatz(boolean_result); Put(Boolean'Image(boolean_result)); New_line;
  -- 18 9 28 14 7 22 11 34 17 52 26 13 40 20 10 5 16 8 4 2 1 -1    => TRUE
  -- 19 58 29 88 44 22 11 34 17 52 26 13 40 20 10 5 16 8 4 2 1 -1  => TRUE
  -- 19 58 29 89 44 22 11 34 17 52 26 13 40 20 10 5 16 8 4 2 1 -1  => FALSE

  ---------------
  -- pos_omirp --
  ---------------
  Put("Pos Omirp (manual): ");
  -- Put("Desactivado debido a que es manual"); New_line;
  pos_omirp(el_omirp, pos); Put(el_omirp, 0);  Put(" in pos "); Put(pos, 0); New_line;
  -- 8374 6726 2572 1597 0  => 1597 in pos 4
  -- 8374 6726 2572 0  => 1 in pos 0
  -- 1597 0  => 1597 in pos 1

  -----------------------
  -- secuencia_odiosos --
  -----------------------
  Put("Secuencia Odiosos (manual): ");
  Put("Desactivado debido a que es manual");
  -- secuencia_odiosos(boolean_result); Put(Boolean'Image(boolean_result));

  -- 12 21 4 31 356 7 13 2 15 4 11 25 7 0  => FALSE
  -- 13 7 0  => FALSE
  -- 12 21 25 31 356 7 2 5 13 68 13 94 29 0  => TRUE
end Lab04_pruebas;
