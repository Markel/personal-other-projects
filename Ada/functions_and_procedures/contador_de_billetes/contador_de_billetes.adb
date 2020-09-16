-- Estoy usando GNAT directamente, puede que ciertos símbolos generen errores en AdaGIDE
WITH Ada.Float_Text_IO, Ada.Text_IO, Ada.Integer_Text_IO;
 USE Ada.Float_Text_IO, Ada.Text_IO;

-- Valores NO considerados:
    -- Dinero con 3 decimales

-- VALORES DE PRUEBA:
    -- 886.49 (1+1+1+1+1+1+1+1.49) (comprobar todos los billetes)
    -- 499.89 && 199.99 && 99.50 && 49.76 && 19.63 && 9.51 && 4.72 (no debería dar un billete superior a su valor)
    -- 0 (0)
    -- -70 (error)
    -- .01 (0+0+0+0+0+0+0+0.01)

-- Función principal
PROCEDURE contador_de_billetes IS
    -- Declarar los valores de los billetes
    dinero: Float;
    num_billetes_500,
    num_billetes_200,
    num_billetes_100,
    num_billetes_50,
    num_billetes_20,
    num_billetes_10,
    num_billetes_5 : Natural;
    resto: Float;

    -- Procedure
    PROCEDURE contar_billetes (
        a_contar      : in Float;
        valor_billete : in Natural;
        num_billetes  : out Natural;
        extra         : out Float) IS
        -- Pre: A contar = Dinero a dividir
        -- Post: num_billetes = cantidad de billetes. Resto = a_contar - billetes contados
        dinero_floor: Natural;
    BEGIN
        -- Necesitamos el valor menor para porque 4.99€ no lo podemos cambiar por un billete de 5€
        dinero_floor := Integer(Float'Floor(a_contar));
        -- Conseguimos los billetes de ese valor
        num_billetes := dinero_floor / valor_billete;
        -- Conseguir el dinero sobrante
        extra := a_contar - (Float(num_billetes) * Float(valor_billete));
        
        -- Me pregunto si habrá un debugger de Ada...
        -- Ada.Integer_Text_IO.Put(dinero_floor);
        -- Ada.Integer_Text_IO.Put(num_billetes);
        -- Put(extra);
    END contar_billetes;

BEGIN
    -- Obtener cantidad a procesar
    Put("Introzca la cantidad de dinero a dividir: ");
    Get(dinero);
    
    -- Obtener números de billetes
    contar_billetes(a_contar => dinero, valor_billete => 500, num_billetes => num_billetes_500, extra => resto);
    contar_billetes(a_contar => resto, valor_billete => 200, num_billetes => num_billetes_200, extra => resto);
    contar_billetes(a_contar => resto, valor_billete => 100, num_billetes => num_billetes_100, extra => resto);
    contar_billetes(a_contar => resto, valor_billete => 50, num_billetes => num_billetes_50, extra => resto);
    contar_billetes(a_contar => resto, valor_billete => 20, num_billetes => num_billetes_20, extra => resto);
    contar_billetes(a_contar => resto, valor_billete => 10, num_billetes => num_billetes_10, extra => resto);
    contar_billetes(a_contar => resto, valor_billete => 5, num_billetes => num_billetes_5, extra => resto);
    
    -- Mostrar los resultados
    -- El put para floats https://www.adaic.org/resources/add_content/docs/craft/html/ch05.htm#5.6
    Put("500x");
    Ada.Integer_Text_IO.Put(num_billetes_500, 0);
    Put(" + 200x");
    Ada.Integer_Text_IO.Put(num_billetes_200, 0);
    Put(" + 100x");
    Ada.Integer_Text_IO.Put(num_billetes_100, 0);
    Put(" + 50x");
    Ada.Integer_Text_IO.Put(num_billetes_50, 0);
    Put(" + 20x");
    Ada.Integer_Text_IO.Put(num_billetes_20, 0);
    Put(" + 10x");
    Ada.Integer_Text_IO.Put(num_billetes_10, 0);
    Put(" + 5x");
    Ada.Integer_Text_IO.Put(num_billetes_5, 0);
    Put(" + ");
    Put(resto, 0, 2, 0);
    delay 3.0;
END contador_de_billetes;
