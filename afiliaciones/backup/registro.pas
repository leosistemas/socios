unit registro;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, ComCtrls, ActnList,  DBGrids, titular, Modulo_datos,Buscar,
  sets ,ficha_familiar
  ;

type

  { Tficha_socio }

  Tficha_socio = class(TForm)
    Gparticipantes: TDBGrid;
    estado: TEdit;
    GPatrocinados: TDBGrid;
    Label27: TLabel;
    zona_delegacion: TLabeledEdit;
    tipodoc: TEdit;

    socios: TPageControl;
    titular: TTabSheet;
    TabSheet2: TTabSheet;

    alta: TButton;
    modificar: TButton;
    baja: TButton;
    reingreso: TButton;
    buscar: TButton;
    operaciones: TButton;
    grabar: TButton;
    cancelar: TButton;

    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label29: TLabel;
    Label26: TLabel;
    Label28: TLabel;
    Label24: TLabel;
    label25: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;

    apellido: TEdit;
    calle: TEdit;
    direccion: TEdit;
    partido: TEdit;
    localidad: TEdit;
    provincia: TEdit;
    codpostal: TEdit;
    piso: TEdit;
    depto: TEdit;
    fnacimiento: TEdit;
    edad: TEdit;
    Celular: TLabeledEdit;
    lugar_afiliacion: TLabeledEdit;
    FAlta: TLabeledEdit;
    FBaja: TLabeledEdit;
    FIngreso: TLabeledEdit;
    FEgreso: TLabeledEdit;
    Patrocinador: TLabeledEdit;
    Promotor: TLabeledEdit;
    Telefono: TLabeledEdit;
    fpago: TEdit;
    nlegajo: TEdit;
    beneficio: TEdit;
    cuil: TEdit;
    fz: TEdit;
    categoria: TEdit;
    origen_pago: TEdit;
    concepto: TEdit;
    email: TEdit;
    sexo: TEdit;
    estcivil: TEdit;
    nacionalidad: TEdit;
    nrodoc: TEdit;
    nombre: TEdit;

    Shape3: TShape;
    Shape4: TShape;
    Shape1: TShape;
    Shape2: TShape;

    procedure altaClick(Sender: TObject);
    procedure buscarClick(Sender: TObject);
     procedure cancelarClick(Sender: TObject);
     procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure GparticipantesDblClick(Sender: TObject);
    procedure grabarClick(Sender: TObject);
    procedure busc_patClick(Sender: TObject);
    procedure limpiar();
    procedure modificarClick(Sender: TObject);
    procedure view_buttons(accion:string);
    procedure asignar();


  private
    { private declarations }
  public
    { public declarations }
  end;

var
  ficha_socio: Tficha_socio;

implementation

{$R *.lfm}

{ Tficha_socio }
procedure Tficha_socio.FormShow(Sender: TObject);
begin
  DataModule1.Set_conector_socios();
  if conf.color_c='S' then
  begin
    shape1.Brush.Color:=StringToColor(sets.conf.c_cons1);
    shape2.Brush.Color:=StringToColor(sets.conf.c_cons2);
    shape3.Brush.Color:=StringToColor(sets.conf.c_cons3);
  end;
  limpiar();
  view_buttons('inicio');
   sets.f_tit.numero:='17111';
     asignar();
end;


procedure Tficha_socio.view_buttons(accion:string);
begin
   if accion='inicio' then
     begin
       alta.visible:=true; baja.visible:=false; modificar.visible:=false; operaciones.visible:=false; reingreso.visible:=false; buscar.visible:=true; grabar.visible:=false; cancelar.visible:=false;
     end;
    if accion='mostrar' then
     begin
       alta.visible:=true; baja.visible:=true; modificar.visible:=true; operaciones.visible:=true; reingreso.visible:=true; buscar.visible:=true; grabar.visible:=false; cancelar.visible:=false;
     end;

     if accion='ocultar' then
     begin
       alta.visible:=false; baja.visible:=false; modificar.visible:=false; operaciones.visible:=false; reingreso.visible:=false; buscar.visible:=false; grabar.visible:=true; cancelar.visible:=true;
     end;
end;

procedure Tficha_socio.limpiar();
begin

