// 2.	Escreva um algoritmo que exiba a sequência de Fibonnacci iniciando em 1 até o "n" elemento.
// Explicação: Na sequência de Fibonnacci, cada elemento é a soma dos dois elementos anteriores. 
// Os dois primeiros elementos são 1 e 1. 
// Recebe como entrada o valor de “n”.
var n = parseInt(prompt("Entre com o valor de N : "));
var a = 0;
var num = 1;
var p = 1;
	
for ( i = 1 ; i <= n ; i++)
{
	console.log(i+"º elemento fibonacci: "+num+"<br />"); //primeiro imprime depois processa.
	a = num;
	num = p;								//logica do fibonacci
	p = num + a;
}
console.log('FIM!');
