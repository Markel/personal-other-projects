-- Estoy usando GNAT directamente, puede que ciertos símbolos generen errores en AdaGIDE
WITH Ada.Float_Text_IO, Ada.Text_IO;
 USE Ada.Float_Text_IO, Ada.Text_IO;

-- Programa principal
PROCEDURE volumen_cilindro IS
    -- Declarar las variables necesarias
    radio: Float;
    altura: Float;
    volumen: Float;
    pi: constant Float := 3.141592653589793;

    -- Procedure de cálculo
    PROCEDURE calcular_volumen (radio, altura: in Float; resultado: out Float) IS
    BEGIN
        resultado := (pi * (radio**2)) * altura;
    END calcular_volumen;

    -- Función de cálculo
    function calcular_volumen_f (radio, altura: in Float) return Float IS
    BEGIN
        return (pi * (radio**2)) * altura;
    END calcular_volumen_f;

BEGIN
    -- Obtener los datos
    Put("Introduzca el radio de la base: ");
    New_Line;
    Get(radio);
    Put("Introduzca la altura del cilindro: ");
    New_Line;
    Get(altura);

    -- calcular_volumen(radio, altura, volumen);
    volumen := calcular_volumen_f(radio, altura);
    
    Put("El volumen es: ");
    Put(volumen, 0);
    delay 1.0;
END volumen_cilindro;