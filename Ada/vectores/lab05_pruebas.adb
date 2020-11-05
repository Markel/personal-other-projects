WITH Laboratorio05, lab05_extra, Ada.Text_IO, Ada.Integer_Text_IO;
 USE Laboratorio05, lab05_extra, Ada.Text_IO, Ada.Integer_Text_IO;

procedure lab05_pruebas IS
  -- Documentación Index variable
  -- type Array is array (Integer range <>) of Integer;
  -- variable(11..31) : Array;

  type Int_Array_Decl     is array (Integer range <>) of Integer;
  type Bool_Array_Decl    is array (Integer range <>) of Boolean;
  type Stri10_Array_Decl  is array (Integer range <>) of String (1..10);
  type Int_10_ArrayS_Decl is array (Integer range <>) of T_Vector10;

  Int_Array_5, Int_Array_5_R: Int_Array_Decl (1..5);
  Int_Array_10_R : Int_Array_Decl(1..10);
  Int_Array_11_R, Int_Array_11_R_1 : Int_Array_Decl (1..11);
  Bool_Array_5_R  : Bool_Array_Decl (1..5);
  Stri10_Array_5, Stri10_Array_5_R : Stri10_Array_Decl (1..5);
  Pass_Int_Arrays_5, Pass_Int_Arrays_5_R : Int_10_ArrayS_Decl (1..5);
  Pass_Int_Arrays_10 : Int_10_ArrayS_Decl (1..10);
  Pass_Int_Arrays_11 : Int_10_ArrayS_Decl (1..11);

  int_1, int_2: Integer;
  bool_1 : Boolean;
  T_Vector10_1 : T_Vector10;
  Stri_10_1 : String (1..10);
  
