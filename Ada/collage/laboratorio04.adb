WITH Ada.Strings.Fixed, Ada.Integer_Text_IO, Ada.Text_IO;
package body Laboratorio04 is

  -------------------------------------------------------------------
  -- Autor: Markel Ferro Postigo
  -- Grupo: A
  -- Fecha: 2020/10/10
  -------------------------------------------------------------------

  --------------
  -- Digito_I --
  --------------

  function Digito_I (Num, I: in Positive) return T_Digito is
    num_string: String := Ada.Strings.Fixed.Trim(Integer'Image(num), Ada.Strings.Left);
  begin
    return Character'Pos(num_string(I)) - 48;
  end Digito_I;

  ------------------
  -- Digito_I (2) --
  ------------------

  procedure Digito_I (Num, I: in Positive; Dig_I: out T_Digito) is
    l: Positive; -- length
    id: Positive; -- i por la derecha
    num_string: String := Ada.Strings.Fixed.Trim(Integer'Image(num), Ada.Strings.Left);
  begin
    l := num_string'length;
    id := l - (i - 1);
    Dig_I := Character'Pos(num_string(id)) - 48;
  end Digito_I;

  --------------------
  -- Contar_Digitos --
  --------------------

  function Contar_Digitos (Num : in Positive) return Natural is
    num_string: String := Ada.Strings.Fixed.Trim(Integer'Image(num), Ada.Strings.Left);
  begin
    return num_string'length;
  end Contar_Digitos;

  --------------------
  -- Contar_Digitos --
  --------------------

  procedure Contar_Digitos (Num : in Positive; digitos: out Natural) is
    num_string: String := Ada.Strings.Fixed.Trim(Integer'Image(num), Ada.Strings.Left);
  begin
    digitos := num_string'length;
  end Contar_Digitos;

  ---------------------------------------
  -- Desfragmentar 4 valores (interna) --
  ---------------------------------------

  procedure desfragmentar_4_valores (
    Num: in Natural;
    d1, d2, d3, d4 : out Natural) IS
  BEGIN
    d1 := Num/1000;
    d2 := Num/100 - d1 * 10;
    d3 := Num/10 - d1 * 100 - d2 * 10;
    d4 := Num - d1 * 1000 - d2 * 100 - d3 * 10;
  END desfragmentar_4_valores;

  -------------------------------
  -- Ordenar números (interna) --
  -------------------------------

  procedure ordenar_numeros (d1, d2, d3, d4: in out Natural) IS
    aux: Natural;
  begin
    -- FIRST
    if d1>=d2 and d1>=d3 and d1>=d4 then
      aux := d4;
      d4  := d1;
      d1  := aux;
    elsif d2>=d1 and d2>=d3 and d2>=d4 then
      aux := d4;
      d4  := d2;
      d2  := aux;
    elsif d3>=d1 and d3>=d2 and d3>=d4 then
      aux := d4;
      d4  := d3;
      d3  := aux;
    else --d4 > d1 and d4 > d2 and d4 > d3
      null;
    end if;
    -- SECOND
    if d1>=d2 and d1>=d3 then
      aux := d3;
      d3  := d1;
      d1  := aux;
    elsif d2>=d1 and d2>=d3 then
      aux := d3;
      d3  := d2;
      d2  := aux;
    else --d3 > d1 and d3 > d2
      null;
    end if;
    -- THIRD
    if d1>=d2 then
      aux := d2;
      d2  := d1;
      d1  := aux;
    else --d2 > d1
      null;
    end if;
  end ordenar_numeros;

  ------------------------
  -- Iteracion_Kaprekar --
  ------------------------

  procedure Iteracion_Kaprekar (Num: in Natural; resultado: out Natural) is
    d1, d2, d3, d4 : Natural;
    el_pequeno, el_grande : Natural;
  begin
    desfragmentar_4_valores(Num, d1, d2, d3, d4);
    ordenar_numeros(d1, d2, d3, d4);
    el_pequeno := d1 * 1000 + d2 * 100 + d3 * 10 + d4;
    el_grande  := d4 * 1000 + d3 * 100 + d2 * 10 + d1;
    resultado := el_grande - el_pequeno;
  end Iteracion_Kaprekar;

  ----------------
  -- es_Capicua --
  ----------------

  function es_Capicua (Num: in Positive) return Boolean is
    bool_result : boolean := true;
    length_num : Natural;
    num_procedure : T_Digito;
  begin
    length_num := Contar_Digitos(Num);
    -- Si es impar el número central no afectará por lo que una división entera valdrá
    for i in 1..length_num/2 loop
      Digito_I(num, i, num_procedure);
      if Digito_I(num, i) /= num_procedure then
        bool_result := false; -- Podríamos no salir, pero por eficiencia mejor parar :)
        exit;
      end if;
    end loop;
    return bool_result;
  end es_Capicua;

  function comprobar_primos (Num: in Positive) return Boolean IS
    es_primo : Boolean := true;
  begin
    for i in 2..Num/2 loop
      if Num rem i = 0 then
        es_primo := false;
        exit;
      end if;
    end loop;
    return es_primo;
  end comprobar_primos;

  --------------
  -- es_Omirp --
  --------------

  function es_Omirp (Num: in Positive) return Boolean is
    Num_inverso : Natural := 0;
    Cantidad_digitos : Natural;
    b_es_omirp : Boolean := true;
    Aux, posicion: Natural;
  begin
    if comprobar_primos(Num) = false then
      b_es_omirp := false;
    end if;
    Cantidad_digitos := Contar_Digitos(Num);
    for i in reverse 1..Cantidad_digitos loop
      posicion := Cantidad_digitos - i + 1;
      Digito_I(Num, posicion, Aux);
      Num_Inverso := Num_Inverso + Aux * 10**(i-1);
    end loop;
    if comprobar_primos(Num_Inverso) = false then
      b_es_omirp := false;
    end if;
    return b_es_omirp;
  end es_Omirp;

  ---------------
  -- es_odioso --
  ---------------

  function es_odioso (Num: in Positive) return Boolean is
  cantidad_impares : Natural := 1;
  division_num : Positive := Num;
  result : Boolean;
  begin
    loop
      exit when division_num = 1;
      if division_num rem 2 /= 0 then
        cantidad_impares := cantidad_impares + 1;
      end if;
      division_num := division_num / 2;
    end loop;
    if cantidad_impares rem 2 /= 0 then
      result := true;
    else
      result := false;
    end if;
    return result;
  end es_odioso;

  ----------------------
  -- lleva_a_kaprekar --
  ----------------------

  procedure lleva_a_kaprekar is
    numero_kaprekar, mirror_kaprekar : Natural;
    Bi : Boolean;
    Ei : Natural;
  begin
    loop
      -- Reiniciamos todo
      Bi := false;
      Ei := 0;
      Ada.Integer_Text_IO.Get(numero_kaprekar);
      exit when numero_kaprekar = 0;
      -- Proceso
      mirror_kaprekar := numero_kaprekar;
      for i in 1..100 loop
        Iteracion_Kaprekar(mirror_kaprekar, mirror_kaprekar);
        if mirror_kaprekar = 6174 then
          Bi := true;
          Ei := i;
          exit;
        end if;
      end loop;
      -- Exponemos resultados
      Ada.Integer_Text_IO.Put(numero_kaprekar, 0);
      Ada.Text_IO.Put(": ");
      Ada.Text_IO.Put(Boolean'Image(Bi) & " ");
      Ada.Integer_Text_IO.Put(Ei, 0);
      Ada.Text_IO.New_Line;
    end loop;
  end lleva_a_kaprekar;

  ----------------
  -- es_collatz --
  ----------------

  procedure es_collatz (resultado: out Boolean) is
    expected_value, collatz_number : Integer;
  begin
    resultado := true;
    Ada.Integer_Text_IO.Get(expected_value);
    if expected_value = 1 then expected_value := -1; end if;
    collatz_number := expected_value;
    loop
      exit when expected_value = -1;
      if expected_value /= collatz_number then
        resultado := false;
        -- exit; -- Si lo pones se queda un buffer en keyboard
      end if;
      if collatz_number rem 2 = 0 then
        collatz_number := collatz_number / 2;
      else
        collatz_number := collatz_number * 3 + 1;
      end if;
      Ada.Integer_Text_IO.Get(expected_value);
    end loop;
  end es_collatz;

  ---------------
  -- pos_omirp --
  ---------------

  procedure pos_omirp (el_omirp:out Positive; Pos: out Natural) is
    is_omirp : Boolean := FALSE;
    input : Natural;
  begin
    Pos := 0;
    loop
      Ada.Integer_Text_IO.Get(input);
      exit when is_omirp or input = 0;
      Pos := Pos + 1;
      is_omirp := es_Omirp(input);
      if is_omirp then
        el_omirp := input;
      end if;
    end loop;
    if not is_omirp then
      el_omirp := 1; -- Es positivo con lo que no puede ser 0...
      Pos := 0;
    end if;
  end pos_omirp;

  -----------------------
  -- secuencia_odiosos --
  -----------------------

  procedure secuencia_odiosos (suma_odiosa: out Boolean) is
    input : Natural;
    odiosos_count : Natural := 0;
    is_odioso : Boolean;
    suma_odiosos : Natural := 0;
  begin
    loop
      Ada.Integer_Text_IO.Get(input);
      exit when input = 0 or odiosos_count = 5;
      if input rem 2 /= 0 then
        is_odioso := es_odioso(input);
        if is_odioso then
          suma_odiosos := suma_odiosos + input;
          odiosos_count := odiosos_count + 1;
        end if;
      end if;
    end loop;
    suma_odiosa := es_odioso(suma_odiosos);
  end secuencia_odiosos;

end Laboratorio04;
