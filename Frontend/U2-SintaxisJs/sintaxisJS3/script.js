let numeros=prompt("Introduce dia y mes separados por / (dd/mm): ")
let numerosArray=numeros.split(`/`)
let num1=parseInt(numerosArray[0])
let num2=parseInt(numerosArray[1])



if(num1===14 && num2===2){
    console.log(`ES DIA DE SAN VALENTIN`)
}else{
    console.log(`NO ES DIA DE SAN VALENTIN`)
}
