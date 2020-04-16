unit Sets;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,dialogs;

Type Tconfigs = Object
    pathSql:string;
    color_consulta:string;
    c_cons1:string;
    c_cons2:string;
    c_cons3:string;
    color_abm:string;
    c_abm1:string;
    c_abm2:string;
    c_abm3:string;
    color_c:string;
    color_a:string;
    procedure colores();

end;
Type TDatos = Object
       tipo_form_usr:string;
       usuario:string;
       idusuario:string;
       tipo_ficha:string;
       tipo_ficha_fam:string;
       grupodeusuario:string;
end;

Type TCampos=Object
       nom:string;
       us:string;
       grp:string;
       act:string;
       id:string;
       pass:string;
end;
Type TCadena=Object
       cadena1:string;
       cadena2:string;
       cadena3:string;
       cadena4:string;
       cadena5:string;
end;
Type TCamposTitular=Object
    apellido: string;
    calle: string;
    direccion: string;
    partido: string;
    localidad: string;
    provincia: string;
    codpostal: string;
    piso: string;
    depto: string;
    fnacimiento: string;
    edad: string;
    Celular: string;
    FAlta: string;
    FBaja: string;
    FIngreso: string;
    FEgreso: string;
    Patrocinador: string;
    Promotor: string;
    Telefono: string;
    jerarquia: string;
    cbu: string;
    nlegajo: string;
    beneficio: string;
    cuil: string;
    afiliado: string;
    categoria: string;
    descuento: string;
    certificado: string;
    email: string;
    sexo: string;
    estcivil: string;
    nacionalidad: string;
    nrodoc: string;
    nombre: string;
    numero:string;
    flag_cp:string;
    cod_loc_i:string;
    cod_prov_i:string;
    patrocinador:string;
end;

Type TCamposFamiliar=Object
    apellido: string;
    calle: string;
    direccion: string;
    partido: string;
    localidad: string;
    provincia: string;
    codpostal: string;
    piso: string;
    depto: string;
    fnacimiento: string;
    edad: string;
    Celular: string;
    FAlta: string;
    FBaja: string;
    FIngreso: string;
    FEgreso: string;
    Patrocinador: string;
    Promotor: string;
    Telefono: string;
    jerarquia: string;
    cbu: string;
    nlegajo: string;
    beneficio: string;
    cuil: string;
    afiliado: string;
    categoria: string;
    descuento: string;
    certificado: string;
    email: string;
    sexo: string;
    estcivil: string;
    nacionalidad: string;
    nrodoc: string;
    nombre: string;
    numero:string;
    idfamiliar:string;
end;

Var
Set_flags : TDatos;
US_fields : TCampos;
S_sql : TCadena;
f_tit:  TCamposTitular  ;
f_fam:  TCamposFamiliar  ;
conf:Tconfigs;

implementation
procedure TConfigs.colores();
var
  a:integer;
  b:integer;
begin
   conf.c_cons1:='';
   conf.c_cons2:='';
   conf.c_cons3:='';
   conf.c_abm1:='';
   conf.c_abm2:='';
   conf.c_abm3:='';
   conf.color_c:='';
   conf.color_a:='';
    if length(conf.color_consulta)>0 then
    begin
      conf.color_c:='S';
      b:=1;
      for a :=1 to length(conf.color_consulta) do
      begin
       if copy(conf.color_consulta,a,1)<>';' then
          begin
            if b=1 then conf.c_cons1:=conf.c_cons1+copy(conf.color_consulta,a,1);
            if b=2 then conf.c_cons2:=conf.c_cons2+copy(conf.color_consulta,a,1);
            if b=3 then conf.c_cons3:=conf.c_cons3+copy(conf.color_consulta,a,1);
          end;
       if (copy(conf.color_consulta,a,1)=';') and (b=2) then b:=3;
       if (copy(conf.color_consulta,a,1)=';') and (b=1) then b:=2;
      end;
      end;
    if length(conf.color_abm)>0 then
       begin
          conf.color_a:='S';
          b:=1;
         for a :=1 to length(conf.color_abm) do
         begin
          if copy(conf.color_abm,a,1)<>';' then
             begin
               if b=1 then conf.c_abm1:=conf.c_abm1+copy(conf.color_abm,a,1);
               if b=2 then conf.c_abm2:=conf.c_abm2+copy(conf.color_abm,a,1);
               if b=3 then conf.c_abm3:=conf.c_abm3+copy(conf.color_abm,a,1);
             end;
          if (copy(conf.color_abm,a,1)=';') and (b=2) then b:=3;
          if (copy(conf.color_abm,a,1)=';') and (b=1) then b:=2;
         end;
         end;
end;

end.

