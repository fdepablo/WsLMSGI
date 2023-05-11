<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- Nos situamos en el nodo raíz -->
    <xsl:template match="/">    
        <html>
        <head>
            <title>Cruceros</title>
        </head>
        <body>
            <h1 style="color:red">Ejemplos de uso de XPath</h1>
            <!-- 
            Búsqueda absoluta de "detalle" de un crucero. Por defecto, si lo ponemos 
            dentro de un "value-of" para pintarlo solo nos pintaría el primer nodo, 
            por lo que tenemos que iterarlo si queremos sacar todos los nodos "detalle".
            
            OJO, si usáramos un motor de XPath como en 07_XPATH, veríamos 
            que las consultas nos devuelven todos los nodos.
            -->
            <xsl:value-of select="/cruceros/crucero/detalles" />
            <hr/>
            <!-- 
            Vamos a iterarlo para ver que podemos acceder a todos los nodos "detalle"
            -->
            <xsl:for-each select="/cruceros/crucero/detalles">
                <!-- Accedemos de manera relativa a los valores de dentro del detalle -->
                <xsl:value-of select="cia" /> - 
                <xsl:value-of select="dias" /> - 
                <xsl:value-of select="fechaSalida" />
                <br/>
            </xsl:for-each>
            <hr/>

            <!-- 
            Búsqueda de "detalle" de un crucero, no empieza por "/" por lo que las 
            búsquedas son relativas al nodo que nos encontramos, en este caso en el nodo raíz que 
            hemos puesto en la línea 4
             -->
            <xsl:value-of select="cruceros/crucero/detalles" />
            <hr/>
            <!--
            Todas las etiquetas "crucero".
            Recordemos que solo se muestra el primer caso que coincida, deberemos iterarlo con un 
            for-each para mostrar el valor de todos los nodos
            -->
            <xsl:value-of select="/cruceros/crucero" />
            <hr/>

            <!--
            Las etiquetas "informacion" de los cruceros.
            En este caso, las vamos a iterar
            -->
            <h4>Información</h4>
            <xsl:for-each select="cruceros/crucero/detalles/informacion">
                <!-- 
                Como queremos acceder a la propia información del nodo que estamos iterando 
                debemos de poner un "."
                -->
                <xsl:value-of select="." /> -
            </xsl:for-each>
            <hr/>

            <!--
            Todos los atributos "codigo" de los elementos "crucero"
            -->
            <xsl:value-of select="/cruceros/crucero/@codigo" />
            <hr/>

            <!--
            Solo el primer "crucero", usamos predicados
            -->
            <xsl:value-of select="/cruceros/crucero[1]" />
            <hr/>

            <!--
            Solo el último "crucero"
            -->
            <xsl:value-of select="/cruceros/crucero[last()]" />
            <hr/>

            <!--
            Los días del primer crucero
            -->
            <xsl:value-of select="/cruceros/crucero[1]/detalles/dias" />
            <hr/>

            <!--
                Nodos "escala" que tenga un atributo "dia" cuyo valor sea 3
            -->
            <xsl:value-of select="/cruceros/crucero/escalas/escala[@dia=3]" />
            <hr/>

            <!--
            Los nodos "crucero" que tengo una "escala" cuyo atributo "dia" sea 3
            -->
            <xsl:value-of select="/cruceros/crucero[escalas/escala/@dia=3]" />
            <!-- Notese que siempre se muestra el ultimo nodo de la consulta XPath, dentro de
                los "[]" irían las condiciones (predicados)
            -->
            <hr/>

            <!--
            Los nodos "crucero" que tengan una duración de 7 días
            -->
            <xsl:value-of select="/cruceros/crucero[detalles/dias=7]" />
            <hr/>
        </body>
        </html>     
    </xsl:template>
</xsl:stylesheet>

