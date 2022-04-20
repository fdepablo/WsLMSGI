![XSLT](img/xslt.png "Aprende XSLT!!")
# EXtensible Stylesheet Language Transformations (XSLT)

Permite convertir documentos XML a otros formatos (por ejemplo, HTML). Una plantilla podra ser la siguiente (fichero con extension xsl):

    <?xml version="1.0" encoding="UTF-8"?>
    <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
        <xsl:template match="/">
            <!-- AQUÍ VA LA ESTRUCTURA DEL DOCUMENTO HTML -->
        </xsl:template>
    </xsl:stylesheet>

Para enlazar un fichero XSL con un fichero XML debemos de poner la siguiente línea en el FICHERO XML:

    <?xml-stylesheet type="text/xsl" href="cruceros.xsl"?>
    
Después de la línea

    <?xml version="1.0" encoding="UTF-8"?>

## Estilos CSS

Son estilos y formatos que se pueden aplicar a XML o HTML Para meter los estilos al fichero "cruceros.xml" debemos de poner la siguiente línea:

    <?xml-stylesheet type="text/css" href="cruceros.css" ?>

Después de 

    <?xml version="1.0" encoding="UTF-8"?>

## Instrucciones para visualizar transformaciones de ficheros de XML a HTML

Los ficheros de este ejemplo hay que desplegarlos en algún servidor como puede ser **TOMCAT** o **APACHE**. También se puede utilizar algún extensión de **Visual Studio Code** como **Live Server** para ejecutarlo.

### Visual Studio Code + Live Server

1. Primero debemos de instalar VSC
2. Bajarse la extensión "Live Server". Esto emula un servidor web en el puerto 5500
3. Abrir la carpeta 08_XSLT dentro del VSC
4. Ponerse sobre el fichero "01_XSLT_Cursos.xml", pulsar botón derecho y elegir la opción "Open With Live Server"
5. Para hacer un shutdown del servidor, hay una opción abajo a la derecha del VSC "Cerrar Port:5500"

### APACHE

1. Instalar APACHE (XAMPP por ejemplo) 
2. Ir a la carpeta "HTDOCS" donde tengamos instalado nuestro APACHE
3. Dentro de esta carpeta pegar la carpeta 08_XSLT
4. Arrancar el servidor apache
4. Abrir el navegado e ir al a ruta determinada EJ: http://localhost/08_XSLT/01_XSLT_Cursos.xml)

### ECLIPSE + TOMCAT

1. Configurar eclipse con el servidor TOMCAT
2. Crear un nuevo proyecto dinámico (dinamic web proyect) y lo llamamos "08_XSLT"
3. Una vez creado, vamos a la carpeta de recursos web (webcontent o webapp) y pegamos todos los ficheros de ejemplo 08_XSLT.
4. Arrancamos el servidor con el proyecto desplegado
5. Abrir el navegado e ir al a ruta determinada EJ: http://localhost:8080/08_XSLT/01_XSLT_Cursos.xml

## Instrucciones para visualizar transformaciones de ficheros de XML a XML

El ejemplo 05 y 06 tratan de hacer una transformación de un XML a otro XML. Si queremos ver la transformación completa, es decir, con las etiquetas resultantes, no podemos usar un navegador de manera normal, ya que estos por defecto quitan las etiquetas de los XML.

Para ello podemos usar alguna otra aplicación para ver el resultado como NOTEPAD++

### Configurando NOTEPAD++ para transformar documentos XML a XML

Esta aplicación se utiliza para trabajar con ficheros en texto plano, y en este caso, para hacer transformaciones de XML a XML.

Haremos los siguientes pasos:

1. Instalamos Notepad++ <https://notepad-plus-plus.org/downloads/>.
2. Instalamos el plugin "XML Tools". En la pestaña "plugins" elegimos la opción "administrar plugins" y lo buscamos ahí. Reiniciamos en caso necesario. 
3. Abriremos el XML que queremos transformar con Notepad++.
4. Con el fichero XML en la ventana del Notepad++, pulsaremos la pestaña "plugins".
5. Seleccionamos "XML Tools".
6. Seleccionamos "XML Transformation...".
7. En la ventana modal que aparece, buscaremos el fichero XSLT que queremos utilizar.
8. Pulsamos el botón "Transform".

## Bibliografía

- <https://www.w3schools.com/xml/xsl_intro.asp>
- <https://www.mclibre.org/consultar/xml/lecciones/xml-xslt.html>