BEGIN
  ----------------
  -- Ultimo_Par --
  ----------------
  Put("Ultimo_Par: ");
  -- Casos de prueba
  Pass_Int_Arrays_11 := ((2,1,11,1,-3,1,1,-1,1,17),(1,4,1,13,-1,1,1,-13,1,1),(1,1,6,1,-7,1,1,-9,1,1),(191,1,1,8,-1,1,1,-1,1,1),(1,4,1,1,-10,1,1,-1,1,1),(1,1,1,1,-1,12,1,-1,1,1),(1,1,6,1,-1,1,14,-1,1,1),(1,1,1,8,-1,1,1,-16,1,1),(1,4,1,1,-10,1,1,-1,18,1),(2,1,1,1,-1,12,1,-1,1,20),(1,1,1,1,-1,1,1,-1,1,1));
  Int_Array_11_R   := (2,4,6,8,-10,12,14,-16,18,20,0);
  Int_Array_11_R_1 := (1,2,3,4,5,6,7,8,9,10,0);
  -- Test
  for i in Pass_Int_Arrays_11'range loop
    Ada.Text_IO.Put (ASCII.ESC & "[32m"); -- Green
    Ultimo_Par(Pass_Int_Arrays_11(i), int_1, int_2);
    if int_1 = Int_Array_11_R(i) and int_2 = Int_Array_11_R_1(i) then
      Ada.Text_IO.Put ("V");
    else 
      Ada.Text_IO.Put (ASCII.ESC & "[31m"); -- Red
      Ada.Text_IO.Put ("X");
    end if;
  end loop;
  -- Finish
  Ada.Text_IO.Put (ASCII.ESC & "[00m");
  New_line;

  --------------------------
  -- múltiplos_del_último --
  --------------------------
  Put("Multiplos del ultimo: ");
  -- Casos de prueba
  Pass_Int_Arrays_10 := ((8,4,6,9,5,3,2,1,1,7),(16,4,1,13,-1,1,1,-13,6,8),(1,1,6,1,-7,1,1,-9,1,-3),(192,1,1,6,-1,12,1,-1,1,6),(8,4,6,7,5,3,2,1,1,2),(1,4,-8,1,8,12,1,-16,1,4),(3,6,6,9,-12,15,14,-1,1,3),(2,4,6,8,-10,1,14,-16,1,2),(2,4,6,8,-10,12,14,-1,18,2),(2,1,1,1,-1,14,1,-1,1,1));
  Int_Array_10_R   := (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
  -- Test
  for i in Pass_Int_Arrays_10'range loop
    Ada.Text_IO.Put (ASCII.ESC & "[32m"); -- Green
    int_1 := Multiplos_Del_Ultimo(Pass_Int_Arrays_10(i));
    if int_1 = Int_Array_10_R(i) then
      Ada.Text_IO.Put ("V");
    else 
      Ada.Text_IO.Put (ASCII.ESC & "[31m"); -- Red
      Ada.Text_IO.Put ("X");
    end if;
  end loop;
  -- Finish
  Ada.Text_IO.Put (ASCII.ESC & "[00m");
  New_line;

  -------------------
  -- está_ordenado --
  -------------------
  Put("Esta Ordenado: ");
  -- Casos de prueba
  Pass_Int_Arrays_5 := ((-2,-2,3,4,5,6,7,8,9,10),(10,10,9,8,8,6,5,4,2,-1),(1,2,3,4,5,4,3,2,1,9),(9,9,8,7,6,-2,1,-1,1,6),(0,0,0,0,0,0,0,0,0,0));
  Bool_Array_5_R := (true, true, false, false, true);
  -- Test
  for i in Pass_Int_Arrays_5'range loop
    Ada.Text_IO.Put (ASCII.ESC & "[32m"); -- Green
    bool_1 := Esta_Ordenado(Pass_Int_Arrays_5(i));
    if bool_1 = Bool_Array_5_R(i) then
      Ada.Text_IO.Put ("V");
    else 
      Ada.Text_IO.Put (ASCII.ESC & "[31m"); -- Red
      Ada.Text_IO.Put ("X");
    end if;
  end loop;
  -- Finish
  Ada.Text_IO.Put (ASCII.ESC & "[00m");
  New_line;

  ---------------------
  -- Separar_digitos --
  ---------------------
  Put("Separar digitos: ");
  -- Casos de prueba
  Int_Array_5  := (123456,2068024680,635435,0,101010);
  Pass_Int_Arrays_5_R := ((0,0,0,0,1,2,3,4,5,6),(2,0,6,8,0,2,4,6,8,0),(0,0,0,0,6,3,5,4,3,5),(0,0,0,0,0,0,0,0,0,0),(0,0,0,0,1,0,1,0,1,0));
  Int_Array_5_R := (3,0,4,0,3);
  -- Test
  for i in Int_Array_5'range loop
    Ada.Text_IO.Put (ASCII.ESC & "[32m"); -- Green
    Separar_digitos(Int_Array_5(i), T_Vector10_1, int_2);
    if T_Vector10_1 = Pass_Int_Arrays_5_R(i) and int_2 = Int_Array_5_R(i) then
      Ada.Text_IO.Put ("V");
    else 
      Ada.Text_IO.Put (ASCII.ESC & "[31m"); -- Red
      Ada.Text_IO.Put ("X");
    end if;
  end loop;
  -- Finish
  Ada.Text_IO.Put (ASCII.ESC & "[00m");
  New_line;

  -----------------------
  -- binario_a_decimal --
  -----------------------
  Put("Binario a Decimal: ");
  -- Casos de prueba
  Pass_Int_Arrays_5 := ((0,0,0,0,0,0,0,0,0,0),(1,1,1,1,1,1,1,1,1,1),(0,0,0,0,1,0,1,0,1,0),(1,0,1,0,1,0,0,1,0,1),(0,1,0,0,1,1,1,0,0,0));
  Int_Array_5_R   := (0,1023,42,677,312);
  -- Test
  for i in Pass_Int_Arrays_5'range loop
    Ada.Text_IO.Put (ASCII.ESC & "[32m"); -- Green
    int_1 := binario_a_decimal(Pass_Int_Arrays_5(i));
    if int_1 = Int_Array_5_R(i) then
      Ada.Text_IO.Put ("V");
    else 
      Ada.Text_IO.Put (ASCII.ESC & "[31m"); -- Red
      Ada.Text_IO.Put ("X");
    end if;
  end loop;
  -- Finish
  Ada.Text_IO.Put (ASCII.ESC & "[00m");
  New_line;

  -----------
  -- Rot13 --
  -----------
  Put("Rot13: ");
  -- Casos de prueba
  Stri10_Array_5  := ("ABCDEFGHIJ","KLMNOPQRST","UVWXYZ0123","456789@#$%","<>[]{}!?_-");
  Stri10_Array_5_R := ("NOPQRSTUVW","XYZABCDEFG","HIJKLM0123","456789@#$%","<>[]{}!?_-");
  -- Test
  for i in Stri10_Array_5'range loop
    Ada.Text_IO.Put (ASCII.ESC & "[32m"); -- Green
    Rot13(Stri10_Array_5(i), Stri_10_1);
    if Stri_10_1 = Stri10_Array_5_R(i) then
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
  -- Digito_Control --
  --------------------
  Put("Digito de control: ");
  -- Casos de prueba
  Pass_Int_Arrays_5 := ((1,1,1,1,1,1,1,1,1,1),(1,2,3,4,5,6,7,8,9,8),(4,9,7,3,2,9,4,8,9,8),(4,1,9,3,7,5,2,6,3,3),(5,3,9,7,4,5,1,8,5,1));
  Int_Array_5_R   := (0, 4, 0, 8, 1);
  -- Test
  for i in Pass_Int_Arrays_5'range loop
    Ada.Text_IO.Put (ASCII.ESC & "[32m"); -- Green
    int_1 := Digito_Control(Pass_Int_Arrays_5(i));
    if int_1 = Int_Array_5_R(i) then
      Ada.Text_IO.Put ("V");
    else 
      Ada.Text_IO.Put (ASCII.ESC & "[31m"); -- Red
      Ada.Text_IO.Put ("X");
    end if;
  end loop;
  -- Finish
  Ada.Text_IO.Put (ASCII.ESC & "[00m");
  New_line;

END lab05_pruebas;