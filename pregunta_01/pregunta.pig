/* 
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra.
Almacene los resultados separados por comas. 

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
conteo = LOAD 'data.tsv' USING PigStorage('\t') AS(letra:chararray, fecha:chararray, numero:int);
specific_columns = FOREACH conteo GENERATE letra;
grouped = GROUP specific_columns BY letra;
conteo_letra = FOREACH grouped GENERATE group, COUNT(specific_columns);
STORE conteo_letra INTO 'output' using PigStorage(',');
