<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- 
    Para usar este XSL debemos de poner la siguiente sentencia en el XML
    <?xml-stylesheet type="text/xsl" href="01_XSLT_Cruceros_01.xsl"?>
    
    En este primer ejemplo nos situaremos en el nodo raíz "/" que sería el objeto
    "Document" del árbol DOM.
    -->
    <xsl:template match="/">
        <!-- Como quiero generar un HTML, escribo HTML -->
        <html>
        <head>      
            <title>Cruceros</title>
            <!-- También podemos añadir un CSS al html resultante para dar estilos a la página -->
            <link rel="stylesheet" href="css/estilos.css" />
        </head>
        <body>
        <!-- Con esta etiqueta (value-of) seleccionamos el nodo texto del nodo al que
            estemos apuntando. El atributo “select” nos permite establecer la expresión XPath
            para buscar dicho nodo. En este caso es una consulta relativa a donde este situado
            el elemento "template" (nodo raíz)
        -->
        <h1><xsl:value-of select="cruceros/informacion"/></h1>
        <!-- 
            Recorremos con un for-each todos los nodos que devuelva la expresión XPath 
            "cruceros/crucero". Lo hacemos de manera relativa a donde esta situado el 
            elemento "template"
         -->
        <xsl:for-each select="cruceros/crucero">
            <!-- Ahora las rutas relativas son relativas al nodo "cruceros/crucero" -->
            <h2>Destino: <xsl:value-of select="destino"/> </h2>
            <p>Información del crucero: <xsl:value-of select="detalles/informacion"/> </p>
            <p>Compañía: <xsl:value-of select="detalles/cia"/> </p>
            <p>Días: <xsl:value-of select="detalles/dias"/> </p>
            <p>Fecha salida: <xsl:value-of select="detalles/fechaSalida"/> </p>
            <!-- 
                Condición para pintar "H4" cuando el número de días sea superior a 6.
                Como el símbolo ">" representa cierre de etiqueta, podemos usar
                la entidad "&gt;"
                En este caso la consulta es relativa a donde está situado el elemento
                "for-each" (nodo cruceros/crucero)
            -->
            <xsl:if test="detalles/dias &gt; 6">
                <h4>El crucero dura una semana o más</h4>
            </xsl:if>

            <!-- Valoramos las distintas fechas de salida para mostrar un texto de cuando salimos -->
            <xsl:choose>
                <xsl:when test="detalles/fechaSalida = '2018-12-26'">
                    <h4> Salimos después de navidad!!! </h4>
                </xsl:when>
                <xsl:when test="detalles/fechaSalida = '2019-02-13'">
                    <h4> Salimos en febrero!!! </h4>
                </xsl:when>
                <xsl:otherwise>
                    <h4> No sé cuando salimos :(</h4>
                </xsl:otherwise>
            </xsl:choose>

            <table border="1">
                <thead>
                    <tr>
                        <th>Día</th>
                        <th>Parada</th>
                        <th>Llegada</th>
                        <th>Salida</th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="escalas/escala">
                        <tr>
                            <!-- Con arroba (@) accedemos a los atributos -->
                            <td><xsl:value-of select="@dia"/></td>
                            <td><xsl:value-of select="parada"/></td>
                            <td><xsl:value-of select="llegada"/></td>
                            <td><xsl:value-of select="salida"/></td>
                        </tr>
                    </xsl:for-each> <!-- Fin de for each de escala-->
                </tbody>
            </table>
        </xsl:for-each> <!-- Fin de for each de crucero-->
        </body>
        </html>     
    </xsl:template>
</xsl:stylesheet>