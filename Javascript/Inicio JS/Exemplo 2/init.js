function check() {
    var company = document.querySelector("#company").value;
   console.log("\n \n \n");
    
	var salary = parseFloat(document.querySelector("#salary").value);
 //   console.log("Salário proposto: " +salary);
    
	//com R$
    var salaryF = salary.toLocaleString('pt-br', {
        style: 'currency',
        currency: 'BRL'
    });
	
 //   console.log("Salário com R$: " +salaryF);
    //sem R$
    var salaryF2 = salary.toLocaleString('pt-br', {
        minimumFractionDigits: 2
    });
 //   console.log("Salário sem R$: " +salaryF2);

    var benefits = document.querySelector("#benefits").value;
  //  console.log("Benefícios: " +benefits);

    //com R$
    var benefitsF = benefits.toLocaleString('pt-br', {
        style: 'currency',
        currency: 'BRL'
    });
 //   console.log("Benefícios com R$: " +benefitsF);

    //sem R$
    var benefitsF2 = benefits.toLocaleString('pt-br', {
        minimumFractionDigits: 2
    });
 //   console.log("Benefícios sem R$: " +benefitsF2);
    var select = document.getElementById("contract");
    var contract = select.options[select.selectedIndex].value;
//    console.log("Tipo de contrato: " +contract);

//Desafio:
//1 - Fazer cálculo anual de salário  -- ok
//2 - Fazer cálculo anula de benefícios -- ok
//3 - Fazer cálculo de férias quando CLT -- ok
//4 - Fazer cálculo de IR de acordo com as faixas:
//===============================================
//1ª faixa: 7,5% para salário base de R$ 1.903,99 a R$ 2.826,65;
//2ª faixa: 15% para salário base de R$ 2.826,66 a R$ 3.751,05;
//3ª faixa: 22,5% para salário base de R$ 3.751,06 a R$ 4.664,68;
//4ª faixa: 27,5% para salário base de a partir de R$ 4.664,69.
	var tax = 0;
	var annualTax = 0;
	var vacation = 0;
	var annualSalary = salary*13;	
	var annualBenefits = benefits * 12; 
	var select = document.getElementById("legalType");
    var legalType = select.options[select.selectedIndex].value; 
	var taxIrpj = (salary*15/100);
	var taxCsll = (salary*9/100);
	var taxPis  = (salary*0.65/100);
	var taxCofins = (salary*3/100);
	var taxIss = (salary*2/100);
	var annualTaxIrpj = (taxIrpj*12);
	var annualTaxCsll = (taxCsll*12);
	var annualTaxPis  = (taxPis*12);
	var annualTaxCofins = (taxCofins*12);
	var annualTaxIss = (taxIss*12);
	
	if (contract == 'CLT') 
		{
			vacation = (salary*1.3);
		}
		else
		{                              //se entrou aqui é por que é PJ ****************
			vacation = 0;              // PJ nao recebe ferias.
			annualSalary = salary*12;  // em pj o salario anual é X12 pois nao tem 13º
			
			if (contract == "PJ" && legalType == "SIMPLES")  // REGIME SIMPLES
			{
				if (annualSalary <= 180000) //1ª Faixa do simples
				{
					tax = (salary*6/100);
				}
				else
				{
					if (annualSalary <= 360000) //2ª Faixa do simples
					{
						tax = (salary*11.2/100);
					}
					else
					{
						if (annualSalary <= 720000) //3ª Faixa do simples
						{
							tax = (salary*13.5/100);
						}
						else
						{
							if (annualSalary <= 1800000) //4ª Faixa do simples
							{
								tax = (salary*16/100);
							}
							else
							{
							 legalType = "LTDA";   //SE MAIOR QUE 1,8 MI --> VIRA LTDA
							 tax = taxCofins + taxCsll + taxIrpj + taxIss + taxPis;
							 annualSalary = tax*12;
							 console.log("***LUCRO ANUAL ACIMA DO PERMITIDO - APLICANDO REGRAS DO REGIME LTDA***");
							 document.write("****LUCRO ANUAL ACIMA DO PERMITIDO **** <br /> ****APLICANDO REGRAS DO REGIME LTDA****<br /><br />");
							}
						}
					}
				}
			}
			else
			{
			 if (legalType == "LTDA")
				{
					tax = taxCofins + taxCsll + taxIrpj + taxIss + taxPis;
					annualTax = tax*12;
				}	
			}
		}	
	if (salary < 1903.99 && contract == "CLT") //Isento	 CLT
		{
			tax = 0;
		}
		else
		{
			if (salary <=  2826.65 && contract == "CLT") //1ª Faixa CLT
				{
					 tax = (salary*7.5/100);
				}
			else
				{
					if (salary <=  3751.05 && contract == "CLT") //2ª Faixa CLT
						{
							tax = (salary*15/100);
						}	
						else
						{
							if (salary <=  4664.68 && contract == "CLT") //3ª Faixa CLT
								{
									tax = (salary*22.5/100);		
								}
									else
									{
										if (salary > 4664.68 && contract == "CLT") //4ª Faixa CLT
										{
											tax = (salary*27.5/100);
										}	
									}
						}
				}	
		} 	
	if (contract == "CLT")
		{
			annualTax = (tax*13.3); //Calcula taxa anual em CLT com 13º e ferias
		}
		else
		{
			annualTax = (tax*12)   //Calcula taxa anual em PJ.
		}
		tax = tax.toLocaleString('pt-br', {             
							style: 'currency',
							currency: 'BRL'
							});
		annualTax = annualTax.toLocaleString('pt-br', {   
							style: 'currency',
							currency: 'BRL'
							});
		vacation  = vacation.toLocaleString('pt-br', {  
							style: 'currency',                       //Formata a variaveis  para a moeda usada no Brasil (Real)
							currency: 'BRL'
							});
		annualSalary = annualSalary.toLocaleString('pt-br', {  
							style: 'currency',
							currency: 'BRL'
							});
		annualBenefits =  annualBenefits.toLocaleString('pt-br', {  
							style: 'currency',
							currency: 'BRL'
							});	
		salary = salary.toLocaleString('pt-br', {
							style: 'currency',
							currency: 'BRL'
							});
		taxCofins = taxCofins.toLocaleString('pt-br', {  
							style: 'currency',
							currency: 'BRL'
							});	
		taxCsll = taxCsll.toLocaleString('pt-br', {  
							style: 'currency',
							currency: 'BRL'
							});	
		taxIrpj = taxIrpj.toLocaleString('pt-br', {  
							style: 'currency',
							currency: 'BRL'
							});	
		taxIss = taxIss.toLocaleString('pt-br', {  
							style: 'currency',
							currency: 'BRL'
							});	
		taxPis = taxPis.toLocaleString('pt-br', {  
							style: 'currency',
							currency: 'BRL'
							});	
		annualTaxCofins = annualTaxCofins.toLocaleString('pt-br', {  
							style: 'currency',
							currency: 'BRL'
							});	
		annualTaxCsll = annualTaxCsll.toLocaleString('pt-br', {  
							style: 'currency',
							currency: 'BRL'
							});	
		annualTaxIrpj = annualTaxIrpj.toLocaleString('pt-br', {  
							style: 'currency',
							currency: 'BRL'
							});	
		annualTaxIss  = annualTaxIss.toLocaleString('pt-br', {  
							style: 'currency',
							currency: 'BRL'
							});	
		annualTaxPis  = annualTaxPis.toLocaleString('pt-br', {  
							style: 'currency',
							currency: 'BRL'
							});						
console.log("1 - Cálculo anual de salário: " + annualSalary +"\n"+"2 - Cálculo anual de benefícios: "+ annualBenefits +"\n"+"3 - Fazer cálculo de férias quando CLT: " +vacation+"\n"+"4 - Impostos totais mensais: " +tax+ "    Impostos totais anuais: "+annualTax);
document.write("Empresa Contratante: "+company+"<br />");
document.write("Contrato Selecionado: " + contract +"<br />Tipo de Pessoa Juridica: "+legalType+"<br /><br />");
document.write("Salario mensal: "+salary+"<br /><br /><br />");
document.write("1 - Cálculo anual de salário: " + annualSalary +"<br />");
document.write("2 - Cálculo anual de benefícios: "+ annualBenefits +"<br />");
document.write("3 - Fazer cálculo de férias quando CLT: " +vacation+"<br />");
document.write("4 - Impostos totais mensais: " +tax+ "<br />Impostos totais anuais: "+annualTax+"<br />");
	if (contract == "PJ" && legalType == "LTDA")
	{
		console.log("\n5 - Descrição dos impostos Mensais:\nCOFINS: "+taxCofins+"\nCSLL: "+taxCsll+"\nIPRJ: "+taxIrpj+"\nISS: "+taxIss+"\nPIS: "+taxPis);
		console.log("\n6 - Descrição dos impostos Anuais:\nCOFINS: "+annualTaxCofins+"\nCSLL: "+annualTaxCsll+"\nIPRJ: "+annualTaxIrpj+"\nISS: "+annualTaxIss+"\nPIS: "+annualTaxPis);		
		document.write("<br />5 - Descrição dos impostos Mensais:<br />COFINS: "+taxCofins+"<br />CSLL: "+taxCsll+"<br />IPRJ: "+taxIrpj+"<br />ISS: "+taxIss+"<br />PIS: "+taxPis+"<br /><br />");
		document.write("<br />6 - Descrição dos impostos Anuais:<br />COFINS: "+annualTaxCofins+"<br />CSLL: "+annualTaxCsll+"<br />IPRJ: "+annualTaxIrpj+"<br />ISS: "+annualTaxIss+"<br />PIS: "+annualTaxPis);
	}
}

function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode == 46)
        return false;
    return true;
}
