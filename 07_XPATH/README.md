nde XPATH!!")

# XPath (XML Path Language)

Permite filtrar la información contenida en un documento XML. Sirve para hacer búsquedas en un fichero XML

## Rutas a elementos

El siguiente sería un resumen de las Expresiones **XPath** más importantes

### Absoluta: 

    '/raiz/elemento1/elemento2' 
    devuelve todos los nodos 'elemento2' contenidos en 'raiz/elemento1'
    
### Relativa:

Para ello debemos situarnos en un nodo especifico, a partir de ahí, las búsquedas serían relativas a ese nodo

    'elemento2' 
    devuelve todos los nodos 'elemento2' desde el nodo que nos encontremos

    'elemento1/elemento2' 
    nodos 'elemento2' que sean hijos de 'elemento1' desde el nodo que nos encontremos

### Búsquedas en todo el documento

Si la expresión comienza por '//' se trata de una búsqueda en cualquier lugar del documento

    '//elemento2' 
    devuelve todos los nodos 'elemento2' se encuentren donde se encuentren en el documento
    '//elemento1/elemento2' 
    devuelve nodos 'elemento2' que sean hijos de 'elemento1' este donde este el nodo 'elemento1'

### Indicando el comienzo de la ruta y el final, quedando la parte intermedia variable

    '/raiz/elemento1//elemento3' 
    devuelve los nodos 'elemento3' que sean sucesores de 'raiz/elemento1'

### Seleccionando nodos de texto:

    '//elemento1/text()'
    devuelve todos los nodos texto de los nodos 'elemento1'

### Seleccionando atributos:    
Se utiliza '@' para acceder a los atributos de un nodo

    '/raiz/elemento1/elemento2/@id' 
    devuelve todos los atributos id que estén en /raiz/elemento1/elemento2
    '//@id' 
    devuelve los atributos 'id' de cualquier elemento

### Seleccionando el propio nodo:
Cuando estamos trabajando con rutas relativas, muchas veces queremos acceder al propio nodo, esto lo hacemos con "." (punto). Sería como el "this" de java. Por ejemplo, si queremos recorrer todas las canciones en un "for-each" y dentro del nodo canción hay un texto con el todo de la canción.

    <xsl:for-each select="canciones/cancion">
        <tr>
            <td><h4>Canciones</h4></td> 
            <td><xsl:value-of select="."/></td>
        </tr>
    </xsl:for-each>

Esta parte se verá mejor en el siguiente ejemplo con XSLT
 
## Predicados

Los predicados '[]' son condiciones que le ponemos a las expresiones XPATH para que filtre la búsqueda. Algunos ejemplos:

    '/raiz/elemento1[1]' primer elemento 'elemento1' que sea hijo de 'raiz'
    '/raiz/elemento1[1]/elemento2' 'elemento2' del primer 'elemento1' de 'raiz' Ej:
        /cruceros/crucero[1]/detalles/cia
    '/elemento1/elemento2[last()]' el ultimo. Ej:
        /cruceros/crucero[1]/escalas/escala[last()]
    '/elemento1/elemento2[last()-1]' el penultimo
    '/elemento1/elemento2[position()<3]' los dos primeros (el primero es el 1)
    '//elemento1[@id]' aquellos 'elemento1' (no importa donde estén) que tienen el atributo "id"
    '//elemento1[@nombre='tony']' aquellos 'elemento1' (no importa donde esten) que tienen el atributo "nombre" cuyo valor sea "tony"
    '/elemento2[elemento3>35.00]' aquellos 'elemento2' que contienen un 'elemento3' de valor superior a 35 . Ej
        //crucero[detalles/cia = "MSC Cruceros"]
    '/elemento2[elemento3>35.00]/elemento4' aquellos elemento4 que estén en /elemento2/elemento3 y cuyo valor del elemento 3 sea mayor que 35. 
    
**Nota** siempre se devuelve los últimos elementos de la expresión XPATH

## Seleccionando nodos desconocidos

    '//elemento1/*' Todos los hijos de 'elemento1'

## Seleccionando varias rutas

    '//elemento1/elemento2 | //elemento3/elemento4'

## Operadores

    |       Computes two node-sets  Ej: //book | //cd
    +       Addition    Ej: 6 + 4
    -       Subtraction Ej: 6 - 4
    *       Multiplication      Ej: 6 * 4
    div     Division    Ej: 8 div 4
    =   eq  Equal   Ej: price=9.80
    !=  ne  Not equal   Ej: price!=9.80
    <   lt  Less than   Ej: price<9.80
    <=  le  Less than or equal to   Ej: price<=9.80
    >   gt  Greater than    Ej: price>9.80
    >=  ge  Greater than or equal to    Ej: price>=9.80
    or      or  Ej: price=9.80 or price=9.70
    and     and     Ej: price>9.00 and price<9.90
    mod     Modulus (division remainder)    Ej: 5 mod 2

## Ejecutar XPATH en Visual Studio Code

Necesitamos algún plugin como puede ser XML Tools, instalamos esta herramienta y podemos ejecutar comandos XPATH en la paleta de comandos, pasos:

    1. Seleccionar el fichero XML donde queremos hacer las búsquedas
    2. Seleccionamos: view -> command palette
    3. Poner la sentencia "XML Tools: Evaluate XPath"

## Ejecutar XPATH en ELIPSE

En Eclipse hay una vista sobre la que podemos ejecutar Xpath
windows -> show view -> other -> XML -> xpath

## Bibliografía

- <https://developer.mozilla.org/es/docs/Web/XPath>
- <https://www.w3schools.com/xml/xpath_intro.asp>
- <https://www.mclibre.org/consultar/xml/lecciones/xml-xpath.html>


