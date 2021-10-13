--NOTAS DE SAÍDA - CÓDIGO DE AÇÃO 101
select a.*, a.rowid
from mgtrf.trf_movdocfis_s a
where a.mds_dt_movim between '01/07/2014' and '31/07/2014'
      and a.mds_st_ndocini in (57792)
order by a.mds_st_ndocini      
      /*621*/






--NOTAS DE ENTRADA - CÓDIGO DE AÇÃO 100
select a.*, a.rowid
from mgtrf.trf_movdocfis_e a
where a.mde_dt_movim between '01/07/2014' and '31/07/2014'
      and a.mde_st_ndocini in (5784,14065,14088,14285,43501,14331,14330,43706,5781)
order by a.mde_st_ndocini
     /*411
      411
      411
      411
      411
      411
      411
      640
      640
      */


--==============================================






