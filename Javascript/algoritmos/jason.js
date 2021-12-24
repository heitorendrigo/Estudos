var obj = {};

function jasonMachine(chave, valor){
    myJason = {};  //declara json local
    myJason[chave] = valor  // adiciona chave e valor
return myJason
}

function addKeyJason(jasonName, key, value){
    jasonName[key]=value //cria ou altera a chave e valor no jason
    return jasonName
}

obj =  jasonMachine('id', 01); // atribui o retorno da execução da função de criar json para dentro de uma variavel obj.



addKeyJason(obj,'nome','Heitor Endrigo')
addKeyJason(obj,'sobrenome','Rocha')
addKeyJason(obj,'idade',30)

console.log(obj)