SELECT TO_CHAR(REP.Agn_In_Codigo) Agn_in_codigo,
       REP.Agn_St_Nome,    
       DECODE(REP.Agn_In_Codigo , 302       ,  REP.Agn_St_Email||';thais.silva@maximabr.net',  25754   ,  'ti@threebond.com.br', REP.Agn_St_Email)                   as  Agn_st_Email,
--            verifica este     |se for     |            preenche o retornocom isto         |se for    |    preenche com isto  | a ultima forma de preenchimento
--                  campo       | este valor|            (neste caso adiciona texto)        |este valor|                       | acontecerá se nenhuma dos decodes 
--                                                                                                                                  anteriores for atendido                                               
       TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE,-1))+1,'dd/mm/YYYY') DTINICIAL,
       TO_CHAR(last_day(sysdate),'DD/MM/YYYY') DTFINAL
FROM MGGLO.GLO_VW_REPRESENTANTE REP
WHERE REP.Agn_Ch_Status <> 'I'
      AND NOT (REP.Agn_St_Email IS NULL)
