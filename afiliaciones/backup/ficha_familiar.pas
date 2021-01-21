unit ficha_familiar;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  control_abm, sets, ExtCtrls, ComCtrls, Modulo_datos
  ;

type

  {  TFicha_fam }

  TFicha_fam = class(TForm)
    apellido: TEdit;
    Button1: TButton;
    calle: TEdit;
    Celular: TLabeledEdit;
    codpostal: TEdit;
    cuil: TEdit;
    depto: TEdit;
    direccion: TEdit;
    edad: TEdit;
    FAlta: TLabeledEdit;
    familiar: TEdit;
    email: TEdit;
    FBaja: TLabeledEdit;
    fnacimiento: TEdit;
    nombre: TEdit;
    nrodoc: TEdit;
    PageControl1: TPageControl;
    partido: TEdit;
    piso: TEdit;
    provincia: TEdit;
    estado: TComboBox;
    incapacidad: TComboBox;
    acargo: TComboBox;
    estcivil: TComboBox;
    parentesco: TComboBox;
    nacionalidad: TComboBox;
    sexo: TComboBox;
    Shape4: TShape;
    fichaFam: TTabSheet;
    antecedentesFam: TTabSheet;
    atencionesFam: TTabSheet;
    tipodoc: TComboBox;
     Telefono: TLabeledEdit;

    Label16: TLabel;
    Label18: TLabel;
    Label22: TLabel;
    Label27: TLabel;
    Label1: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    label25: TLabel;
    Label26: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    localidad: TEdit;
    Shape1: TShape;
    Shape2: TShape;

    tipodoc1: TComboBox;

    procedure apellidoExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure calleExit(Sender: TObject);
    procedure CelularExit(Sender: TObject);
    procedure codpostalExit(Sender: TObject);
    procedure cuilExit(Sender: TObject);
    procedure deptoExit(Sender: TObject);
    procedure direccionExit(Sender: TObject);
    procedure edadExit(Sender: TObject);
    procedure familiarExit(Sender: TObject);
    procedure emailExit(Sender: TObject);
    procedure fnacimientoExit(Sender: TObject);
    procedure nombreExit(Sender: TObject);
    procedure nrodocExit(Sender: TObject);
    procedure partidoExit(Sender: TObject);
    procedure pisoExit(Sender: TObject);
    procedure provinciaExit(Sender: TObject);
    procedure estadoExit(Sender: TObject);
    procedure incapacidadExit(Sender: TObject);
    procedure acargoExit(Sender: TObject);
    procedure estcivilExit(Sender: TObject);
    procedure parentescoExit(Sender: TObject);
    procedure nacionalidadExit(Sender: TObject);
    procedure sexoExit(Sender: TObject);
    procedure tipodocExit(Sender: TObject);
    procedure apellidoEnter(Sender: TObject);
    procedure calleEnter(Sender: TObject);
    procedure CelularEnter(Sender: TObject);
    procedure codpostalEnter(Sender: TObject);
    procedure cuilEnter(Sender: TObject);
    procedure deptoEnter(Sender: TObject);
    procedure direccionEnter(Sender: TObject);
    procedure edadEnter(Sender: TObject);
    procedure familiarEnter(Sender: TObject);
    procedure emailEnter(Sender: TObject);
    procedure fnacimientoEnter(Sender: TObject);
    procedure nombreEnter(Sender: TObject);
    procedure nrodocEnter(Sender: TObject);
    procedure partidoEnter(Sender: TObject);
    procedure pisoEnter(Sender: TObject);
    procedure provinciaEnter(Sender: TObject);
    procedure estadoEnter(Sender: TObject);
    procedure incapacidadEnter(Sender: TObject);
    procedure acargoEnter(Sender: TObject);
    procedure estcivilEnter(Sender: TObject);
    procedure parentescoEnter(Sender: TObject);
    procedure nacionalidadEnter(Sender: TObject);
    procedure sexoEnter(Sender: TObject);
    procedure tipodocEnter(Sender: TObject);
    procedure EntraEdit(Sender: TObject);
    procedure SaleEdit(Sender: TObject);

    procedure asigna();
    procedure asignar_boxes(Sender:TObject);
    procedure cargar_boxes();
    procedure FormShow(Sender: TObject);
    procedure setear_boxes();
    procedure limpiar();
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Ficha_fam: TFicha_fam;

implementation

{$R *.lfm}

