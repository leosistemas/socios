unit loc_inaes;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, ZDataset, Forms, Controls, Graphics, Dialogs,
  StdCtrls, DBGrids,Sets
  ;

type

  { TFloc_inaes }

  TFloc_inaes = class(TForm)
    codpost: TEdit;
    DS_loc_inaes: TDataSource;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    localidad: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    partido: TEdit;
    localidades: TZReadOnlyQuery;
    procedure codpostEnter(Sender: TObject);
    procedure codpostKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure localidadEnter(Sender: TObject);
    procedure localidadKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState );

    procedure Datosloc(bandera:string);
    procedure partidoEnter(Sender: TObject);
    procedure partidoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Floc_inaes: TFloc_inaes;

implementation

{$R *.lfm}

{ TFloc_inaes }

procedure TFloc_inaes.localidadKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   Datosloc('loc');
end;

procedure TFloc_inaes.codpostKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    Datosloc('cp');
end;

procedure TFloc_inaes.partidoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Datosloc('part');
end;

procedure TFloc_inaes.Datosloc(bandera:string);
var
  cadena:string;
begin
  if bandera='cp' then
      begin
   BEGIN
      if codpost.text<>'' THEN
       begin
        localidades.Close;
        localidades.SQL.Clear;
        cadena:='select codigo_provincia,codigo_localidad COD_INAES,cp,loc_inaes.localidad,prov_inaes.PROVINCIA,loc_inaes.PARTIDO  from LOC_INAES ';
        cadena:=cadena + ' INNER join prov_inaes on LOC_INAES.CODIGO_PROVINCIA=prov_inaes.CODIGO where loc_inaes.cp =' + codpost.text;
        localidades.SQL.Add(cadena);
        localidades.open;
        end;
       end;
  end;
  if bandera='loc' then
   begin
   if localidad.text<>'' THEN
       begin
         BEGIN
             localidades.Close;
             localidades.SQL.Clear;
             cadena:='select codigo_provincia,codigo_localidad COD_INAES,cp,loc_inaes.localidad,prov_inaes.PROVINCIA, loc_inaes.PARTIDO  from LOC_INAES ';
             cadena:= cadena + ' INNER join prov_inaes on LOC_INAES.CODIGO_PROVINCIA=prov_inaes.CODIGO where loc_inaes.localidad like ''%'+localidad.text+'%''order by localidad;';
             localidades.SQL.Add(cadena);
             localidades.open;
         end;
       end;
       end;
  if bandera='part' then
   begin
   if partido.text<>'' THEN
       begin
         BEGIN
             localidades.Close;
             localidades.SQL.Clear;
             cadena:='select codigo_provincia,codigo_localidad COD_INAES,cp,loc_inaes.localidad,prov_inaes.PROVINCIA, loc_inaes.PARTIDO  from LOC_INAES ';
             cadena:= cadena + ' INNER join prov_inaes on LOC_INAES.CODIGO_PROVINCIA=prov_inaes.CODIGO where loc_inaes.partido like ''%'+partido.text+'%''order by localidad;';
             localidades.SQL.Add(cadena);
             localidades.open;
         end;
       end;
  end;

end;

procedure TFloc_inaes.partidoEnter(Sender: TObject);
begin
  localidad.Text:='';
  codpost.text:='';
end;
procedure TFloc_inaes.localidadEnter(Sender: TObject);
begin
  partido.Text:='';
  codpost.text:='';
end;

procedure TFloc_inaes.codpostEnter(Sender: TObject);
begin
  partido.Text:='';
  localidad.text:='';

end;


procedure TFloc_inaes.DBGrid1DblClick(Sender: TObject);
begin
  f_tit.localidad:=localidades.FieldByName('localidad').AsString;
  f_tit.partido:=localidades.FieldByName('partido').AsString;
  f_tit.provincia:=localidades.FieldByName('provincia').AsString;
  f_tit.cod_loc_i:=localidades.FieldByName('cod_inaes').AsString;
  f_tit.cod_prov_i:=localidades.FieldByName('codigo_provincia').AsString;;
  if f_tit.flag_cp='' then  f_tit.codpostal:='0';
  if f_tit.flag_cp<>'' then
      begin
      if ((strtoint(f_tit.flag_cp)>=1450) and (length(f_tit.flag_cp)>0)) or (strtoint(localidades.FieldByName('cp').AsString)>0) then
         begin
         f_tit.codpostal:=localidades.FieldByName('cp').AsString;
         end
      else
      begin
         f_tit.codpostal:=f_tit.flag_cp;
      end;
      end;
  close;
end;

procedure TFloc_inaes.FormShow(Sender: TObject);
begin
  codpost.Text:=f_tit.flag_cp;
  if f_tit.flag_cp='' then        codpost.Text:='0';
  if f_tit.flag_cp<>'' then
     begin
     if strtoint(f_tit.flag_cp)<1450 then
         begin
           codpost.Text:='0';
         end;
     end;
   Datosloc('cp');
end;


end.

