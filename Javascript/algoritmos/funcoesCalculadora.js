//Exemplo de ciração de funções para as operações matematicas.
function addition(pA, pB){
  return pA+pB;  
}    
function subtraction(pA, pB){
  return pA-pB;                   //declaração das funções.
}    
function multiplication(pA, pB){
  return pA*pB;
}    
function division(pA, pB){
  return pA/pB;
}
var a = 1;// altere estes valores para testar as funções
var b = 1;// altere estes valores para testar as funções      

var add = addition(a,b);
var sub = subtraction(a,b);     //atribui o retorno das chamadas das funções nas variaveis.
var mul = multiplication(a,b);
var div = division(a,b);
      
console.log("Resultado da adição "+a+" + "+b+" = "+add);
console.log("Resultado da subtração "+a+" - "+b+" = "+sub);
console.log("Resultado da multiplicação "+a+" x "+b+" = "+mul); //imprime console.
console.log("Resultado da divisão "+a+" / "+b+" = "+div);