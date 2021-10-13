CREATE OR REPLACE VIEW MGCLI.CLI_VW_NUMEROCAS AS
select p.pro_in_codigo as "COD MEGA", 
p.pro_st_descricao AS  "DESCRIÇÃO",
p.pro_st_alternativo AS "ALTERNATIVO", 


NVL((select t.mep_st_valor from  mgcli.cli_vw_especitens t 
           where t.med_in_sequencia = 32 
           and t.pro_in_codigo = p.pro_in_codigo) , 'NÃO CADASTRADO') AS "Nº CAS"

from mgadm.est_produtos p 





