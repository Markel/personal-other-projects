WITH Ada.Text_IO, Ada.Integer_Text_IO, Ada.Exceptions, nt_console, Ada.Calendar.Formatting, Ada.Calendar, Ada.Real_time;
 USE Ada.Text_IO, Ada.Integer_Text_IO, Ada.Exceptions, nt_console, Ada.Calendar.Formatting, Ada.Calendar, Ada.Real_time;

package body Laboratorio10 is
  --* Puedes comprobar el significado de los errores en Errores.md
  Error_1x02, Error_1x03, Error_1x04: exception;
  Error_2x01: exception;
  Error_3x01, Error_3x04: exception;

  Cambiar_a_negro: Boolean := true;
  Guardar: Boolean := false;

  Default_foreground: Color_Type;
  Default_background: Color_Type;

  --* Esta procedure sirve para saber a que color hay que volver una vez que hayamos cambiado el color
  procedure obtain_defaults IS
  begin
    Default_foreground := Get_Foreground;
    Default_background := Get_Background;
  end obtain_defaults;

--*-------------------------------------------------------------------------*--
--*------------                        ES                       ------------*--
--*-------------------------------------------------------------------------*--

  ----------------
  -- Es_Esquina --
  ----------------

  function Es_Esquina
    (Img:in T_Imagen;
    Fil,Col:in Positive)
    return Boolean
  is
    resultado: Boolean := false;
  begin
    if (Fil = Img'First(1) or Fil = Img'Last(1)) and --* La fila
       (Col = Img'First(2) or Col = Img'Last(2)) then --* La columna
      resultado := true;
    end if;
    return resultado;
  end Es_Esquina;

  ----------------
  -- Es_Lateral --
  ----------------

  function Es_Lateral
    (Img:in T_Imagen;
    Fil,Col:in Positive)
    return Boolean
  is
    resultado: Boolean := false; 
  --* Si es esquina también devolverá que es lateral!
  begin
    if Fil = Img'First(1) or Fil = Img'Last(1) or --* Las filas
       Col = Img'First(2) or Col = Img'Last(2) then --* Las columnas
      resultado := true;
    end if;
    return resultado;
  end Es_Lateral;

  -----------------
  -- Es_Interior --
  -----------------

  function Es_Interior
    (Img: in T_Imagen;
    Fil,Col: in Positive)
    return Boolean
  is
    resultado: Boolean := false;
  begin
    if Fil /= Img'First(1) and Fil /= Img'Last(1) and
       Col /= Img'First(2) and Col /= Img'Last(2) then
      resultado := true;
    end if;
    return resultado;
  end Es_Interior;

