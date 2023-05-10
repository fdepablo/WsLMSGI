![DTD](img/Validar_XML.jpg "Validando XML con DTD!!")

# Document Type Definition (DTD)

## Introducción

Hasta ahora hemos visto cómo hacer documentos XML que estén bien formados, pero muchas veces también vamos a querer que los documentos XML cumplan con una estructura y unas etiquetas determinadas. DTD nos va a ayudar a hacer que cumplan con una estructura específica.

Un **DTD** es un conjunto de reglas sintácticas para definir etiquetas y validar documentos XML. Nos indica qué etiquetas se pueden usar en un documento, en qué orden deben aparecer, cuáles pueden aparecer dentro de otras, cuáles tienen atributos, etc.

El DTD del lenguaje XML es opcional. En tareas sencillas no es necesario construir una DTD. Así pues, si un XML cumple con las reglas de construcción se trataría de un documento **bien formado** y si lleva DTD será un documento **validado**. 

También podemos validar XML con **XSD** que veremos en la lección siguiente y es más potente y moderno que DTD.

DTD describe un formato de datos dentro de un fichero XML de la siguiente manera:

1. <b>Elementos:</b> cuáles son las etiquetas permitidas y cuál es el contenido de cada etiqueta.
2. <b>Estructura:</b> en qué orden van las etiquetas en el documento.
3. <b>Anidamiento:</b> qué etiquetas van dentro de cuáles.

Un DTD puede ser:

1. **Interno**, en caso de que las reglas estén dentro de un XML. 
2. **Externo**, en caso de que las reglas estén en un fichero con extensión **.dtd**

## Sintaxis

El documento XML suele comenzar por una instrucción de procesamiento para el procesador de XML. En esta instrucción se indica el tipo de normalización que sigue el documento según el estándar XML y la codificación.

    <?XML version="1.0" encoding="UTF-8"?>

Después suele comenzar el DTD, en caso de que sea interno utilizamos la sintaxis:

    <! DOCTYPE[
        reglas del documento XML
    ]>

Si se referencia a un DTD externo, se utiliza la palabra **SYSTEM** con la ubicación del DTD:

    <! DOCTYPE etiqueta_raiz SYSTEM "documento.dtd">

Ejemplo de un XML con un DTD interno

```
    <?xml version=”1.0” encoding=”UTF-8”?>
    <!DOCTYPE ligaDeFutbol [
        <!ELEMENT ligaDeFutbol (partido*)>
        <!ELEMENT partido EMPTY>
        <!ATTLIST partido nombre CDATA #REQUIRED>
    ]>

    <ligaDeFutbol>
        <partido nombre=”Nottingham Presa” />
        <partido nombre=”Vodka Juniors” />
        <partido nombre=”Water de Munich” />
    </ligaDeFutbol>

```
## Elementos

Un elemento en DTD se define con la palabra **!ELEMENT**

    <!ELEMENT DEFINICION_DEL_ELEMENTO>

Cuando definimos un elemento normalmente puede contener:

1. Otros elementos
2. Datos
3. Ser un elemento vacío

Por lo que tenemos reglas diferentes para definir cada uno de los contenidos.

### Contenido de los elemento

Si queremos describir un elemento que contenga otros elementos, pondremos entre paréntesis los elementos que se pueden introducir.

    <!ELEMENT tag (tag1, tag2,..)>

Pudiendo tener las siguientes cardinalidades, que se ponen siempre al final del elemento:

   1. Si un elemento es opcional pondremos **?**.
   2. Si la cardinalidad de un elemento es entre 0 y N pondremos <b>*</b>.
   3. Si la cardinalidad de un elemento es entre 1 y N pondremos **+**.
   4. Con **| (pipe)** indicamos que un elemento es opcional entre dos, pero tendremos que elegir entre uno de ellos.

Por ejemplo, la siguiente regla DTD

    <!ELEMENT tag (tag1 | tag2, tag3+, tag4*, tag5?)>

Permitiría los siguientes documentos XML

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

Pero **NO** permitiría los siguientes documentos XML:

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

Para los elementos que no contienen a otros elementos, indicaremos si tienen datos con **#PCDATA**, están vacíos con **EMPTY**, o cualquier tipo (datos o elementos) con **ANY**.

    <!ELEMENT texto #PCDATA>
    <!ELEMENT vacio EMPTY>
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

