select P.Pro_In_Codigo as CODIGO, p.Pro_St_Descricao as DESCRICAO, max(n.not_dt_emissao) as ULTIMO_FATURAMENTO, INA.INP_BO_DISTRIBUICAO AS INATIVO


  from mgven.ven_notafiscal N,
       mgven.ven_itemnotafiscal I,
       mgadm.est_produtos P,
       mgadm.est_inativaproduto INA
 where N.org_tab_in_codigo = I.org_tab_in_codigo
       and N.org_pad_in_codigo = I.org_pad_in_codigo
       and N.org_in_codigo = I.org_in_codigo
       and N.org_tau_st_codigo = I.org_tau_st_codigo
       and N.seq_tab_in_codigo = I.seq_tab_in_codigo
       and N.seq_in_codigo = I.seq_in_codigo
       and N.not_in_codigo = I.not_in_codigo
       and I.pro_tab_in_codigo = P.pro_tab_in_codigo
       and I.pro_pad_in_codigo = P.pro_pad_in_codigo
       and I.pro_in_codigo = P.pro_in_codigo
       and p.pro_st_defitem = 'PA'
    --   and P.pro_tab_in_codigo <> INA.pro_tab_in_codigo
      -- and P.pro_pad_in_codigo <> INA.pro_pad_in_codigo
     --  and P.pro_in_codigo <> INA.pro_in_codigo
     --  and ina.pro_in_codigo is null
       
       group by P.Pro_In_Codigo, p.Pro_St_Descricao,  INA.INP_BO_DISTRIBUICAO
       