--*-------------------------------------------------------------------------*--
--*------------                      PISTAS                     ------------*--
--*-------------------------------------------------------------------------*--

  ------------
  -- Anadir --
  ------------

  procedure Anadir (L: in out T_Lista_D_Pistas; P: in T_Pista) is
    Aux : T_Lista_D_Pistas;
    siguiente : T_Lista_D_Pistas := L;
  begin
    Aux := new T_Nodo_Pista'(P, null);
    if siguiente = null then
      L := Aux;
    else
      loop
        exit when siguiente.all.sig = null;
        siguiente := siguiente.all.sig;
      end loop;
      siguiente.all.sig := Aux;
    end if;
  exception
    when Error: others => raise Error_3x01 with "Error al anadir a la lista dinamica " & Exception_Information(Error);
  end Anadir;

  -----------------
  -- Continuable --
  -----------------
  --* Determina si alguna pista entre las disponibles se puede hacer
  function Continuable (Img: in T_Imagen; Lp: in T_Lista_E_Pistas) return Boolean is
  begin
    --* No puedes dar una clase de cosas guays y esperar que no las use ;)
    return (for some I in 1..Lp.cont => Es_Posible_Resolver(Img, Lp.Rest(I)));
  end continuable;

  -------------------
  -- obtener_valor --
  -------------------

  procedure Obtener_valor(
    Img: In T_Imagen;
    Lp: in T_Lista_E_Pistas;
    fila,columna: in Integer;
    valor: out Integer) IS
    i : Integer := 0;
    encontrada: Boolean := false;
  begin
    valor := Integer'First;
    loop
      exit when i >= Lp.Cont or encontrada;
      i := i + 1;
      if Lp.rest(i).fil = fila and Lp.rest(i).col = columna then
        valor := Lp.rest(i).valor;
        encontrada := true;
      end if;
    end loop;
  end obtener_valor;

  --------------
  -- longitud --
  --------------

  function Longitud (L:in T_Lista_D_Pistas) return Natural is
    cantidad : Natural := 0;
    siguiente : T_lista_D_Pistas := L;
  begin
    loop
      exit when siguiente = null;
      cantidad := cantidad + 1;
      siguiente := siguiente.all.sig;
    end loop;
    return cantidad;
  end longitud;

  -------------------
  -- Obtener_Pista --
  -------------------

  --* He modificado este subprograma para poder eliminar la pista de la lista más fácil
  procedure Obtener_Pista(Filas,Columnas: in Integer;Lp: in T_Lista_E_Pistas;P: out T_Pista; pos: out Integer)
  is
    i: Integer := 1;
    encontrada: Boolean := false;
    fila, columna: Integer;
    saveable: Character;
  begin
    New_Line;
    Put("Introduzca la posicion de la pista a resolver o `s` para guardar: ");
    Get(fila); Get(columna);
    pos := 0; --* Es un método de control por si no exite la pista
    if fila in 1..filas and columna in 1..columnas then
      loop
        if Lp.rest(i).fil = fila and Lp.rest(i).col = columna then
          P := Lp.rest(i);
          pos := i;
          encontrada := true;
        end if;
        exit when i >= Lp.Cont or encontrada;
        i := i + 1;
      end loop;
    end if;
  exception
    when Error: DATA_ERROR => Get(saveable);
      if saveable in 's'|'S' then
        Guardar := true;
        Skip_Line;
      else
        Put("Warning 2x03: Posicion introducida de tipo incorrecta"); New_Line;
        Skip_Line;
      end if;
    when Error: others => Put("Warning 3x05: Error al solicitar la posición. " & Exception_Information(Error)); Skip_Line;
  end Obtener_Pista;

