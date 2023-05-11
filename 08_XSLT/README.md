![XSLT](img/xslt.png "Aprende XSLT!!")

# XSLT (EXtensible Stylesheet Language Transformations)

**XSLT** es un motor para realizar transformaciones de ficheros XML a cualquier otro tipo de formato, comúnmente HTML o XML.

Un ejemplo sencillo es que partiendo de la información que tenga un XML, crear un HTML para que se pueda visualizar dicha información en un navegador web de una forma mucho más atractiva y legible. 

**XSLT** se basa en plantillas o **templates**. Dentro de la etiqueta **template** podemos escribir como queremos que sea la salida del XML que vamos a procesar.

Un fichero XSLT tiene la extensión **.xsl** y normalmente tiene la siguiente estructura

    <?xml version="1.0" encoding="UTF-8"?>
    <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
        <xsl:template match="/">
            <!-- CÓDIGO (HTML, XML, etc.) -->
        </xsl:template>
    </xsl:stylesheet>

El atributo **match** establece en que parte del XML que queremos transformar nos queremos situar por defecto. Dentro iría una expresión **XPATH** con cualquier expresión, aunque normalmente empezaremos por el nodo raíz para poder recorrer todo el documento XML.

Por otra parte, el fichero **XML** debe de tener la siguiente estructura para que pueda ser procesado por XSLT

    <?xml version="1.0" encoding="UTF-8"?>
    <?xml-stylesheet type="text/xsl" href="RUTA_FICHERO_XSL.xsl"?>
    <!-- XML -->
    ...
    ...

Es decir, en el fichero **XML** debemos de poner el enlace al fichero **XSLT** que queremos que haga la transformación. Para ello usaremos la etiqueta **xml-stylesheet**.

## Etiquetas

Dentro de la etiqueta **template** pondremos todas las etiquetas **XSLT** que necesitemos para realizar la transformación. Entre las más importante podemos encontrar:

1. **xsl:value-of select="Expresion_XPath"** : Con esta etiqueta seleccionamos el nodo texto del nodo al que estemos apuntando. El atributo **select** nos permite establecer la expresión XPath para buscar dicho nodo.
2. **xsl:for-each select="Expresion_XPath"** : Con esta etiqueta iteraremos todos los nodos que cumplan con la expresión XPath que pongamos en el atributo **select**. Dentro de la etiqueta podremos
realizar las acciones que estimemos para cada uno de los nodos.
3. **xsl:if test="Expresion_XPath_Booleana"** : Con esta etiqueta valoraremos la expresión XPath que establezcamos dentro del atributo **test**. La expresión XPath debe de devolver un **boolean**. En caso de devolver **true**, lo que pongamos dentro de esta etiqueta se ejecutará, en caso contrario no lo hará.
4. **xsl:choose** : Parecida a la etiqueta **xsl:if** pero con esta etiqueta podemos valorar varias codiciones. Dentro de esta etiqueta debemos usar la etiqueta **xsl:when test="Expresion_XPath_Booleana"** para valorar cada una de las condiciones que queramos. También podemos usar la etiqueta optativa **xsl:otherwise** que se ejecutará cuando no se cumpla ninguna condición **when**. El uso es muy parecido al de una estructura **switch**.

Todas las expresiones XPath que usemos en estas etiquetas serán **relativas** a la expresión XPath de la etiqueta que la contenga, como por ejemplo una etiqueta **template**.

## Transformación de fichero XML a HTML

Para ejecutar las transformaciones normalmente hay que recurrir a algún programa de terceros. Para el caso de transformar XML a HTML podemos recurrir a un servidor, ya que a veces los XML se usan como fuente de datos para crear los HTML.

De esta manera, los ficheros del primer ejemplo **01_XSLT_Cruceros**, hay que desplegarlos en algún servidor como puede ser **TOMCAT** o **APACHE**. También se puede utilizar algún extensión de **Visual Studio Code** con el plugin **Live Server** para ejecutarlo.

### Visual Studio Code + Live Server

1. Bajarse la extensión **Live Server**. Nos permite utilizar un servidor que está escuchando en el puerto **5500**
2. Abrir la carpeta 08_XSLT dentro del VSC
3. Ponerse sobre el fichero **01_XSLT_Cruceros.xml**, pulsar botón derecho y elegir la opción **Open With Live Server**
4. En la página web que se nos abre, navegar hasta el fichero **01_XSLT_Cruceros.xml**

### APACHE

1. Instalar APACHE (XAMPP por ejemplo) 
2. Ir a la carpeta "HTDOCS" donde tengamos instalado nuestro APACHE
3. Dentro de esta carpeta pegar la carpeta 08_XSLT
4. Arrancar el servidor apache
4. Abrir el navegado e ir al a ruta determinada. Ej. <http://localhost/08_XSLT/01_XSLT_Cruceros.xml>

### ECLIPSE + TOMCAT

1. Configurar eclipse con el servidor TOMCAT
2. Crear un nuevo proyecto dinámico (dinamic web proyect) y lo llamaremos "08_XSLT"
3. Una vez creado, vamos a la carpeta de recursos web (webcontent o webapp) y pegamos todos los ficheros de ejemplo 08_XSLT.
4. Arrancamos el servidor con el proyecto desplegado
5. Abrir el navegado e ir al a ruta determinada. Ej. <http://localhost:8080/08_XSLT/01_XSLT_Cruceros.xml>

## Transformación de fichero XML a XML

Para este caso, el fichero XSLT debe de tener la etiqueta **xsl:output** con el atributo **method="xml"** después de la etiqueta **xsl:stylesheet**

    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

Para transformar HTML no es obligatorio ponerla porque por defecto la salida es de HTML. El que marca el tipo de transformación es el atributo **method** que puede tener tres valores **xml, html y text**.

El atributo **encoding** establece la codificación de los caracteres. El atributo **indent** establece que el XML resultante quede sangrado.  

El ejemplo **02_XSLT_Productos** trata de hacer una transformación de un XML a otro XML. Si queremos ver la transformación completa, es decir, con las etiquetas resultantes, no podemos usar un servidor con un navegador, ya que los navegadores por defecto quitan las etiquetas de los XML y solo se visualizan los nodos texto.

Para ello, podemos usar alguna otra aplicación para ver el resultado, como puede ser [Notepad++](https://notepad-plus-plus.org)

### Configurando Notepad++ para transformar documentos XML a XML

Esta aplicación se utiliza para trabajar con ficheros en texto plano, y en este caso, para visualizar transformaciones de XML a XML.

Haremos los siguientes pasos:

1. Instalamos **Notepad++** <https://notepad-plus-plus.org/downloads/>
2. Instalamos el plugin **XML Tools** (en caso de que no lo tengamos). En la pestaña "plugins" elegimos la opción "administrar plugins" y lo buscamos. Reiniciamos en caso necesario
3. Abriremos el XML que queremos transformar con Notepad++, en este caso **02_XSLT_Productos.xml**
4. Con el fichero XML en la ventana del Notepad++, pulsaremos la pestaña "plugins"
5. Seleccionamos "XML Tools"
6. Seleccionamos "XML Transformation..."
7. En la ventana modal que aparece, buscaremos el fichero XSLT que queremos utilizar para hacer la transformación, en este caso **02_XSLT_Productos.xsl**
8. Pulsamos el botón "Transform". Se deberá de aparecer una nueva pestaña con la transformación.

## Bibliografía

- <https://www.w3schools.com/xml/xsl_intro.asp>
- <https://www.mclibre.org/consultar/xml/lecciones/xml-xslt.html>

