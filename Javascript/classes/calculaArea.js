// 1 - Seu objetivo é construir uma classe denominada Area que calcule 
// tanto a área quadrada (primeiro método) como a área cúbica (segundo método).
// Utilize programação orientada a objetos.
class Area
{
	constructor(x,y,z)
	{
		this._x = x;
		this._y = y;
		this._z = z;
	}
	Qudrada()
	{
		var q = this._x*this._y;
		return q;
	}
	Cubica()
	{
		var c = this._x * this._y * this._z; 
		return c;
	}
}
var objeto = new Area(10,10,10);
console.log("O valor da area quadrada é: "+objeto.Qudrada()+" cm².");
console.log("O valor da area cubica é: "+objeto.Cubica()+" cm³.");