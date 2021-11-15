// Dado uma string S, 
//retorne qual caractere aparece mais vezes e quantas vezes ele aparece. 
// Em caso de empate, retorne o de menor ordem alfabética.
// "banana" -> 'a', 3  |       gato -> 'a', 1
var s = 'gota';
var arr = ['',0];
var cont = 0;

s = s.split('').sort().join('') //ordena a string p analise 

for(i=0; i<s.length; i++) //percorre as letras da string
{   
    cont = 1;  //instanciando como 1 para continuar a contagem dali para frente.
    for(var a=i+1; a<s.length; a++) // percorre o resto da string
    {
        if (s[i]==s[a])   //verifica se no resto da string tem outra vez a mesma letra
        {
            cont++;     //contabiliza em variavel de controle
        }    
    }
if (cont>arr[1]) //ao fim da verificação do resto da string,  
    {            //caso a incidencia seja a maior ja registrada, a arr é subscrita   
        arr[0]=s[i];
        arr[1]=cont; 
    }
}
console.log(arr)