--*-------------------------------------------------------------------------*--
--*------------                      MOSTRAR                    ------------*--
--*-------------------------------------------------------------------------*--

  procedure Mostrar (Img: in T_Imagen; Lp: in T_Lista_E_Pistas) is
    valor: Integer;
  begin
    New_Line;
    for i in Img'range(1) loop
      for j in Img'range(2) loop
        Set_Foreground(Black);
        Obtener_valor(Img, Lp, i, j, valor);
        if Img(i,j) = Duda then
          Set_Background(Light_Cyan);
          if valor = Integer'First then
            Put("?");
          else
            Set_Foreground(Light_Red);
            Put(valor,1);
          end if;
        elsif Img(i,j) = Blanco then
          Set_Background(Gray);
          if valor = Integer'First then
            Put("_");
          else
            Set_Foreground(Light_Red); 
            Put(valor,1);
          end if;
        elsif Img(i,j) = Negro then
          Set_Background(Light_Green);
          if valor = Integer'First then
            Put("#");
          else
            Set_Foreground(Light_Red);
            Put(valor,1);
          end if;
        end if;
        Set_Background(Default_background);
        Set_Foreground(Default_foreground);
      end loop;
      New_Line;
    end loop;
  end Mostrar;

  procedure Mostrar (L: in T_Lista_E_Pistas) is
  begin
    New_Line; Put("Pistas disponibles:"); New_Line;
    for i in 1..L.Cont loop
      Put("|");
      Put(L.Rest(i).Fil, 2);
      Put(",");
      Put(L.Rest(i).Col, 2);
      Put("|");
    end loop;
    New_Line;
  exception
    when Error: others => New_Line; Put("Warning 3x02: Error al mostrar la lista dinamica. " & Exception_Information(Error));
  end Mostrar;

  procedure Mostrar (L: in T_Lista_D_Pistas) is
    siguiente: T_Lista_D_Pistas := L;
  begin
    --* Eso se podría hacer con una función anidada, pero esto va a dar errores.
    New_Line; Put("Localizacion de las pistas utilizadas (en orden):"); New_Line;
    loop
      exit when siguiente = null;
      Put("|");
      Put(siguiente.all.pista.Fil, 2);
      Put(",");
      Put(siguiente.all.pista.Col, 2);
      Put("|");
      siguiente := siguiente.all.sig;
    end loop;
    New_Line(2);
  exception
    when Error: others => New_Line; Put("Warning 3x02: Error al mostrar la lista dinamica. " & Exception_Information(Error));
  end Mostrar;

  procedure Mostrar (Cuadros: in T_contador) IS
  begin
    Put("Negras: ");  Put(Cuadros(Negro), 0);
    Put(". Blancas: "); Put(Cuadros(Blanco), 0);
    Put(". Dudas: ");   Put(Cuadros(Duda), 0); Put(". (");
    Put((Cuadros(Negro)+Cuadros(Blanco))*100/(Cuadros(Negro)+Cuadros(Blanco)+Cuadros(Duda)), 0); Put("%)"); New_Line;
  end Mostrar;

  ---------------------------
  -- resultados_finales 🎉 --
  ---------------------------

  procedure Resultados_finales (
    Img: in T_Imagen;
    Sol: in T_lista_D_Pistas;
    filas, columnas: in Integer;
    Cuadros : in T_contador;
    Lp: in T_Lista_E_Pistas) is
  begin
    New_Line;
    if Lp.Cont /= 0 then
      Put("Puzzle resulto (al maximo posible):");
    else
      Put("Puzzle resuelto:"); 
    end if;
    Mostrar(Img, Lp);
    Mostrar(Sol);
    Mostrar(Cuadros);
  end resultados_finales;

--*-------------------------------------------------------------------------*--
--*------------                      IMAGEN                     ------------*--
--*-------------------------------------------------------------------------*--

  --------------------
  -- Contar_cuadros --
  --------------------

  procedure Contar_cuadros
    (Img: in T_Imagen;
    Fil, Col: in Integer;
    Contador: out T_contador)
  is
  begin
    Contador(Blanco) := 0;
    Contador(Negro) := 0;
    Contador(Duda) := 0;
    for i in Img'Range(1) loop
      for j in Img'Range(2) loop
        Contador(Img(i,j)) := Contador(Img(i,j)) + 1;
      end loop;
    end loop;
  end Contar_cuadros;

  -------------------------
  -- Es_Posible_Resolver --
  -------------------------

  function Es_Posible_Resolver
    (Img: in T_Imagen;
    P: in T_Pista)
    return Boolean
  is
    cantidad, blancoc, negroc, dudac: Natural := 0;
    resultado: Boolean := false;
    posible: Natural := 0;
  begin
    begin
      if Es_Esquina(Img, P.Fil, P.Col) then
        cantidad := 4;
      elsif Es_Lateral(Img, P.Fil, P.Col) then
        cantidad := 6;
      elsif Es_Interior(Img, P.Fil, P.Col) then
        cantidad := 9;
      end if;
    exception
      when Error: others => raise Error_3x04 with "Posición a buscar equivocada. " & Exception_Information(Error);
    end;

    for i in (P.Fil - 1)..(P.Fil + 1) loop --* Soy consciente que los paréntesis no son necesarios
      for j in (P.Col - 1)..(P.Col + 1) loop --* Simplemente quiero legibilidad
        if i in 1..Img'Last(1) and j in 1..Img'Last(2) then --* Comprobamos que está en la matriz
          if Img(i,j) = Blanco then
            blancoc := blancoc + 1;
          elsif Img(i,j) = Duda then
            dudac := dudac + 1;
          elsif Img(i,j) = Negro then
            negroc := negroc + 1;
          end if;
        end if;
      end loop;
    end loop;

    if Dudac + Negroc = P.Valor then
      resultado := true;
      Cambiar_a_negro := true;
    elsif Negroc = P.Valor then
      resultado := true;
      Cambiar_a_negro := false;
    end if;

    return resultado;
  end Es_Posible_Resolver;

  -----------------------
  -- Resolver_Posicion --
  -----------------------

  procedure Resolver_Posicion
    (Img: in out T_Imagen;
    P: in T_Pista) IS
  begin
    for i in (P.Fil - 1)..(P.Fil + 1) loop --* Soy consciente que los paréntesis no son necesarios
      for j in (P.Col - 1)..(P.Col + 1) loop --* Simplemente quiero legibilidad
        if i in 1..Img'Last(1) and j in 1..Img'Last(2) then --* Comprobamos que está en la matriz
          if P.Valor = 0 then
            Img(i,j) := Blanco;
          elsif Img(i,j) = Duda then
            if Cambiar_a_negro then
              Img(i,j) := Negro;
            else
              Img(i,j) := Blanco;
            end if;
          end if;
        end if;
      end loop;
    end loop;
  end Resolver_Posicion;

  ------------------
  -- Imagen_vacia --
  ------------------

  function Imagen_vacia (filas,columnas: in Integer) return T_Imagen is
    Img: T_Imagen(1..filas,1..columnas);
  begin
    Img := (others=>(others=>Duda));
    return Img;
  end Imagen_vacia;

