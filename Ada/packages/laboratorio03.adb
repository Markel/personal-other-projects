WITH Ada.Text_IO, Ada.Integer_Text_IO, Ada.Strings.Fixed;
package body Laboratorio03 is

  --------------------
  -- tipo_triangulo --
  --------------------

  function tipo_triangulo (A1,A2,A3: in Float) return T_TRIANGULO is
  tipo : T_TRIANGULO;
  begin
    if A1+A2+A3 /= 180.0 then
      tipo := NO_TRIANGULO;
    elsif A1 = A2 AND A1 = A3 then
      tipo := EQUILATERO;
    elsif A1 = A2 OR A1 = A3 OR A2 = A3 then
      tipo := ISOSCELES;
    else
      tipo := ESCALENO;
    end if;
    return tipo;
  end tipo_triangulo;

  -----------------------------
  -- Multiplos_de_tres_entre --
  -----------------------------

  procedure Multiplos_de_tres_entre (N1,N2: in Integer; suma: out Natural) is
  multiplo3 : Integer;
  begin
    if N1 > N2 then
      raise Program_Error with "N1 debe ser estrictamente menor que N2.";
    end if;
    suma := 0;
    multiplo3 := N1;
    loop
      if multiplo3 rem 3 = 0 then
        exit;
      else
        multiplo3 := multiplo3 + 1;
      end if;
    end loop;

    while multiplo3 <= N2 loop
      -- Debug (queda una bonita tabla :)
      -- Ada.Integer_Text_IO.Put(suma);
      -- Ada.Integer_Text_IO.Put(multiplo3);
      -- Ada.Text_IO.New_Line;
      suma := suma + multiplo3;
      multiplo3 := multiplo3 + 3;
    end loop;
  end Multiplos_de_tres_entre;

  -----------------
  -- sin_blancos --
  -----------------

  procedure sin_blancos is
  m : Character;
  begin
      loop
        Ada.Text_IO.Get(m);
        if m = ' ' then
          null;
        elsif m = '.' then
          exit;
        else
          Ada.Text_IO.Put(m);
        end if;
      end loop;
  end sin_blancos;

  -------------------
  -- pares_impares --
  -------------------

  procedure pares_impares is
  p : Integer;
  num_pares, suma_impares : Integer;
  begin
    num_pares := 0;
    suma_impares := 0;
    loop
      Ada.Integer_Text_IO.Get(p);
      -- Ada.Integer_Text_IO.Put(p);
      if p = 0 then
        -- Ada.Text_IO.Put("The exit");
        exit;
      elsif p rem 2 = 0 then
        -- Ada.Text_IO.Put("Par");
        num_pares := num_pares + 1;
      elsif p rem 2 /= 0 then
        -- Ada.Text_IO.Put("Impar");
        suma_impares := suma_impares + p;
      else
        -- Ada.Text_IO.Put("Otro");
        null;
      end if;
    end loop;
    -- Ada.Text_IO.New_Line;
    Ada.Text_IO.Put("Numero de pares: ");
    Ada.Integer_Text_IO.Put(num_pares, Width => 0); Ada.Text_IO.New_Line;
    Ada.Text_IO.Put("Suma de impares: ");
    Ada.Integer_Text_IO.Put(suma_impares, Width => 0); Ada.Text_IO.New_Line;
  end pares_impares;

  -----------------------
  -- secuencia_collatz --
  -----------------------

  procedure secuencia_collatz (N: in Integer; longitud, suma: out integer) is
  begin
    --  Generated stub: replace with real body!
    pragma Compile_Time_Warning (Standard.True, "secuencia_collatz unimplemented");
    raise Program_Error with "Unimplemented procedure secuencia_collatz";
  end secuencia_collatz;

  ------------------
  -- control_ISBN --
  ------------------

  function control_ISBN
    (d1,d2,d3,d4,d5,d6,d7,d8,d9:in Integer)
    return character
  is
  begin
    --  Generated stub: replace with real body!
    pragma Compile_Time_Warning (Standard.True, "control_ISBN unimplemented");
    raise Program_Error with "Unimplemented function control_ISBN";
    return control_ISBN (d1 => d1, d2 => d2, d3 => d3, d4 => d4, d5 => d5,
      d6 => d6, d7 => d7, d8 => d8, d9 => d9);
  end control_ISBN;

  ------------------
  -- control_ISBN --
  ------------------

  -- Documentation space of image https://stackoverflow.com/a/1847396
  function control_ISBN (num:In Integer) return character is
  num_control_ISBN : integer;
  char_control_ISBN : character;
  num_string: String(1..9);
  begin
    -- Convertir a string porque hace las cosas más fáciles, evitando overflows, etc.
    num_string := Ada.Strings.Fixed.Trim(Integer'Image(num), Ada.Strings.Left);
    for H in 1..9 loop
      num_control_ISBN := num_control_ISBN + (((Character'pos(num_string(H))) - 48) * H);
    end loop;
    -- El 47 viene por el código ASCII
    char_control_ISBN := Character'Val(num_control_ISBN rem 11 + 48);
    if (Integer(Character'Pos(char_control_ISBN)) = 58) then
      char_control_ISBN := 'X';
    end if;
    return char_control_ISBN;
  end control_ISBN;
end Laboratorio03;
