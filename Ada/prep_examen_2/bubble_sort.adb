-- NOT DESIGNED TO RUN

procedure bubble_sort (V:in out Vector) is
  Aux: Integer;
begin
  for i in 1..V'Length-1 loop
    for pos in V'First..V'Last-i loop
      if V(pos) > V(pos+1) then
        -- Intercambiar V(Pos) y V(Pos+1)
        Aux := V(pos);
        V(pos) := V(pos+1);
        V(pos+1) := Aux;
      end if;
    end loop;
  end loop;
end bubble_sort;