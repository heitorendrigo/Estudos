DECLARE CURSOR c_func IS 
  
  
  
  SELECT SUBSTR(PA.PRO_ST_CODREAL,3,4) AS PA_SERIE,
         PA.PRO_IN_CODIGO AS PA_PRO_IN_CODIGO,
         PA.PRO_ST_DEFITEM AS PA_PRO_IN_DEFITEM,
         MP.PRO_IN_CODIGO AS MP_PRO_IN_CODIGO,
         MP.PRO_ST_DEFITEM AS MP_PRO_IN_DEFITEM,
         SUBSTR(MP.PRO_ST_CODREAL,3,4) AS MP_SERIE
         
FROM MGCLI.CLI_VW_TBB_LISTAMAT_ATUAL LIS, 
MGADM.EST_PRODUTOS PA, MGADM.EST_PRODUTOS MP

WHERE LIS.PA_PRO_IN_CODIGO = PA.PRO_IN_CODIGO
AND LIS.MP_PRO_IN_CODIGO = MP.PRO_IN_CODIGO
and pa.pro_in_codigo = 1261;

BEGIN
  
FOR v_func IN c_func
       LOOP
        
       IF v_func.MP_PRO_IN_DEFITEM = 'CO' THEN
          DBMS_OUTPUT.put_line('*****ATENCAO****');
          DBMS_OUTPUT.put_line(v_func.PA_SERIE||' '||v_func.PA_PRO_IN_CODIGO||' '||v_func.PA_PRO_IN_DEFITEM||' '||v_func.MP_PRO_IN_CODIGO||' '||v_func.MP_PRO_IN_DEFITEM||' '||v_func.MP_SERIE);
           DBMS_OUTPUT.put_line('******************');
      
        ELSE

          DBMS_OUTPUT.put_line(v_func.PA_SERIE||' '||v_func.PA_PRO_IN_CODIGO||' '||v_func.PA_PRO_IN_DEFITEM||' '||v_func.MP_PRO_IN_CODIGO||' '||v_func.MP_PRO_IN_DEFITEM||' '||v_func.MP_SERIE);
          

          END IF;
         
       END LOOP;
       
        DBMS_OUTPUT.put_line('-----------------------');


END;
