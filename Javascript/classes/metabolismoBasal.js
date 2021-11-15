//Estudo sobre orientação a objeto aplicado ao calculo de taxa de metabolismo basal e total.
class Pessoa
{
	constructor(nome,sexo,peso,altura,anoNascimento,atividade,objetivo)
	{
		this._nome = nome;
		this._peso = peso  // Kg
		this._altura = altura; // cm
		this._idade = new Date().getFullYear()-anoNascimento;  //YYYY
		
		switch (objetivo) // 1- Perda de peso | 2- Manter  | 3- Ganhar peso
		{
			case 1:this._objetivo = -300;
			case 2:this._objetivo = 0;
			case 3:this._objetivo = 300;
		}
	
		if (sexo == 1)  // Homem   //1-Masculino | 2-Feminino
		{
			this._tmb = 700 + (13,8*this._peso) + (5*this._altura) - (6,8*this._idade); 
			this._sexo = 'Masculino'
		}
		if (sexo == 0)  // Mulher  //1-Masculino | 2-Feminino
		{
			this._tmb = 670 + (9,6*this._peso) + (1,8*this._altura) - (4,7*this._idade);
			this._sexo = 'Feminino'
		}

		if (atividade == 1) //1- intenso 3x / semana | 0-sem atividade
		{	
			this._tmt = this._tmb + 400 + this._objetivo
			this._atividade = 'Intensa';
		}
		if (atividade == 0)
		{
			this._tmt = this._tmb + this._objetivo
			this._atividade = 'Sedentaria';
		}
		this._macros = { proteinas: Math.round(35/100*(this._tmt/4)),
						 carboidratos: Math.round(45/100*(this._tmt/4)),
						 gorduras: (20/100*(this._tmt/9)).toFixed(2)
					   }				
	}
}	

function imprimeDados(){
	console.log('Nome: '+pessoa._nome);
	console.log('Sexo: '+pessoa._sexo);
	console.log('Idade: '+pessoa._idade);
	console.log('Altura(cm): '+pessoa._altura);
	console.log('Peso(kg): '+pessoa._peso);
	console.log('Taxa de metabolismo basal: '+pessoa._tmb);
	console.log('Taxa de metabolismo total: '+pessoa._tmt);
	console.log(' ');
	console.log('Proteinas: '+pessoa._macros.proteinas+' g/dia');
	console.log('Carboidratos: '+pessoa._macros.carboidratos+' g/dia');
	console.log('Gorduras: '+pessoa._macros.gorduras+' g/dia');
}
//                         (nome,sexo,peso,altura,anoNascimento,atividade,objetivo)
var pessoa = new Pessoa('Heitor',  1 , 90 ,  180 ,    1991     ,    1    ,  3     ); // instanciando um objeto
imprimeDados();// função que imprime os dados.