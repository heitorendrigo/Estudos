 SELECT T.ORG_TAB_IN_CODIGO,
           T.ORG_PAD_IN_CODIGO,
           T.ORG_IN_CODIGO,
           T.ORG_TAU_ST_CODIGO,
           T.FIL_IN_CODIGO,
           T.PRO_TAB_IN_CODIGO,
           T.PRO_PAD_IN_CODIGO,
           T.PRO_IN_CODIGO,
           T.AGN_ST_FANTASIA,
           T.PRO_ST_ALTERNATIVO,
           T.PRO_ST_DESCRICAO,                                       
           T.NOT_IN_NUMERO,
           REPLACE(T.MVL_ST_LOTEFORNE,' ') MVL_ST_LOTEFORNE ,
           T.NOT_DT_EMISSAO,      
           T.MTF_ST_SEUCODIGO,
           T.MVL_RE_QUANTIDADE,
           T.INS_IN_SEQUENCIA,
           T.LIN_IN_SEQUENCIA,
           M.MEP_RE_TOLERINFERIOR ENS_RE_QTTOLERINF,
           M.MEP_RE_TOLERSUPERIOR ENS_RE_QTTOLERSUP,
           T.ENS_RE_INSPECAO,
           T.PRO_TAB_IN_CODIGO_SA,
           T.PRO_PAD_IN_CODIGO_SA,
           T.PRO_IN_CODIGO_SA,       
           T.MED_TAB_IN_CODIGO,
           T.MED_PAD_IN_CODIGO,
           T.MED_IN_SEQUENCIA,
           O.PQUA_ST_IDENTIFICA,
           N.MEP_UNI_ST_UNIDADE,
           P.MED_ST_NOME,
           P.MED_IN_DECIMAIS,
           P.MED_ST_TIPO,
           M.MEP_ST_VALOR,
           Q.ENS_ST_OBSERVACAO
     FROM (SELECT DISTINCT ORG_TAB_IN_CODIGO,
                  ORG_PAD_IN_CODIGO,
                  ORG_IN_CODIGO,
                  ORG_TAU_ST_CODIGO,
                  FIL_IN_CODIGO,
                  PRO_TAB_IN_CODIGO,
                  PRO_PAD_IN_CODIGO,
                  PRO_IN_CODIGO,
                  AGN_ST_FANTASIA,
                  PRO_ST_ALTERNATIVO,
                  PRO_ST_DESCRICAO,
                  NOT_IN_NUMERO,
                  MVL_ST_LOTEFORNE,
                  NOT_DT_EMISSAO,
                  MTF_ST_SEUCODIGO,
                  MVL_RE_QUANTIDADE,
                  PRO_TAB_IN_CODIGO_SA,
                  PRO_PAD_IN_CODIGO_SA,
                  PRO_IN_CODIGO_SA,
                  LIN_ST_LOTEFORNE,
                  INS_IN_SEQUENCIA,
                  LIN_IN_SEQUENCIA,
                  ENS_IN_ENSAIO,
                  ENS_IN_SEQAMOSTRA,
                  MED_TAB_IN_CODIGO,
                  MED_PAD_IN_CODIGO,
                  MED_IN_SEQUENCIA500,
                  MED_IN_SEQUENCIA,
                  ENS_RE_QTTOLERINF,
                  ENS_RE_QTTOLERSUP,
                  ENS_RE_INSPECAO
            FROM (SELECT A.ORG_TAB_IN_CODIGO,
                         A.ORG_PAD_IN_CODIGO,
                         A.ORG_IN_CODIGO,
                         A.ORG_TAU_ST_CODIGO,
                         A.FIL_IN_CODIGO,
                         E.PRO_TAB_IN_CODIGO,
                         E.PRO_PAD_IN_CODIGO,
                         E.PRO_IN_CODIGO,
                         D.AGN_ST_FANTASIA,
                         E.PRO_ST_ALTERNATIVO,
                         E.PRO_ST_DESCRICAO,
                         C.MVL_RE_QUANTIDADE,
                         A.NOT_IN_NUMERO,
                         C.MVL_ST_LOTEFORNE,
                         A.NOT_DT_EMISSAO,
                         F.PRO_TAB_IN_CODIGO AS PRO_TAB_IN_CODIGO_SA,
                         F.PRO_PAD_IN_CODIGO AS PRO_PAD_IN_CODIGO_SA,
                         F.PRO_IN_CODIGO     AS PRO_IN_CODIGO_SA,
                         F.LIN_ST_LOTEFORNE,
                         F.INS_IN_SEQUENCIA,
                         L.LIN_IN_SEQUENCIA,
                         L.ENS_IN_ENSAIO,
                         L.ENS_IN_SEQAMOSTRA,
                         L.MED_TAB_IN_CODIGO,
                         L.MED_PAD_IN_CODIGO,
                         L.MED_IN_SEQUENCIA + 500 AS MED_IN_SEQUENCIA500, -- soma-se 500 para sair no laudo apenas os ensaios da aba processo
                         L.MED_IN_SEQUENCIA,
                         L.ENS_RE_QTTOLERINF,
                         L.ENS_RE_QTTOLERSUP,
                         L.ENS_RE_INSPECAO,
                       (SELECT M.MTF_ST_SEUCODIGO
                          FROM MGADM.EST_MATLFORNEC M
                         WHERE M.ORG_TAB_IN_CODIGO = A.ORG_TAB_IN_CODIGO
                           AND M.ORG_PAD_IN_CODIGO = A.ORG_PAD_IN_CODIGO
                           AND M.ORG_IN_CODIGO     = A.ORG_IN_CODIGO
                           AND M.ORG_TAU_ST_CODIGO = A.ORG_TAU_ST_CODIGO
                           AND M.PRO_TAB_IN_CODIGO = B.PRO_TAB_IN_CODIGO
                           AND M.PRO_PAD_IN_CODIGO = B.PRO_PAD_IN_CODIGO
                           AND M.PRO_IN_CODIGO     = B.PRO_IN_CODIGO
                           AND M.AGN_TAB_IN_CODIGO = A.AGN_TAB_IN_CODIGO
                           AND M.AGN_PAD_IN_CODIGO = A.AGN_PAD_IN_CODIGO
                           AND M.AGN_IN_CODIGO     = A.AGN_IN_CODIGO
                           AND M.AGN_TAU_ST_CODIGO = A.AGN_TAU_ST_CODIGO) MTF_ST_SEUCODIGO
                    FROM MGVEN.VEN_NOTAFISCAL          A,
                         MGADM.EST_MOVIMENTO           B,
                         MGADM.EST_LOTESMOVIMENTO      C,
                         MGGLO.GLO_AGENTES             D,
                         MGADM.EST_PRODUTOS            E,
                         MGADM.EST_LOTESINSPECAO       F,
                         MGADM.EST_LOTESMOVIMENTO      G,
                         MGMAN.PRO_MOVTOMANUF          H,
                         MGMAN.PRO_ORDENS              I,
                         MGMAN.PRO_ORDEMLOTESUB        J,
                         MGADM.EST_ENSAIOSLOTEINSPECAO K,
                         MGADM.EST_INSPECAOENSAIOS     L
                   WHERE A.ORG_TAB_IN_CODIGO      = B.ORG_TAB_IN_CODIGO
                     AND A.ORG_PAD_IN_CODIGO      = B.ORG_PAD_IN_CODIGO
                     AND A.ORG_IN_CODIGO          = B.ORG_IN_CODIGO
                     AND A.ORG_TAU_ST_CODIGO      = B.ORG_TAU_ST_CODIGO
                     AND A.FIL_IN_CODIGO          = B.FIL_IN_CODIGO
                     AND TO_CHAR(A.NOT_IN_NUMERO) = B.MVT_ST_NUMDOC
                     AND A.NOT_DT_EMISSAO         = B.MVT_DT_DOCUMENTO
  
                     AND B.ORG_TAB_IN_CODIGO = C.ORG_TAB_IN_CODIGO
                     AND B.ORG_PAD_IN_CODIGO = C.ORG_PAD_IN_CODIGO
                     AND B.ORG_IN_CODIGO     = C.ORG_IN_CODIGO
                     AND B.ORG_TAU_ST_CODIGO = C.ORG_TAU_ST_CODIGO
                     AND B.FIL_IN_CODIGO     = C.FIL_IN_CODIGO
                     AND B.SER_TAB_IN_CODIGO = C.SER_TAB_IN_CODIGO
                     AND B.SER_IN_SEQUENCIA  = C.SER_IN_SEQUENCIA
                     AND B.MVT_IN_LANCAM     = C.MVT_IN_LANCAM

                     AND A.AGN_TAB_IN_CODIGO = D.AGN_TAB_IN_CODIGO
                     AND A.AGN_PAD_IN_CODIGO = D.AGN_PAD_IN_CODIGO
                     AND A.AGN_IN_CODIGO     = D.AGN_IN_CODIGO

                     AND B.PRO_TAB_IN_CODIGO = E.PRO_TAB_IN_CODIGO
                     AND B.PRO_PAD_IN_CODIGO = E.PRO_PAD_IN_CODIGO
                     AND B.PRO_IN_CODIGO     = E.PRO_IN_CODIGO

                     AND B.ORG_TAB_IN_CODIGO = G.ORG_TAB_IN_CODIGO
                     AND B.ORG_PAD_IN_CODIGO = G.ORG_PAD_IN_CODIGO
                     AND B.ORG_IN_CODIGO     = G.ORG_IN_CODIGO
                     AND B.ORG_TAU_ST_CODIGO = G.ORG_TAU_ST_CODIGO

                     AND E.PRO_TAB_IN_CODIGO = I.PRO_TAB_IN_CODIGO
                     AND E.PRO_PAD_IN_CODIGO = I.PRO_PAD_IN_CODIGO
                     AND E.PRO_IN_CODIGO     = I.PRO_IN_CODIGO

                     --AND UPPER(C.MVL_ST_LOTEFORNE) = UPPER(F.LIN_ST_LOTEFORNE) 
                     --ALTERAÇÃO REALIZADA PARA RETIRAR POSSÍVEIS ESPAÇOS EM BRANCO (ERRO DE DIGITAÇÃO)
                     AND UPPER(REPLACE(C.MVL_ST_LOTEFORNE,' ')) = UPPER(REPLACE(F.LIN_ST_LOTEFORNE,' '))
                     
                     AND F.PRO_TAB_IN_CODIGO = G.PRO_TAB_IN_CODIGO
                     AND F.PRO_PAD_IN_CODIGO = G.PRO_PAD_IN_CODIGO
                     AND F.PRO_IN_CODIGO     = G.PRO_IN_CODIGO

                     AND G.ORG_TAB_IN_CODIGO = H.ORG_TAB_IN_CODIGO
                     AND G.ORG_PAD_IN_CODIGO = H.ORG_PAD_IN_CODIGO
                     AND G.ORG_IN_CODIGO     = H.ORG_IN_CODIGO
                     AND G.ORG_TAU_ST_CODIGO = H.ORG_TAU_ST_CODIGO
                     AND G.SER_TAB_IN_CODIGO = H.SER_TAB_IN_CODIGO
                     AND G.SER_IN_SEQUENCIA  = H.SER_IN_SEQUENCIA
                     AND G.MVT_IN_LANCAM     = H.MVT_IN_LANCAM

                     AND H.ORG_TAB_IN_CODIGO = I.ORG_TAB_IN_CODIGO
                     AND H.ORG_PAD_IN_CODIGO = I.ORG_PAD_IN_CODIGO
                     AND H.ORG_IN_CODIGO     = I.ORG_IN_CODIGO
                     AND H.ORG_TAU_ST_CODIGO = I.ORG_TAU_ST_CODIGO
                     AND H.ORD_TAB_IN_CODIGO = I.ORD_TAB_IN_CODIGO
                     AND H.ORD_SEQ_IN_CODIGO = I.ORD_SEQ_IN_CODIGO
                     AND H.ORD_IN_CODIGO     = I.ORD_IN_CODIGO

                     AND I.ORG_TAB_IN_CODIGO = J.ORG_TAB_IN_CODIGO
                     AND I.ORG_PAD_IN_CODIGO = J.ORG_PAD_IN_CODIGO
                     AND I.ORG_IN_CODIGO     = J.ORG_IN_CODIGO
                     AND I.ORG_TAU_ST_CODIGO = J.ORG_TAU_ST_CODIGO
                     AND I.ORD_TAB_IN_CODIGO = J.ORD_TAB_IN_CODIGO
                     AND I.ORD_SEQ_IN_CODIGO = J.ORD_SEQ_IN_CODIGO
                     AND I.ORD_IN_CODIGO     = J.ORD_IN_CODIGO
                     
                     --AND UPPER(C.MVL_ST_LOTEFORNE) = UPPER(F.LIN_ST_LOTEFORNE) 
                     --ALTERAÇÃO REALIZADA PARA RETIRAR POSSÍVEIS ESPAÇOS EM BRANCO (ERRO DE DIGITAÇÃO)
                     AND UPPER(REPLACE(F.LIN_ST_LOTEFORNE,' ')) = UPPER(REPLACE(J.ORL_ST_LOTEFABRICACAO,' '))

                     AND F.INS_IN_SEQUENCIA = K.INS_IN_SEQUENCIA
                     AND F.LIN_IN_SEQUENCIA = K.LIN_IN_SEQUENCIA 

                     AND K.INS_IN_SEQUENCIA = L.INS_IN_SEQUENCIA
                     AND K.LIN_IN_SEQUENCIA = L.LIN_IN_SEQUENCIA
                     AND K.ENS_IN_ENSAIO    = L.ENS_IN_ENSAIO)) T, --ALIAS DO SELECT T
           MGCLI.CLI_VW_ESPECITENS       M,
           MGCLI.CLI_VW_ESPECITENS       N,
           MGADM.EST_PROCQUALIDADE       O,
           MGADM.EST_ESPECIFICACOES      P,
           MGADM.EST_INSPECAOENSAIOSOBS  Q
     WHERE T.PRO_TAB_IN_CODIGO_SA = M.PRO_TAB_IN_CODIGO
       AND T.PRO_PAD_IN_CODIGO_SA = M.PRO_PAD_IN_CODIGO
       AND T.PRO_IN_CODIGO_SA     = M.PRO_IN_CODIGO
       AND T.MED_TAB_IN_CODIGO    = M.MED_TAB_IN_CODIGO
       AND T.MED_PAD_IN_CODIGO    = M.MED_PAD_IN_CODIGO
       AND T.MED_IN_SEQUENCIA500  = M.MED_IN_SEQUENCIA

       AND T.PRO_TAB_IN_CODIGO_SA = N.PRO_TAB_IN_CODIGO
       AND T.PRO_PAD_IN_CODIGO_SA = N.PRO_PAD_IN_CODIGO
       AND T.PRO_IN_CODIGO_SA     = N.PRO_IN_CODIGO
       AND T.MED_TAB_IN_CODIGO    = N.MED_TAB_IN_CODIGO
       AND T.MED_PAD_IN_CODIGO    = N.MED_PAD_IN_CODIGO
       AND T.MED_IN_SEQUENCIA     = N.MED_IN_SEQUENCIA

       AND N.PQUA_TAB_IN_CODIGO = O.PQUA_TAB_IN_CODIGO (+)
       AND N.PQUA_PAD_IN_CODIGO = O.PQUA_PAD_IN_CODIGO (+)
       AND N.PQUA_IN_CODIGO     = O.PQUA_IN_CODIGO     (+)
                           
       AND N.MED_TAB_IN_CODIGO = P.MED_TAB_IN_CODIGO
       AND N.MED_PAD_IN_CODIGO = P.MED_PAD_IN_CODIGO
       AND N.MED_IN_SEQUENCIA  = P.MED_IN_SEQUENCIA
                           
       AND T.INS_IN_SEQUENCIA  = Q.INS_IN_SEQUENCIA  (+)
       AND T.LIN_IN_SEQUENCIA  = Q.LIN_IN_SEQUENCIA  (+)
       AND T.ENS_IN_ENSAIO     = Q.ENS_IN_ENSAIO     (+)
       AND T.ENS_IN_SEQAMOSTRA = Q.ENS_IN_SEQAMOSTRA (+)
       AND T.MED_TAB_IN_CODIGO = Q.MED_TAB_IN_CODIGO (+)
       AND T.MED_PAD_IN_CODIGO = Q.MED_PAD_IN_CODIGO (+)
       AND T.MED_IN_SEQUENCIA  = Q.MED_IN_SEQUENCIA  (+)

       AND T.ORG_IN_CODIGO     = 2
       AND T.FIL_IN_CODIGO     = 3
       AND T.NOT_IN_NUMERO     = 64214
