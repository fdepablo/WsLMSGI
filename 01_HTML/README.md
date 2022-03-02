![HTML](img/HTML5.png "Aprende HTML!!")

# HyperText Markup Language (HTML)

HTML es un lenguaje de etiquetas usado por los diseñadores y programadores para crear páginas web.

Este lenguaje es un estándar reconocido por todo el mundo. Sus normas las define un organismo sin ánimo de lucro llamado [World Wide Web Consortium](https://www.w3.org/)

Se ha convertido en el estándar de visualización de la información, siendo la vista de muchas aplicaciones, tanto de las páginas web más tradicionales como de aplicaciones de servidor para servicios empresariales.

Una **tag** o **etiqueta** es la marca que usa el lenguaje para delimitar a un elemento específico.

Las etiquetas o marcas están definidas por caracteres de escape que indican al software que lee el documento cuándo comienza y acaba el tag o etiqueta. En lenguajes de marcado como HTML existen etiquetas o marcas que usan el carácter “<” para abrir, o el “/>” para cerrar la etiqueta.

Empecemos por mostrar un poco de código de una página HTML en su formato más básico:

    <!DOCTYPE html>
    <html>
        <head>
            <title>Mi primer documento HTML</title>
        </head>

        <body>
            <p>Hola Mundo</p>
        </body>
    </html>

Las partes más importantes de un fichero HTML son las siguientes:

1. Etiqueta DOCTYPE, informa al navegador del tipo de documento y cuál es la versión. En este caso estamos definiendo un documento HTML version 5 (HTML5). Para hacer documentos de versiones anteriores a la 5, la etiqueta era bastante más complicada de escribir.
1. Etiqueta HTML, es donde esta limitado todo nuestro codigo HTML
2. Etiqueta HEAD, elemento que contiene los encabezados de la página. Esta etiqueta suele incluir:
    - Etiquetas meta, que llevan información interna de la página web. También llamadas "metatags" y sirven para integrar metadatos sobre la página. Normalmente se utilizan para dar información a los motores de búsquedas (por ejemplo Google) y mejorar la indexación de la página. Esto es importante a la hora del posicionamiento web. 
    - Etiqueta title, que lleva el nombre que aparecerá en la pestaña o en la barra del navegador.
    - Recursos enlazados, para enlazar fuentes de recursos con la página, como puede ser CSS o JavaScript
3. Etiqueta BODY, define el cuerpo del documento HTML, en esta se incluyen todas las etiquetas que veremos a continuación en el curso, y por supuesto los atributos y el texto o contenido de cada elemento. Es posiblemente la etiqueta más importante, ya que será lo que el usuario final verá en la página.

Todas las etiquetas anteriores serían obligatorias para tener un documento HTML bien formado. Si no las ponemos, entonces dependerá del navegador el que se ejecute correctamente.

## HTML5

HTML5 es la última actualización de HTML. HTML5 también es un termino que sirve para agrupar las  tecnologías web HTML5, CSS3 y nuevas capacidades de JavaScript.

La necesidad de esta nueva versión viene por que su antecesora HTML4, que carece de las características necesarias para la creación de aplicaciones modernas.

Por ejemplo, el declive de uso de Adobe Flash para dotar de dinamismo nuestras páginas, ha llevado a que HTML5 disponga de herramientas para que nuestros navegadores puedan gestionar audio, vídeo, animaciones vectoriales, componentes de interfaz, entre muchas otras cosas. Ahora HTML5 es capaz de hacer esto sin necesidad de plugins y con una gran compatibilidad entre navegadores.

Dentro de HTML5 podemos encontrar 3 grandes tecnologías: HTML5, CSS3 y JavaScript. Cada una de estas tecnologías tendrá una función dentro de una página web:
1. La estructura de la pagina la lleva HTML (Etiquetas HTML)
2. Los estilos de la pagina lo lleva CSS (los colores, los tamaños de las letras, la colocacion de las etiquetas, etc.)
3. La funcionalidad de la pagina la lleva JavaScript (lo que puede hacer la pagina web cuando pulsamos un boton, por ejemplo)

Para saber si nuestro código cumple los estándares de HTML5 podemos utilizar las herramientas de validación disponibles en Internet. [Validador](http://validator.w3.org/.)

## Como comenzar

Podemos empezar a ver los ejemplos que estan numerados dentro de esta carpeta (01_HTML)

**Nota**: Para crear un fichero HTML con VSC debemos crear un nuevo fichero con extensión .html. Para rellenar un contenido básico debemos de poner dentro del fichero "html:5" y pulsar enter. Esto último solo funcionaría si tenemos instalada la extensión "beautify"

## Bibliografía
- <https://www.w3schools.com/html/default.asp>
- <https://developer.mozilla.org/es/docs/conflicting/Web/HTML/Element>
