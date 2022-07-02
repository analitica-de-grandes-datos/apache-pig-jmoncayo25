/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname,
       color
   FROM 
       u 
   WHERE color = 'blue' AND firstname LIKE 'Z%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

*/
datos = LOAD 'data.csv' USING PigStorage(',') AS(n:int, nombre:chararray, apellido:chararray, fecha:chararray, color:chararray, key:int);
specific_columns = FOREACH datos GENERATE nombre, color;
filtering = FILTER specific_columns BY (color == 'blue') AND (nombre MATCHES '.*^Z.*');
STORE filtering INTO 'output';
