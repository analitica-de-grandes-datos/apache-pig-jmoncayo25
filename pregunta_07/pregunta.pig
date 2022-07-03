/*
Pregunta
===========================================================================

Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
columna 3 separados por coma. La tabla debe estar ordenada por las 
columnas 1, 2 y 3.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
datos = LOAD 'data.tsv' AS (letras:chararray, bolsa:BAG{t:tuple(p:chararray)}, mapa:[]);
specific_columns = FOREACH datos GENERATE letras, COUNT(bolsa.p) AS bolsa_column, SIZE(mapa) AS mapa_size;
ordenar = ORDER specific_columns BY letras ASC, bolsa_column, mapa_size ASC;
STORE ordenar INTO 'output' USING PigStorage(',');
