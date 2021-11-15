// 5.	Escreva um algoritmo que simule o funcionamento de um caixa eletrônico.
// Explicação: Deverá receber o valor desejado de saque e ele retornará à 
// quantidade de cédulas de cada valor. As cédulas consideradas pelo 
// caixa eletrônico são: 100, 50, 20, 10, 5 e 2. 
// Deve ser retornado a MENOR quantidade de cédulas possível para o valor do saque.

var valor = 123; //altere o valor para simular o saque
var saldo = valor;
var n100  = 0;
var n50   = 0;
var n20   = 0;
var n10   = 0;
var n5    = 0;
var n2    = 0;

if (valor == 1 || valor == 3)  
{
    console.log("Valor não permitido, cedulas disponiveis: 2, 5, 10, 20, 50, 100");
}
else //valor valido
{
    if ( valor %2 == 1)//se o valor for impar ja desconta uma nota de 5
    {
        n5 ++;
        saldo = saldo - 5;
    }
    while (saldo >= 2) //realiza o saque
    { 
        if (saldo >= 100) 
        {
            n100 = n100+saldo/100|0;   //contabilizo quantas notas de 100 usarei  --> o "|0;"  serve para truncar o resultado
            saldo = saldo % 100;  // jogo o saldo das notas de 100 para o saldo                  
        }
        if (saldo >= 50)
        {
            n50 = n50+saldo/50|0;
            saldo = saldo % 50;             
        }
        if (saldo >= 20)
        {
            n20 = n20+saldo/20|0;
            saldo = saldo % 20;            
        }
        if (saldo >= 10)
        {                             
            n10 = n10+saldo/10|0;
            saldo = saldo % 10;           
        }
        if (saldo >= 5)
        {
            n5 = n5+ saldo/5|0;
            saldo = saldo % 5;             
        }         
        if (saldo >= 2)
        {
            n2 = n2+saldo/2|0;
            saldo = saldo % 2;                
        }    
    }
    if (saldo == 1)  //ajusta saldo final caso tenha SOBRADO 1
    {
        if (n5>0)
        {
            n5 = n5-1;
            n2 = n2+3;
            saldo = 0;
        }
        else
        {
            if(n10>0)
            {
            n10 = n10 - 1;
            n5 = n5 + 1;
            n2 = n2 +3;
            saldo = 0 ;
            }
        } 
    }
    //imprime valores
    console.log("Valor Solicitado: "+valor);
    console.log("Saldo pendente : "+saldo);
    console.log("Cédulas de 100: "+n100);
    console.log("Cédulas de 50: "+n50);
    console.log("Cédulas de 20: "+n20);
    console.log("Cédulas de 10: "+n10);
    console.log("Cédulas de 5: "+n5);
    console.log("Cédulas de 2: "+n2);
}