

select o.*,o.rowid from mgadm.est_especvalor o
where o.eso_in_sequencia in (select p.eso_in_sequencia from Mgadm.est_especorigem p
                             where p.pro_in_codigo in (Select n.pro_in_codigo from mgven.ven_itemnotafiscal n
                                                      where n.not_in_codigo in (select p.not_in_codigo from mgven.ven_notafiscal p
                                                                                where p.not_in_numero = &NF ))-- NF
                            and p.med_in_sequencia = 33)
--executa o select, insere a NF
--liberar cadeado, enntrar no clob esv_st_observacao copiar o conteudo da aba RTF para a aba TXT
