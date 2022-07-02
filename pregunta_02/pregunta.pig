/*
Pregunta
===========================================================================

Ordene el archivo `data.tsv`  por letra y valor (3ra columna). Escriba el
resultado separado por comas.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

     >>> Escriba el codigo del mapper a partir de este punto <<<
*/
orden = LOAD 'data.tsv' USING PigStorage('\t') AS(letra:chararray, fecha:chararray, numero:int);
columnas = FOREACH orden GENERATE letra, fecha, numero;
ordenar = ORDER columnas BY numero;
STORE ordenar INTO 'output' using PigStorage(',');
