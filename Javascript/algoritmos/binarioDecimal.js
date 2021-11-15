//Função que converte numero decimal para Binario.
var vl = parseInt(prompt('entre com o valor: '));

function dec2bin(decNum){
  var binNum = [];
  var resto = 0;
  var strBin = '';
  while(decNum > 0)
  {
    var control = 0
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
console.log(dec2bin(vl));