function btnCalculo() 
{
	var aporteInicial = parseInt(document.querySelector("#aporte").value);
	var aporteMes = parseInt(document.querySelector("#vlMes").value);
	var taxa = parseInt(document.querySelector("#taxa").value);
	var objetivo = parseInt(document.querySelector("#objetivo").value);
	var montante = 0;

	function atualizaValor()
	{
		montante = aporteMes+(aporteMes*taxa/100);
		return 0;
	}










}

function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode == 46)
        return false;
    return true;
}
