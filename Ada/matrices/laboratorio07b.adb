WITH Ada.Numerics.Elementary_Functions, Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
 USE Ada.Numerics.Elementary_Functions, Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;

--* No todos los programas se adecuan a cambios de index (algunos sí, otros parcialmente, otros no)

package body Laboratorio07b is
  type dia_por_mes_decl is array (T_mes range enero..diciembre) of T_Dia;

  function check_bisiesto (ano: in Positive) return dia_por_mes_decl IS
  begin
    if ano rem 4 = 0 and (ano rem 100 /= 0 or ano rem 400 = 0) then
      --* Bisiesto
      return (31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
    else
      --* No bisiesto
      return (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31); --* Creo que después de esta locura de laboratorio, me merezco poder poner un doble return
    end if;
  end;

  ------------
  -- Trigon --
  ------------

  function Trigon (C: in T_Complejo_Polar) return T_Complejo_Tri is
    result : T_Complejo_Tri;
  begin
    result.A := C.argumento * Cos(C.Angulo);
    result.B := C.argumento * Sin(C.Angulo);
    return result;
  end Trigon;

  -------------------
  -- Dia_Siguiente --
  -------------------

  procedure Dia_Siguiente (F: in out T_Fecha) is
    dia_por_mes: dia_por_mes_decl;
  begin
    --* Checkear bisiesto
    dia_por_mes := check_bisiesto(F.anno);
    if F.Dia = dia_por_mes(F.mes) then
      F.Dia := 1;
      if F.Mes = T_Mes'last then
        F.Mes := T_Mes'first;
        F.Anno := F.Anno + 1;
      else
        F.Mes := T_Mes'succ(F.Mes);
      end if;
    else
      F.Dia := F.Dia + 1;
    end if;
  end Dia_Siguiente;

  ------------
  -- Maximo --
  ------------

  procedure Maximo
    (Lluvia: in T_Datos_Pluviometricos;
    F1, F2: T_Fecha;
    F: out T_Fecha)
  is
    range1 : Natural := T_Mes'Pos(F1.mes) + 1 + ((F1.anno-2001)*12);
    range2 : Natural := T_Mes'Pos(F2.mes) + 1 + ((F2.anno-2001)*12);
    type contador_decl is array (range1..range2) of Integer; --* 1 es: enero de 2001, 2 febrero, ...
    m: T_Mes := F1.mes;
    d: T_Dia := F1.dia;
    contador : contador_decl := (others=>0);
    cont_pos : Natural := 0;
    dia_por_mes: dia_por_mes_decl;
    aux : Integer := Integer'First;
  begin
    Year: for y in F1.anno..F2.anno loop
      dia_por_mes := check_bisiesto(y);
      Mes: loop
        cont_pos := T_mes'Pos(m) + 1 + ((y-2001)*12);
        Dia: loop
          contador(cont_pos) := contador(cont_pos) + Lluvia(y)(m)(d);
          --Put(d,3); Put(T_Mes'Pos(m),3); Put(y,5); Put(", ");
          exit Dia when d = dia_por_mes(m) or (d = F2.dia and m = F2.mes and y = F2.anno);
          d := d + 1;
        end loop Dia;
        d := 1; --* Día debe ir antes del exit porque después del año también se resetea el día
        exit Mes when (m = F2.mes and y = F2.anno) or m = T_Mes'Last;
        m := T_mes'Succ(m); --Put("HI");
      end loop Mes;
      m := T_Mes'First;
    end loop Year;
    
    for c in range1..range2 loop
      if contador(c)>aux then
        aux := contador(c);
        cont_pos := c;
      end if;
    end loop;
    
    cont_pos := cont_pos - 1; --// TODO: Descubrir por qué hay que hacer -1, pero es muy tarde, ya lo miraré (o no si estás leyendo esto)
    --* Nota, creo que porque Ada pone las listas de T'mes desde 0 y mi array empieza de 1
    F := (1, T_Mes'Val(cont_pos rem 12) , cont_pos/12 + 2001);
  end Maximo;

  -----------------
  -- Simplificar --
  -----------------

  procedure Simplificar (
    L:  in out T_Estatica_Carreteras;
    Peaje: out T_Estatica_Carreteras) is
    i : Integer := 1;
  begin
    Peaje.Cont := 0;
    loop
      exit when i >= L.Cont + 1 or Peaje.Cont >= 5;
      if L.Ctras(i).Peaje_km > 0.0 then
        Peaje.Ctras(Peaje.Cont + 1) := L.Ctras(i);
        Peaje.Cont := Peaje.Cont + 1;
        L.Ctras(i..L.Ctras'Last - 1) := L.Ctras(i+1..L.Ctras'Last);
        L.Cont := L.Cont - 1;
      else
        i := i + 1;
      end if;
    end loop;
    -- for i in 1..Peaje.Cont loop
    --   Put(Peaje.Ctras(i).Peaje_km);
    -- end loop;
  end Simplificar;

  -----------------
  -- Simplificar --
  -----------------

  procedure Simplificar (L: in out T_Estatica_Puntos) is
    pos_sobre_3 : Natural := 0;
    real_pos : Integer := 2;
  begin
    loop
      exit when real_pos >= L.Num;
      if pos_sobre_3 /= 3 then
        L.Ptos(real_pos..L.Ptos'Last - 1) := L.Ptos(real_pos + 1..L.Ptos'Last);
        L.Num := L.Num - 1;
        pos_sobre_3 := pos_sobre_3 + 1;
      else
        pos_sobre_3 := 0;
        real_pos := real_pos + 1;
      end if;
    end loop;
  end Simplificar;

  -----------------
  -- Simplificar --
  -----------------

  procedure Simplificar (L: in out T_Estatica_Carreteras) is
    c : Integer := 1;
    p : Integer := 2;
  begin
    loop
      exit when c >= L.Cont + 1 or L.Cont = 0;
      loop
        exit when p = L.Ctras(c).Trazado.Num;
        if abs(L.Ctras(c).Trazado.Ptos(p).X - L.Ctras(c).Trazado.Ptos(p-1).X) < 0.001
            and abs(L.Ctras(c).Trazado.Ptos(p).Y - L.Ctras(c).Trazado.Ptos(p-1).Y) < 0.0001 then
          L.Ctras(c).Trazado.Ptos(p..L.Ctras(c).Trazado.Num) := L.Ctras(c).Trazado.Ptos(p + 1..L.Ctras(c).Trazado.Num + 1);
          L.Ctras(c).Trazado.Num := L.Ctras(c).Trazado.Num - 1;
        else
          p := p + 1;
        end if;
      end loop;
      c := c + 1;
      p := 2;
    end loop;
  end Simplificar;

  --------------------------
  -- DNI_Mayor_Patrimonio --
  --------------------------

  function DNI_Mayor_Patrimonio (U: in T_Urbanizacion) return Integer is
    type persona is record
      DNI: Integer;
      Patrimonio: Integer;
    end record;
    type persona_array is array (Integer range <>) of persona;
    type guardador_DNI is record
      Cantidad: Integer;
      Personas: persona_array(1..(Num_Bloques*Max_Plantas*Max_Apartamentos_Por_Planta));
    end record;
    Contador : guardador_DNI;

    function buscar_DNI (DNI: in Integer) return Natural IS
      posicion: Natural := 0;
    begin
      for i in 1..Contador.Cantidad loop
        if DNI = Contador.Personas(i).DNI then
          posicion := i;
        end if;
      end loop;
      return posicion;
    end buscar_DNI;

    posicion_DNI : Natural;
    result_pos : Integer;
    aux : Natural := 0;
  begin
    Contador.Cantidad := 0;

    --* Crear una lista con todos los DNI + Patrimonio
    for e in U'range loop
      for p in U(e)'range loop
        for a in 1..U(e)(p).Num_Apartamentos loop
          --* Esto ya lee cada apartamento
          posicion_DNI := buscar_DNI(U(e)(p).Apartamentos(a).Propietario_Actual.DNI);
          if posicion_DNI = 0 then
            --* En el caso de que sea un nuevo DNI
            posicion_DNI := Contador.Cantidad + 1;
            Contador.Personas(posicion_DNI).DNI := U(e)(p).Apartamentos(a).Propietario_Actual.DNI;
            Contador.Personas(posicion_DNI).Patrimonio := 0;
            Contador.Cantidad := Contador.Cantidad + 1;
          end if;
          Contador.Personas(posicion_DNI).Patrimonio
            := Contador.Personas(posicion_DNI).Patrimonio
            + U(e)(p).Apartamentos(a).Precio;
        end loop;
      end loop;
    end loop;

    --* Saca la posición con más patrimonio
    --Put(Contador.Cantidad,2);
    for i in 1..Contador.Cantidad loop
      --Put(Contador.Personas(i).Patrimonio);
      if aux < Contador.Personas(i).Patrimonio then
        result_pos := i;
        aux := Contador.Personas(i).Patrimonio;
      end if;
    end loop;

    --Put(result_pos);
    return Contador.Personas(result_pos).DNI;
  end DNI_Mayor_Patrimonio;

  ------------------------------
  -- encontrar_espacio_blanco --
  ------------------------------

  procedure encontrar_espacio_blanco (P: in T_Puzle; F, C: out Integer) is
    found : Boolean := false;
  begin
    F := P'First;
    C := P'First(2);
    if N rem M /= 0 then raise Program_Error with "El sudoku debe ser divisible por las matrices"; end if;
    Filas: loop
      Columnas: loop
        --New_Line; Put(F); Put(C); Put(P(F,C));
        if P(F,C) = 0 then
          found := true;
        end if;
        exit Columnas when found or C = P'Last(2) - M + 1;
        C := C + M;
      end loop Columnas;
      exit Filas when found or F = P'Last - M + 1;
      F := F + M;
      C := P'First(2);
    end loop Filas;
  end encontrar_espacio_blanco;

  -----------------------------
  -- rotar_matriz_derecha_90 --
  -----------------------------

  -- TODO: Hacerlo sin auxiliares https://www.geeksforgeeks.org/rotate-a-matrix-by-90-degree-in-clockwise-direction-without-using-any-extra-space/
  --* Es que no me daba la cabeza para hacerlo de otra forma.
  procedure rotar_matriz_derecha_90 (F: in out T_Ficha) is
    matrix: T_Ficha;
    x: Integer := F'First;
    y: Integer := F'First(2);
  begin
    if F'Length /= F'Length(2) then raise Program_Error with "La matriz debe ser cuadrada"; end if;
    for i in reverse F'range loop
      for j in F'range(2) loop
        matrix(x,y) := F(i,j);
        x := x + 1;
      end loop;
      y := y + 1;
      x := F'First(2);
    end loop;
    F := matrix;
  end rotar_matriz_derecha_90;

  ---------------------
  -- filas_correctas --
  ---------------------

  -- TODO: Refactor this... (también un caso de prueba que pase filas pero no columnas estaría bien)
  function filas_correctas
    (P: in T_Puzle;
    Ficha: in T_Ficha;
    F, C: in Integer)
    return Boolean
  is
    type natural_array is array (Integer range <>) of Natural;
    linea_a_checkear : natural_array(1..N-3);
    counter : Natural := 0;
    result : Boolean := true;
    pos : Natural := 0;
  begin
    Filas: for i in F..F+2 loop
      -- TODO: Encontrar una manera de coger una fila de un array sin necesidad de un for (llevo mucho tiempo buscándolo)
      Dividor_de_lineas: for a in 1..N loop
        if a not in C..C+2 then
          --Put(P(F,a));
          counter := counter + 1;
          linea_a_checkear(counter) := P(i,a);
        end if;
        exit when counter = N-M;
      end loop Dividor_de_lineas; counter := 0;

      --* El código "real" del for
      pos := pos + 1;
      -- New_Line;
      -- Put(Ficha(pos,1));
      -- Put(Ficha(pos,2));
      -- Put(Ficha(pos,3));
      for l in linea_a_checkear'range loop
        --* Creo que aquí la liamos y ya definimos que N debe ser 9 y M = 3
        -- Put(linea_a_checkear(l));
        if linea_a_checkear(l) = Ficha(pos,1) or linea_a_checkear(l) = Ficha(pos,2) or linea_a_checkear(l) = Ficha(pos,3) then
          result := false;
        end if;
      end loop;
      -------- DEBUG --------
      -- for h in linea_a_checkear'range loop
      --   Put(linea_a_checkear(h));
      -- end loop;
    end loop Filas; pos := 0;

    if result then --* Demasidas veces se tiene que saltar el check de las columnas como para no ponerlo en un if
      Columnas: for j in C..C+2 loop
        -- TODO: Lo mismo que arriba
        Dividor_de_columnas: for a in 1..N loop
          if a not in F..F+2 then
            --Put(P(F,a));
            counter := counter + 1;
            linea_a_checkear(counter) := P(a,j);
          end if;
          exit when counter = N-M;
        end loop Dividor_de_columnas; counter := 0;

        --* El código "real" del for
        pos := pos + 1;
        -- New_Line;
        -- Put(Ficha(1,pos));
        -- Put(Ficha(2,pos));
        -- Put(Ficha(3,pos));
        for l in linea_a_checkear'range loop
          --* Creo que aquí la liamos y ya definimos que N debe ser 9 y M = 3
          --Put(linea_a_checkear(l));
          if linea_a_checkear(l) = Ficha(1,pos) or linea_a_checkear(l) = Ficha(2,pos) or linea_a_checkear(l) = Ficha(3,pos) then
            result := false;
          end if;
        end loop;
      end loop Columnas; pos := 0; --* Este sobra pero 🤷‍♂️
    end if;  
    return result;
  end filas_correctas;
end Laboratorio07b;
