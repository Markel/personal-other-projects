pragma Initialize_Scalars; -- Para el 'Valid de ordenados' 
WITH Ada.Text_IO, Ada.Integer_Text_IO;
 USE Ada.Text_IO, Ada.Integer_Text_IO;
package body Laboratorio05 is

  -------------------------------------------------------------------
  -- Autor: Markel Ferro Postigo
  -- Grupo: A
  -- Fecha: 2020/10/26
  -------------------------------------------------------------------

  ----------------
  -- Ultimo_Par --
  ----------------

  procedure Ultimo_Par (V: in T_Vector10; Ultimo_Par: out Integer; Posicion: out Natural) IS
  begin
    Ultimo_Par := 0;
    Posicion := 0;
    for i in V'range loop
      if V(i) rem 2 = 0 then
        Ultimo_Par := V(i);
        Posicion := i;
      end if;
    end loop;
  end Ultimo_Par;

  --------------------------
  -- multiplos_del_ultimo --
  --------------------------

  function Multiplos_Del_Ultimo (V: in T_Vector10) return Positive is
    count : Natural := 0; -- Siempre va a dar mayor que 1 so es seguro
  begin
    for i in V'range loop
      if V(i) mod V(10) = 0 then
        count := count + 1;
      end if;
    end loop;
    return count;
  end Multiplos_Del_Ultimo;

  -------------------
  -- esta_ordenado --
  -------------------

  function Esta_Ordenado (V: in T_Vector10) return Boolean is
    result : Boolean := true;
    Cre : Boolean;
  begin
    -- El 'valid es necesario, porque el primer y segundo número podrían ser iguales
    for i in 2..V'Last loop
      if V(i) = V(i-1) then
        null;
      elsif (not Cre'Valid or Cre = true) and V(i) > V(i-1) then
        Cre := true;
      elsif (not Cre'Valid or Cre = false) and V(i) < V(i-1) then
        Cre := false;
      else
        result := false;
        -- exit;  🥺 sería más eficiente
      end if;
    end loop;
    return result;
  end Esta_Ordenado;

  ---------------------
  -- Separar_digitos --
  ---------------------

  procedure Separar_digitos(Num: In Natural; V: out T_Vector10; impares: out Natural) is
    Numero : Natural := Num; -- Que no permite escribir si no
  begin
    impares := 0;
    for i in reverse V'range loop
      V(i) := Numero rem 10;
      if V(i) rem 2 /= 0 then
        impares := impares + 1;
      end if;
      Numero := Numero / 10; -- Quitamos un número haciendo una división entera
    end loop;
  end Separar_digitos;

  -----------------------
  -- binario_a_decimal --
  -----------------------

  function Binario_A_Decimal (V: in T_Vector10) return Natural is
    result : Natural := 0;
  begin
    for i in V'range loop
      result := result + V(i) * 2**(V'last-i);
    end loop;
    return result;
  end Binario_A_Decimal;

  -----------
  -- Rot13 --
  -----------

  procedure Rot13 (Sin_Cifrar: in String; Cifrado: out String) is
    aux : Natural;
  begin
    for i in Sin_Cifrar'range loop
      aux := Character'Pos(Sin_Cifrar(i));
      if (65 <= aux and aux <= 90) or (97 <= aux and aux <= 122) then
        aux := aux + 13;
        if (91 <= aux and aux <= 103) or (123 <= aux and aux <= 135) then
          aux := aux - 26;
        end if;
      end if;
      Cifrado(i) := Character'Val(aux);
    end loop;
  end Rot13;

  --------------------
  -- Digito_Control --
  --------------------

  function Digito_Control (Codigo_Cuenta: in T_Vector10) return Natural is
    result : Natural := 0;
  begin
    -- El sumatorio
    for i in Codigo_Cuenta'range loop
      result := result + Codigo_Cuenta(i) * (2**i rem 11);
    end loop;
    result := result rem 11;
    result := 11 - result;
    if result = 11 then
      result := 0;
    elsif result = 10 then
      result := 1;
    end if;
    return result;
  end Digito_Control;
end Laboratorio05;