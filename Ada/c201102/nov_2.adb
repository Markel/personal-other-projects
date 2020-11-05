package body NOV_2 is

  ----------------
  -- Insertar_f --
  ----------------

  procedure Insertar_f (L: in out T_Lista; X: in Integer) is
    i : Natural := 1;
  begin
    while L(i) /= VACIO loop
      i := i + 1;
    end loop;
    L(i) := X;
    L(i+1) := VACIO;
  end Insertar_f;

  ----------------
  -- Insertar_3 --
  ----------------

  procedure Insertar_3 (L: in out T_Lista; X: in Integer) is
    new_x  : Integer := X;
    Aux, i : Integer := 3;
  begin
    if L(1) = VACIO or L(2) = VACIO then
      null;
    else
      L(3) := X;
      while L(i) /= VACIO loop
        -- We must interchange new_x & X
        Aux   := L(i);
        L(i)  := new_x;
        new_x := aux;
        i := i + 1;
      end loop;      
    end if;

    -- L(3..L'Last) := X & L(3..L'Last-1);
  end Insertar_3;

  -----------------
  -- Modificar_3 --
  -----------------

  procedure Modificar_3 (L: in out T_Lista; incremento: in Integer) is
  begin
    if L(3) /= VACIO then -- Taking care of not modyfing VACIO
      L(3) := L(3) + incremento;
    end if;
  end Modificar_3;

  --------------
  -- Borrar_3 --
  --------------

  procedure Borrar_3 (L: in out T_Lista) is
  begin
    if L(1) = VACIO or L(2) = VACIO or L(3) = VACIO then
      null;
    else
      L(3..L'Last) := L(4..L'Last) & 1;
    end if;
  end Borrar_3;

  ---------------------
  -- Ordenar_Burbuja --
  ---------------------

  procedure Ordenar_Burbuja (L: in out T_Lista) is
  begin
    --  Generated stub: replace with real body!
    pragma Compile_Time_Warning (Standard.True, "Ordenar_Burbuja unimplemented");
    raise Program_Error with "Unimplemented procedure Ordenar_Burbuja";
  end Ordenar_Burbuja;

  -----------------------
  -- Ordenar_Insercion --
  -----------------------

  procedure Ordenar_Insercion (L: in out T_Lista) is
  begin
    --  Generated stub: replace with real body!
    pragma Compile_Time_Warning (Standard.True, "Ordenar_Insercion unimplemented");
    raise Program_Error with "Unimplemented procedure Ordenar_Insercion";
  end Ordenar_Insercion;

  -----------------------
  -- Ordenar_seleccion --
  -----------------------

  procedure Ordenar_seleccion (L: in out T_Lista) is
  begin
    --  Generated stub: replace with real body!
    pragma Compile_Time_Warning (Standard.True, "Ordenar_seleccion unimplemented");
    raise Program_Error with "Unimplemented procedure Ordenar_seleccion";
  end Ordenar_seleccion;

  procedure Imprimir(L: in T_Lista) is
    I:Integer:=L'first;
  begin
    Put("[");
    loop
        exit when L(I) = VACIO;
        Put(Integer'Image(L(I)));
        I := I+1;
        if I /= L'Last and then L(I) /= VACIO then
          Put(" ");
        end if;
    end loop;
    Put("]"); New_line;
  end Imprimir;

end NOV_2;
