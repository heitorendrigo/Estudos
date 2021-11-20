var text = '';

function camelCase(str)
{
  var control = '';
   str = str.replace(/[^a-zA-Z]/gi,' ').toLowerCase();
  for (i=0 ; i<= str.length; i++)
    {
      if(str.substring(i-2,i-1) == " ")
        {
          control = control + str.substring(i-1,i).toUpperCase();
        }
      else
        {
          control = control + str.substring(i-1,i);
        }
    }
    control = control.replace(/ /g, ""); 
    str = control.substring(0,1).toLowerCase()+control.substring(1,control.length);  
  return str;
}
  console.log(camelCase(text));
  document.write('String em Camel case: '+camelCase(text));
