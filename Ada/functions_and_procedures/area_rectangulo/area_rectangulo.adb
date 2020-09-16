-- Estoy usando GNAT directamente, puede que ciertos símbolos generen errores en AdaGIDE
WITH Ada.Float_Text_IO, Ada.Text_IO;
 USE Ada.Float_Text_IO, Ada.Text_IO;

-- Programa principal
PROCEDURE area_rectangulo IS
    -- Declarar las variables necesarias
    lado_a: Float;
    lado_b: Float;
    area: Float;

    -- Procedure de cálculo
    PROCEDURE calcular_area (lado1, lado2: in Float; resultado: out Float) IS
    BEGIN
        resultado := (lado1 * lado2);
    END calcular_area;

    -- Función de cálculo
    function calcular_area_f (lado1, lado2: in Float) return Float IS
    BEGIN
        return lado1 * lado2;
    END calcular_area_f;

BEGIN
    -- Obtener los datos
    Put("Introduzca el primer lado: ");
    New_Line;
    Get(lado_a);
    Put("Introduzca el segundo lado: ");
    New_Line;
    Get(lado_b);

    -- calcular_area(lado_a, lado_b, area);
    area := calcular_area_f(lado_a, lado_b);
    
    Put("La area es: ");
    Put(area, 0);
    delay 1.0;
END area_rectangulo;