/*
Pregunta
===========================================================================

Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
columna 3. En otras palabras, cuántos registros hay que tengan la clave 
`aaa`?

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

lineas = LOAD 'data.tsv' USING PigStorage('\t') as (letra:CHARARRAY,bolsa:BAG{t: TUPLE(p:CHARARRAY)},mapa:MAP[]);
letras = FOREACH lineas GENERATE mapa AS letra;
keys = FOREACH letras GENERATE FLATTEN(KEYSET($0)) as key;
agrupar = GROUP keys BY key;
conteo = FOREACH agrupar GENERATE group, COUNT(keys);
STORE conteo INTO './output'  USING PigStorage(',');
