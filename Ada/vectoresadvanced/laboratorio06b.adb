WITH Ada.Numerics, Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
 USE Ada.Numerics, Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
package body Laboratorio06b is

  ----------------
  -- Cent_A_Sex --
  ----------------

  procedure Cent_A_Sex
    (Centesimales: in Float;
    Sexagesimales: out T_Grados_Sex)
  is
    Aux : Natural := 0;
  begin
    Aux := Integer(Centesimales * 3600.0); -- Aquí Ada puede generar errores porque los floats generan problemas
    Sexagesimales.Segundos := Aux rem 60;
    Aux := Aux / 60;
    Sexagesimales.Minutos := Aux rem 60;
    Sexagesimales.Grados := Aux / 60;

    ----------------------- PROGRAMA ANTIGUO -----------------------
    -- Sexagesimales.Grados   := Integer(Float'Floor(Aux)); -- 180.67
    -- Put(" Aux: "); Put(Aux, Exp => 0);
    -- Put("  Grados: "); Put(Float(Sexagesimales.Grados), Exp => 0);
    -- Put("  Resta: "); Put(Aux - Float(Sexagesimales.Grados));
    -- Aux := (Aux - Float(Sexagesimales.Grados)) * 60.0; -- .67 * 60.0
    -- --Put(Aux, Exp => 0);
    -- Sexagesimales.Minutos  := Integer(Float'Floor(Aux));
    -- Aux := (Aux - Float(Sexagesimales.Minutos)) * 60.0;
    -- --Put(Aux, Exp => 0);
    -- Sexagesimales.Segundos := Integer(Aux);    
  end Cent_A_Sex;

  -------------------
  -- Rotar_Derecha --
  -------------------

  procedure Rotar_Derecha (V:in out T_Vector_Enteros) is
    -- Aux_prev, Aux_actual: Integer := V(V'Last); -- Aux_prev podría no ser inicializada, pero por dejarlo en una línea
  begin
    V := V(V'Last) & V(V'First..V'Last-1);
    -- OPCIÓN MANUAL
    -- for i in V'First..V'Last loop
    --   Aux_prev := Aux_actual;
    --   Aux_actual := V(i);
    --   V(i) := Aux_prev;
    -- end loop;
  end Rotar_Derecha;

  -----------------------------
  -- esta_en_vector_ordenado --
  -----------------------------

  function esta_en_vector_ordenado (V: in T_vector_enteros; N: in Integer) return Boolean IS
    i : Integer := V'First;
    result : Boolean := false;
  begin
    loop
      if V(i) = N then
        result := true;
      end if;
      exit when i = V'Last or result or V(i) > N;
      i := i + 1;
    end loop;
    return result;
  end esta_en_vector_ordenado;

  --------------------------------
  -- eliminar_elemento_ordenado --
  --------------------------------

  procedure eliminar_elemento_ordenado
    (pos: in Integer;
    V: in out T_vector_enteros)
  is
    i : Integer := V'First;
    --true_pos : Integer := V'First + (pos - 1); -- Hay que adaptar el valor a el rango
  begin
    Posicionado:
    loop
      exit Posicionado when V(i) = Integer'First;
      i := i + 1;
      if i > V'Length+V'First-1 then
        raise CONSTRAINT_ERROR with "No existe centinela en el vector";
      end if;
    end loop Posicionado;
    if pos in V'range and pos < i then
      V(pos..V'Last - 1) := V(pos+1 .. V'Last);
    end if;
  end eliminar_elemento_ordenado;

  --------------------------------
  -- insertar_elemento_ordenado --
  --------------------------------

  procedure insertar_elemento_ordenado
    (num:  in Integer;
    V: in out T_Vector_Enteros)
  is
    i : Integer := V'First;
    Aux_prev, Aux_actual: Integer := num;
  begin
    Posicionado:
    loop
      exit when num < V(i) or V(i) = Integer'First;
      i := i + 1;
    end loop Posicionado;
    V(i..V'Last) := num & V(i..V'Last-1);
  end insertar_elemento_ordenado;

  ------------------------
  -- Eliminar_Repetidos --
  ------------------------

  procedure Eliminar_Repetidos (V: in out T_Vector_Enteros) is
    i, j: Integer := V'Last;
    changed : Boolean := false;
  begin
    loop
      j := i - 1;
      changed := false;
      loop
        if V(i) = V(j) then
          V(j..V'Last) := V(j..i-1) & V(i+1..V'Last) & Integer'First;
          changed := true;
        end if;
        exit when changed or j <= V'First;
        j := j - 1;
      end loop;
      i := i - 1;
      exit when i = V'First;
    end loop;
    -----DEBUG-----
    -- for i in V'Range loop
    --   Put(V(i));
    -- end loop;
    
  end Eliminar_Repetidos;

  ------------------------
  -- Letra_Mas_Repetida --
  ------------------------

  function Letra_Mas_Repetida (Texto: in T_Info_Texto) return T_LETRA is
    AuxStr : String(1..30);
    Aux : Natural := 0;
    Contador : T_contadores_letras := (others=>0);
    Result : T_LETRA := 'Y'; -- La y & z es más o menos mis debuggers de diferentes problemas
  begin
    Nivel_Letra:
    for i in Texto.Palabras'First..Texto.Cuantas loop
      -- Entramos al nivel de palabras
      AuxStr := Texto.Palabras(i).Letras; -- Así podemos modificarlo in los problemas del in
      Nivel_Caracter:
      for j in (Texto.Palabras(i).Letras'First)..(Texto.Palabras(i).Long) loop
        -- Entramos al nivel de carácteres
        -- Convertir minúsculas a mayúsculas
        if 97 <= Character'Pos(AuxStr(j)) and Character'Pos(AuxStr(j)) <= 122 then
          AuxStr(j) := Character'Val(Character'Pos(AuxStr(j)) - 32);
        end if;
        -- Añadir al contador solo si es una letra (olvidar puntos y así)
        if AuxStr(j) in 'A'..'Z' then
          Contador(AuxStr(j)) := Contador(AuxStr(j)) + 1;
        end if;
      end loop Nivel_Caracter;
    end loop Nivel_Letra;
    Contador_a_resultado:
    for m in T_contadores_letras'range loop
      if Contador(m) > Aux then
        Aux := Contador(m);
        Result := m;
      end if;
    end loop Contador_a_resultado;
    return result;
  end Letra_Mas_Repetida;

  -----------------------
  -- Ordenar_Insercion --
  -----------------------

  procedure Ordenar_Insercion (V: in out T_Vector_Enteros) is
    ordenado: T_Vector_Enteros(V'range) := (others=>Integer'Last);
  begin
    for i in V'range loop
      insertar_elemento_ordenado(V(i), ordenado);
    end loop;
    V := ordenado;
  end Ordenar_Insercion;

  -----------------
  -- Es_Toeplitz --
  -----------------

  function Es_Toeplitz (M: T_Matriz) return Boolean is
    result: Boolean := true; -- Vamos a hacer la apuesta positiva :)
    Aux : Integer;
  begin
    if M'length(1) = M'Length(2) then -- Comprobamos primero que sea cuadrada
      -- Vamos con la parte inferior primero
      Inferior_central:
      for i in reverse M'range(1) loop
        for j in M'First(2)..M'Last(2) - (i - M'First(1)) loop
          -- Put((i-M'First(2) + j)); Put(J); -- Se puede utilizar para ver la combinaciones
          if j = M'First(2) then -- Al principio no hay un valor de Aux con lo que no testeamos
            Aux := M((i-M'First(2) + j), j);
          else
            -- Se hace la comprobación (como todos los valores deberían ser iguales no
            -- necesitamos volver a guardar en Aux)
            if Aux /= M((i-M'First(2) + j), j) then
              result := false; 
            end if;
          end if;
        end loop;
      end loop Inferior_central;
      -- Realizamos lo mismo pero con los valores invertidos
      Superior:
      -- El +1 proviene de que no necesitamos comprobar la línea central
      for j in reverse M'First(2) + 1..M'Last(2) loop
        for i in M'First(1)..M'Last(1) - (j - M'First(2)) loop
          -- Put(i); Put(j+(i-1)); -- Visualización 2
          if i = M'First(1) then
            Aux := M(i, (j-M'First(1) + i));
          else 
            if Aux /= M(i, (j-M'First(1) + i)) then
              result := false;
            end if;
          end if;
        end loop;
      end loop Superior;
    else
      -- Si no es cuadrada no puede ser Toeplit.
      result := false;
    end if;
    return result;
  end Es_Toeplitz;

end Laboratorio06b;
