//exemplo de MAtrizes, ou arrays com mais de uma dimensão.
  var myMatrix = [
    [0,1,2],
    [3,4,5],
    [6,7,8]
  ];

//percorrendo valores em matrizes -- caso tenha outra dimensão inserir proximo nivel. 
for (var x = 0; x<myMatrix.length; x++)//percorre linhas
{
  for (var y=0; y<myMatrix[x].length; y++)// percorre coluna das linhas
  {
    console.log(myMatrix[x][y]);
  }
}