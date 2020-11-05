WITH Ada.Strings.Fixed, Ada.Integer_Text_IO, Ada.Text_IO;
package body Lab05_Extra is

  pragma Compile_Time_Warning (Standard.True, "El laboratorio extra NO ha sido implementado, no usar :(");
  --------------------
  -- Num_Misterioso --
  --------------------

  procedure Num_Misterioso (Num:out String) is
    type Bool_10_decl is array (0..9) of Boolean;
    Vector10 : Bool_10_decl := (others => false);
    Vector10Already : Bool_10_decl := (others => true); -- A la inversa
    type Nat_9_decl is array (1..9) of Natural;
    VectorNat : Nat_9_decl := (1,2,3,4,5,6,7,8,9);
    Pos : Natural := 1;
    Aux : Natural;
    Bo_Aux : Boolean := false;

    function next_number return Natural IS
    begin
      for i in Bool_10_decl'range loop
        if Vector10(i) = false and Vector10Already(i) = true then
          Ada.Text_IO.Put("   IF");
          Vector10(i) := true;
          return i;
        end if;
      end loop;
    end next_number;

    function check(pos: in Positive) return Boolean IS
      NumNat : Natural := 0;
    begin
      for i in 1..pos loop
        NumNat := NumNat + VectorNat(i) * 10**(pos-i);
      end loop;

      Ada.Integer_Text_IO.Put(NumNat);

      if NumNat rem pos = 0 then
        return true;
      else
        return false; -- Ya sé que son dos return, pero se me puede perdonar?
      end if;
    end check;

  begin
    loop
      --Ada.Integer_Text_IO.Put(VectorNat(Pos));
      Ada.Text_IO.Put(Boolean'Image(Vector10(Pos)));
      Ada.Text_IO.Put(Boolean'Image(Vector10Already(Pos)));
      
      if check(Pos) and Bo_Aux = false then
        Ada.Text_IO.Put("Nice");
        Pos := Pos + 1;
        Vector10Already := (others => true);
      elsif Bo_Aux = true then
        Bo_Aux := false;
      end if;

      if Vector10 /= Vector10Already then
        Vector10(VectorNat(Pos)) := false;
        Vector10Already(VectorNat(Pos)) := false;
        VectorNat(Pos) := next_number;
      else
        Ada.Text_IO.Put("alert");
        Pos := Pos - 1;
        Bo_Aux := true;
        Vector10Already := (others => true);
      end if;

      

      --Ada.Text_IO.Put(Boolean'Image(check(Pos)));
      --Ada.Integer_Text_IO.Put(Pos);

      
      Ada.Text_IO.New_Line;
      --delay 0.3;
    end loop;

  end Num_Misterioso;

  ----------------------------
  -- Incluir_Digito_Control --
  ----------------------------

  procedure Incluir_Digito_Control (Tarjeta: in out T_Vector16) is
    -- result : Natural := 0;
  begin
    -- for i in 1..15 loop
    --   if Tarjeta(i) rem 2 = 0 then
    --     result := result + Tarjeta(i);
    --   elsif Tarjeta(i)<5 then
    --     result := result + 2 * Tarjeta(i);
    --   elsif Tarjeta(i)>=5 then
    --     result := result + (2 * Tarjeta(i) - 9);
    --   end if;
    -- end loop;
    -- result := result rem 10;
    -- if result = 10 then
    --   Tarjeta(16) := 0;
    -- else
    --   Tarjeta(16) := 10 - result;
    -- end if;
    null;
  end Incluir_Digito_Control;

  -----------------
  -- Es_Correcta --
  -----------------

  function Es_Correcta (Tarjeta: in T_Vector16) return Boolean is
  begin
    --  Generated stub: replace with real body!
    pragma Compile_Time_Warning (Standard.True, "Es_Correcta unimplemented");
    raise Program_Error with "Unimplemented function Es_Correcta";
    return Es_Correcta (Tarjeta);
  end Es_Correcta;

  --------------------------
  -- Incluir_Digitos_IBAN --
  --------------------------

  procedure Incluir_Digitos_IBAN
    (Pais: in String;
    BAnco, Sucursal: in Integer;
    Numero_Cuenta: T_Vector10;
    IBAN: out STRING)
  is
  begin
    --  Generated stub: replace with real body!
    pragma Compile_Time_Warning (Standard.True, "Incluir_Digitos_IBAN unimplemented");
    raise Program_Error with "Unimplemented procedure Incluir_Digitos_IBAN";
  end Incluir_Digitos_IBAN;

end Lab05_Extra;
