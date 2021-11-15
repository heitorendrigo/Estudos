// Exercicio: Construa uma função que recebe duas palavras e compara se elas são ou não anagramas, caso seja,
// a função deve retornar "true" se não FormDataEvent, a função deve retornar "false"
// Explicação: Anagrama são palavras que contem as mesmas letras porem em ordens diferentes.Anagrama
// Exemplo: amor, roma, mora...

var string1 = 'anagrama'; //altere as palavras para testar a função
var string2 = 'aangraam'; //altere as palavras para testar a função

function anagrama(str1, str2){
  var ar1 = [];
  var ar2 = [];
  var rt = false;
  if (str1.length != str2.length) //se a quantidade de letras for diferente ja não é anagrama.
  { 
    return rt
  }
  else
  {
    for (var i=0; i<str1.length; i++)
    {
      ar1.push(str1.substring(i,i+1));
      ar2.push(str2.substring(i,i+1));   
    }
    ar1=ar1.sort();
    ar2=ar2.sort();
    for (var i=0; i<ar1.length; i ++)
    {
      if (ar1[i]==ar2[i])
      {
        rt = true;
      }
      else
      {
      rt = false; 
      }
    }
    return rt
  }
}
console.log(anagrama(string1,string2));