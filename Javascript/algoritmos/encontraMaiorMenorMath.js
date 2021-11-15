// 3.	Escreva um algoritmo que encontre o maior e o menor número de uma lista de inteiros.
// Explicação: Dado uma lista de inteiros como entrada, o algoritmo precisará retornar o 
// maior e o menor número dentro da lista de inteiros.

var array = [2,6,77,8,21,0];
var maior = Math.max.apply(null, array);       //pega maior valor da array resolvendo NaN
var menor = Math.min.apply(null, array);
console.log("Maior: "+maior);
console.log("Menor: "+menor);