apellido.Text:='';calle.Text:='';direccion.Text:='';partido.Text:='';localidad.Text:='';provincia.Text:='';codpostal.Text:='';piso.Text:='';depto.Text:='';fnacimiento.Text:='';
edad.Text:='';Celular.Text:='';lugar_afiliacion.Text:='';FAlta.Text:='';FBaja.Text:='';FIngreso.Text:='';FEgreso.Text:='';Patrocinador.Text:='';Promotor.Text:='';Telefono.Text:='';
fpago.Text:='';zona_delegacion.Text:='';nlegajo.Text:='';beneficio.Text:='';cuil.Text:='';fz.Text:='';categoria.Text:='';origen_pago.Text:='';concepto.Text:='';email.Text:='';
estado.Text:='';sexo.Text:='';estcivil.Text:='';nacionalidad.Text:='';tipodoc.Text:='';nrodoc.Text:='';nombre.Text:='';

end;

procedure Tficha_socio.modificarClick(Sender: TObject);
begin
     sets.Set_flags.tipo_ficha:='modificar';
     Application.CreateForm(Ttitular,Ftitular);
     Ftitular.ShowModal;
     Ftitular.Destroy;
     //asignar();
     //buscar ficha cargada!!!!
end;



procedure Tficha_socio.altaClick(Sender: TObject);
begin
     limpiar();
     sets.Set_flags.tipo_ficha:='insert';
     Application.CreateForm(Ttitular,Ftitular);
     Ftitular.ShowModal;
     Ftitular.Destroy;
     //buscar ficha cargada!!!!
end;

procedure Tficha_socio.buscarClick(Sender: TObject);
begin
     Datamodule1.Qparticipantes.close;
     Datamodule1.Qpatrocinados.close;
     Datamodule1.QSets.close;
     Application.CreateForm(TForm5,FBuscar);
     FBuscar.ShowModal;
     FBuscar.Destroy;
     limpiar();
     view_buttons('inicio');
     asignar();
end;



procedure Tficha_socio.cancelarClick(Sender: TObject);
begin
     limpiar();
     view_buttons('mostrar');
end;

procedure Tficha_socio.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  DataModule1.QBuscar.close;
  Datamodule1.Qparticipantes.close;
  Datamodule1.Qpatrocinados.close;
  Datamodule1.QSets.close;
  DataModule1.conector_socios.Disconnect;
end;



procedure Tficha_socio.grabarClick(Sender: TObject);
begin
      limpiar();
     view_buttons('mostrar');
end;

procedure Tficha_socio.busc_patClick(Sender: TObject);
begin
   sets.f_tit.numero:=sets.f_tit.patrocinador ;
   limpiar();
   asignar();
end;

procedure Tficha_socio.asignar();
var
  cl:string;
