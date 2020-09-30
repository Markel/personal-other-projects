-- It obviously doesn't work as a program :/
-- Just add a main program

procedure duracion_tarea(
  hh,mm,ss: in out Integer;
  duracion: in Integer;
  dia_siguiente: out Boolean) IS
  las_cuatro: constant integer := 3600 * 16;
  las_ocho: constant Integer := 3600 * 8;
  hora_en_segundos : Integer;
BEGIN
  hora_en_segundos := hh*3600+mm*60+ss;
  hora_final := hora_en_segundos+ duracion;
  if hora_final <= las_cuatro then
    dia_siguiente := false;
  else
    hora_final := hora_final - las_cuatro + las_ocho;
    dia_siguiente := true;
  end if;
  hh := hora_final/3600;
  mm := hora_final rem 3600/60;
  ss := hora_final rem 60;
END duracion_tarea;