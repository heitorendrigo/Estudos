class Pessoa{
	constructor(pNome,pSexo,pAnoNascimento){
		this._nome = pNome;
		this._sexo = pSexo;
		this._anoNascimento = pAnoNascimento;
	}

	calculaIdade(){
		return new Date().getFullYear()-this._anoNascimento
	}
}
var individuo1 = new Pessoa('Heitor','Masculino',1991);//instancia objeto
//a partir daqui posso chamar os metodos contidos na essencia do objeto individuo1 da seguinte forma:
//console.log(individuo1.calculaIdade());  -> ira retornar o resultado da função.

console.log(individuo1._nome+' possui '+individuo1.calculaIdade()+' anos!')