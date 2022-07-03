/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
datos = LOAD 'data.tsv' USING PigStorage('\t') AS(letra:chararray, fecha:chararray, numero:int);
numeros = FOREACH datos GENERATE numero;
ordenar = ORDER numeros BY numero ASC;
limite_3 = LIMIT ordenar 3;
STORE limite_3 INTO 'output' using PigStorage(',');
