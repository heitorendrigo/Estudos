// 1.	Escreva um algoritmo que some números pares.
// Explicação: Dada uma lista de números distintos encontre a soma dos 
// números pares que resulte no menor valor, e deve retornar este valor.

var soma = 0;
var pares = [];
var array = [3,2];
//array = array.sort();
for (var i = 0 ; i < array.length; i++)
{
	if (array[i]%2 == 0)
	{
		pares.push(array[i]);	
	}
}
pares= pares.sort((a,b)=>a-b); //ordena array de pares
if(pares.length >=2) // verifica o tamanho da array para tratar erros.
{
	soma = pares[0]+pares[1];
}
if(pares.length == 1)
{
	soma = pares[0]
}
console.log("Soma dos 2 menores numeros Pares: "+soma);