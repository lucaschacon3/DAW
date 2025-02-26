## Ejemplo

Hay que hacer un div contenedor con propiedades flex y dentro cajas con tamaño. Para poner cajas debajo hay que hacer otro contenedor.

```css
#contenedor{
    display: flex; /*le damos la propiedad flex*/
    flex-direction: row; /*distribuimos filas desde la derecha*/
    flex-wrap: wrap;/*desbordamiento: esto sirve para que al hacer pequeña la pagina, se vaya la caja para abajo*/
		
		/*para centrar cajas (usar section en vez de div)*/
		justify-content: center; 
		align-items: center;
		align-content: center;
}

#caja1{
	  height: 20px; /*lo ideal es usarlo en pixeles*/
    width: 20px;
}
```

```html
<div id="contenedor">
    <div id="caja1">caja1</div>
</div>
```