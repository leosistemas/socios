select numero,estado est,estado.descripcion estado,apellido || ' ' || nombre as nombre, beneficio,nlegajo,tipodoc || ' ' || nrodoc as nrodoc ,cuil,cbu from afiliados inner join estado on afiliados.estado = estado.codigo where apellido like  '%
%' and nombre like '%
%'