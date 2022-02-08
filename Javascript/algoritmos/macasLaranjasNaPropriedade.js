Vs = 7
Vt = 11
Va = 5
Vb = 15
Vmaçãs = [-2, 2, 1]
Vlaranjas = [5,-6]

//problem:
// https://www.hackerrank.com/challenges/apple-and-orange/problem?utm_campaign=challenge-recommendation&utm_medium=email&utm_source=24-hour-campaign


function contaMacasLaranja(s, t, a, b, apples, oranges) {
   var inicioCasa = s
   var finalCasa = t
   var arvoreMaca = a
   var arvoreLaranja = b
   var macasFinal =[];
   var laranjasFinal =[];

    for (var i = 0; i<apples.length; i++){
        if(apples[i]>0 &&  dentroDaCasa(arvoreMaca+apples[i]) ===true ){
            macasFinal.push(arvoreMaca+apples[i])
        }
    }

    for (var i = 0; i<oranges.length; i++){
        if(oranges[i]<0 &&  dentroDaCasa(arvoreLaranja+oranges[i]) === true ){
            laranjasFinal.push(arvoreLaranja+oranges[i])
        }
    }

    function dentroDaCasa(posicaoFinalFruta){
        if (posicaoFinalFruta >= inicioCasa && posicaoFinalFruta <= finalCasa ){
            return true
        }
        return false
    }
    console.log(macasFinal.length)
    console.log(laranjasFinal.length)
}
 
console.log(contaMacasLaranja(Vs, Vt, Va, Vb, Vmaçãs, Vlaranjas));