create or replace view cli_vw_tbb_lotes_revalidacao as
Select pro.pro_in_codigo, pro.pro_st_alternativo, 
lot.mvl_st_loteforne, 
   
    (select min(o.mvt_dt_movimento) 
               from mgadm.est_lotesmovimento o
               where o.pro_in_codigo = pro.pro_in_codigo 
               and o.mvl_st_loteforne = lot.mvl_st_loteforne ) as "LOT_DT_ENTRADA",
   

              mov.mvt_st_numdoc as "LOT_ST_DOC",
                
lot.mvt_dt_validade,

          (select max(o.mvt_dt_movimento) 
               from mgadm.est_lotesmovimento o
               where o.pro_in_codigo = pro.pro_in_codigo 
               and o.mvl_st_loteforne = lot.mvl_st_loteforne 
               )  as "DT_ULTIMO_MOV",
              
               
          mov.mvt_st_entrsaida,
          mov.mvt_dt_documento    
           

from mgadm.est_lotesmovimento lot, mgadm.est_produtos pro, mgadm.est_movimento mov
where mov.mvt_in_lancam = lot.mvt_in_lancam
and  lot.pro_in_codigo = pro.pro_in_codigo

group by pro.pro_in_codigo, mvl_st_loteforne,mov.mvt_st_numdoc ,pro_st_alternativo,  mvt_dt_validade,  mov.mvt_st_entrsaida ,mov.mvt_dt_documento    
