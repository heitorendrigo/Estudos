select * from mgven.ven_notafiscal p
where p.not_in_numero = &numero_nota  -- &numero_nota é um parametro criado quando roda o select o PL solicita o valor desta "variavel"
