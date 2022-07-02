/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
aparece cada letra minúscula en la columna 2.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
datos = LOAD 'data.tsv' AS (letra:int, bolsa:BAG{(letras:chararray)}, mapa:MAP[]);
letras = FOREACH datos GENERATE FLATTEN(bolsa) as letra;
grouped = GROUP letras by letra;
letra_count = FOREACH grouped GENERATE group, COUNT(letras);
STORE letra_count INTO 'output' using PigStorage(',');
