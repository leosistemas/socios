unit Modulo_datos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, ZConnection, ZDataset,Forms,dialogs,Sets;

 type

  { TDataModule1 }

  TDataModule1 = class(TDataModule)
    DSMicroantecedente: TDataSource;
    DS_AyudasCtas: TDataSource;
    DS_CargosFijos: TDataSource;
    DS_AC_antecedentes: TDataSource;
    DS_Ayudas: TDataSource;
    DS_CargosEnCuotas: TDataSource;
    DS_deleg: TDataSource;
    DS_partPatrocinado: TDataSource;
    DS_promotores: TDataSource;
    DS_Buscar: TDataSource;
    DS_participantes: TDataSource;
    DS_patrocinados: TDataSource;
    DS_usuarios: TDataSource;
    DS_ACARGO: TDataSource;
    QAcargo: TZQuery;
    QMicroantecedente: TZQuery;
    QAyudas: TZQuery;
    QAyudasCtas: TZQuery;
    QCargosEnCuotas: TZQuery;
    QMicroficha: TZQuery;
    QCargosFijos: TZQuery;
    QAC_Antecedentes: TZQuery;
    QpartPatrocinado: TZReadOnlyQuery;
    QQQ: TZQuery;
    QFicha_fam: TZReadOnlyQuery;
    Qpatrocinados: TZReadOnlyQuery;
    QSets: TZQuery;
    Qusuarios: TZQuery;
    QBuscar: TZQuery;
    Qparticipantes: TZReadOnlyQuery;
    Qdeleg: TZQuery;
    Qpromotores: TZQuery;
    conector_socios: TZConnection;
    QRead: TZReadOnlyQuery;
    procedure conector_sociosBeforeConnect(Sender: TObject);
    procedure Set_conector_socios();
    procedure select_usuario();
   function sql_buscar(archivo:string;cl:string;cl2:string;tipo:string):string;
  private
  public
  end;

var
  DataModule1: TDataModule1;

implementation
{$R *.lfm}

PROCEDURE TDataModule1.Set_conector_socios();
var
    renglon:string;
    path:string;
    fileconfig:textfile;
begin
  datamodule1.conector_socios.Disconnect;
  path :=ExtractFilePath (Application.ExeName) +'librerias\';
  conf.pathSql:=ExtractFilePath (Application.ExeName)+'sqls\';
  AssignFile(fileconfig,path+'dbxconfig.ini');
  Reset(fileconfig);
  readln(fileconfig,renglon);
  renglon:= trim(path)+trim(renglon);
    DataModule1.conector_socios.LibraryLocation:=renglon;
  readln(fileconfig,renglon);
  DataModule1.conector_socios.HostName:=trim(renglon);
  readln(fileconfig,renglon);
  DataModule1.conector_socios.Port:=strtoint(trim(renglon))+3049;
  readln(fileconfig,renglon);
  DataModule1.conector_socios.Protocol:=trim(renglon);
  readln(fileconfig,renglon);
  DataModule1.conector_socios.Database:=trim(renglon);
  DataModule1.conector_socios.User:='sysdba';
  DataModule1.conector_socios.Password:='masterkey';
  closefile(fileconfig);
  datamodule1.conector_socios.Connect;
end;

procedure TDataModule1.conector_sociosBeforeConnect(Sender: TObject);
begin
 DataModule1.conector_socios.Properties.Add('codepage=ISO_8859_1');
 DataModule1.conector_socios.Properties.Add('charset=ISO_8859_1');
end;



procedure TDataModule1.select_usuario();
var
    cadena:string;
begin
  cadena:='select id,usuario,nombre,iif(activo=''T'',''SI'',''NO'') activo,cast(fcreado as date) fcreado,cast(fmodificacion as date) fmodificacion,grupo,passbuscar from segur_usuarios';
  DataModule1.Qusuarios.Close;
  DataModule1.Qusuarios.SQL.clear;
  DataModule1.Qusuarios.SQL.Add(cadena);
  DataModule1.Qusuarios.Open;
end;
function TDataModule1.sql_buscar(archivo:string;cl:string;cl2:string;tipo:string):string;
var
    fuente: textfile;
    renglon:string;
    SQ:string;
begin
  //
  SQ:='';
  renglon:=conf.pathSql+archivo;
    AssignFile(fuente,renglon);
    Reset(fuente);
  if (tipo<>'nombre') and (tipo<>'socio') then
  begin
    readln(fuente,renglon);
    SQ:=renglon +tipo+ cl;
  end;
    if tipo='nombre' then
    begin
             readln(fuente,renglon);
             SQ:=renglon + cl;
             readln(fuente,renglon);
             SQ:=SQ+ renglon+cl2;
             readln(fuente,renglon);
             SQ:=SQ+ renglon;
             readln(fuente,renglon);
             SQ:=SQ+renglon + cl;
             readln(fuente,renglon);
             SQ:=SQ+ renglon+cl2;
             readln(fuente,renglon);
             SQ:=SQ+ renglon;

    end;
    if tipo='socio' then
    begin
             while not eof(fuente) do
             begin
                  readln(fuente,renglon);
                  SQ:=SQ+renglon;
             end;
             SQ:=SQ+cl;

    end;
    closefile(fuente);

    result:=SQ;
end;

end.

