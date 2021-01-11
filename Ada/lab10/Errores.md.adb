> Los errores con ⚠️ lanzarán un aviso en consola, pero pueden producir errores en el futuro.

> Los errores con ❌ terminarán el programa con un error.

> Los errores con ❌|⚠️ terminarán una porción del programa, pero no el programa entero.

> Los errores con ➕ incluirán información extra para debug.

## Errores de fichero (1x??)
  ### ⚠️ 1x01: Caracter desconocido
  Los tableros de entrada inicial solo pueden contener los siguientes caracteres: `. 1 2 3 4 5 6 7 8 9 0`. Se ha detectado un caracter diferente a esos, asegúrese que es un archivo válido.

  ### ❌➕ 1x02: No ha sido posible guardar el juego
  El juego no ha podido ser guardado, lo siento, pero has perdido todo el progreso :(. Al menos los movimientos que has realizado se han impreso en pantalla (soy majo al final).

  ### ❌➕ 1x03: No ha sido cargar el juego
  El juego no ha podido ser cargado, es posible que el archivo esté corrupto o que el launcher haya mandado abrir el mismo archivo dos veces. Pruebe con otro archivo diferente.

  ### ❌ 1x04: El fichero incluye jugadas imposibles
  El fichero cargado incluye una secuencia de jugadas que no se pueden realizar. Revise el archivo. También puede ser que el launcher haya pasado las variables de algún juego anterior con lo que el programa está intentando ejecutar jugadas de un tablero anterior (ocurre con el launcher de pruebas).

## Errores de juego (2x??)

  > Estos son los errores más humanos por así decirlo.

  ### ❌|⚠️ 2x01: Ninguna pista se puede resolver 
  Se han iterado por todas las pistas al menos una vez y ninguna de ellas ha podido ser resuelto, por tanto, el ejercicio no tiene solución.

  ### ⚠️ 2x02: Puzzle muy grande
  Tamaños de n*m > 1000 pueden dar problemas ya que el máximo número de pistas que pueden existir es 1000

  ### ⚠️ 2x03: Posición introducida de tipo incorrecta
  Este tipo de error es lanzada por `Ada.Integer_Text_IO` cuando introduces un valor que no es entero. Posiblemente no genere más problemas y simplemente te solicite la posición otra vez.

  > Nota: Este error es bastante posible que ocurra porque ha introducido la posición como `5, 5`, debe introducirla como `5 5`.

## Errores de programa (3x??)

  > Estos son los errores más de programación por así decirlo

  ### ❌➕ 3x01: Error al añadir a la lista dinámica
  No se ha podido añadir la pista correcta a la lista dinámica.

  ### ⚠️➕ 3x02: Error al mostrar la lista dinámica
  El subprograma que muestra la lista dinámica ha fallado, probablemente porque ha intentado acceder a un `null`. Es bastante posible que la lista esté incompleta.

  ### ⚠️➕ 3x03: Error al mostrar la lista estática
  El subprograma que muestra la lista estática ha fallado. Es bastante posible que la lista esté incompleta y haga complicado seguir jugando. También es posible que sea porque la lista estática está vacía.

  ### ❌➕ 3x04: Posición a buscar equivocada
  Este error viene debido a que la posición que envías una posición equivocada a buscar al subprograma `Es_Posible_Resolver` con lo que los subprogramas `Es_Esquina`, `Es_Lateral` y `Es_Interior` no se pueden llamar correctamente, esto es posible que ocurra debido a un error al administrar la lista dinámica, ya que debido a esa situación se descubrió este error.
  
  ### ⚠️➕ 3x05: Error al solicitar la posición
  Este es un error genérico que es lanzado por el subprograma que solicita la posición, posiblemente no genere más problemas y simplemente te solicite la posición otra vez.