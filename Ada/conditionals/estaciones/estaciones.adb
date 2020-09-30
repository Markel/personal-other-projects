WITH Ada.Integer_Text_IO, Ada.Text_IO;
 USE Ada.Integer_Text_IO, Ada.Text_IO;

procedure estaciones IS
  -- Lo metemos en un array para hacer un loop
  -- Documentación de arrays: https://learn.adacore.com/courses/intro-to-ada/chapters/arrays.html
  type Valores is range 28 .. 31;
  type Index is new Integer range 1 .. 12;
  type T_Array is array (Index) of Valores;
  -- Podríamos contar bisisestos, pero no afecta en este caso
  Dias_por_mes: T_Array := (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);

  -- Convertimos el input de día mes a dias desde el inicio
  -- del año para hacerlo más corto
  function descubrir_dia_del_ano (dia, mes: in Positive) return Integer IS
    since_inicio_del_ano : Integer := 0;
    j : Index := 1;
  BEGIN
    -- Documentación de for: https://es.wikibooks.org/wiki/Programaci%C3%B3n_en_Ada/Sentencias_y_estructuras_de_control#Sentencia_de_bucle_iterativo_(for)
    for I in 1..(mes-1) loop
      j := Index'Value(Integer'Image(i));
      since_inicio_del_ano :=
        since_inicio_del_ano +
        Integer'Value(Valores'Image(Dias_por_mes (j)));
    end loop;
    return since_inicio_del_ano + dia;
  END descubrir_dia_del_ano;

  dia, mes: Positive;
  dia_del_ano: Integer;
BEGIN
  Put("Dia: ");
  Get(dia);
  Put("Mes: ");
  Get(mes);
  dia_del_ano := descubrir_dia_del_ano(dia, mes);
  Put("La estacion correspondiente es: ");
  case dia_del_ano is
    when 1..79 => Put("Invierno");
    when 80..171 => Put("Primavera");
    when 172..263 => Put("Verano");
    when 264..354 => Put("Otono");
    when 355..365 => Put("Invierno");
    when others => raise CONSTRAINT_ERROR;
  end case;
END estaciones;
