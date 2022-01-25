select numero,estado est,estado.descripcion estado,apellido || ', ' || nombre as nombre, beneficio,trim(cast(nlegajo as varchar(10))) nlegajo,tipodoc || ' ' || nrodoc as nrodoc ,cuil,cbu from afiliados inner join estado on afiliados.estado = estado.codigo where apellido like  '%
%' and nombre like '%
%' union all 
  select p.numero,p.estado est,estado.descripcion estado,p.apellido || ', ' || p.nombre as nombre, 0 as beneficio,trim(trim(cast(a.nlegajo as varchar(7))) ||'/' || trim(cast(p.familiar as varchar(2)))) nlegajo,p.tipodoc || ' ' || p.nrodoc as nrodoc ,0 cuil, 0 cbu from participantes p inner join estado on p.estado = estado.codigo inner join afiliados a on p.numero=a.numero where p.apellido like  '%
%' and p.nombre like '%
%'