En el ejemplo anterior, podemos ver que el DTD define las etiquetas que estarán dentro de la etiqueta "note", no permitiendo el uso de las no indicadas, teniendo que estar las definidas y en el orden dado.

También definimos que cada una de las etiquetas contendrá datos de texto con **#PCDATA** y el elemento **important** será nodo vacío con **EMPTY**.

De este modo, si falta alguno de los elementos indicados o el contenido no es el indicado, el XML no se validará.

## Atributos

Los atributos permiten añadir información adicional a los elementos de un documento. La principal diferencia entre los elementos y los atributos es que los atributos no pueden ser anidados (no tienen hijos).

Un atributo en DTD lo podemos definir de la siguiente manera:

    <!ATTLIST ElementoAsociado NomAtributo TIPO VALOR>

Tipos de atributo, entre los más importantes:

1. <b>CDATA</b> Los atributos CDATA (character data) son los más sencillos, y pueden contener casi cualquier cosa. Es el más habitual para usar
2. <b>ID</b> Nombre que identifica inequívocamente a la etiqueta de todas las demás, es decir, no admitiría que en el documento hubiera dos elementos con el mismo valor del atributo. El valor no puede comenzar por un carácter numérico.
3. <b>Lista de nombres </b> Si se especifica una lista de nombres separados por "pipes", indica que al usar el atributo se debe seleccionar uno de esa lista.
4. <b>ENTITY</b> Es el valor de una entidad o entidades separadas por coma.

Para definir el valor predeterminado del atributo podemos encontrar entre los más importantes:

1. <b>#REQUIRED</b> Indica que el atributo es obligatorio.
2. <b>#IMPLIED</b> Indica que el atributo es optativo.
3. <b>#FIXED</b> Indica que el atributo siempre tendrá el mismo valor. Después de #FIXED debemos de poner el valor con comillas simples o dobles. También sería de carácter optativo.
4. <b>'VALOR'</b> Indica un valor predeterminado si no se especifica el valor del atributo. El valor debe de ir con comillas simples o dobles. También sería de carácter optativo.

Ejemplos
```
    <!ATTLIST curso
        director CDATA #REQUIRED
        horario (mañana | tarde | noche) #IMPLIED
        instalaciones (Exes | externas) “Exes”
    >
```

En el ejemplo de arriba tenemos que la etiqueta curso debe de tener los siguientes atributos:

   1. atributo director de tipo CDATA y obligatorio
   2. atributo horario, cuyos valores pueden ser "mañana", "tarde" o "noche"
   3. atributo instalaciones, cuyos valores pueden ser "Exes" o "externas". El valor por defecto será "Exes"

## Entidades

También llamadas macros o constantes de texto. Las entidades permiten colocar trozos de contenido en cualquier lugar del documento haciendo referencia a su nombre. Para definir una entidad usamos la etiqueta !ENTITY.

Ya hemos visto entidades a lo largo del curso, por ejemplo
    
    &ntilde; -> pone la letra "ñ"
    &lt; -> pone la letra "<"

Son abreviaturas que se usan dentro del documento para simplificar. Cuando se procese el documento estas abreviaturas serán sustituidas por el nombre completo. Para definirlas se usa:

    <!ENTITY tag "texto sustituyo">
    <!ENTITY tony "Tony Stark">
    <!ENTITY ISO "International Organization for Standadization">

Para referenciar la entidad dentro del documento usamos **&nombre_entidad;**
    
Podemos distinguir entidades internas o externas

### Entidades internas

Las entidades internas se referencian únicamente desde el propio fichero, de ahí su nombre, internas.

### Entidades externas

Las entidades externas son similares a las internas, con la diferencia de que obtienen el contenido fuera del documento, pudiendo ser incluso imágenes o archivos de sonido. Se utiliza la palabra SYSTEM para indicar que es externo:

    <!ENTITY entity-name SYSTEM "URI/URL">

## Como comenzar

Podemos empezar a ver los ejemplos que están numerados dentro de esta carpeta

## Bibliografía

- <https://www.w3schools.com/xml/xml_dtd_intro.asp>
- <https://www.liquid-technologies.com/tutorials>