{ TFicha_fam }
procedure TFicha_fam.apellidoEnter(Sender: TObject);begin EntraEdit(Sender);end;
procedure TFicha_fam.calleEnter(Sender: TObject);begin EntraEdit(Sender);end;
procedure TFicha_fam.CelularEnter(Sender: TObject);begin EntraEdit(Sender);end;
procedure TFicha_fam.codpostalEnter(Sender: TObject);begin EntraEdit(Sender);end;
procedure TFicha_fam.cuilEnter(Sender: TObject);begin EntraEdit(Sender);end;
procedure TFicha_fam.deptoEnter(Sender: TObject);begin EntraEdit(Sender);end;
procedure TFicha_fam.direccionEnter(Sender: TObject);begin EntraEdit(Sender);end;
procedure TFicha_fam.edadEnter(Sender: TObject);begin EntraEdit(Sender);end;
procedure TFicha_fam.familiarEnter(Sender: TObject);begin EntraEdit(Sender);end;
procedure TFicha_fam.emailEnter(Sender: TObject);begin EntraEdit(Sender);end;
procedure TFicha_fam.fnacimientoEnter(Sender: TObject);begin EntraEdit(Sender);end;
procedure TFicha_fam.nombreEnter(Sender: TObject);begin EntraEdit(Sender);end;
procedure TFicha_fam.nrodocEnter(Sender: TObject);begin EntraEdit(Sender);end;
procedure TFicha_fam.partidoEnter(Sender: TObject);begin EntraEdit(Sender);end;
procedure TFicha_fam.pisoEnter(Sender: TObject);begin EntraEdit(Sender);end;
procedure TFicha_fam.provinciaEnter(Sender: TObject);begin EntraEdit(Sender);end;
procedure TFicha_fam.estadoEnter(Sender: TObject);begin EntraEdit(Sender);end;
procedure TFicha_fam.incapacidadEnter(Sender: TObject);begin EntraEdit(Sender);end;
procedure TFicha_fam.acargoEnter(Sender: TObject);begin EntraEdit(Sender);end;
procedure TFicha_fam.estcivilEnter(Sender: TObject);begin EntraEdit(Sender);end;
procedure TFicha_fam.parentescoEnter(Sender: TObject);begin EntraEdit(Sender);end;
procedure TFicha_fam.nacionalidadEnter(Sender: TObject);begin EntraEdit(Sender);end;
procedure TFicha_fam.sexoEnter(Sender: TObject);begin EntraEdit(Sender);end;
procedure TFicha_fam.tipodocEnter(Sender: TObject);begin EntraEdit(Sender);end;

procedure TFicha_fam.apellidoExit(Sender: TObject);begin SaleEdit(Sender);end;

procedure TFicha_fam.Button1Click(Sender: TObject);
begin
  //limpiar();
end;

procedure TFicha_fam.calleExit(Sender: TObject);begin SaleEdit(Sender);end;
procedure TFicha_fam.CelularExit(Sender: TObject);begin SaleEdit(Sender);end;
procedure TFicha_fam.codpostalExit(Sender: TObject);begin SaleEdit(Sender);end;
procedure TFicha_fam.cuilExit(Sender: TObject);begin SaleEdit(Sender);end;
procedure TFicha_fam.deptoExit(Sender: TObject);begin SaleEdit(Sender);end;
procedure TFicha_fam.direccionExit(Sender: TObject);begin SaleEdit(Sender);end;
procedure TFicha_fam.edadExit(Sender: TObject);begin SaleEdit(Sender);end;
procedure TFicha_fam.familiarExit(Sender: TObject);begin SaleEdit(Sender);end;
procedure TFicha_fam.emailExit(Sender: TObject);begin SaleEdit(Sender);end;
procedure TFicha_fam.fnacimientoExit(Sender: TObject);begin SaleEdit(Sender);end;
procedure TFicha_fam.nombreExit(Sender: TObject);begin SaleEdit(Sender);end;
procedure TFicha_fam.nrodocExit(Sender: TObject);begin SaleEdit(Sender);end;
procedure TFicha_fam.partidoExit(Sender: TObject);begin SaleEdit(Sender);end;
procedure TFicha_fam.pisoExit(Sender: TObject);begin SaleEdit(Sender);end;
procedure TFicha_fam.provinciaExit(Sender: TObject);begin SaleEdit(Sender);end;
procedure TFicha_fam.estadoExit(Sender: TObject);begin SaleEdit(Sender);end;
procedure TFicha_fam.incapacidadExit(Sender: TObject);begin SaleEdit(Sender);end;
procedure TFicha_fam.acargoExit(Sender: TObject);begin SaleEdit(Sender);end;
procedure TFicha_fam.estcivilExit(Sender: TObject);begin SaleEdit(Sender);end;
procedure TFicha_fam.parentescoExit(Sender: TObject);begin SaleEdit(Sender);end;
procedure TFicha_fam.nacionalidadExit(Sender: TObject);begin SaleEdit(Sender);end;
procedure TFicha_fam.sexoExit(Sender: TObject);begin SaleEdit(Sender);end;
procedure TFicha_fam.tipodocExit(Sender: TObject);begin SaleEdit(Sender);end;

