// Escreva um algoritmo que exiba a sequência de Fibonnacci iniciando em 1 até o "n" elemento DENTRO DE UMA ARRAY
// Explicação: Na sequência de Fibonnacci, cada elemento é a soma dos dois elementos anteriores. 
// Os dois primeiros elementos são 1 e 1. 
// Recebe como entrada o valor de “n”.

  var n = 8;  //altere o valor para exibir até o termo n de fibonacci
  var fibonacci = [0,1,1]

  for (var i=3; i<n; i++) //comeca a partir do 3o termo
  {
    fibonacci[i] = fibonacci[i-1] + fibonacci[i-2] 
  }
console.log(fibonacci);
