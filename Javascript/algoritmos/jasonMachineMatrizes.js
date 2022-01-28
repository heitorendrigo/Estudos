var chaves = ['nome','sobrenome','idade','cargo']
var valores = ['Heitor','Rocha',30,'Analista de sistemas']

function jasonMachine(arrKeys,arrValues){
    if (arrKeys.length == arrValues.length){
        jason = {};
        for (var i=0; i< arrKeys.length; i++){
            jason[arrKeys[i]]=arrValues[i];
        }
        return jason
    }
    else{
        return 'Arrays de parametros inconcistentes, reveja as entradas da função.'
    }
}

console.log(jasonMachine(chaves,valores));

