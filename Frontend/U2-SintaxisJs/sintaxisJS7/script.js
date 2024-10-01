let numeroAsteriscos=parseInt(prompt(`Introduce un numero: `))

for (let i = 0; i < numeroAsteriscos; i++) {
   for (let j = 0; j < numeroAsteriscos-i; j++) {
   
    document.write(`*`)
   }
   document.write(`<br>`)
   document.write(`*`)
}