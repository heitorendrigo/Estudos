select agn.agn_in_codigo,  -- oque
agn.agn_st_fantasia,
agn.uf_st_sigla,
agn.pa_st_sigla,
agn.mun_in_codigo,
agn.agn_st_municipio,
agn.agn_st_logradouro,
agn.agn_st_numero,
agn.agn_st_bairro,
agn.agn_st_cep,
agn.agn_st_cxpostal,
agn.agn_st_complemento,
agn.agn_st_cgc,
agn.agn_st_email,
agn.agn_re_latitude,
agn.agn_re_longitude,
agn.agn_st_outrosemails

from mgglo.glo_agentes agn, mgglo.glo_agentes_id agn_id  -- de onde

where        agn.agn_in_codigo = agn_id.agn_in_codigo  -- em que casos
  and agn_id.agn_tau_st_codigo = 'C'
  and agn_id.agn_ch_status = 'A'
  and agn_id.agn_dt_iniciomov < sysdate

