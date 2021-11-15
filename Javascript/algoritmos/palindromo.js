// 1.	Escreva um algoritmo que receba um texto como entrada e precisará retornar se ele 
// é ou não um palíndromo. Sendo 1 para o caso de ser palíndromo e 0 quando não for.
// Explicação: O texto pode ser lido tanto da direita para a esquerda como da esquerda para a direita
var texto = 'ana';
 
function verificaPalindromo(pString){
	let esquerda = ''; 
	for (var i = pString.length; i > 0; i--)    //define a inversão da string
	{ 
		esquerda = esquerda + pString.substring(i-1,i)
		if (texto == esquerda)
		{
			return 1;
		}
			else
		{
			return 0;
		}
	}			
}		
document.write(verificaPalindromo(texto));	
