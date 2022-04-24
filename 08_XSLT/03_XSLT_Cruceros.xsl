<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- 
		Para usar este XSL debemos de poner la siguiente sentencia
		en el XML
		<?xml-stylesheet type="text/xsl" href="03_XSLT_Cruceros.xsl"?>
		
		XSL es un motor para mostrar XML en el formato que queramos.
		
		XSL se basa en plantillas (templates) y en un lenguaje de etiquetas. 
		Dentro de la etiqueta template podemos escribir como queremos que sea la 
		salida del xml en este caso queremos mostrar un HTML, pero podria ser cualquier 
		formato (texto plano, otro xml, csv, etc).

		El primer paso es crear un templete, y dentro pondremos todo el codigo nuevo que
		queremos crear.
		
		El atributo "match" establece en que parte del XML nos queremos
		situar. Dentro iría lenguaje XPATH, que sirve para filtrar.
		En este primer ejemplo nos situamos en el nodo raiz "/" que seria el objeto
		"Document" del arbol DOM (ver dibujo pic_htmltree.gif)
 	-->
	<xsl:template match="/">
		<!-- Dentro podemos escribir lo que queramos, como quiero generar un HTML, escribo el lenguaje
		HTML -->
		<html>
		<head>		
			<title>Cruceros</title>
		<!-- Tambien podriamos meter un CSS al html resultante, es decir, renderizarlo
		con un XSL y añadirle estilos CSS (colores, formas, responsive...) -->
		<!-- <link rel="stylesheet" href="css/estilos.css" /> -->
		</head>
		<body>
		<!-- Con esta etiqueta (value-of select) seleccionamos el texto del nodo que queramos 
			y dentro de select la expresion XPATH que queramos (en este ejemplo, es una expresion
			relativa)
		-->
		<h1 style="color:red"><xsl:value-of select="cruceros/informacion"/></h1>
		<!-- 
		For-each : 
			Esto representa una estructura de control repetitiva que se ejecuta para 
			cada elemento crucero dentro de otro elemento cruceros. 
			En cada repetición se establece un filtro de modo (select), 
			que delimita el contenido XML al elemento crucero que toque en 
			cada iteración. Tambien es XPATH
			Si la ruta empieza sin "/" estamos accediendo al nodo de manera
			relativa a donde nos encontremos, si ponemos "/" sería de manera
			absoluta
		 -->
		<xsl:for-each select="cruceros/crucero">
			<p>			
				<!-- Ahora la ruta para acceder al destion cambia de manera relativa -->
				Destino: <xsl:value-of select="destino"/>
				<br />
				Informacion del crucero: <xsl:value-of select="detalles/informacion"/>
				<br/>
				CIA: <xsl:value-of select="detalles/cia"/>
				<br />
				Dias: <xsl:value-of select="detalles/dias"/>
				<br />
				Fecha salida: <xsl:value-of select="detalles/fechaSalida"/>
				<xsl:if test="detalles/dias &gt; 6">
					<br />
					El crucero dura una semana o mas
				</xsl:if>
			</p>
			<table border="1">
				<tr>
					<th>Dia</th>
					<th>Parada</th>
					<th>Llegada</th>
					<th>Salida</th>
				</tr>
				<xsl:for-each select="escalas/escala">
					<tr>
						<!-- Con arroba (@) accedemos a atributos -->
						<td><xsl:value-of select="@dia"/></td>
						<td><xsl:value-of select="parada"/></td>
						<td><xsl:value-of select="llegada"/></td>
						<td><xsl:value-of select="salida"/></td>
					</tr>
				</xsl:for-each> <!-- Fin de for each de escala-->
			</table>
		</xsl:for-each> <!-- Fin de for each de crucero-->
		</body>
	</html>
		
	</xsl:template>
</xsl:stylesheet>