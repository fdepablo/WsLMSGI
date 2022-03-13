<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<!-- Decimos que la salida será un xml. Pueden ser tres valores: xml, html y text 
    Encoding seria la codificación de los caracteres, UTF-8 para nuestro alfabeto (tildes, "ñ")
    indent sería que el xml resultante tabule las etiquetas  
-->
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
      <tiendas>
        <!-- 
            Seleccionamos todos los items que tengan un atributo "type" cuyo valor es
            "tienda" 
        -->
        <xsl:for-each select="productos/item[@type='tienda']">
          <tienda>
              <!-- Con la siguiente anotacion creamos un atributo "marca" con el valor del atributo
                "nombre" dentro de la etiqueta "tienda" -->
            <xsl:attribute name="marca">
                <xsl:value-of select="@nombre"/>
            </xsl:attribute>
            <identificacion><xsl:value-of select="@producto"/></identificacion>
            <codigo><xsl:value-of select="@codigo"/></codigo>
            <precio><xsl:value-of select="@precio"/></precio>
          </tienda>
        </xsl:for-each>
      </tiendas>
    </xsl:template>
</xsl:stylesheet>