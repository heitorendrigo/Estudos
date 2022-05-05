//Função que converte numero decimal para Binario.
var vArr = [10, 7, 2, 8, 3]

// [10, 7, 2, 8, 3]
// [1, 2, 1, 3]  => 4
// [3, 0, 2, 4]  => 0

function countPairs(arr) {
   retorno = []
    for (var i=0; i<arr.length; i++)
    {
        if (arr[i]%2 == 0)
        {
        retorno.push(dec2bin(arr[i]));
        }
    }

    function dec2bin(decNum){

        var binNum = [];
        var resto = 0;
        var strBin = '';
        while(decNum > 0)
        {
          resto = Math.floor(decNum % 2);
          binNum.unshift(resto);
          decNum = Math.floor(decNum/2);
        }
        for(var i=0;i<binNum.length; i++)
        {
          strBin = strBin+binNum[i];
        }
       return strBin;
      } 
return retorno
}

console.log(countPairs(vArr));