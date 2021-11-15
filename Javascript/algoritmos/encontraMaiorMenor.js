// 3.	Escreva um algoritmo que encontre o maior e o menor número de uma lista de inteiros.
// Explicação: Dado uma lista de inteiros como entrada, o algoritmo precisará retornar o 
// maior e o menor número dentro da lista de inteiros.

var maior = 0;
var menor = 999999999999 ; 
var array = [5,0,9,2,20];
	
function encontraMaiorMenor(arr){	
	for (var i = 0; i<arr.length; i++)
	{
		if (arr[i] >= maior){
			maior = arr[i]; 
		}
		if (arr[i] <= menor){
			menor = arr[i];
		}
	}
	return [maior,menor];
}	
console.log(encontraMaiorMenor(array));