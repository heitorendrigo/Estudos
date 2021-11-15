// 2 - String Challenge
// Have the function StringChallenge(str) take the str parameter being passed which 
// will contain the numbers 2 through 9, and determine if there is a consecutive 
// stream of digits of at least N length where N is the actual digit value. 
// If so, return the string true, otherwise return the string false. 
// For example: if str is "6539923335" then your program should return the string 
// true because there is a consecutive stream of 3's of length 3. 
// The input string will always contain at least one digit.

var num = '5556293383563665';//-> true         |  in: 5556293383563665 -> false
function StringChallenge(str){
  var count = 0; //contador de reps
  var rt = false //retorno da funcao
  var i = 0;    //indice do while
  while (i<str.length && rt == false) //loop 
  {
    if (i+1<str.length)//se não for o ultimo digito
    {  
      if(str[i]==str[i+1])//se o proximo for igual
      {
        count ++;  //conta as repetições
        if (str[i] == count)//repetição for igual ao numero 
        {
          //console.log('não é o ultimo e verificou contador, e atende - rt=true');
          rt = true;
        }
      }
      else //se o proximo nao repetir
      {
        if (str[i]==str[i-1])
        {
          count ++;
          if(count == str[i])
          {
          rt = true;
          }
          else
          {
            count = 0; //zera contador.
          } 
        } 
      }
    }
    else //caso seja o ultimo digito
    {
      if(str[i-1]==str[i])
      {
        count ++;
      }
      if (str[i] == count)//compara repetições com o numero repetido 
      {
        rt = true;
      }
      else
      {
        rt = false;
      }
    }
  i ++;  //incrementa indice do while
  }
 return rt;
}

console.log(StringChallenge(num));