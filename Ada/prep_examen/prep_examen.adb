-- ESTE ARCHIVO NO ESTÁ PREPARADO PARA SER COMPILADO, ES SIMPLEMENTE MI BLOC DE NOTAS PERSONAL

--------------
-- Cilindro --
--------------
Entrada: Float: altura, radio
Salida: Float (Volumen)
Pre: Altura y radio > 0
Post: Volumen := π*radio^2*altura

function volumen_cilindro (altura, radio: in Float) return float IS

--------------------
-- Area Triangulo --
--------------------
Entrada: Float: lado_del_triangulo
Salida: Float (area)
Pre: lado_del_triangulo > 0
Post: area := raiz de tres/4 * lado_del_triangulo^2

function area_triangulo (lado_del_triangulo: in Float) return Float IS

---------------
-- Icosaedro --
---------------

Entrada: Float: lado_del_triangulo
Salida: Float (area)
Pre: lado_del_triangulo > 0
Post: area := (raiz de tres/4 * lado_del_triangulo^2)

procedure area_icosaedro (lado_del_triangulo: in Float; area_icosaedro: out Float) IS
begin
  area_icosaedro := area_triangulo(lado_del_triangulo);
  area_icosaedro := area_icosaedro * 20;
end area_icosaedro;

-------------------------------
-- Programa Volumen Cilindro --
-------------------------------

Entrada: Float: diametro, altura (manualmente)
Salida: Float: volumen (en pantalla)
Pre: EL usuario tendrá que meter en teclado el diametro y altura (en milimetros) los cuales deberan ser > 0
Post: Imprimir en la pantalla el volumen del Cilindro
      π*radio^2*altura

With Ada.Numerics, Ada.Text_IO, Ada.Float_Text_IO;

procedure volumen_cilindro IS
  pi : Float := Ada.Numerics.Pi;
  radiocuadrado, diametro, altura, volumen : Float;
begin
  Put("Introduzca el diametro: "); Get(diametro);
  radiocuadrado := (diametro / 2.0) ** 2;
  Put("Introduzca la altura: "); Get(altura);
  volumen := pi*radiocuadrado*altura;
  Put("Volumen: "); Put(volumen, Exp => 0, Fore => 0);
end volumen_cilindro;

------------
-- Planck --
------------

WITH Ada.Numerics;

procedure procedimiento_de_planck (
  c, h, k, r: in Float;
  Planck, c1, c2, Stefan, Thomson : out Float)
IS
  pi : Float := Ada.Numerics.Pi;
begin
  Planck := h/(2*pi);
  c1 := 2*Planck*h*c**2;
  c2 := h*c/k;
  Stefan := pi**2 / 60 * h**4 / (planck**3 * c**2);
  Thomson := 8*pi / 3 * r**2;
end procedimiento_de_planck;

-----------
-- Notas --
-----------

type T_Calificacion is (Suspenso, Aprobado, Notable, Sobresaliente, Matricula);

function notas (nota: in Float) return T_Calificacion IS
  Aux : T_Calificacion;
begin
  if nota < 5 then
    Aux := Suspenso;
  elsif 5 <= nota < 7 then
    Aux := Aprobado;
  elsif 7 <= nota < 9 then
    Aux := Notable;
  elsif 9 <= nota < 10 then
    Aux := Sobresaliente;
  elsif 10 = nota then
    Aux := Matricula;
  else
    raise CONSTRAINT_ERROR;
  end if;
  return Aux;
end notas;

-- CASOS DE PRUEBA Y SIMULACIÓN
|   | Datos |    Descripción   |     Resultado    |           Simulación           |
|---|:-----:|:----------------:|:----------------:|:------------------------------:|
| 1 |  4.36 |    No aprobado   |     Suspenso     |  Se ejecuta hasta el primer if |
| 2 |  5.00 | Aprobado raspado |     Aprobado     | Se ejecuta hasta el segundo if |
| 3 |  8.00 |    Un notable    |      Notable     |  Se ejecuta hasta el tercer if |
| 4 |  9.50 | Un sobresaliente |   Sobresaliente  |  Se ejecuta hasta el cuarto if |
| 5 | 10.00 | Matricula, yeah! |     Matricula    |  Se ejecuta hasta el quinto if |
| 6 |  12.0 | Una nota no real | CONSTRAINT_ERROR |       Se ejecuta el else       |


------------------------
-- Espacios en blanco --
------------------------
WITH Ada.Text_IO, Ada.Integer_Text_IO;
 USE Ada.Text_IO, Ada.Integer_Text_IO;

procedure eliminar_extras IS
  caracter_actual : Character;
  cantidad_de_caracteres : Natural := 0;
begin
  loop
    Get(caracter_actual);
    if caracter_actual = ' ' then
      cantidad_de_caracteres := cantidad_de_caracteres + 1;
    else
      Put(caracter_actual);
    end if;
    exit when caracter_actual = '.';
  end loop;
  New_Line;
  Put("Se han eliminado "); Put(cantidad_de_caracteres, 0); Put(" caracteres");
end eliminar_extras;

--------------------------------
-- Numero de control multiple --
--------------------------------

procedure numero_de_control_multiple IS
  num := Natural;
  Suma, Num_total := Natural := 0;
begin
  Entire_procedure: loop
    for i in reverse 1..9 loop -- Ambos inclusivos
      Get(num);
      exit Entire_procedure when num = -1;
      Suma := Suma + Num * i;
      Num_total := Num_total + Num * 10**(i-1);
    end loop;
    for i in reverse 1..9 loop
      Put(Suma / 10**(i-1));
      if i = 8 or i = 3 or i = 1 then
        Put("-");
      end if;
    end loop;
    if Suma mod 11 = 10 then
      Put("X");
    else
      Put(Suma mod 11);
  end loop;
end numero_de_control_multiple;