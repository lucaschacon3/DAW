Consite en crear una cuadrícula y meter cajas con tamaño en % para que sea responsive.

### Ejemplo

```css
#contenedor{
    display: grid;/*le damos la propiedad grid*/
    grid-template-rows: 20% 20% 20% 20% 20%;
    grid-template-columns: 20% 20% 20% 20% 20%;
    /*es una cuadricula 5x5*/
    width: 100%; /*ponemos que ocupe el 100% del ancho*/
    height: 1000px;

}
#caja1{
	  grid-row: 1/3; /*ocupa la posición 1 y 2*/
    grid-column: 1/6; /*ocupa la posición 1,2,3,4,5*/
    /*IMPORTANTE hay que llegar hasta la última como en este caso*/
}
```

```html
<div id="contenedor">
    <div id="caja1">caja1</div>
</div>
```