![XSD](img/Validar_XML.jpg "Validando XML con XSD!!")

# XML Schema Definition  (XSD)

## Introducción

Un esquema, al contrario que un DTD, puede definir tipos de datos, lo cual es claramente beneficioso en el intercambio de datos, objetos o bases de datos.

XSD es más potente que el DTD clásico de XML, ya que permite más flexibilidad. Es un estándar recomendado por el W3C (Word Wide Web Consortium).

Tanto DTD como XSD proporcionan la validación de documentos XML, tanto estructural como formal del documento, para por ejemplo, enviar un documento a un destinatario junto con las condiciones que deben cumplir los documentos.

En la actualidad los XSD se utilizan en mayor medida que los DTD para validar XML, ya que son más potentes y además siguen la gramática XML.

## XSD vs DTD

Principales diferencias:

   1. Los XSD o esquemas son más potentes: permiten describir un XML con mayor detalle y hacer mayores restricciones.
   2. Permiten utilizar tipos de datos. Mientras que con DTD el tipo de datos siempre era texto, con XSD podemos afinar más y decir que puede ser númerico, string, etc.
   3. Los Esquemas pueden implantar reglas mucho más específicas que las DTD sobre el contenido de los elementos y atributos. Son las llamadas restricciones. Por ejemplo, que el texto de una etiqueta nombre no pueda exceder de 20 caracteres.
   4. No se puede describir entidades utilizando esquemas. Necesitaremos utilizar DTDs. para ello.

## Definición

XSD es un lenguaje basado en XML, a diferencia de los DTDs.

Al definir el schema es necesario escribir una serie de atributos. El primero es el namespace al que pertenece nuestro esquema o XSD

    xmlns:xs=”http://www.w3.org/2001/XMLSchema”

Esto indica que los elementos utilizados corresponden al espacio de nombres (namespace) definido en esa dirección. Podemos decir que para que no haya ambigüedad entre las etiquetas descritas, siempre se define un espacio de nombres al que pertenecen. Dentro de un espacio de nombres no puede haber dos etiquetas con el mismo nombre.

Por poner una similitud con la programación, el namespace sería como los paquetes, o por dentro de los sistemas informáticos, sería como los directorios.

Existen diversas maneras de vincular un XML a un XSD, una de las mas sencillas es poniendo las siguientes sentencias en el nodo raiz del documento XML

    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:noNamespaceSchemaLocation= "DIRECCION_XSD"

## Elementos Simples

Los elementos simples pueden contener cualquier tipo de dato pero no atributos ni otros elementos hijos.

```
   <element name="NOMBRE_DE_LA_ETIQUETA" type="TIPO_DE_DATO"/> 
```
Siendo el atributo "name" el nombre de la etiqueta y el type y "tipo" de la etiqueta.

### Tipos de Datos de Elementos

   1. string = cadena de texto, ejemplo=“Brazil”
   2. boolean = valores booleanos: true / false
   3. byte, short, integer, long = nºs enteros, ejemplo=  -7, 0, 12.
   4. Float, double, decimal=nºs decimales, -47,1, 1766,86
   5. date = fecha AAAA-MM-DD, ejemplo= 1999-11-23
   6. time = hora HH:MM, ejemplo= 23:03

## Elementos Complejos

Para añadir más elementos a un esquema vamos a utilizar la etiqueta "complexType". Todos los elementos irán entre esas etiquetas, indicando que hay un grupo de elementos o un único elemento con atributos.

Luego dentro de esta etiqueta normalmente va una de las siguientes tres etiquetas:

   1. "sequence" han de incluirse todos los elementos respetando el orden. Normalmente es la más usada e importante de las tre
   2. "choice" Es necesario incluir uno de los elementos que haya dentro
   3. "all" han de incluirse todos los elementos que haya dentro, sin importar el orden.

Ejemplos:

```
    <?xml version=“1.0”?>
    <schema  xmlns=“http://www.w3.org/2001/XMLSchema”> 
        <element name=“pelicula”>  
            <complexType>
                <sequence>	
                    <element name=“titulo” type=“string” />
                    <element name=“minutos” type=“integer” />
                    <element name=“fecha_estreno” type=“date” />
                </sequence>
            </complexType>
        </element>
    </schema>

    <?xml version=“1.0”?>
    <schema  xmlns=“http://www.w3.org/2001/XMLSchema”> 
        <element name=“pelicula”>  
            <complexType>
                <choice>	
                    <element name=“titulo” type=“string” />
                    <element name=“minutos” type=“integer” />
                    <element name=“fecha_estreno” type=“date” />
                </choice>
            </complexType>
        </element>
    </schema>

    <?xml version=“1.0”?>
    <schema  xmlns=“http://www.w3.org/2001/XMLSchema”> 
        <element name=“pelicula”>  
            <complexType>
                <all>	
                    <element name=“titulo” type=“string” />
                    <element name=“minutos” type=“integer” />
                    <element name=“fecha_estreno” type=“date” />
                </all>
            </complexType>
        </element>
    </schema>
```
En el primer ejemplo tienen que ir los tres elementos, y en ese orden establecido.
En el segundo ejemplo solo pueden ir uno de esos tres elementos
En el tercer ejemplo tienen que ir todos los elementos, pero en el orden que se quieran.

## Cardinalidad de los elementos