--*-------------------------------------------------------------------------*--
--*------------                     FICHEROS                    ------------*--
--*-------------------------------------------------------------------------*--

  -------------------
  -- Iniciar_Juego --
  -------------------

  procedure Iniciar_Juego
    (Ruta: in String;
    filas,columnas:  out Integer;
    LP: out T_Lista_E_Pistas) --* Sorprendentemente, LP se inicializa con todo 0s, pero por si acaso lo inicializamos...
  is
    F: File_type;
    AuxChar: Character;
  begin
    obtain_defaults;
    Clear_Screen;
    Open(F, In_File, ruta & ".txt");
    --* Establecer tamaño de la matriz
    Get(F,filas);
    Get(F,columnas);
    if filas*columnas > 1000 then
      Put("Warning 2x02: Puzzle muy grande.");
    end if;

    --* Crear lista estática de pistas
    LP.Cont := 0;
    for i in 1..filas loop
      for j in 1..columnas loop
        Get(F, AuxChar);
        if AuxChar = '.' then --* No hay pista
          null;
        elsif AuxChar in '0'..'9' then --* Hay pista
          LP.Cont := LP.Cont + 1;
          LP.Rest(LP.Cont).Fil := i;
          LP.Rest(LP.Cont).Col := j;
          LP.Rest(LP.Cont).Valor := Integer(Character'Pos(AuxChar) - 48);
        else
          Put("Warning 1x01: Caracter desconocido.");
        end if;
      end loop;
    end loop;
    Close(F);
  end Iniciar_Juego;

  -------------------
  -- Guardar_Juego --
  -------------------

  procedure Guardar_Juego
    (filename: in String;
    fils,cols:  in Integer;
    Lp :  in T_Lista_e_Pistas;
    LS :  in T_lista_D_Pistas)
  is
    S: File_Type;
    siguiente: T_Lista_D_Pistas := LS;
  begin
    Put("Guardando...");
    Create(S, Out_File, filename & ".game");
    --* Escribir filas y columnas
    Put(S, fils, 0); Put(S, ' ');
    Put(S, cols, 0);
    New_Line(S);
    --* Escribir cantidad pistas remaining
    Put(S, Lp.Cont, 0);
    New_Line(S);
    --* Escribir pistas pendientes
    for i in 1..Lp.Cont loop
      Put(S, Lp.Rest(i).Fil, 0); Put(S, ' ');
      Put(S, Lp.Rest(i).Col, 0); Put(S, ' ');
      Put(S, Lp.Rest(i).Valor, 0); Put(S, "   ");
    end loop;
    New_Line(S);
    --* Escribir cantidad listas utilizadas
    Put(S, longitud(LS), 0);
    New_Line(S);
    --* Escribir pistas utilizadas
    loop
      exit when siguiente = null;
      Put(S, siguiente.all.pista.Fil, 0); Put(S, ' ');
      Put(S, siguiente.all.pista.Col, 0); Put(S, ' ');
      Put(S, siguiente.all.pista.valor, 0); Put(S, "   ");
      siguiente := siguiente.all.sig;
    end loop;
    Close(S);
    New_Line; Put("Guardado completado en " & filename & ".game"); New_Line;
  exception
    when Error: others => Mostrar(LS); raise Error_1x02 with "No ha sido posible guardar el juego. " & Exception_Information(Error);
  end Guardar_Juego;

  --------------------
  -- Reanudar_Juego --
  --------------------

  procedure Reanudar_Juego
    (filename: in String;
    filas, columnas:  out Integer;
    Lp :  out T_Lista_e_Pistas;
    LS :  out T_lista_D_Pistas)
  is
    LSCont: Integer;
    Pis_Aux: T_Pista;
    F: File_Type;
  begin
    obtain_defaults;
    Clear_Screen;
    Open(F, In_File, filename & ".game");
    --* Establecer tamaño de la matriz
    Get(F,filas);
    Get(F,columnas);
    if filas*columnas > 1000 then
      Put("Warning 2x02: Puzzle muy grande.");
    end if;
    
    --* Establecer lista estática
    Get(F, Lp.Cont);
    for i in 1..Lp.Cont loop
      Get(F, Lp.Rest(i).Fil);
      Get(F, Lp.Rest(i).Col); 
      Get(F, Lp.Rest(i).Valor);
    end loop;

    LS := null;
    --* Establecer lista dinámica
    Get(F, LSCont);
    for i in 1..LSCont loop
      Get(F, Pis_Aux.Fil);
      Get(F, Pis_Aux.Col);
      Get(F, Pis_Aux.Valor);
      Anadir(LS, Pis_Aux);
    end loop;
    Close(F);
  exception
    when Error: others => raise Error_1x03 with "No ha sido cargar el juego. " & Exception_Information(Error);
  end Reanudar_Juego;

--*-------------------------------------------------------------------------*--
--*------------                      FASES                      ------------*--
--*-------------------------------------------------------------------------*--

  ------------
  -- Fase_1 --
  ------------

  procedure Fase_1
    (filas, columnas: in Integer;
    Lp:in out T_Lista_E_Pistas;
    Sol: out T_lista_D_Pistas)
  is
    Img: T_Imagen(1..filas,1..columnas);
    utilizada, resoluble: Boolean := false;
    i : Natural := 1;
    Cuadros : T_contador;
  begin
    Img := Imagen_vacia(filas,columnas);
    begin
      Repetir_lista: loop
        i := 1;
        Iterar_por_pistas: loop
          resoluble := Es_Posible_Resolver(Img, Lp.Rest(i));
          if resoluble then
            utilizada := true;
            Resolver_Posicion(Img, Lp.Rest(i));
            Anadir(Sol, Lp.Rest(i));
            -- Mostrar(Img, Lp);
            Lp.Rest(i..Lp.Cont-1) := Lp.Rest(i+1..Lp.Cont);
            Lp.Cont := Lp.Cont - 1;
          end if;
          exit Iterar_por_pistas when i >= Lp.Cont or Lp.Cont = 0;
          i := i + 1;
        end loop Iterar_por_pistas;
        exit Repetir_lista when Lp.Cont = 0;
        if not utilizada then
          raise Error_2x01 with "Ninguna pista se puede resolver";
        end if;
        utilizada := false;
      end loop Repetir_lista;
    exception
      when Error: others => Put(Exception_Information(Error));
    end;
    Contar_cuadros(Img, Filas, Columnas, Cuadros);
    resultados_finales (Img,Sol,filas,columnas,cuadros,Lp);
  end Fase_1;

  ------------
  -- Fase_2 --
  ------------

  procedure Fase_2
    (filas, columnas: in Integer;
    LP: in out T_Lista_E_Pistas;
    Sol: in out T_Lista_D_Pistas)
  is
    Img: T_Imagen(1..filas,1..columnas);
    Cuadros : T_contador := (others=>0);
    pista_a_resolver : T_pista;
    i: Integer := Integer'First;
    Time: String(1..19);
    siguiente: T_Lista_D_Pistas := Sol;
  begin
    Img := Imagen_vacia(filas,columnas);
    --* Reanudación de una partida empezada
    if Sol /= null then
      Reanudar: loop
        if Es_Posible_Resolver(Img, siguiente.pista) then
          Resolver_Posicion(Img, siguiente.pista);
        else
          raise Error_1x04 with "El fichero incluye jugadas imposibles.";
        end if;
        siguiente := siguiente.all.sig;
        exit Reanudar when siguiente = null;
      end loop Reanudar;
    end if;
    --* Nos ponemos a jugar 🎲
    begin
      loop
        exit when Lp.Cont <= 0 or Guardar;
        if not continuable(Img, Lp) then
          raise Error_2x01 with "Ninguna pista se puede resolver";
        end if;
        Contar_cuadros(Img, Filas, Columnas, Cuadros);
        Mostrar(Img, Lp);
        Mostrar(Cuadros);
        Mostrar(LP);
        i := 0; --* Por si quiere guardar no intentar resolver algo irresoluble.
        Obtener_Pista(filas,columnas,lp,pista_a_resolver,i);
        if i /= 0 then
          if Es_Posible_Resolver(Img, pista_a_resolver) then
            Resolver_Posicion(Img, pista_a_resolver);
            Anadir(Sol, pista_a_resolver);
            -- Mostrar(Img, Lp);
            Lp.Rest(i..Lp.Cont-1) := Lp.Rest(i+1..Lp.Cont);
            Lp.Cont := Lp.Cont - 1;
          else
            Set_Foreground(Red);
            Put_Line("La pista introducida no es resoluble.");
            Set_Foreground(Default_foreground);
          end if;
        elsif not Guardar then
          Set_Foreground(Red);
          Put_Line("La pista introducida no existe.");
          Set_Foreground(Default_foreground);
        end if;
      end loop;
    exception
      when Error: others => Put(Exception_Information(Error));
    end;
    if Guardar then
      Time := Image(Clock);
      --* Los archivos no permiten `:` con lo que hay que cambiarlos a `-`
      Time(14) := '-';
      Time(17) := '-';
      Guardar_Juego(Time, Filas, Columnas, Lp, Sol);
    else
      Contar_cuadros(Img,Filas,Columnas,Cuadros);
      resultados_finales(Img,Sol,filas,columnas,cuadros,Lp);
    end if;
  end Fase_2;

--*-------------------------------------------------------------------------*--
--*------------            UNIMPLEMENTED SUBPROGRAMS            ------------*--
--*-------------------------------------------------------------------------*--

  function Resolver(Filas, Columnas: in Integer;Lp: in T_Lista_E_Pistas)return T_Imagen is begin
    raise Program_Error with "Unimplemented function Resolver";
    return Resolver (Filas, Columnas, Lp);
  end Resolver;

  procedure Obtener_Pista(Filas,Columnas: in Integer;Lp: in T_Lista_E_Pistas;P: out T_Pista) is null;

  procedure Concatenar (L1,L2: in out T_Lista_D_Pistas) is null;

  procedure Anadir (L: in out T_Lista_E_Pistas; P: in T_Pista) is null;

  procedure Borrar (L: in out T_Lista_E_Pistas; P: in T_Pista) is null;

  procedure Buscar_Pista (Lp: in T_Lista_E_Pistas;Img: in T_Imagen;P: out T_Pista) is null;

  procedure Colorear (Img: in out T_Imagen; P: in T_Pista) is null;

  function Completa (Img: in T_Imagen) return Boolean is begin
    raise Program_Error with "Unimplemented function Completa";
    return Completa (Img);
  end Completa;

  procedure Mostrar (Img: in T_Imagen) is null;

end Laboratorio10;
