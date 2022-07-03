/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       REGEX_EXTRACT(birthday, '....-..-..', 2) 
   FROM 
       u;

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

datos = LOAD 'data.csv' USING PigStorage(',') AS(n:int, nombre:chararray, apellido:chararray, fecha:chararray, color:chararray, key:int);
specific_columns = FOREACH datos GENERATE fecha;
extraccion = FOREACH specific_columns GENERATE SUBSTRING(fecha, 5, 7);
STORE extraccion INTO 'output/' using PigStorage(',');
