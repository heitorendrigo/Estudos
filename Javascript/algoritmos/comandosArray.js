//comandos basicos para manipulação de Arrays.
 
 var myArray = [2,4,4,4,6]
  console.log(myArray);//exibe a array 
  
  myArray.push(8);//insere 8 ao FINAL da array
  console.log('myArray após myArray.push(8): '+myArray); 

  myArray.unshift(0);//insere 0 ao INICIO da array 
  console.log('myArray após myArray.unshift(0): '+myArray); 
 
  //removendo 
  myArray.shift();//remove o elemento do INICIO da array 
  console.log('myArray após myArray.shift(): '+myArray);

  myArray.pop();  //remove o elemento do FINAL da array
  console.log('myArray após myArray.pop(): '+myArray);

  console.log('Indexof do termo 2: '+myArray.indexOf(2));// retorna 0

  console.log('Exibe o menor numero da array:'+ Math.min.apply(null,myArray));

  console.log('Exibe o maior numero da array:'+ Math.max.apply(null,myArray));

  var   arrayCres = myArray.sort((a,b) => a-b); //ordena array numerica em ordem crescente.
  console.log('Exibe array em ordem crescente:'+arrayCres);

  var arrayDecres = myArray.sort((a,b) => b-a); //ordena array numerica em ordem decrescente.
  console.log('Exibe array em ordem decrescente:'+arrayDecres);

  var  arrayUnica = [...new Set(myArray)]; //remove os itens duplicados da array.
  console.log('Exibe array sem seus termos se repetirem:'+arrayUnica);


//  ==============================================















