// 4 - Considerando a tabela abaixo…
// total de eleitores = 1000
// válidos            = 800
// votos brancos      = 150
// nulos              = 50
// Faça uma classe com 3 métodos que calculam o percentual do votos válidos em relação ao total de eleitores,
// o percentual de brancos em relação ao total de eleitores, o percentual de nulos em relação ao total de eleitores.
// Dica: “em relação ao total” significa que você deve dividir, por exemplo, “nulos” pelo total de eleitores, 
//válidos pelo total de eleitores, etc… Utilize programação orientada a objetos.
var vEleitores = 1000;
var vValidos  = 800;
var vBrancos = 150;
var vNulos   = 50;

class votacao
{
  constructor(eleitores, validos, brancos,nulos)
  {
    this._eleitores = eleitores;
    this._validos   = validos;
    this._brancos   = brancos;
    this._nulos     = nulos; 
  }
  calculaPercValidos()
  {
    return  this._validos/this._eleitores*100;
  }
  calculaPercBrancos()
  {
    return this._brancos/this._eleitores*100;
  }
  calculaPercNulos()
  {
    return this._nulos/this._eleitores*100;
  }
}
var apuracao = new votacao(vEleitores,vValidos,vBrancos,vNulos);//parametros passados pelas variaveis.
console.log("Procentagem de votos validos: "+apuracao.calculaPercValidos()+'% ');
console.log("Procentagem de votos brancos: "+apuracao.calculaPercBrancos()+'% ');
console.log("Procentagem de votos nulos: "+apuracao.calculaPercNulos()+'% ');