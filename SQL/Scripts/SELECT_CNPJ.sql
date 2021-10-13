select a.*,a.rowid from mgglo.glo_agentes a
--set a.agn_ch_statuscgc = 'C'
where not(a.agn_st_cgc is null)
      and a.agn_st_cgc like '%/%'
      and a.agn_ch_statuscgc = 'N'
