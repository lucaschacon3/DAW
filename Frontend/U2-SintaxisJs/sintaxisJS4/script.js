let numEmpleados = parseInt(prompt(`¿Cuántos empleados tienes?: `));
let salarioBase = [];
let antiguedad = [];
let salarioTotal = [];
let tabla = ``;

for (let i = 0; i < numEmpleados; i++) {
    salarioBase[i] = parseInt(prompt(`Introduce salario del operario ${i + 1}: `));
    antiguedad[i] = parseInt(prompt(`Introduce la antigüedad en años del operario ${i + 1}: `));

    // Inicialización del salario total
    salarioTotal[i] = 0;

    // Condiciones para calcular el salario total
    if (salarioBase[i] < 500 && antiguedad[i] < 10) {
        salarioTotal[i] = salarioBase[i] * 2;
    }else if (salarioBase[i] < 500 || antiguedad[i] >= 10) {
        salarioTotal[i] = salarioBase[i] * 3;
    } else if (salarioBase[i] >= 500) {
        salarioTotal[i] = salarioBase[i];
    }
}

// Mostrar resultados
for (let i = 0; i < numEmpleados; i++) {
    console.log(`Operario ${i + 1}: Salario base: ${salarioBase[i]}, Antigüedad: ${antiguedad[i]} años, Salario total: ${salarioTotal[i]}`);
}
