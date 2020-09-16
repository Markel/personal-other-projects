-- Estoy usando GNAT directamente, puede que ciertos símbolos generen errores en AdaGIDE
WITH Ada.Float_Text_IO, Ada.Text_IO;
 USE Ada.Float_Text_IO, Ada.Text_IO;

-- Programa principal
PROCEDURE radians IS
    -- Declarar las variables necesarias
    grados_sexagesimales: Float;
    radianes: Float;
    pi: constant Float := 3.141592653589793;

    -- Procedure de conversión
    PROCEDURE convertir_a_radianes (grados: in Float; resultado: out Float) IS
    BEGIN
        resultado := (grados * pi)/180.0;
    END convertir_a_radianes;

    -- Función de conversión
    function convertir_a_radianes_f (grados: in Float) return Float IS
    BEGIN
        return (grados * pi)/180.0;
    END convertir_a_radianes_f;

BEGIN
    -- Obtener los grados
    Put("Introduzca sus grados sexagesimales");
    New_Line;
    Get(grados_sexagesimales);

    -- convertir_a_radianes(grados_sexagesimales, radianes);
    radianes := convertir_a_radianes_f(grados_sexagesimales);
    
    Put("Los radianes correspondientes son: ");
    Put(radianes, 0);
    delay 1.0;
END radians;