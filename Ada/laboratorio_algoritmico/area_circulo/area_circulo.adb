WITH Ada.Float_Text_IO, Ada.Text_IO, Ada.Numerics;
 USE Ada.Float_Text_IO, Ada.Text_IO;

PROCEDURE area_circulo IS

    function obtener_area (radio: in Float) return Float IS
    BEGIN
        if radio < 0.0 then
            -- https://learn.adacore.com/courses/Ada_For_The_CPP_Java_Developer/chapters/10_Exceptions.html
            raise CONSTRAINT_ERROR with "El radio debe ser positivo";
        end if;
        return Ada.Numerics.Pi*radio**2;
    END obtener_area;

    radio, area: Float;
BEGIN
    Put("Introduzca el radio del circulo: ");
    Get(radio);
    area := obtener_area(radio);
    Put("El area es: ");
    Put(area, Fore=>0, Exp=>0);
    delay 1.0;
END area_circulo;