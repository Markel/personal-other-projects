WITH Ada.Text_IO;
 USE Ada.Text_IO;
procedure dic_03 is
  type T_Puntero is access Integer;
  v1,v2,v3: T_puntero;
begin
  v1 := new Integer;
  v2 := new Integer;
  v1.all := 5;
  v2.all := 5;
  if v1 = v2 then
    v3 := new Integer'(7); -- No se ejecuta
  elsif v1.all = v2.all then
    v3 := new Integer'(v2.all+1);
  else
    v3 := v1;
  end if;
  v2 := v3;
  Put("Hola, soy para parar el debugger :)");
end dic_03;