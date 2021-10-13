function ScriptFibonacci() 
{
	var qtd = parseInt(document.querySelector("#number").value);
	var ant = 0;
	var num = 1;
	var pro = 1;

	function atualizaValores()
	{
		ant = num;
		num = pro;
		pro = num + ant;
	}

	function imprimeValores()
	{
		document.write("valor: "+num+"<br />");
	}

	for (var i = 1; i <= qtd; i++)
	{
		document.write(i+" elemento da serie Fibonacci, ")
		imprimeValores();
		atualizaValores();
	}














}

function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode == 46)
        return false;
    return true;
}