procedure TFicha_fam.EntraEdit(Sender: TObject);
begin
     TEdit(Sender).Color:=clYellow;
end;
procedure TFicha_fam.SaleEdit(Sender: TObject);
begin
     TEdit(Sender).Color:=clDefault;
end;
procedure TFicha_fam.limpiar();
begin
  apellido.Text:='';calle.Text:='';Celular.Text:='';codpostal.Text:='';cuil.Text:='';depto.Text:='';direccion.Text:='';edad.Text:='';
  FAlta.Text:='';familiar.Text:='';email.Text:='';FBaja.Text:='';fnacimiento.Text:='';nombre.Text:='';nrodoc.Text:='';partido.Text:='';
  piso.Text:='';provincia.Text:='';estado.Text:='';incapacidad.Text:='';acargo.Text:='';estcivil.Text:='';parentesco.Text:='';
  nacionalidad.Text:='';sexo.Text:='';tipodoc.Text:=''; Telefono.Text:='';localidad.Text:='';
end;

procedure TFicha_fam.asigna;
var
  cl:string;
begin
     cl:=DataModule1.sql_buscar('vista_fichaFam.sql',sets.f_fam.idfamiliar,'','socio');
     DataModule1.QFicha_fam.close;
     DataModule1.QFicha_fam.sql.clear;
     DataModule1.QFicha_fam.sql.add(cl);
     DataModule1.QFicha_fam.Open;
     apellido.Text:=DataModule1.QFicha_fam.FieldByName('apellido').AsString;
     calle.Text:=DataModule1.QFicha_fam.FieldByName('calle').AsString;
     direccion.Text:=DataModule1.QFicha_fam.FieldByName('numeracion_calle').AsString;
     partido.Text:='paritdo';//DataModule1.QBuscar.FieldByName('partido').AsString;
     localidad.Text:='localidaad';//DataModule1.QBuscar.FieldByName('localidad').AsString;
     provincia.Text:='provincia';//DataModule1.QBuscar.FieldByName('provincia').AsString;
     codpostal.Text:=DataModule1.QFicha_fam.FieldByName('codpostal').AsString;
     piso.Text:=DataModule1.QFicha_fam.FieldByName('piso').AsString;
     depto.Text:=DataModule1.QFicha_fam.FieldByName('depto').AsString;
     fnacimiento.Text:=DataModule1.QFicha_fam.FieldByName('fnacimiento').AsString;
     edad.Text:=DataModule1.QFicha_fam.FieldByName('edad').AsString;
  //   Celular.Text:=DataModule1.QBuscar.FieldByName('celular').AsString;

     FAlta.Text:=DataModule1.QFicha_fam.FieldByName('falta').AsString;
     FBaja.Text:=DataModule1.QFicha_fam.FieldByName('fbaja').AsString;

     Telefono.Text:=DataModule1.QFicha_fam.FieldByName('telefono').AsString;
     familiar.Text:=DataModule1.QFicha_fam.FieldByName('familiar').AsString;
//   cuil.Text:=DataModule1.QBuscar.FieldByName('cuil').AsString;
     email.Text:=DataModule1.QFicha_fam.FieldByName('email').AsString;
     sexo.Text:=DataModule1.QFicha_fam.FieldByName('sexo').AsString;
     estcivil.Text:=DataModule1.QFicha_fam.FieldByName('estcivil').AsString;
     nacionalidad.Text:=DataModule1.QFicha_fam.FieldByName('nacionalidad').AsString;
     tipodoc.Text:=DataModule1.QFicha_fam.FieldByName('tipodoc').AsString;
     nrodoc.Text:=DataModule1.QFicha_fam.FieldByName('nrodoc').AsString;
     nombre.Text:=DataModule1.QFicha_fam.FieldByName('nombre').AsString;
end;