begin
     //showmessage('asig' + sets.f_tit.numero);
     if sets.f_tit.numero='0' then
     begin
       showmessage('Sin datos');
       exit;
     end;
     cl:=DataModule1.sql_buscar('vista_legajo_titular.sql',sets.f_tit.numero,'','socio');
     DataModule1.QBuscar.close;
     DataModule1.QBuscar.sql.clear;
     DataModule1.QBuscar.sql.add(cl);
     DataModule1.QBuscar.Open;
     //exit();

     //DATOS PERSONALES
     nombre.Text:=DataModule1.QBuscar.FieldByName('nombre').AsString;
     apellido.Text:=DataModule1.QBuscar.FieldByName('apellido').AsString;
     tipodoc.Text:=DataModule1.QBuscar.FieldByName('tipodoc').AsString;
     nrodoc.Text:=DataModule1.QBuscar.FieldByName('nrodoc').AsString;
     cuil.Text:=DataModule1.QBuscar.FieldByName('cuil').AsString;
     sexo.Text:=DataModule1.QBuscar.FieldByName('sexo').AsString;
     fnacimiento.Text:=DataModule1.QBuscar.FieldByName('fnacimiento').AsString;
     estcivil.Text:=DataModule1.QBuscar.FieldByName('estcivil').AsString;
     nacionalidad.Text:=DataModule1.QBuscar.FieldByName('nacionalidad').AsString;
     edad.Text:=DataModule1.QBuscar.FieldByName('edad').AsString;
     Telefono.Text:=DataModule1.QBuscar.FieldByName('telefono').AsString;
     Celular.Text:=DataModule1.QBuscar.FieldByName('celular').AsString;
     email.Text:=DataModule1.QBuscar.FieldByName('email').AsString;

     //DATOS SOCIALES
       estado.text:=DataModule1.QBuscar.FieldByName('estado').AsString;
       categoria.Text:=DataModule1.QBuscar.FieldByName('categoria').AsString;
       origen_pago.Text:=DataModule1.QBuscar.FieldByName('origen_pago').AsString;
       fz.Text:=DataModule1.QBuscar.FieldByName('fuerza').AsString;
       concepto.Text:=DataModule1.QBuscar.FieldByName('concepto').AsString;
       fpago.Text:=DataModule1.QBuscar.FieldByName('fpago').AsString;
     nlegajo.Text:=DataModule1.QBuscar.FieldByName('nlegajo').AsString;
     beneficio.Text:=DataModule1.QBuscar.FieldByName('beneficio').AsString;
     FAlta.Text:=DataModule1.QBuscar.FieldByName('falta').AsString;
     FBaja.Text:=DataModule1.QBuscar.FieldByName('fbaja').AsString;
     FIngreso.Text:=DataModule1.QBuscar.FieldByName('finicio').AsString;
     FEgreso.Text:=DataModule1.QBuscar.FieldByName('fegreso').AsString;
     Patrocinador.Text:=DataModule1.QBuscar.FieldByName('titular_nombre').AsString;
     lugar_afiliacion.Text:=DataModule1.QBuscar.FieldByName('delegacion_afiliante').AsString;
     Promotor.Text:=DataModule1.QBuscar.FieldByName('delegacion_zona').AsString;


      //DATOS DE DOMICILIO


     calle.Text:=DataModule1.QBuscar.FieldByName('calle').AsString;
     direccion.Text:=DataModule1.QBuscar.FieldByName('numeracion_calle').AsString;
     piso.Text:=DataModule1.QBuscar.FieldByName('piso').AsString;
     depto.Text:=DataModule1.QBuscar.FieldByName('depto').AsString;
     codpostal.Text:=DataModule1.QBuscar.FieldByName('codpostal').AsString;
     localidad.Text:=DataModule1.QBuscar.FieldByName('localidad').AsString;
     partido.Text:=DataModule1.QBuscar.FieldByName('partido').AsString;
     provincia.Text:=DataModule1.QBuscar.FieldByName('provincia').AsString;
     zona_delegacion.Text:=DataModule1.QBuscar.FieldByName('delegacion_zona').AsString;

     sets.f_tit.patrocinador:=DataModule1.QBuscar.fieldbyname('codigo_titular').AsString;

     if (trim(sets.f_tit.patrocinador)='0') then
     begin
       patrocinador.Visible:=false;
       end
       else
       begin
           patrocinador.Visible:=true;
     end;

     cl:=DataModule1.sql_buscar('vista_participantes.sql',sets.f_tit.numero,'','socio');
     DataModule1.Qparticipantes.close;
     DataModule1.Qparticipantes.sql.clear;
     DataModule1.Qparticipantes.sql.add(cl);
     DataModule1.Qparticipantes.Open;

     cl:=DataModule1.sql_buscar('vista_patrocinado.sql',sets.f_tit.numero,'','socio');
     DataModule1.Qpatrocinados.close;
     DataModule1.Qpatrocinados.sql.clear;
     DataModule1.Qpatrocinados.sql.add(cl);
     DataModule1.Qpatrocinados.Open;
     view_buttons('mostrar');

end;

procedure Tficha_socio.GparticipantesDblClick(Sender: TObject);
begin
  if DataModule1.Qparticipantes.IsEmpty then exit;
  if DataModule1.Qparticipantes.RecordCount>0 then
  begin
    sets.Set_flags.tipo_ficha_fam:='modificar';
    sets.f_fam.idfamiliar:=DataModule1.Qparticipantes.FieldByName('id_familiar').AsString;
    Application.CreateForm(TFicha_fam, Ficha_fam);
    Ficha_fam.ShowModal;
  end;
end;

end.

