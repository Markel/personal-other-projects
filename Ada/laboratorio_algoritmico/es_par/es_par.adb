WITH Ada.Text_IO, Ada.Integer_Text_IO;
 USE Ada.Text_IO, Ada.Integer_Text_IO;

PROCEDURE es_par IS
  PROCEDURE calcular_si_es_par (
    numero: in Natural;
    resultado: out Boolean
  ) IS
  BEGIN
    resultado := (numero rem 2) = 0;
  END calcular_si_es_par;

  numero: Natural;
  es_par: Boolean;
BEGIN
  Put("Introduce el numero a calcular:"); 
  Get(numero);
  calcular_si_es_par(numero, es_par);
  Put("es_par = ");
  Put(Boolean'Image(es_par));
END es_par;