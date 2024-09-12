// Declara una lista de Integer llamada edades y añádele las edades 25, 30, 22, 19, y 40. 
// Calcula y muestra en la consola la edad mayor y menor en la lista.

List<Integer> edades = new List<Integer>{25, 30, 22, 19, 40};

Integer mayor = edades[0];
Integer menor = edades[0];

for(Integer edad : edades){
    if(edad > mayor){
        mayor = edad;
    }else if (edad < menor){
        menor = edad;
    }
}

System.debug('El mayor del grupo tiene ' + mayor + ' años.');
System.debug('El menor del grupo tiene ' + menor + ' años.');