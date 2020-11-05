package NOV_2 is
   VACIO: constant INTEGER := Integer'First;
   type T_Lista is array (Integer range <>) of INteger;
   -- T_Vector contiene elementos en las primeras posiciones hasta encontrar un elemento VACIO (el resto no es importante)

   procedure Insertar_F (L: in out T_Lista; X: in Integer);
   --pre:  L tiene una lista de elementos terminada en un elemento VACIO y hay hueco para un elemento más
   --post: L tiene la misma lista que al principio y X al final de la lista

   procedure Insertar_3 (L: in out T_Lista; X: in Integer);
   --pre:  L tiene una lista de elementos terminada en VACIO
   --post: L tiene la misma lista que al principio con X entre el elemento 2 y 3 de la lista inicial
   --      Si L tiene 1 elemento (pos 2 VACIO), se deja tal cual

   procedure Modificar_3 (L: in out T_Lista; Incremento: in Integer);
   --pre:  L tiene una lista de elementos terminada en VACIO
   --post: L tiene la misma lista que al principio conel tercer elemento cambiado para incorporar el incremento o decremento
  --      Si L tiene 2 o menos elementos, se deja tal cual

   procedure Borrar_3 (L: in out T_Lista);
   --pre: L tiene una lista de elementos terminada en VACIO
   --post: L tiene la misma lista que al principio menos el elemento que estaba en la posición 3 (y el resto desplazado)
  --      Si L tiene 2 o menos elementos, se deja tal cual

   procedure Ordenar_Burbuja(L: in out T_Lista);
   --pre: L tiene una lista de elementos  a ordenar (quitamos la restriccion terminada en VACIO)
   --post: L tiene la misma lista que al principio ordenada de menor a mayor

   procedure Ordenar_Insercion(L: in out T_Lista);
   --pre: L tiene una lista de elementos  a ordenar (quitamos la restriccion terminada en VACIO)
   --post: L tiene la misma lista que al principio ordenada de menor a mayor

   procedure Ordenar_seleccion(L: in out T_Lista);
   --pre: L tiene una lista de elementos  a ordenar (quitamos la restriccion terminada en VACIO)
   --post: L tiene la misma lista que al principio ordenada de menor a mayor

   procedure Imprimir(L: in T_Lista);


end NOV_2;

