![DTD](img/Validar_XML.jpg "Validando XML!!")

# Document Type Definition (DTD)

## Introducción

Un DTD es un conjunto de reglas sintácticas para definir etiquetas. 

Nos indica qué etiquetas se pueden usar en un documento, en qué orden deben aparecer, cuáles pueden aparecer dentro de otras, cuáles tienen atributos, etc.

El DTD del lenguaje XML es opcional. En tareas sencillas no es necesario construir una DTD, entonces se trataría de un documento "bien formado"(well-formed) y si lleva DTD será un documento "validado" (valid). 

Tambien podemos validar XML con XSD que veremos en la lección siguiente.

DTD describe un formato de datos.

   1. <b>Elementos:</b> cuáles son las etiquetas permitidas y cuál es el contenido de cada etiqueta.
   2. <b>Estructura:</b> en qué orden van las etiquetas en el documento.
   3. <b>Anidamiento:</b> qué etiquetas van dentro de cuáles.

## Sintaxix

El documento XML suele comenzar por una instrucción de procesamiento para el procesador de XML. En esta instrucción se indica el tipo de normalización que sigue el documento según el estándar XML y la codificación.

    <?XML version="1.0"encoding="UTF-8"?>

Después suele comenzar el DTD, que puede ser referenciado por un enlace o descrito manualmente en el propio documento. Para definir el DTD utilizamos la sintaxis:

    <! DOCTYPE[
        definiciones
    ]>

Donde en definiciones se incluyen todas las declaraciones que puede contener el DTD. Si se referencia a un estándar externo se utiliza la palabra SYSTEM de la siguiente forma:

    <! DOCTYPE etiqueta SYSTEM "documento.dtd">

Ejemplo de un XML con un DTD interno

```
    <?xml version=”1.0” encoding=”UTF-8”?>
    <!DOCTYPE ligaDeFutbol [
        <!ELEMENT ligaDeFutbol (partido*)>
        <!ELEMENT partido EMPTY>
        <!ATTLIST partido localNombre CDATA #REQUIRED>
        <!ATTLIST partido localGoles CDATA #REQUIRED>
        <!ATTLIST partido visitanteNombre CDATA #REQUIRED>
        <!ATTLIST partido visitanteGoles CDATA #REQUIRED>
    ]>


    <ligaDeFutbol>
        <partido localNombre=”Nottingham Presa” localGoles=”0” visitanteNombre=”Inter de Mitente” visitanteGoles=”1” />
        <partido localNombre=”Vodka Juniors” localGoles=”3”  visitanteNombre=”Sparta da Risa” visitanteGoles=”3” />
        <partido localNombre=”Water de Munich” localGoles=”4” visitanteNombre=”Esteaua es del grifo” visitanteGoles=”2” />
    </ligaDeFutbol>

```
## Elementos

Si queremos describir un elemento que contenga otro elemento pondremos entre paréntesis los elementos que se pueden introducir.

    <!ELEMENT tag (tag1, tag2)>

### Cardinalidades de los elementos 

   1. Si un elemento es opcional pondremos "?".
   2. Si la cardinalidad de un elemento es entre 0 y N pondremos "*".
   3. Si la cardinalidad de un elemento es entre 1 y N pondremos "+".
   4. Con "|" indicamos que un elemento es opcional entre dos, pero tendremos que elegir entre uno de ellos.

    <!ELEMENT tag (tag1 | tag2, tag3 +, tag4 *, tag5 ?)>

Ejemplos validos:

```
    <tag>
        <tag2></tag2>
        <tag3></tag3>
        <tag3></tag3>	
    </tag>

    <tag>
        <tag2></tag2>
        <tag3></tag3>
        <tag3></tag3>	
        <tag4></tag4>	
        <tag4></tag4>	
        <tag5></tag5>	
    </tag>

```
Ejemplos NO validos:

```
    <tag>
        <tag1></tag1>
        <tag2></tag2>
        <tag3></tag3>
    </tag>

    <tag>
        <tag2></tag2>
        <tag4></tag4>	
        <tag4></tag4>	
        <tag5></tag5>	
    </tag>
```


### Contenido de los elemento (vacios, nodos texto, etc)

