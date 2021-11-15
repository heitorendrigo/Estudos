// 6.	Escreva um algoritmo de ordenação (Insertion Sort)
// Explicação: Dado uma lista de inteiros como entrada, o algoritmo precisará ordenar 
// os valores utilizando o método de ordenação "Insertion Sort".

// Insertion Sort, ou ordenação por inserção, é um algoritmo de ordenação que, dado uma 
// estrutura (array, lista) constrói uma matriz final com um elemento de cada vez, 
// uma inserção por vez. Assim como algoritmos de ordenação quadrática, 
// é bastante eficiente para problemas com pequenas entradas, sendo o mais eficiente entre 
// os algoritmos desta ordem de classificação. 
// Podemos fazer uma comparação do Insertion Sort com o modo como algumas pessoas organizam 
// um baralho num jogo de cartas. Imagine que você está jogando às cartas. 
// Você está com as cartas na mão e elas estão ordenadas. Você recebe uma nova carta e deve 
// colocá-la na posição correta da sua mão de cartas, de forma a que as cartas obedeçam à ordenação. 
// A cada nova carta adicionada à sua mão de cartas, a nova carta pode ser menor que algumas das 
// cartas que você já tem na mão ou maior, e assim, você começa a comparar a nova carta com todas 
// as cartas na sua mão até encontrar sua posição correta. Você insere a nova carta na posição correta, 
// e, novamente, a sua mão é composta de cartas totalmente ordenadas. 
// Então, você recebe outra carta e repete o mesmo procedimento. 
// Então outra carta, e outra, e assim em diante, até não receber mais cartas (fonte: Wikipedia). 
//  - Desenhar junto com candidato. Explicar e fazer junto com ele ao longo da questão.

var arr = [1,2,3,4,5]; //insertio parte do principio que a array ja esta ordenada.
var novoNumero = 3;//altere este valor para testar a rotina
var arrAntes = [];
var arrDepois = [];
var meio = 0;

for(var i=0; i < arr.length; i++)
{
  if(novoNumero >= arr[i])
  {
      console.log('maior ou igual que a posição: '+i)
      arrAntes.push(arr[i])
  }
  if(novoNumero < arr[i])
  {
    console.log('menor que a posição: '+i)
    arrDepois.push(arr[i])
  }
}
arrAntes.push(novoNumero)//insere o numero na array antes 
arr = arrAntes.concat(arrDepois); //junta as duas arrays em uma so com o novo numero.
console.log(arr)




















