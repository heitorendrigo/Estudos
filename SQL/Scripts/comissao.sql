--======================================================

select p.not_in_codigo from mgven.ven_notafiscal p
where p.not_in_numero in ()


--======================================================

select c.rnf_re_basecomissao,c.rnf_re_valorcomissao,c.rnf_re_perccomissao,c.rowid from mgven.ven_representantenf c, mgven.ven_notafiscal nf
where c.not_in_codigo = nf.not_in_codigo
and nf.not_in_numero in (104744) --notas

--and itnf.pro_in_codigo = 4506   --item

--======================================================

select p.*,p.rowid from mgven.ven_representanteitemnf p, mgven.ven_notafiscal nf, mgven.ven_itemnotafiscal itnf
where p.not_in_codigo = nf.not_in_codigo
and nf.not_in_codigo = itnf.not_in_codigo
and itnf.seq_in_codigo = p.seq_in_codigo
and nf.not_in_numero in (103720) -- notas
--and itnf.pro_in_codigo = 4506 -- item
--======================================================
