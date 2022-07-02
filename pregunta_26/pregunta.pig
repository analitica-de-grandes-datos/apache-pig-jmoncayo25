/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname 
   FROM 
       u 
   WHERE 
       SUBSTRING(firstname, 0, 1) >= 'm';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

datos = LOAD 'data.csv' USING PigStorage(',') AS(n:int, nombre:chararray, apellido:chararray, fecha:chararray, color:chararray, key:int);
extraccion = FILTER datos BY SUBSTRING(nombre, 0, 1) >= 'M';
extraccion_generate = FOREACH extraccion GENERATE nombre;
STORE extraccion_generate INTO 'output/' using PigStorage(',');
