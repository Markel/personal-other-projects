procedure dic_03_1 is
  type T_NODo;
  type T_Lista_D is access T_NODO;
  type T_NODO is record
    info: Integer;
    sig: T_Lista_D;
  end record;
  L: T_Lista_D := null;
begin
  L := new T_NODO;
  L.all.info := 1;
  L.all.sig := null;
  L := new T_NODO'(1,null);

  L.all.sig := new T_NODO'(2,null);
  L.all.sig.all.sig := new T_NODO'(2,null);
  delay 1.0;
end dic_03_1;