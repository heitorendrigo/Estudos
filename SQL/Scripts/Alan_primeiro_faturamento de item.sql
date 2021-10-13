(select min(nf.not_dt_emissao) as data,itn.pro_in_codigo as item

from mgven.ven_notafiscal NF, mgven.ven_itemnotafiscal ITN

where nf.not_in_codigo = itn.not_in_codigo
and itn.pro_in_codigo in (3826,3892,4007,1286,4031,1299,1302,1303,1312,1313,3329,3328,2708,3730,3824,3825,4038,3908,3893,3906,3950,3996,4071,3411,3895,4149,3215,4179,4004,3443,4046,3949,4128,4129,3263,3365,4060,4109,4133,1690,3007)
group by itn.pro_in_codigo)
