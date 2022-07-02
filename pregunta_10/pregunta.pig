/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Genere una relación con el apellido y su longitud. Ordene por longitud y 
por apellido. Obtenga la siguiente salida.

  Hamilton,8
  Garrett,7
  Holcomb,7
  Coffey,6
  Conway,6

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

datos = LOAD 'data.csv' USING PigStorage(',') AS(n:int, nombre:chararray, apellido:chararray, fecha:chararray, color:chararray, key:int);
specific_columns = FOREACH datos GENERATE apellido;
size = FOREACH specific_columns GENERATE apellido, SIZE(apellido) as t;
ordenar = ORDER size BY t DESC;
limite = LIMIT ordenar 5;
STORE limite INTO 'output' using PigStorage(',');
