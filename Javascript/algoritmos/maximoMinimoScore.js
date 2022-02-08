vN = 10 ;
vScores = [3, 4, 21, 36, 10, 28, 35, 5, 24, 42];

//Problem:
// https://www.hackerrank.com/challenges/breaking-best-and-worst-records/problem

function breakingRecords(scores) {
    var max = scores[0];
    var min = scores[0];
    var countMax = 0;
    var countMin = 0;

    for (var i= 0; i< scores.length ; i++)
    {
        if (scores[i]>max)
        {
            max = scores[i];
            countMax ++;
        }
        if (scores[i]<min)
        {
            min = scores[i];
            countMin ++;
        }
    }
    var arrReturn = [ countMax, countMin]
    return arrReturn

}
 
console.log(breakingRecords(vN, vScores));