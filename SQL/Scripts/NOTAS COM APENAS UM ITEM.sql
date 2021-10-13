select nota.not_in_numero 

from 

mgven.ven_notafiscal nota, mgven.ven_itemnotafiscal itn, 
mgven.ven_representantenf rep, mgven.ven_representanteitemnf itnrep

where nota.not_in_codigo = itn.not_in_codigo
  and itn.not_in_codigo = rep.not_in_codigo
  and rep.not_in_codigo = itnrep.not_in_codigo
  
and nota.not_dt_emissao > '15-jul-2015'
and rep.rnf_re_perccomissao <> 0
and itn.not_in_codigo not in(select itnf.not_in_codigo from mgven.ven_itemnotafiscal itnf
           where itnf.itn_in_sequencia > 1
           and itnf.not_in_codigo = itn.not_in_codigo)
           
          
          

