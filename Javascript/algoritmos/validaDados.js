//Exemplo de replace, com RegExp, no exemplo removemos os acentos e deixamos tudo em letras minusculas.
var string1 = 'TÉxtÔ';// -> texto
  string1=string1.toLowerCase().replace(new RegExp('[ÁÀÂÃáàâã]','gi'),'a')
          .replace(new RegExp('[ÉÈÊéèê]','gi'),'e')
          .replace(new RegExp('[ÍÌÎíìî]','gi'),'i')
          .replace(new RegExp('[ÓÒÔÕóòôõ]','gi'),'o')
          .replace(new RegExp('[ÚÙÛúùû]','gi'),'u')
          .replace(new RegExp('[Ç]','gi'), 'c');
//lower case + tratativa de acentos
console.log(string1 )