Para los elementos que no contienen a otros elementos indicaremos si están vacíos (Empty), cualquier contenido (Any) o solo datos ([#PCDATA]).

    <!ELEMENT texto #PCDATA>
    <!ELEMENT salto EMPTY>
    <!ELEMENT extra ANY>

Ejemplo:

```
    <?xml version="1.0"?>
    <!DOCTYPE note [
        <!ELEMENT note (to,from,heading,body)>
        <!ELEMENT to (#PCDATA)>
        <!ELEMENT from (#PCDATA)>
        <!ELEMENT heading (#PCDATA)>
        <!ELEMENT body (#PCDATA)>
        <!ELEMENT important (EMPTY)>
    ]>

    <note>
        <to>Tove</to>
        <from>Jani</from>
        <heading>Reminder</heading>
        <body>Don't forget me this weekend</body>
        <important/>
    </note>
```
En el ejemplo anterior podemos ver que el DTD define las etiquetas que estarán dentro de la etiqueta "note", no permitiendo el uso de las no indicadas (to, from, heading, body e important).

También definimos que cada una de las etiquetas contendrá datos (#PCDATA) e important sera nodo vacio (EMPTY).  

De este modo, si falta alguno de los elementos indicados o el contenido no es el indicado, el XML no se validará.

## Atributos

Los atributos permiten añadir información adicional a los elementos de un documento. La principal diferencia entre los elementos y los atributos es que los atributos no pueden ser anidados (no tienen hijos).

Definición de un atributo en un DTD

    <!ATTLIST ElementoAsociado NomAtributo TIPO VALOR_PREDETERMINADO>

Para definir el tipo del atributo podemos encontrar entre los más importantes:

   1. <b>CDATA</b> Los atributos CDATA (character data) son los más sencillos, y pueden contener casi cualquier cosa. Es el más habitual para usar
   2. <b>ID</b> Nombre que identifica inequívocamente a la etiqueta.
   3. <b>Lista de nombres </b> Si se especifica una lista de nombres separados por "pipes", indica que al usar el atributo se debe seleccionar uno de esa lista.
   4. <b>NMTOKENS</b> (nmtokens) Se parecen a CDATA, pero solo aceptan denominar cosas con caracteres validos (letras, números, puntos, guiones, subrayados y los dos puntos).
   5. <b>ENTITY</b> (entities) Es el valor de una entidad o entidades separadas por coma.

Para definir el valor predeterminado del atributo podemos encontrar entre los más importantes:

   1. <b>#REQUIRED</b> Indica que el atributo es requerido siempre que se use la etiqueta
   2. <b>#VALOR</b> Indica un valor que se usará por defecto si no se especiﬁca el valor del atributo
   3. <b>#IMPLIED</b> Indica un valor que se usará por defecto si no se especiﬁca el valor del atributo. Tambien podemos entenderlo como optativo
   4. <b>#FIXED</b> Indica que el atributo siempre tiene el valor, aunque no se especiﬁque

Ejemmplos
```
    <!ATTLIST curso
        director CDATA #REQUIRED
        horario (mañana | tarde | noche) #IMPLIED
        instalaciones (Exes | externas) “Exes”
    >
```

En el ejemplo de arriba tenenos que la etiqueta curso debe de tener los siguientes atributos:

   1. atributo director de tipo CDATA y obligatorio
   2. atributo horario, cuyos valores pueden ser "mañana", "tarde" o "noche"
   3. atributo instalaciones, cuyos valores pueden ser "Exes" o "externas". El valor por defecto será "Exes"

## Entidades

Las entidades permiten colocar trozos de contenido en cualquier lugar del documento haciendo referencia a su nombre. Para definir una entidad usamos la etiqueta !ENTITY.

Ya hemos visto entidades a lo largo del curso, como la entidad "(&)ntilde;" que sirve para poner la letra "ñ" o la entidad "(&)lt;" que sirve para poner un "<". Nota: se pone el caracter "&" entre parentesis ya que Markdown lo transformaría a "ñ" y a "<" respectivamente cuando lo establezcamos en "preview mode"

Podemos distinguir entidades internas o externas

### Entidades internas

También llamadas macros o constantes de texto. Las entidades internas son las que se asocian a una cadena de caracteres. Se referencian únicamente desde el propio fichero, de ahí su nombre, internas.

    <!ENTITY tag "Tony Stark">

Son abreviaturas que se usan dentro del documento para simplificar. Cuando se procese el documento estas abreviaturas serán sustituidas por el nombre completo. Para deﬁnirlas se usa:

    <!ENTITY tag "texto sustituyo">

Para referenciar la entidad dentro del documento usamos "&nombre_entidad", donde cada vez que usemos &ISO en el documento aparecerá el nombre completo.

    <!ENTITY ISO "International Organization for Standadization">

### Entidades externas

Las entidades externas son similares a las internas, con la diferencia de que obtienen el contenido fuera del documento, pudiendo ser incluso imágenes o archivos de sonido. Se utiliza la palabra SYSTEM para indicar que es externo:

    <!ENTITY entity-name SYSTEM "URI/URL">

Los parámetros solo se pueden referenciar en la DTD del documento. Se utiliza % antes del nombre para referenciar y se definen de la forma:

    <!ENTITY %parametro "texto">

## Como comenzar
Practicamente toda esta documentación se ha sacado de la unidad formativa 3.2.2 XML. Podemos verla para repasarla

Luego, podemos empezar a ver los ejemplos que estan numerados dentro de esta carpeta

## Bibliografía
- <https://www.w3schools.com/xml/xml_dtd_intro.asp>
