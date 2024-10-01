console.log(document.getElementById("input2")); 
console.log(document.querySelector("#input2"));

console.log(document.getElementsByTagName("p" ));
console.log(document.querySelectorAll("p"));

console.log(lipsum.getElementsByTagName("p"));
console.log(document.querySelectorAll("#lipsum p"));

console.log(document.getElementsByTagName("form"))[0];
console.log(document.querySelectorAll("form"))[0];//solo el primero
console.log(document.querySelector("form"));

Console.log(document.getElementsByName("sexo"));
console.log(document.querySelectorAll("input[name='sexo']"));

console.log(document.querySelectorAll("li.important"));
console.log(document.getElementsByClassName("important"));