// 3 - Dados 3 valores quaisquer (a, b e c) representando as medidas dos lados de um triângulo, 
// faça um algoritmo para descobrir se formam ou não um triângulo.
// Saiba que para formar um triângulo, o valor de cada lado deve ser menor que a soma dos outros 2 lados.
// ‘a’, ‘b’, e ‘c’ devem formam um triângulo, a função retorna true
// se as medidas não formam um triângulo, a função retorna false
// Utilize programação orientada a objetos.
var lado1 = 10;
var lado2 = 20;
var lado3 = 30;
class Triangulo
{
    constructor(a,b,c)
    {
        this._a = a;
        this._b = b;
        this._c = c;
    }            
    verificaTriangulo()
    {
        if(this._a < this._b + this._c && this._b < this._a+this._c && this._c < this._a+this._b) //logica que define se é triangulo.
        {
            return true;
        }
        else
        {
            return false;
        }
    }
}
var triangulo1 = new Triangulo(lado1,lado2,lado3);
console.log("Os lados formam um triângulo? R: "+triangulo1.verificaTriangulo());