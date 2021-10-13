

--1 - identificar o sequencial do item na nota na tabela item nota fiscal


select p.not_in_codigo from mgven.ven_notafiscal p
where p.not_in_numero = /*XXXXX*/
and p.not_dt_emissao > '01-nov-2014' 

/*retorno = YYYYY */

select o.pro_in_codigo,o.itn_in_sequencia from mgven.ven_itemnotafiscal o
where o.not_in_codigo = /*YYYYYY*/
and o.pro_in_codigo = /*CODIGO_ITEM*/

RETORNO: /*AA*/  


--2 - Setar na tabela  mgcustom.ven_tagcombustivel_nf o campo de itn_in_sequencia com o valor do sequencial encontrado em AA

select p.itn_in_sequencia,p.not_in_codigo,p.com_in_codigoapn, p.rowid  from mgcustom.ven_tagcombustivel_nf p
where p.not_in_codigo = /*YYYYYY*/


--3 - Apos tal procedimento, deve-se gerar um novo lote da NF. (geralmente feito pela rose)


