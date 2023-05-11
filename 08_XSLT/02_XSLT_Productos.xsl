<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<!-- 
  Este XSLT realizará la transformación de un XML a otro.

  Lo primero, decimos que la salida resultante será un XML.
-->
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <!-- Nos situamos en el nodo raíz -->
    <xsl:template match="/">
      <!--
        En este caso, en vez de hacer un HTML vamos a crear un XML, por lo que tendremos
        que usar las etiquetas adecuadas para ello. 
        Creamos la etiqueta "tienda" en el nuevo XML.
      -->
      <tiendas>
        <!-- 
            Seleccionamos todos los "productos/items" que tengan un atributo "type" 
            cuyo valor sea "tienda".
        -->
        <xsl:for-each select="productos/item[@type='tienda']">
          <!-- Creamos la etiqueta "tienda" en el nuevo XML -->
          <tienda>
            <!-- 
              Con la siguiente etiqueta creamos un atributo "marca" con el valor del atributo
              "nombre" dentro de la etiqueta "tienda",
            -->
            <xsl:attribute name="marca">
                <xsl:value-of select="@nombre"/>
            </xsl:attribute>
            <!-- 
              Creamos la etiqueta "identificacion" y dentro le ponemos el valor del atributo
              "producto" dentro de la etiqueta tienda.
            -->
            <identificacion><xsl:value-of select="@producto"/></identificacion>
            <!-- 
              Creamos la etiqueta "codigo" y dentro le ponemos el valor del atributo
              "codigo" dentro de la etiqueta tienda.
            -->
            <codigo><xsl:value-of select="@codigo"/></codigo>
            <!-- 
              Creamos la etiqueta "codigo" y dentro le ponemos el valor del atributo
              "precio" dentro de la etiqueta tienda.
            -->
            <precio><xsl:value-of select="@precio"/></precio>
          </tienda>
        </xsl:for-each>
      </tiendas>
    </xsl:template>
</xsl:stylesheet>