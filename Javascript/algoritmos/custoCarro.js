//exemplo de função, com 3 parametros e entrada e um retorno de calculo.
function cost(pCost,pDistributor,pTax){
  return pCost + (pCost*pDistributor/100) + (pCost*pTax/100) ;  
}
var finalCost = cost(100,10,12);
console.log("Custo final: "+finalCost);//retorno 122.