procedure TFicha_fam.FormShow(Sender: TObject);
begin
  if conf.color_a='S' then
  begin
     if sets.Set_flags.tipo_ficha_fam='insert' then
        begin
          shape1.Brush.Color:=StringToColor(sets.conf.c_abm1);
          shape2.Brush.Color:=StringToColor(sets.conf.c_abm2);
        end;
    if sets.Set_flags.tipo_ficha_fam='modificar' then
        begin
          shape1.Brush.Color:=StringToColor(sets.conf.c_cons1);
          shape2.Brush.Color:=StringToColor(sets.conf.c_cons2);
        end;
  end;
  if sets.Set_flags.tipo_ficha_fam='modificar' then
  begin
     limpiar();

    // view_buttons('ocultar');
     asigna();
     setear_boxes();
     cargar_boxes();
  end;
  if sets.Set_flags.tipo_ficha_fam='insert' then
  begin
     limpiar();
    // view_buttons('ocultar');
     cargar_boxes();
  end;

end;
procedure TFicha_fam.asignar_boxes(Sender: TObject);
begin
   TComboBox(Sender).Clear;
     DataModule1.QSets.First;
     while not DataModule1.QSets.EOF do
  begin
    if TComboBox(Sender).Name='tipodoc1' then
      begin
          TComboBox(Sender).Items.Add(trim(DataModule1.QSets.FieldByName('abreviado').AsString));
          DataModule1.QSets.Next;
      end
    else
        begin
          TComboBox(Sender).Items.Add(trim(DataModule1.QSets.FieldByName('descripcion').AsString));
          DataModule1.QSets.Next;
        end;
  end;
end;

procedure TFicha_fam.setear_boxes;
begin
     ctrl.set_combo('documentos');
     asignar_boxes(Ficha_fam.tipodoc);
     asignar_boxes(Ficha_fam.tipodoc1);
     ctrl.set_combo('estadocivil');
     asignar_boxes(Ficha_fam.estcivil);
     ctrl.set_combo('nacionalidad');
     asignar_boxes(Ficha_fam.nacionalidad);
     ctrl.set_combo('estado');
     asignar_boxes(Ficha_fam.estado);
     ctrl.set_combo('parentesco');
     asignar_boxes(Ficha_fam.parentesco);
    ctrl.set_combo('estado');
     asignar_boxes(Ficha_fam.estado);
end;

procedure TFicha_fam.cargar_boxes;
   var
  a:integer;
begin
   for a :=0 to tipodoc.Items.Count-1 do
  begin
      if trim(tipodoc1.Items[a])=trim(DataModule1.Qparticipantes.FieldByName('tipodoc').asstring) then
     begin
         tipodoc.ItemIndex:=a;
     end;
  end;
  for a :=0 to estcivil.Items.Count-1 do
  begin
      if trim(estcivil.Items[a])=trim(DataModule1.Qparticipantes.FieldByName('estcivil').asstring) then
     begin
         estcivil.ItemIndex:=a;
     end;
  end;
   for a :=0 to nacionalidad.Items.Count-1 do
  begin
     if trim(nacionalidad.Items[a])=trim(DataModule1.Qparticipantes.FieldByName('nacionalidad').asstring) then
     begin
         nacionalidad.ItemIndex:=a;
     end;
  end;
   for a :=0 to estado.Items.Count-1 do
  begin
     if trim(estado.Items[a])=trim(DataModule1.Qparticipantes.FieldByName('estado').asstring) then
     begin
         estado.ItemIndex:=a;
     end;
  end;
  for a :=0 to parentesco.Items.Count-1 do
  begin
     if trim(parentesco.Items[a])=trim(DataModule1.Qparticipantes.FieldByName('parentesco').asstring) then
     begin

         parentesco.ItemIndex:=a;
     end;
  end;
   if DataModule1.Qparticipantes.FieldByName('sexo').asstring ='M' then sexo.ItemIndex:=0;
   if DataModule1.Qparticipantes.FieldByName('sexo').asstring ='F' then sexo.ItemIndex:=1;
   if DataModule1.Qparticipantes.FieldByName('acargo').asstring ='S' then acargo.ItemIndex:=0;
   if DataModule1.Qparticipantes.FieldByName('acargo').asstring ='N' then acargo.ItemIndex:=1;
   if DataModule1.Qparticipantes.FieldByName('incapacidad').asstring ='S' then incapacidad.ItemIndex:=0;
   if DataModule1.Qparticipantes.FieldByName('incapacidad').asstring ='N' then incapacidad.ItemIndex:=1;

 end;
end.

