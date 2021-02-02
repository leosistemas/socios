select afiliado,familiar,estado codigo_estado, estado.DESCRIPCION estado,causa codigo_cuasa,
CAUSA_ANTECEDENTE.DESCRIPCION causa,fcausa,detalle,usuario 
from antecedentes,estado,CAUSA_ANTECEDENTE  
where  
antecedentes.CAUSA=CAUSA_ANTECEDENTE.CODIGO and 
estado.codigo=antecedentes.CAUSA and afiliado=