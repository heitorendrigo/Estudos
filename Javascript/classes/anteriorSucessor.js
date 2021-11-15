// 2 - Seu objetivo é construir uma classe denominada Calc com duas funções.
// A primeira função mostrará o antecessor de um número qualquer.
// A segunda função mostrará o sucessor de um número qualquer

class Calc
{
  constructor(numero)
  {
    this._anterior = numero -1; //apenas para demonstrar que podemos ja fazer operações no construtor para criar atributos.
    this._numero = numero;
  }
  anterior()
  {
    return this._anterior;
  }
  sucessor()
  {
    var s = this._numero + 1; 
    return s;
  }
}
num = new Calc(123);
console.log("Numero: "+num._numero);
console.log("Antecessor: "+num._anterior); //imprimindo direto o atributo.
console.log("Sucessor: "+num.sucessor()); // imprimindo o resultado do metodo.