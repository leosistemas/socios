SELECT orden,ncuota,IMPCUOTA,IMPPAGO,via,mescobro.DESCRIPCION mcobro ,cobrado.DESCRIPCION mcobrado 
FROM AY_EC_OTORGADAs_ctas 
left join P_MES_ENLETRAS(mes) mescobro on 1=1 
left join P_MES_ENLETRAS(mescobrado) cobrado on 1=1 
WHERE orden=