# ViewPort

HTML5 introdujo un método para permitir que los diseñadores web tomen el control de la ventana gráfica a través de la etiqueta <meta>

```html
<meta name="viewport" content="width=device-width, initial-scale=1.0">
```

# Consejos

- NO usar elementos grandes de ancho fijo (si pones una imagen muy grande va ha aparecer una barra horinzontal para desplazarse, eso hay que evitarlo).
- NO permitir que el contenido dependa de un ancho de ventana en particular para mostrarse bien.
- Usar consultas de @media para aplicar diferentes estilos para pantallas pequeñas y grandes.

# Regla @media

## Consultas

- width | min-width | max-width
- height | min-height | max-height
- orientation (landscape / portrait)
- aspect-ratio | min-aspect-ratio | max-aspect-ratio
- color | min-color | max-color

## @media compatible

```html
<!DOCTYPE html>
<html lang="es">
    <head>
        <link rel="stylesheet" href="css/peq.css" media=" (max-device-width: 500px)">
        <link rel="stylesheet" href="css/med.css" media=" (min-device-width: 501px) and (max-device-width:700px)">
        <link rel="stylesheet" href="css/gra.css" media=" (min-device-width: 701px)">
        
    </head>
    <body>

    </body>
</html>

```

## Tamaños para pantallas

Lo ideal es tener un documento css general y uno especifico para movil, tablet y escritorio.

### Ejemplo para escritorio

```css
@media only screen and (min-width:1500px){
	body{
		color: green;
	}
}
 /*Desde 700 pixeles de pantalla y ventana que tenga unos estilos*/
```

### Ejemplo para movil

```css
@media only screen and (max-width:800px){
	body{
		color: blue;
	}
}
 /*hasta 500 pixeles de pantalla y ventana que tenga unos estilos*/
```

### Ejemplo para tablet

```css
@media only screen and (min-width:800px) and (max-width:1500px){
	body{
		color: yellow;
	}
}
 /*Entre 500 y 700 pixeles de pantalla y ventana que tenga unos estilos*/
```