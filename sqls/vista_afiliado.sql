select a.NUMERO,
a.ESTADO estado_1,
e.DESCRIPCION estado,
a.tipodoc,
a.NRODOC,
a.nombre,
a.APELLIDO,
a.SEXO,
a.codpostal,
a.fnacimiento,
a.estcivil estcivil_1,
ec.DESCRIPCION estcivil,
a.nacionalidad nacionalidad_1,
n.DESCRIPCION nacionalidad,
a.titular,
a.telefono,
a.ubigeo,
a.usuario,
a.falta,
a.fbaja,
a.email,
a.finicio,
a.fegreso,
a.nafiliado,
a.categoria categoria_1,
CAT.DESCRIPCION AS CATEGORIA,
a.NLEGAJO,
a.FMOMENTO,
a.BENEFICIO,
a.FPAGO,
a.PRESENTADO,
a.delegacionpresentado,
a.jerarquia jerarquia_1,
j.DESCRIPCION jerarquia,
a.ncertificado || '/' || a.ACERTIFICADO certificado,
a.ncertificado,
a.ACERTIFICADO,
a.PUEDEVOTAR,
a.edad,
a.nocorreo,
a.cbu,
a.via_spa,
a.cuil,
a.DOM_INAES,
a.CALLE,
a.NUMERACION_CALLE,
a.PISO,
a.loc_inaes,
a.prov_inaes,
a.DEPTO,
loc.LOCALIDAD,
loc.PARTIDO,
prov.PROVINCIA,
a.promotor promotor_1,
a.delegacion delegacion_1,
DELEGACION.descripcion as delegacion,
PROMOTORes.descripcion as promotor,
a.novedad,
a.inf_inaes,
a.TIPO_CUOTA,
a.celular,
fp.descripcion AS DESCUENTO,
pat.nombre || ', ' || pat.apellido as patrocinador,
pat.numero as patrocinador_numero
 from afiliados a
 left join afiliados pat on a.titular=pat.numero
 left join delegacion on a.delegacion=delegacion.codigo
 left join promotores on a.promotor=promotores.codigo
 inner join estado e on a.ESTADO=e.codigo
 inner join ESTADOCIVIL ec on a.ESTCIVIL=ec.CODIGO
 inner join NACIONALIDAD n on a.NACIONALIDAD=n.CODIGO
 inner join JERARQUIA j on a.jerarquia=j.CODIGO
 inner join LOC_INAES loc on a.LOC_INAES=loc.CODIGO_LOCALIDAD
 inner join PROV_INAES prov on loc.CODIGO_PROVINCIA=prov.CODIGO
 inner join CATEGORIA CAT ON A.CATEGORIA=CAT.CODIGO
 inner join FORMASPAGO FP ON A.FPAGO=FP.CODIGO
 
 where a.NUMERO=
