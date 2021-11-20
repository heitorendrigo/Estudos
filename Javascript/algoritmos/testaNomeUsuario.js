function CodelandUsernameValidation(str) { 
    // code goes here  

      if (str.length >= 4 && str.length<= 25)
      {
        if(str[0].toLowerCase() != str[0].toUpperCase())
        {
          if (/^[0-9A-Za-z]+$/.test(str) || /_/.test(str))
          {
            if (str[str.length-1] != '_')
            {
              return true
            }
            return false
            }
          return false
          }
        return false
      }
      else
      {
        return false
      }
    }
console.log(CodelandUsernameValidation('TESTE'));