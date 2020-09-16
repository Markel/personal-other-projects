-- Estoy usando GNAT directamente, puede que ciertos símbolos generen errores en AdaGIDE
WITH Ada.Float_Text_IO, Ada.Text_IO, Ada.Integer_Text_IO;
 USE Ada.Float_Text_IO, Ada.Text_IO;

-- NOTA:
    -- En el programa existe un error por el cual los milímetros recibe números basura, generando errores al multiplicar y vamos, que los milímetros pueden tener mal los decimales

-- Función principal
PROCEDURE convertidor_metros IS
    metros,
    decimetros,
    centimetros,
    resto: Float;

    -- Procedure
    PROCEDURE cambiar_unidades (
        a_contar      : in Float;
        valor_medida  : out Float;
        extra         : out Float) IS
        -- Pre: A contar = Valor en una cantidad
        -- Post: valor_medida = número de esa cantidad. extra = siguiente cantidad
    BEGIN
        valor_medida := Float'Floor(a_contar);
        extra := (a_contar - valor_medida) * 10.0;
        
        -- Me pregunto si habrá un debugger de Ada...
        -- New_Line;
        -- Put(a_contar, Exp => 0);
        -- New_Line;
        -- Put(valor_medida, 0, 0, 0);
        -- New_Line;
        -- Put(extra, Exp => 0);
    END cambiar_unidades;

BEGIN
    -- Obtener cantidad a procesar
    Put("Introzca la cantidad de metros a dividir: ");
    Get(metros);
    
    -- Obtener medidas
    cambiar_unidades(a_contar => metros, valor_medida => metros, extra => resto);
    cambiar_unidades(a_contar => resto, valor_medida => decimetros, extra => resto);
    cambiar_unidades(a_contar => resto, valor_medida => centimetros, extra => resto);
    
    -- Mostrar los resultados
    -- El put para floats https://www.adaic.org/resources/add_content/docs/craft/html/ch05.htm#5.6
    Put("Resultado");
    New_Line;
    Put(metros, 0, 0, 0);
    Put("m");
    New_Line;
    Put(decimetros, 0, 0, 0);
    Put("dm");
    New_Line;
    Put(centimetros, 0, 0, 0);
    Put("cm");
    New_Line;
    Put(resto, 0, 4, 0);
    Put("mm");
    delay 3.0;
END convertidor_metros;
