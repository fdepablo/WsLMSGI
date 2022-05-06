![XPATH](img/xpath.png "XPATH!!")

# XPath (XML Path Language)

El uso principal que tiene XPath es la navegar a través de nodos de un documento XML. Gracias a XPath podemos filtrar información o realizar consultas en XML.

XPath tiene las siguientes características:

1. XPath usa **expresiones de ruta** para identificar y navegar a través de nodos XML.
2. XPath contiene más de 200 funciones predefinidas. 
3. XPath es usado principalmente en otros lenguajes como XSLT.
4. XPath es una recomendación de la W3C.

Para trabajar con XPath hay que tener claro conceptos de XML, tales como:

1. En XML, tenemos diferentes tipos de nodos, los más importantes serían **elementos, atributos, texto y comentarios**
2. Los documentos XML son tratados como un árbol de nodos. El nodo padre de todos los nodos es llamado **root element o elemento raíz**

## Ejecutar expresiones XPath en Visual Studio Code

Para VSC, necesitamos algún plugin, como puede ser XML Tools. Una vez instalado el plugin, podemos ejecutar comandos XPath en la **paleta de comandos** siguiendo los siguientes pasos:

1. Seleccionar el fichero XML donde queremos hacer las búsquedas y a continuación pinchar dentro del fichero (en cualquier lugar).
2. Ver -> Paleta de comandos o pulsando **ctrl + mayus + p**.
3. Escribimos "XML Tools: Evaluate XPath". Se abrirá una pequeña ventana donde podemos escribir la expresión XPath.

Podemos ahorrarnos el paso 2 y 3 pulsando **ctrl + mayus + alt + X**.

¡OJO!, siempre que queramos ejecutar una expresión XPath **debemos de hacer el paso 1** (aunque veamos el XML en la pantalla de VSC, siempre pulsar dentro del XML antes de poner la expresión XPath).

## Ejecutar expresiones XPath en Eclipse

Dentro del IDE Eclipse hay una vista sobre la que podemos ejecutar XPath, para ejecutar dicha vista podemos ir a:
    
    windows -> show view -> other -> XML -> XPath

Dentro de esa vista podemos ejecutar las expresiones XPath.

## Expresiones XPath y operadores más importantes

XPath usa **expresiones de ruta** para seleccionar nodos o un conjunto de nodos en un documento XML. Estas expresiones se parecen mucho a las rutas que usas en un sistema tradicional de ficheros.

    /pelicula/actores/actor/nombre

Vamos a ver las **expresiones XPath** más importantes con algunos ejemplos sobre el XML de “Película” y de "Cruceros":

