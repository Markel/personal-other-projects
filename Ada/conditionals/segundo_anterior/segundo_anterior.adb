WITH Ada.Integer_Text_IO, Ada.Text_IO, Ada.Strings.Fixed;
 USE Ada.Integer_Text_IO, Ada.Text_IO, Ada.Strings.Fixed;

procedure segundo_anterior IS
-- Meter todo en un type (quería aprender a usarlos :)
subtype T_sobre_24  is Natural range 0..23;
subtype T_sobre_60  is Natural range 0..59;
type el_record is record
  Hora    : T_sobre_24  := 0;
  Minuto  : T_sobre_60  := 0;
  Segundo : T_sobre_60  := 0;
end record;
tiempo : el_record;

-- Si el número es el primero del rango pasará a ser el final
-- y se comprobará lo mismo con la unidad superior. Si no es
-- el primero, simplemente se resta uno y mantienen los valores
-- de unidades de unidades superiores.
procedure reducir_segundo(
  Hora_Inicial: in T_sobre_24;
  Minuto_Inicial, Segundo_Inicial : in T_sobre_60;
  Hora_Final: out T_sobre_24;
  Minuto_Final, Segundo_Final : out T_sobre_60) IS
BEGIN
  IF Segundo_Inicial = T_sobre_60'First THEN
    Segundo_Final := T_sobre_60'Last;
    IF Minuto_Inicial = T_sobre_60'First THEN
      Minuto_Final := T_sobre_60'Last;
      IF Hora_Inicial = T_sobre_24'First THEN
        Hora_Final := T_sobre_24'Last;
      ELSE
        Hora_Final := Hora_Inicial - 1;
      END IF;
    ELSE
      Minuto_Final := Minuto_Inicial - 1;
      Hora_Final := Hora_Inicial;
    END IF;
  ELSE
    Hora_Final := Hora_Inicial;
    Minuto_Final := Minuto_Inicial;
    Segundo_Final := Segundo_Inicial - 1;
  END IF;
END reducir_segundo;

BEGIN
  Put("Hora: ");
  Get(tiempo.hora);
  Put("Minuto: ");
  Get(tiempo.minuto);
  Put("Segundo: ");
  Get(tiempo.segundo);
  reducir_segundo(
    tiempo.hora, tiempo.minuto, tiempo.segundo,
    tiempo.hora, tiempo.minuto, tiempo.segundo);
  -- Trim sacado de https://stackoverflow.com/a/1847396
  Put_Line(
    "La hora restado un segundo es: "
    & Trim(Integer'Image(tiempo.hora),Ada.Strings.Left) & ":"
    & Trim(Integer'Image(tiempo.minuto),Ada.Strings.Left) & ":"
    & Trim(Integer'Image(tiempo.segundo),Ada.Strings.Left));
END segundo_anterior;