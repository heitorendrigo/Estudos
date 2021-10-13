select c.not_in_codigo from mgven.ven_notafiscal c
where c.not_in_numero = 68661 --Colocar o Numero da NF e obter o NOT_IN_CODIGO

select l.pro_in_codigo,l.eni_st_codigo, l.rowid from mgven.ven_itemnotafiscal l
where l.not_in_codigo = 327338  --Filtrar pelo Not_in_Codigo Obtido
--fazer update no campo eni_st_codigo com o codigo que se precisa
