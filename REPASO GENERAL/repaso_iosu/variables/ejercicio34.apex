//Declara una lista de Integer llamada edades e inicialízala con los valores 25, 30, y 35. Usa un bucle for para imprimir cada edad en la consola.

// let lista = [25, 30, 35]; Planteamiento en js para ayudar.

// for(let i = 0; i < lista.length; i++){
//     console.log(lista[i]);
// }

//Declaración.

List<Integer> edades = new List<Integer>{25,30,35};

//Lectura con un for. Se usa algo parecido a un for of en js.

for(Integer edad: edades){
    System.debug(edad);
}