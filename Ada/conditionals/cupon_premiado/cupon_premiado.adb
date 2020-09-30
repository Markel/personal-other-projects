WITH Ada.Integer_Text_IO, Ada.Text_IO;
 USE Ada.Integer_Text_IO, Ada.Text_IO;

procedure cupon_premiado is

  -- Ej.: 4567 => fragmento1 = 4, fragmento2 = 5, ...
  procedure desfragmentar_4_valores (
    valor: in Natural;
    fragmento1, fragmento2, fragmento3, fragmento4 : out Natural) IS
  BEGIN
    fragmento1 := Integer(Float'Floor(Float(valor)/1000.0));
    fragmento2 := Integer(Float'Floor(Float(valor)/100.0)) - fragmento1 * 10;
    fragmento3 := Integer(Float'Floor(Float(valor)/10.0)) - fragmento1 * 100 - fragmento2 * 10;
    fragmento4 := valor - fragmento1 * 1000 - fragmento2 * 100 - fragmento3 * 10;
  END desfragmentar_4_valores;

  function obtener_premio (
    CP_fragmento1, CP_fragmento2, CP_fragmento3, CP_fragmento4,
    CC_fragmento1, CC_fragmento2, CC_fragmento3, CC_fragmento4: in Natural) return Natural IS
  premio: Natural;
  BEGIN
    if CP_fragmento3 = CC_fragmento3 and CP_fragmento4 = CC_fragmento4 then
      if CP_fragmento2 = CC_fragmento2 then
        if CP_fragmento1 = CC_fragmento1 then
          premio := 100000;
        else
          premio := 50000;
        end if;
      else
        premio := 3;
      end if;
    else
      premio := 0;
    end if;
    return premio;
  END obtener_premio;

  cupon_premiado, cupon_comprobar : Integer;
  -- CP = Cupon premiado. CC = Cupon a comprobar
  CP_fragmento1, CP_fragmento2, CP_fragmento3, CP_fragmento4 : Natural;
  CC_fragmento1, CC_fragmento2, CC_fragmento3, CC_fragmento4 : Natural;
  premio: Natural;
BEGIN
  get(cupon_premiado);
  get(cupon_comprobar);
  desfragmentar_4_valores(cupon_premiado, CP_fragmento1, CP_fragmento2, CP_fragmento3, CP_fragmento4);
  desfragmentar_4_valores(cupon_comprobar, CC_fragmento1, CC_fragmento2, CC_fragmento3, CC_fragmento4);
  premio := obtener_premio(
    CP_fragmento1, CP_fragmento2, CP_fragmento3, CP_fragmento4,
    CC_fragmento1, CC_fragmento2, CC_fragmento3, CC_fragmento4);
  Put("Su premio es: ");
  Put(premio, width=>0);
END cupon_premiado;