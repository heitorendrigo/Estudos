str = 'testando a maiorpalavradomundo'
function LongestWord(sen) { 
    var maior = '';
    sen = sen.replace(/[^a-zA-Z ]/gi,'').toLowerCase();
    sen = sen.split(' ')
    for (var i=0; i< sen.length; i++)
    {
        if (sen[i].length > maior.length)
        {
          maior = sen[i];
        }
    }
      return maior
    }
    console.log(LongestWord(str));
