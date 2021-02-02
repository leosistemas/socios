select 
ant.AFILIADO,ant.FAMILIAR,ant.FCAUSA,cast (ant.detalle as varchar(500)) detalle ,
ant.USUARIO,ant.ESTADO CODIGO_ESTADO,ant.CAUSA,c_ant.DESCRIPCION causa_descripcion,est.DESCRIPCION est_descripcion from antecedentes ant,CAUSA_ANTECEDENTE c_ant,estado est where ant.CAUSA=c_ant.CODIGO and ant.ESTADO=est.CODIGO and ant.AFILIADO=