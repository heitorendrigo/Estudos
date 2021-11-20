// Questions Marks
// Have the function QuestionsMarks(str) take the str string parameter, which will contain single digit numbers, letters, and question marks, and check if there are exactly 3 question marks between every pair of two numbers that add up to 10. If so, then your program should return the string true, otherwise it should return the string false. If there aren't any two numbers that add up to 10 in the string, then your program should return false as well.

// For example: if str is "arrb6???4xxbl5???eee5" then your program should return true because there are exactly 3 question marks between 6 and 4, and 3 question marks between 5 and 5 at the end of the string.
// Examples
// Input: "aa6?9"
// Output: false
// Input: "acc?7??sss?3rr1??????5"
// Output: true

var texto = 'acc?7??sss?3rr1??????5';

function QuestionsMarks(str) { 
    var controle = false;
    var inte = 0;
    str= str.replace(/[^0-9?]/gi,'');//diferente de num e ? troca
  
    for (var i=0;i<str.length; i++)
    {
      if (str[i]=='?')
      { 
        inte ++;
      } 
      else
      {
        inte = 0;
      }
      if(inte == 3)
      {
        var a = parseInt(str[i-3]);    
        var b = parseInt(str[i+1]);
        if (a+b==10)
        {
          controle = true
        }   
      }
    }
    return controle; 
  }
  console.log(QuestionsMarks(texto))