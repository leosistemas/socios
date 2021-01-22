select 
p.numero,
p.ID_FAMILIAR,
p.apellido,
p.nombre,
p.tipodoc,
p.nrodoc,
p.ESTADO codigo_estado,
e.descripcion estado,
p.EDAD,
p.ESTCIVIL estcivil_1,
estc.descripcion estcivil,
p.familiar,
p.FALTA,
p.FBAJA,
p.EMAIL,
p.FNACIMIENTO,
p.FPAGO,
p.NACIONALIDAD,
p.PARENTESCO parenstesco_1,
fam.DESCRIPCION parentesco,
p.SEXO,
p.ACARGO,
p.INCAPACIDAD,
p.CALLE,
p.NUMERACION_CALLE,
p.PISO,
p.DEPTO,
p.CODPOSTAL,
p.LOC_INAES,
p.telefono

 from participantes p
 inner join afiliados a on p.numero=a.numero
 inner join estado e on p.estado=e.codigo
 inner join ESTADOCIVIL estc on p.ESTCIVIL=estc.CODIGO
 inner join parentesco fam on p.PARENTESCO=fam.CODIGO 
 where p.numero=