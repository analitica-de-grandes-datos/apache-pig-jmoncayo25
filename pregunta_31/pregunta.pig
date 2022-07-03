/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Cuente la cantidad de personas nacidas por año.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

datos = LOAD 'data.csv' using PigStorage(',') AS (id:int,  nombre:chararray, apellido:chararray, fecha:chararray, color:chararray, key:int);
datos2 = FOREACH datos GENERATE SUBSTRING(fecha, 0, 4) as annio;
datos3 = GROUP datos2 BY annio;
datos4 = FOREACH datos3 GENERATE group, COUNT(datos2);
STORE datos4 INTO 'output/' using PigStorage(',');