Para documentos XML en los que necesitemos definir un elemento que se repitan, podremos utilizar los atributos de element, <b>maxOccurs y minOccurs</b>. Tienen las siguientes caracteristicas:

   1. Son atributos opcionales.
   2. Estos dos atributos indican el mínimo (minOccurs) y máximo (maxOccurs) número de concurrencias del elemento.
   3. El valor por defecto para ambos atributos es 1.
   4. Si se quiere indicar que el elemento puede aparecer un número ilimitado de veces, el atributo maxOccurs tomará el valor “unbounded”

Ejemplos:

```
    <?xml version=“1.0”?>
    <schema  xmlns=“http://www.w3.org/2001/XMLSchema”> 
        <element name=“persona”>  
            <complexType>
                <sequence>	
                    <element name=“nombre” type=“string” minOccurs="1" maxOccurs="3"/>
                    <element name=“apellidos” type=“integer” minOccurs="2" maxOccurs="unbounded"/>
                    <element name=“fecha_nacimiento” type=“date”/>
                    <element name=“direccion” type=“string” minOccurs="0"/>
                </sequence>
            </complexType>
        </element>
    </schema>
```

Nota: Si ponemos a un elemento 'minOccurs="0"', lo estamos haciendo optativo.

## Atributos

Para definir atributos se utiliza una sintaxis similar a la que tenemos para los elementos.

```
   <attribute name="NOMBRE_ATRIBUTO" type="TIPO_ATRIBUTO"></attribute>
```

Caracteristicas de los atributos:

   1. Siempre van dentro de la etiqueta "complexType", y AL FINAL del todo, despues de los elementos.
   2. Son optativos por defecto. Los podemos hacer obligatorios con el atributo 'use="required"'
   3. Se pueden poner valores por defecto y fijos con los atributos "fixed" y "default".

## Etiqueta annotation (Anotaciones)

A menudo podemos incluir una descripción en nuestros esquema(XSD) como referencia y ayuda para quiénes los vaya a utilizar y para nosotros en un futuro. Para ello se utilizarán las etiquetas "documentation" dentro de las etiquetas "annotation". Suele ir justo despues de la etiqueta "schema"

```
    <annotation>
        <documentation>
            Esto es una prueba de antoación dentro de un esquema
        </documentation>
    </annotation>
```

## Restricciones

Las restricciones permiten restringir el valor que se puede dar a un elemento o atributo XML.

Mediante restricciones podemos indicar que un valor debe estar comprendido en un rango determinado, debe ser un valor de una lista de valores “cerrada”, o debe ser mayor o menor que otro valor…

Utilizan el elemento restriction dentro, a su vez, de la etiqueta "sympleType"

Tipos de restricciones:

   1. Valor comprendido en un rango
   2. El valor está restringido a un conjunto de valores posibles
   3. Restringir el valor de un elemento a una serie de caracteres
   4. Longitud de los valores de los elementos

Atributos que podemos usar con las restricciones:

   1. <b>enumeration:</b> Establece una lista de valores “aceptados”
   2. <b>length</b>: Número de caracteres obligatorios
   3. <b>maxExclusive y maxInclusive</b>: Valor máximo de un rango
   4. <b>minExclusive y minInclusive</b>: Valor mínimo en un rango
   5. <b>maxLength y minLength</b>: Número máximo y mínimo de caracteres permitidos
   6. <b>totalDigits</b>: Número máximo de dígitos permitidos
   7. <b>fractionDigits</b>: Número máximo de posiciones decimales permitidas, solo para double

Ejemplo

```
    <element name="edad">
        <simpleType>
            <restriction base="TIPO">
                <minInclusive value="0"/>
                <maxInclusive value="100"/>
            </restriction>
        </simpleType>
    </element>
```
Un elemento edad, de tipo numero entero, cuyo valor debe de estar comprendido entre 0 y 100

## Expresiones regulares

Muchas veces los atributos de las restriciones se nos quedan tambien cortos a la hora de validar un xml. Por ejemplo, imaginemos que queremos validar un DNI, que tiene un formato establecido. Pues con los atributos que hemos visto hasta ahora no podríamos hacerlo. Es ahí cuando entran en juego las expresiones regulares que <b>definen una secuencia de caracteres permitida como un patrón. determinado</b>

```
    <element name="edad">
        <simpleType>
            <restriction base="TIPO">
                <pattern value="EXPRESION_REGULAR"/>
            </restriction>
        </simpleType>
    </element>

```

Hacer expresiones regulares simples, es sencillo, pero se pueden volver MUY complejas.

Reglas:

   1. . Cualquier caracter
   2. \d cualquier dígito
   3. \D cualquier no-dígito
   4. \s espacio en blanco, retorno de carro, línea nueva
   5. \S cualquier carácter distinto a espacio en blanco
   6. <code>a*</code> "a" puede aparecer cero o más veces
   7. <code>a+</code> "a" puede aparecer una o más veces
   8. a{n} "a" puede aparecer n veces
   9. [a] uno de los caracteres que aparezcan entre []
   10. () los parentesis sirven para agrupar las reglas anteriores

## Como comenzar

Podemos empezar a ver los ejemplos que estan numerados dentro de esta carpeta

## Bibliografía
- <https://www.w3schools.com/xml/schema_intro.asp>
- <https://www.abrirllave.com/xsd/>
