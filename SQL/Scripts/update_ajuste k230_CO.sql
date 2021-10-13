Update mgadm.est_produtos i
set i.Pro_Ch_Deffiscalitem = '03'

where i.pro_in_codigo in

(Select 
ITEM_PAI/*, P.PRO_ST_ALTERNATIVO,P.PRO_ST_DEFITEM,DEFINICAO_ITEM_PAI */from MGADM.EST_PRODUTOS P,

(Select O.ORD_DT_ABERTURA_REAL K230_DT_DATAINIOP
                ,(case when O.ORD_ST_SITUACAO = 'EN' or O.ORD_ST_SITUACAO = 'CA' then
                         MAX(M.MVO_DT_MOVIMENTO)
                       else
                         null
                  end) K230_DT_DATAFINOP
                ,M.ORD_IN_CODIGO K230_ST_CODDOCOP
                ,O.PRO_IN_CODIGO AS "ITEM_PAI"
                ,M.MVO_ST_TIPOMOVTO
                ,A.PRO_CH_DEFFISCALITEM AS "DEFINICAO_ITEM_PAI"
                ,SUM(DECODE(M.MVO_ST_TIPOMOVTO,'EDO',M.MVO_RE_QUANTIDADE,0)) K230_RE_QTDEENC
                ,B.PRO_IN_CODIGO AS "ITEM FILHO"
                ,B.PRO_CH_DEFFISCALITEM AS "DEFICAO ITEM FILHO"
                ,O.PRO_TAB_IN_CODIGO
                ,O.PRO_PAD_IN_CODIGO
                ,M.ORG_TAB_IN_CODIGO
                ,M.ORG_PAD_IN_CODIGO
                ,M.ORG_IN_CODIGO
                ,M.ORG_TAU_ST_CODIGO
                ,M.FIL_IN_CODIGO
                ,M.ORD_TAB_IN_CODIGO
                ,M.ORD_SEQ_IN_CODIGO
                ,M.ORD_IN_CODIGO
            from MGMAN.PRO_MOVTOMANUF M
                ,MGMAN.PRO_ORDENS O
                ,MGMAN.PRO_TIPOORDENS T
                ,MGADM.EST_PRODUTOS A
                ,MGADM.EST_PRODUTOS B
                ,(select ORG_IN_CODIGO FIL_IN_CODIGO
                    from MGGLO.GLO_VW_ORGANIZACAO ORG
                   where ORG.AGN_TAB_IN_CODIGO = 53
                     and ORG.AGN_PAD_IN_CODIGO = 1
                     and (ORG.ORG_IN_CODIGOFISCAL = 3 or ORG.ORG_IN_CODIGO = 3)
                     and ORG.AGN_TAU_ST_CODIGO = 'G') F
           where O.ORG_TAB_IN_CODIGO        = 53
             and O.ORG_PAD_IN_CODIGO        = 1
             and O.ORG_IN_CODIGO            = 2
             and O.ORG_TAU_ST_CODIGO        = 'G'
             and O.FIL_IN_CODIGO            = F.FIL_IN_CODIGO
             and trunc(M.MVO_DT_MOVIMENTO) >= '01/01/2019'
             and trunc(M.MVO_DT_MOVIMENTO) <= '31/01/2019'
             and A.PRO_CH_DEFFISCALITEM NOT IN ('03','04') /*425451*/
 
             and o.PRO_TAB_IN_CODIGO  = a.PRO_TAB_IN_CODIGO (+)
             and o.PRO_PAD_IN_CODIGO  = a.PRO_PAD_IN_CODIGO (+)
             and o.PRO_IN_CODIGO      = a.PRO_IN_CODIGO     (+)
 
             and m.com_TAB_IN_CODIGO = b.pro_TAB_IN_CODIGO (+)
             and m.com_PAD_IN_CODIGO = b.pro_PAD_IN_CODIGO (+)
             and m.com_IN_CODIGO     = b.pro_IN_CODIGO     (+)
 
             and O.ORG_TAB_IN_CODIGO        = M.ORG_TAB_IN_CODIGO
             and O.ORG_PAD_IN_CODIGO        = M.ORG_PAD_IN_CODIGO
             and O.ORG_IN_CODIGO            = M.ORG_IN_CODIGO
             and O.ORG_TAU_ST_CODIGO        = M.ORG_TAU_ST_CODIGO
             and O.ORD_TAB_IN_CODIGO        = M.ORD_TAB_IN_CODIGO
             and O.ORD_SEQ_IN_CODIGO        = M.ORD_SEQ_IN_CODIGO
             and O.ORD_IN_CODIGO            = M.ORD_IN_CODIGO
             and O.TPO_TAB_IN_CODIGO        = T.TPO_TAB_IN_CODIGO
             and O.TPO_PAD_IN_CODIGO        = T.TPO_PAD_IN_CODIGO
             and O.TPO_ST_CODIGO_TIPO       = T.TPO_ST_CODIGO_TIPO
             and (M.MVO_ST_TIPOMOVTO = 'EDO' or M.MVO_ST_TIPOMOVTO = 'SDD')
             and ((T.TPC_ST_PROCESSO = 'MAN') or (T.TPC_ST_PROCESSO = 'TER' and T.TPO_CH_TPPERFILMATTERC = 'FO'))
             and T.TPO_BO_EMITEBLOCOK       = 'S'
            and T.TPO_BO_RETRABALHO        = 'N' --PMCQ-1449
             and (exists (select 1
                            from MGADM.EST_PRODUTOS P
                           where P.PRO_TAB_IN_CODIGO = O.PRO_TAB_IN_CODIGO
                             and P.PRO_PAD_IN_CODIGO = O.PRO_PAD_IN_CODIGO
                             and P.PRO_IN_CODIGO     = O.PRO_IN_CODIGO
                             and (P.PRO_CH_DEFFISCALITEM in ('03' -- Produtos em Processo
                                                            ,'04') -- Produto Acabado
                                 or instr('',P.PRO_CH_DEFFISCALITEM) > 0)) OR --and -- PMCQ-1578
                  exists (select 1
                            from MGADM.EST_PRODUTOS P
                           where P.PRO_TAB_IN_CODIGO = M.COM_TAB_IN_CODIGO
                             and P.PRO_PAD_IN_CODIGO = M.COM_PAD_IN_CODIGO
                             and P.PRO_IN_CODIGO     = M.COM_IN_CODIGO
                             -- PTRI-2177
                             and instr(decode(nvl('',''),'','00,01,02,03,04,05,06,10',''),P.PRO_CH_DEFFISCALITEM)>0
                          ))
           group by O.ORD_DT_ABERTURA_REAL
                   ,M.ORD_IN_CODIGO
                   ,M.MVO_ST_TIPOMOVTO
                   ,A.PRO_CH_DEFFISCALITEM
                   ,B.PRO_IN_CODIGO
                   ,B.PRO_CH_DEFFISCALITEM 
                   ,O.PRO_TAB_IN_CODIGO
                   ,O.PRO_PAD_IN_CODIGO
                   ,O.PRO_IN_CODIGO
                   ,M.ORG_TAB_IN_CODIGO
                   ,M.ORG_PAD_IN_CODIGO
                   ,M.ORG_IN_CODIGO
                   ,M.ORG_TAU_ST_CODIGO
                   ,M.FIL_IN_CODIGO
                   ,M.ORD_TAB_IN_CODIGO
                   ,M.ORD_SEQ_IN_CODIGO
                   ,M.ORD_IN_CODIGO
                   ,O.ORD_ST_SITUACAO
                   
                   )
WHERE ITEM_PAI = P.PRO_IN_CODIGO
and p.pro_st_defitem = 'CO'

GROUP BY ITEM_PAI/*, P.PRO_ST_ALTERNATIVO,P.PRO_ST_DEFITEM,DEFINICAO_ITEM_PAI*/)
             