1. **NOMBRE_DEL_NODO** : Selecciona todos los nodos con el nombre 'NOMBRE_DE_NODO'. La selección es **relativa** desde el nodo que nos encontremos. Para ello debemos situarnos en un nodo específico, a partir de ahí, las búsquedas serían relativas a ese nodo. Esto cobra más sentido cuando trabajamos con XSLT, en esta lección vamos a usar las rutas que empiezan por **/** (siguiente punto).

        'titulo' -> selecciona todos los nodos 'titulo' desde el nodo que nos encontremos
        'actores/actor' -> selecciona todos los nodos 'actor' que sean hijos directos de 'actores' desde el nodo que nos encontremos

2. **(barra normal) <code>/</code>** : Selección del nodo raíz del documento. Las rutas que empiezan por '/' las podemos entender como absolutas al documento ya que empezamos seleccionando el nodo raíz.

        '/pelicula/titulo' -> selecciona los nodos 'titulo' que sean hijos directos de '/pelicula'
        '/pelicula/actores/actor' -> selecciona los nodos 'actor' que sean hijos directos de '/pelicula/actores'

        '/cruceros/crucero/detalles/informacion' -> selecciona los nodos 'informacion' que sean hijos directos de '/cruceros/crucero/detalles'
        '/cruceros/informacion' -> selecciona los nodos 'informacion' que sean hijos directos de '/cruceros'
    
3. **(doble barra normal) <code>//</code>** : Selección de nodos desde el nodo actual en cualquier parte del documento, sin importar de donde se encuentren. Es muy útil para hacer búsquedas sin conocer la estructura del documento.

        '//actor' -> selecciona todos los nodos 'actor' en cualquier parte del documento
        '//titulo' -> selecciona todos los nodos 'titulo' en cualquier parte del documento

        '//informacion' -> selecciona todos los nodos 'informacion' en cualquier parte del documento. Nótese que se seleccionan tanto los que están en '/cruceros' como los que están en '/cruceros/crucero/detalles'

4. **(Arroba) <code>@</code>** : Selección de los nodos atributo.

        '/pelicula/@id' -> selecciona todos los atributos 'id' que estén en '/pelicula/'
        '//@id' -> selecciona todos los atributos 'id' en cualquier parte del documento

        '/cruceros/crucero/escalas/escala/@dia' -> selecciona todos los atributos 'dia' que estén en '/cruceros/crucero/escalas/escala'

5. **text()** : Selección de los nodos texto.

        '/pelicula/titulo/text()' -> selecciona el nodo texto de '/pelicula/titulo'

6. **(punto) <code>.</code>** : Selección del propio nodo. Cuando estamos trabajando con rutas relativas, muchas veces queremos acceder al propio nodo. Sería como el **this** de java. Esto cobra mucho más sentido cuando trabajamos con XSLT. Ejemplo de XSLT (se ve en detalle en la siguiente lección).

        <xsl:for-each select="actores/actor">
            <xsl:value-of select="."/>
        </xsl:for-each>

7. **(doble punto) <code>..</code>** : Selección del nodo padre. Al igual que el **(punto) .**, esto cobra más sentido cuando lo usamos con XSLT.

8. **(pipe) <code>|</code>** : Unión de dos conjuntos de nodos. 

        '//actor | //titulo' -> seleccionamos los nodos 'actor' y 'titulo' que estén en cualquier parte del documento

## Predicados

Los predicados son condiciones que le ponemos a las expresiones XPATH para que filtre la búsqueda, son usados para encontrar un nodo especifico o un nodo que contenga un valor especifico. 

Los predicados van entre corchetes **[]**, y será evaluado como un 'Boolean'. Si el 'Boolean' se evalua como **true**, el nodo es incluido en el conjunto seleccionado, si se evalúa como **false** será excluido. Veamos algunos reglas

1. Dentro de los predicados podemos poner el número de nodo que queremos que nos seleccione, y así evitar seleccionar todos los nodos que cumplan con la expresión.

        '/pelicula/actores/actor[1]' -> selecciona el primer 'actor' que sea hijo de '/pelicula/actores'. Dicho con otras palabras, seleccionamos el primer actor de la película.
        '/pelicula/actores/actor[1]/nombre' -> seleccionamos el nombre del primer actor de la pelicula. Nótese que, en este caso no sé pone al final el predicado, el predicado se pone en el actor. 
        '/pelicula/actores/actor/nombre[1]' -> selecciona el primer nombre de los actores, solo sería útil si tuviéramos varios nodos nombres por actor. Este ejemplo es para ver las diferencias con el caso anterior.

        '/cruceros/crucero[2]' -> selecciona el segundo crucero que sea hijo de '/cruceros'. Dicho con otras palabras, seleccionamos el segundo crucero.
        '/cruceros/crucero[1]/detalles/cia' -> selecciona la 'cia' (compañia) perteneciente al primer hijo de '/cruceros/crucero'. Dicho con otras palabras, seleccionamos la compañía del primer crucero. 
        '/cruceros/crucero[2]/escalas/escala[1]/parada' -> seleccionamos la parada de la primera escala del segundo crucero del documento. 

2. Podemos usar atributos dentro de los predicados. Suele ser más útil si lo combinamos con operadores

        '/cruceros/crucero/escalas/escala[@dia]' -> selecciona todos los nodos 'escala' que tengan el atributo 'dia'
        '/cruceros/crucero[1]/escalas/escala[@dia]' -> selecciona del primer crucero todos los nodos 'escala' que tengan el atributo 'dia'.
        '/cruceros/crucero[1]/escalas/escala[@dia = 2]' -> selecciona del primer crucero todos los nodos 'escala' que tengan el atributo 'dia' igual a '2'

3. También admiten algunas funciones, como **last()** que selecciona el último nodo, útil cuando no conocemos el número exacto de nodos:

        '/pelicula/actores/actor[last()]' -> selecciona el último actor.
        '/cruceros/crucero[last()]/escalas/escala[last()]' -> selecciona la última escala del último crucero.
        '/cruceros/crucero[last()]/escalas/escala[last()]/parada' -> selecciona la parada de la última escala del último crucero. 

4. La función **position()** nos devuelve la posición actual del nodo, normalmente la combinamos con un operador:

        '/pelicula/actores/actor[position() < 3]/nombre' -> selecciona el nombre de los dos primeros actores.

## Otros operadores

Vamos a ver algunos otros operadores que podemos usar en XPath dentro de los predicados:

1. **(simbolo más) <code> + </code>** : Suma.

        '/pelicula/actores/actor[1 + 1]/nombre' -> selecciona el nombre del segundo actor

2. **(simbolo menos) <code> - </code>** : Resta.

        '/pelicula/actores/actor[last() - 1]/nombre' -> selecciona el nombre del penúltimo actor

3. **(simbolo multiplicar) <code> * </code>** : Multiplicación. Ej. [6 * 4]
4. **<code> div </code>** : división. Ej. [8 div 4]
5. **(simbolo igual) <code> = </code>** : Igual.

        '/cruceros/crucero[detalles/cia = "MSC Cruceros"]' -> selecciona los cruceros cuya 'cia' sea igual a "MSC Cruceros"
        '/cruceros/crucero[detalles/cia @eq "MSC Cruceros"]/detalles/fechaSalida' -> selecciona la fecha de salida de los cruceros cuya 'cia' sea igual a "MSC Cruceros"

6. **<code> != </code>** : Distinto.

        '/cruceros/crucero[detalles/cia != "MSC Cruceros"]/detalles/fechaSalida' -> selecciona la fecha de salida de los cruceros cuya 'cia' sea diferente a "MSC Cruceros"

7. **<code> < </code>** : Menor.

        '/cruceros/crucero[detalles/dias < 7]/detalles/informacion' -> La información de los cruceros cuyo número de días sea menor a una semana (7)

8. **<code> <= </code>** : Menor o igual. Ej. dias <= 4
9. **<code> > </code>** : Mayor. Ej. dias > 4
10. **<code> >= </code>** : Mayor o igual. Ej. dias >= 4
11. **<code> or </code>** : "O" lógico.

        '//actor[edad > 35 or edad < 28]/nombre' -> selecciona el nombre de los actores cuya edad sea mayor que 35 o menor que 28

12. **<code> and </code>** : "Y" lógico.

        '//actor[edad < 35 and edad > 28]/nombre' -> selecciona el nombre de los actores cuya edad sea menor que 35 y mayor que 28

## Bibliografía

- <https://developer.mozilla.org/es/docs/Web/XPath>
- <https://www.w3schools.com/xml/xpath_intro.asp>
- <https://www.mclibre.org/consultar/xml/lecciones/xml-xpath.html>
- <https://www.w3.org/TR/xpath-31/>