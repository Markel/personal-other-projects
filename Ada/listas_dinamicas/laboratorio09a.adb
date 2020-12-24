package body Laboratorio09a is

  ----------
  -- Esta --
  ----------

  function Esta (L: in T_Lista_Dinamica; N: in Integer) return Boolean is
    resultado: Boolean := false;
    siguiente: T_Lista_Dinamica := L;
  begin
    loop
      exit when resultado or siguiente = null;
      if siguiente.all.info = N then
        resultado := true;
      end if;
      siguiente := siguiente.all.sig;
    end loop;
    return resultado;
  end Esta;

  --------------
  -- Posicion --
  --------------

  function Posicion (L: in T_Lista_Dinamica; N: in Integer) return Natural is
    pos: Natural := 0; -- Empezamos uno menos por cómo está hecho el código
    encontrado: Boolean := false;
    siguiente: T_Lista_Dinamica := L;
  begin
    loop
      exit when encontrado or siguiente = null;
      if siguiente.all.info = N then
        encontrado := true;
      end if;
      siguiente := siguiente.all.sig;
      pos := pos + 1;
    end loop;
    if not encontrado then
      pos := Integer'Last;
    end if;
    return pos;
  end Posicion;

  ----------------------
  -- Insertar_Delante --
  ----------------------

  procedure Insertar_Delante (L: in out T_Lista_Dinamica; Num: Integer) is
    Anadir: T_Lista_Dinamica;
  begin
    Anadir := new T_Nodo_Enteros'(Num, L);
    L := Anadir;
  end Insertar_Delante;

  ---------------------
  -- Insertar_Detras --
  ---------------------

  procedure Insertar_Detras (L: in out T_Lista_Dinamica; Num: Integer) is
    Anadir : T_Lista_Dinamica;
    siguiente : T_Lista_Dinamica := L;
  begin
    Anadir := new T_Nodo_Enteros'(Num, null);
    if siguiente = null then
      L := Anadir;
    else
      loop
        exit when siguiente.all.sig = null;
        siguiente := siguiente.all.sig;
      end loop;
      siguiente.all.sig := Anadir;
    end if;
  end Insertar_Detras;

  ------------------------------
  -- Insertar_Elemento_En_Pos --
  ------------------------------

  procedure Insertar_Elemento_En_Pos
    (L: in out T_Lista_Dinamica;
    Num: in Integer;
    Pos: in Integer)
  is
    Anadir: T_Lista_Dinamica;
    siguiente: T_Lista_Dinamica := L;
    i: Natural := 1;
  begin
    if Pos <= 1 or L = null then
      Anadir := new T_Nodo_Enteros'(Num, L);
      L := Anadir;
    else
      Llegar_a_posicion: loop
        exit Llegar_a_posicion when i >= Pos - 1 or siguiente.all.sig = null;
        siguiente := siguiente.all.sig;
        i := i + 1;
      end loop Llegar_a_posicion;
      Anadir := new T_Nodo_Enteros'(Num, siguiente.all.sig);
      siguiente.all.sig := Anadir;
    end if;
  end Insertar_Elemento_En_Pos;

  ------------
  -- Borrar --
  ------------

  procedure Borrar (L: in out T_Lista_Dinamica; Num: in Integer) is
    siguiente: T_Lista_Dinamica := L;
    encontrado: Boolean := false;
  begin
    if L = null then
      null; --* Listas vacías
    elsif L.all.info = Num then
      L := L.all.sig; --* Listas de 1 número que hay que borrarlo
    elsif L.all.sig = null then
      null; --* Listas de 1 número que no hay que borrarlo
    else
      loop
        if siguiente.all.sig.all.info = Num then
          encontrado := true;
        end if;
        exit when encontrado or siguiente.all.sig.all.sig = null;
        siguiente := siguiente.all.sig;
      end loop;
      if encontrado then
        siguiente.all.sig := siguiente.all.sig.all.sig;
      end if;
    end if;
  end Borrar;

  ----------------
  -- Concatenar --
  ----------------

  procedure Concatenar (L1, L2: in out T_Lista_Dinamica) is
    siguiente: T_Lista_Dinamica := L1;
  begin
    if L1 = null then
      L1 := L2;
    else
      loop
        exit when siguiente.all.sig = null;
        siguiente := siguiente.all.sig;
      end loop;
      siguiente.all.sig := L2;
    end if;
  end Concatenar;

  --------------
  -- Invertir --
  --------------

  procedure Invertir (L: in out T_Lista_Dinamica) is
    invertido: T_Lista_Dinamica := null;
    siguiente: T_Lista_Dinamica := L;
    Nodo_Aux : T_Lista_Dinamica;
  begin
    if L /= null then
      loop
        Nodo_Aux := new T_Nodo_Enteros'(siguiente.all.info,invertido);
        invertido := Nodo_Aux;
        exit when siguiente.all.sig = null;
        siguiente := siguiente.all.sig;
      end loop;
      L := invertido;
    end if;
  end Invertir;

  -----------------
  -- Simplificar --
  -----------------

  procedure Simplificar (L: in out T_Lista_Puntos; Cuantos: out Natural) is
    --* `Cuantos` guarda el número de elementos hay, NO la cantidad de elementos que eliminas
    siguiente: T_Lista_Puntos := L;
  begin
    Cuantos := 2; --* Nunca miramos los primos dos elementos con lo que necesitamos contarlos
    if L /= null and then L.all.sig /= null and then L.all.sig.all.sig /= null then --* El primero y el último siempre se mantiene, con lo que listas de dos elementos no importan
      loop
        if abs(siguiente.all.info.X - siguiente.all.sig.all.info.X) < 0.001 and 
           abs(siguiente.all.info.Y - siguiente.all.sig.all.info.Y) < 0.001 then
          siguiente.all.sig := siguiente.all.sig.all.sig;
        else
          Cuantos := cuantos + 1;
          siguiente := siguiente.all.sig;
        end if;
        exit when siguiente.all.sig.all.sig = null;
      end loop;
    end if;
  end Simplificar;
end Laboratorio09a;
