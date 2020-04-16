unit titular;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DateTimePicker, Forms, Controls, Graphics,
  Dialogs, StdCtrls, ExtCtrls, ActnList, ColorBox, Buttons, sets, Modulo_datos,
  control_abm, loc_inaes
  ;

type

  { Ttitular }

  Ttitular = class(TForm)
    acertificado: TEdit;
    ColorBox1: TColorBox;
    ColorBox2: TColorBox;
    ColorBox3: TColorBox;
    categoria: TComboBox;
    Image1: TImage;
    promotor: TComboBox;
    delegacion: TComboBox;
    fingreso: TDateTimePicker;
    fbaja: TDateTimePicker;
    fegreso: TDateTimePicker;
    falta: TDateTimePicker;
    fnacimiento: TDateTimePicker;
    descuento: TComboBox;
    Label17: TLabel;
    Label27: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    jerarquia: TComboBox;
    Label30: TLabel;
    sexo: TComboBox;
    estcivil: TComboBox;
    nacionalidad: TComboBox;
    Shape2: TShape;
    Shape3: TShape;
    tipodoc: TComboBox;
    grabar: TButton;
    cancelar: TButton;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
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
    Celular: TLabeledEdit;
    Patrocinador: TLabeledEdit;
    Telefono: TLabeledEdit;
    cbu: TEdit;
    nlegajo: TEdit;
    beneficio: TEdit;
    cuil: TEdit;
    afiliado: TEdit;
    ncertificado: TEdit;
    email: TEdit;
    nrodoc: TEdit;
    nombre: TEdit;

    Shape4: TShape;
    Shape1: TShape;
    tipodoc1: TComboBox;

    procedure cancelarClick(Sender: TObject);
    procedure codpostalKeyPress(Sender: TObject; var Key: char);
    procedure ColorBox1Change(Sender: TObject);
    procedure ColorBox2Change(Sender: TObject);
    procedure ColorBox3Change(Sender: TObject);

    procedure FormShow(Sender: TObject);
    procedure grabarClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure limpiar();

    procedure view_buttons(accion:string);
    procedure EntraEdit(Sender: TObject);
    procedure SaleEdit(Sender: TObject);

      procedure apellidoExit(Sender: TObject);
      procedure calleExit(Sender: TObject);
      procedure direccionExit(Sender: TObject);
      procedure partidoExit(Sender: TObject);
      procedure localidadExit(Sender: TObject);
      procedure provinciaExit(Sender: TObject);
      procedure codpostalExit(Sender: TObject);
      procedure pisoExit(Sender: TObject);
      procedure deptoExit(Sender: TObject);
      procedure fnacimientoExit(Sender: TObject);
      procedure edadExit(Sender: TObject);
      procedure CelularExit(Sender: TObject);
      procedure DelegacionExit(Sender: TObject);
      procedure FAltaExit(Sender: TObject);
      procedure FBajaExit(Sender: TObject);
      procedure FIngresoExit(Sender: TObject);
      procedure FEgresoExit(Sender: TObject);
      procedure PatrocinadorExit(Sender: TObject);
      procedure PromotorExit(Sender: TObject);
      procedure TelefonoExit(Sender: TObject);
      procedure jerarquiaExit(Sender: TObject);
      procedure cbuExit(Sender: TObject);
      procedure nlegajoExit(Sender: TObject);
      procedure beneficioExit(Sender: TObject);
      procedure cuilExit(Sender: TObject);
      procedure afiliadoExit(Sender: TObject);
      procedure categoriaExit(Sender: TObject);
      procedure descuentoExit(Sender: TObject);
      procedure ncertificadoExit(Sender: TObject);
      procedure emailExit(Sender: TObject);
      procedure sexoExit(Sender: TObject);
      procedure estcivilExit(Sender: TObject);
      procedure nacionalidadExit(Sender: TObject);
      procedure tipodocExit(Sender: TObject);
      procedure nrodocExit(Sender: TObject);
      procedure nombreExit(Sender: TObject);

     procedure apellidoEnter(Sender: TObject);
    procedure calleEnter(Sender: TObject);
    procedure direccionEnter(Sender: TObject);
    procedure partidoEnter(Sender: TObject);
    procedure localidadEnter(Sender: TObject);
    procedure provinciaEnter(Sender: TObject);
    procedure codpostalEnter(Sender: TObject);
    procedure pisoEnter(Sender: TObject);
    procedure deptoEnter(Sender: TObject);
    procedure fnacimientoEnter(Sender: TObject);
    procedure edadEnter(Sender: TObject);
    procedure CelularEnter(Sender: TObject);
    procedure DelegacionEnter(Sender: TObject);
    procedure FAltaEnter(Sender: TObject);
    procedure FBajaEnter(Sender: TObject);
    procedure FIngresoEnter(Sender: TObject);
    procedure FEgresoEnter(Sender: TObject);
    procedure PatrocinadorEnter(Sender: TObject);
    procedure PromotorEnter(Sender: TObject);
    procedure TelefonoEnter(Sender: TObject);
    procedure jerarquiaEnter(Sender: TObject);
    procedure cbuEnter(Sender: TObject);
    procedure nlegajoEnter(Sender: TObject);
    procedure beneficioEnter(Sender: TObject);
    procedure cuilEnter(Sender: TObject);
    procedure afiliadoEnter(Sender: TObject);
    procedure categoriaEnter(Sender: TObject);
    procedure descuentoEnter(Sender: TObject);
    procedure ncertificadoEnter(Sender: TObject);
    procedure emailEnter(Sender: TObject);
    procedure sexoEnter(Sender: TObject);
    procedure estcivilEnter(Sender: TObject);
    procedure nacionalidadEnter(Sender: TObject);
    procedure tipodocEnter(Sender: TObject);
    procedure nrodocEnter(Sender: TObject);
    procedure nombreEnter(Sender: TObject);
    procedure asigna();
    procedure paleta();
    procedure asignar_boxes(Sender:TObject);
    procedure cargar_boxes();
    procedure setear_boxes();
    function campos():string;
    function campos_data():string;
    function campos_update():string;
    procedure set_valor_combo();
    procedure set_valor_combo_tabla(tabla:string);
    function set_valor_combo_box(Sender:TObject;campo:string):string;
  private
    { private declarations }
  public
    { public declarations }
    tdoc:string;sex:string;estc:string;nac:string;cat:string;desc:string;jer:string;
  end;

var
  Ftitular: Ttitular;

implementation

{$R *.lfm}

{ Ttitular }


procedure Ttitular.view_buttons(accion:string);
begin
    if accion='insert' then
     begin
        grabar.visible:=true; cancelar.visible:=true;
        fingreso.Visible:=false;fbaja.Visible:=false;fegreso.Visible:=false;
        Label34.Visible:=false;Label35.Visible:=false;Label36.Visible:=false;
        colorbox1.Visible:=false; colorbox2.Visible:=false; colorbox3.Visible:=false;
        fingreso.Date:=nulldate;fnacimiento.Date:=nulldate;
      end;

     if accion='modificar' then
     begin
        grabar.visible:=true; cancelar.visible:=true;
        colorbox1.Visible:=false; colorbox2.Visible:=false; colorbox3.Visible:=false;
     end;
end;

procedure Ttitular.FormShow(Sender: TObject);
begin
  if (sets.Set_flags.tipo_ficha='paleta_consulta') or (sets.Set_flags.tipo_ficha='paleta_abm') then paleta();
  if conf.color_a='S' then
  begin
    shape1.Brush.Color:=StringToColor(sets.conf.c_abm1);
    shape2.Brush.Color:=StringToColor(sets.conf.c_abm2);
    shape3.Brush.Color:=StringToColor(sets.conf.c_abm3);
  end;
  if sets.Set_flags.tipo_ficha='modificar' then
  begin
     limpiar();
     view_buttons('modificar');
     asigna();
    cargar_boxes();
    setear_boxes();

  end;
  if sets.Set_flags.tipo_ficha='insert' then
  begin
     limpiar();
     view_buttons('insert');
      cargar_boxes();
  end;
end;

procedure Ttitular.ColorBox1Change(Sender: TObject);
begin
  shape1.Brush.Color:=ColorBox1.Colors[ColorBox1.ItemIndex];
  grabar.Visible:=true;
end;

procedure Ttitular.ColorBox2Change(Sender: TObject);
begin
     shape2.Brush.Color:=ColorBox2.Colors[ColorBox2.ItemIndex];
     grabar.Visible:=true;
end;

procedure Ttitular.ColorBox3Change(Sender: TObject);
begin
  shape3.Brush.Color:=ColorBox3.Colors[ColorBox3.ItemIndex];
  grabar.Visible:=true;
end;


procedure Ttitular.EntraEdit(Sender: TObject);
begin
     TEdit(Sender).Color:=clYellow;
end;
procedure Ttitular.SaleEdit(Sender: TObject);
begin
     TEdit(Sender).Color:=clDefault;
end;

procedure Ttitular.apellidoEnter(Sender: TObject);begin EntraEdit(Sender);end;
procedure Ttitular.calleEnter(Sender: TObject);begin EntraEdit(Sender); end;
procedure Ttitular.direccionEnter(Sender: TObject);begin EntraEdit(Sender); end;
procedure Ttitular.partidoEnter(Sender: TObject);begin EntraEdit(Sender); end;
procedure Ttitular.localidadEnter(Sender: TObject);begin EntraEdit(Sender); end;
procedure Ttitular.provinciaEnter(Sender: TObject);begin EntraEdit(Sender); end;
procedure Ttitular.codpostalEnter(Sender: TObject);begin EntraEdit(Sender);  end;
procedure Ttitular.pisoEnter(Sender: TObject);begin EntraEdit(Sender); end;
procedure Ttitular.deptoEnter(Sender: TObject);begin EntraEdit(Sender); end;
procedure Ttitular.fnacimientoEnter(Sender: TObject);begin EntraEdit(Sender); end;
procedure Ttitular.edadEnter(Sender: TObject);begin EntraEdit(Sender); end;
procedure Ttitular.CelularEnter(Sender: TObject);begin EntraEdit(Sender); end;
procedure Ttitular.DelegacionEnter(Sender: TObject);begin EntraEdit(Sender); end;
procedure Ttitular.FAltaEnter(Sender: TObject);begin EntraEdit(Sender); end;
procedure Ttitular.FBajaEnter(Sender: TObject);begin EntraEdit(Sender); end;
procedure Ttitular.FIngresoEnter(Sender: TObject);begin EntraEdit(Sender); end;
procedure Ttitular.FEgresoEnter(Sender: TObject);begin EntraEdit(Sender); end;
procedure Ttitular.PatrocinadorEnter(Sender: TObject);begin EntraEdit(Sender); end;
procedure Ttitular.PromotorEnter(Sender: TObject);begin EntraEdit(Sender); end;
procedure Ttitular.TelefonoEnter(Sender: TObject);begin EntraEdit(Sender); end;
procedure Ttitular.jerarquiaEnter(Sender: TObject);begin EntraEdit(Sender); end;
procedure Ttitular.cbuEnter(Sender: TObject);begin EntraEdit(Sender); end;
procedure Ttitular.nlegajoEnter(Sender: TObject);begin EntraEdit(Sender); end;
procedure Ttitular.beneficioEnter(Sender: TObject);begin EntraEdit(Sender); end;
procedure Ttitular.cuilEnter(Sender: TObject);begin EntraEdit(Sender); end;
procedure Ttitular.afiliadoEnter(Sender: TObject);begin EntraEdit(Sender); end;
procedure Ttitular.categoriaEnter(Sender: TObject);begin EntraEdit(Sender); end;
procedure Ttitular.descuentoEnter(Sender: TObject);begin EntraEdit(Sender); end;
procedure Ttitular.ncertificadoEnter(Sender: TObject);begin EntraEdit(Sender); end;
procedure Ttitular.emailEnter(Sender: TObject);begin EntraEdit(Sender); end;
procedure Ttitular.sexoEnter(Sender: TObject);begin EntraEdit(Sender); end;
procedure Ttitular.estcivilEnter(Sender: TObject);begin EntraEdit(Sender); end;
procedure Ttitular.nacionalidadEnter(Sender: TObject);begin EntraEdit(Sender); end;
procedure Ttitular.tipodocEnter(Sender: TObject);begin EntraEdit(Sender); end;
procedure Ttitular.nrodocEnter(Sender: TObject);begin EntraEdit(Sender); end;
procedure Ttitular.nombreEnter(Sender: TObject);begin EntraEdit(Sender); end;

procedure Ttitular.apellidoExit(Sender: TObject);begin Saleedit(Sender);end;
procedure Ttitular.calleExit(Sender: TObject);begin SaleEdit(Sender); end;
procedure Ttitular.direccionExit(Sender: TObject);begin SaleEdit(Sender); end;
procedure Ttitular.partidoExit(Sender: TObject);begin SaleEdit(Sender); end;
procedure Ttitular.localidadExit(Sender: TObject);begin SaleEdit(Sender); end;
procedure Ttitular.provinciaExit(Sender: TObject);begin SaleEdit(Sender); end;
procedure Ttitular.codpostalExit(Sender: TObject);begin SaleEdit(Sender); end;
procedure Ttitular.pisoExit(Sender: TObject);begin SaleEdit(Sender); end;
procedure Ttitular.deptoExit(Sender: TObject);begin SaleEdit(Sender); end;
procedure Ttitular.fnacimientoExit(Sender: TObject);begin SaleEdit(Sender); end;
procedure Ttitular.edadExit(Sender: TObject);begin SaleEdit(Sender); end;
procedure Ttitular.CelularExit(Sender: TObject);begin SaleEdit(Sender); end;
procedure Ttitular.DelegacionExit(Sender: TObject);begin SaleEdit(Sender); end;
procedure Ttitular.FAltaExit(Sender: TObject);begin SaleEdit(Sender); end;
procedure Ttitular.FBajaExit(Sender: TObject);begin SaleEdit(Sender); end;
procedure Ttitular.FIngresoExit(Sender: TObject);begin SaleEdit(Sender); end;
procedure Ttitular.FEgresoExit(Sender: TObject);begin SaleEdit(Sender); end;
procedure Ttitular.PatrocinadorExit(Sender: TObject);begin SaleEdit(Sender); end;
procedure Ttitular.PromotorExit(Sender: TObject);begin SaleEdit(Sender); end;
procedure Ttitular.TelefonoExit(Sender: TObject);begin SaleEdit(Sender); end;
procedure Ttitular.jerarquiaExit(Sender: TObject);begin SaleEdit(Sender); end;
procedure Ttitular.cbuExit(Sender: TObject);begin SaleEdit(Sender); end;
procedure Ttitular.nlegajoExit(Sender: TObject);begin SaleEdit(Sender); end;
procedure Ttitular.beneficioExit(Sender: TObject);begin SaleEdit(Sender); end;
procedure Ttitular.cuilExit(Sender: TObject);begin SaleEdit(Sender); end;
procedure Ttitular.afiliadoExit(Sender: TObject);begin SaleEdit(Sender); end;
procedure Ttitular.categoriaExit(Sender: TObject);begin SaleEdit(Sender); end;
procedure Ttitular.descuentoExit(Sender: TObject);begin SaleEdit(Sender); end;
procedure Ttitular.ncertificadoExit(Sender: TObject);begin SaleEdit(Sender); end;
procedure Ttitular.emailExit(Sender: TObject);begin SaleEdit(Sender); end;
procedure Ttitular.sexoExit(Sender: TObject);begin SaleEdit(Sender); end;
procedure Ttitular.estcivilExit(Sender: TObject);begin SaleEdit(Sender); end;
procedure Ttitular.nacionalidadExit(Sender: TObject);begin SaleEdit(Sender); end;
procedure Ttitular.tipodocExit(Sender: TObject);begin SaleEdit(Sender); end;
procedure Ttitular.nrodocExit(Sender: TObject);begin SaleEdit(Sender); end;
procedure Ttitular.nombreExit(Sender: TObject);begin SaleEdit(Sender); end;


procedure Ttitular.paleta();
begin
   colorbox1.Visible:=true;
   colorbox2.Visible:=true;
   colorbox3.Visible:=true;
   grabar.Visible:=true;
   cancelar.Visible:=true;
end;



procedure Ttitular.limpiar();
begin
apellido.Text:='';calle.Text:='';direccion.Text:='';partido.Text:='';localidad.Text:='';provincia.Text:='';codpostal.Text:='';piso.Text:='';depto.Text:='';fnacimiento.Date:=date();
Celular.Text:='';promotor.Text:='';FAlta.Date:=date();FBaja.Date:=date();FIngreso.Date:=date();FEgreso.Date:=date();Patrocinador.Text:='';Promotor.Text:='';Telefono.Text:='';
jerarquia.Text:='';cbu.Text:='';nlegajo.Text:='';beneficio.Text:='';cuil.Text:='';afiliado.Text:='';categoria.Text:='';descuento.Text:='';ncertificado.Text:='';email.Text:='';
sexo.Text:='';estcivil.Text:='';nacionalidad.Text:='';tipodoc.Text:='';nrodoc.Text:='';nombre.Text:=''; acertificado.text:='';
colorbox1.Visible:=false; colorbox2.Visible:=false; colorbox3.Visible:=false;f_tit.flag_cp:='';
end;



procedure Ttitular.cancelarClick(Sender: TObject);
begin
     limpiar();
     view_buttons('mostrar');
     close;
end;

procedure Ttitular.codpostalKeyPress(Sender: TObject; var Key: char);
begin
  if key=char(13) then
  begin
      Application.CreateForm(TFloc_inaes,Floc_inaes);
         f_tit.flag_cp:=codpostal.Text;
         Floc_inaes.ShowModal;
         Floc_inaes.Destroy;
         localidad.Text:=f_tit.localidad;
         provincia.text:=f_tit.provincia;
         partido.Text:=f_tit.partido;
         codpostal.Text:=f_tit.codpostal;

  end;
end;




procedure Ttitular.grabarClick(Sender: TObject);
   var
     sq:string;sq1:string;sq2:string;
begin
     if sets.Set_flags.tipo_ficha='paleta_consulta' then
     begin
        sets.conf.color_consulta:=ColorToString(shape1.Brush.Color)+';'+ColorToString(shape2.Brush.Color)+';'+ColorToString(shape3.Brush.Color);
        DataModule1.conector_socios.ExecuteDirect('update segur_usuarios set tema_consultas='''+sets.conf.color_consulta+''' where id='+sets.Set_flags.idusuario);
        sets.conf.colores();
     end;

     if sets.Set_flags.tipo_ficha='paleta_abm' then
     begin
        sets.conf.color_abm:=ColorToString(shape1.Brush.Color)+';'+ColorToString(shape2.Brush.Color)+';'+ColorToString(shape3.Brush.Color);
        DataModule1.conector_socios.ExecuteDirect('update segur_usuarios set tema_abm='''+sets.conf.color_abm+''' where id='+sets.Set_flags.idusuario);
        sets.conf.colores();
     end;
     close;
     if sets.Set_flags.tipo_ficha='insert' then
     begin

        {for i := 0 to ComponentCount-1 do
    if (Components[i] is TEdit) then
       begin
          ctrl.datos_personales(Components[i]);
       end;
    end; }
end;
     if sets.Set_flags.tipo_ficha='modificar' then
     begin
          sq:= campos_update();
     end;

end;

procedure Ttitular.Image1Click(Sender: TObject);
begin
  showmessage('buscar');
end;

procedure Ttitular.asigna();
var
  cl:string;
  fa:string;fi:string;fb:string;fe:string;
begin
     cl:=DataModule1.sql_buscar('vista_afiliado.sql',sets.f_tit.numero,'','socio');
     DataModule1.QBuscar.close;
     DataModule1.QBuscar.sql.clear;
     DataModule1.QBuscar.sql.add(cl);
     DataModule1.QBuscar.Open;
     apellido.Text:=DataModule1.QBuscar.FieldByName('apellido').AsString;
     calle.Text:=DataModule1.QBuscar.FieldByName('calle').AsString;
     direccion.Text:=DataModule1.QBuscar.FieldByName('numeracion_calle').AsString;
     partido.Text:=DataModule1.QBuscar.FieldByName('partido').AsString;
     localidad.Text:=DataModule1.QBuscar.FieldByName('localidad').AsString;
     provincia.Text:=DataModule1.QBuscar.FieldByName('provincia').AsString;
     codpostal.Text:=DataModule1.QBuscar.FieldByName('codpostal').AsString;
     piso.Text:=DataModule1.QBuscar.FieldByName('piso').AsString;
     depto.Text:=DataModule1.QBuscar.FieldByName('depto').AsString;
     fnacimiento.Date:=strtodate(DataModule1.QBuscar.FieldByName('fnacimiento').AsString);
     Celular.Text:=DataModule1.QBuscar.FieldByName('celular').AsString;
     //promotor.Text:=DataModule1.QBuscar.FieldByName('delegacion').AsString;
     Patrocinador.Text:=DataModule1.QBuscar.FieldByName('patrocinador').AsString;
     //Promotor.Text:=DataModule1.QBuscar.FieldByName('promotor').AsString;
     Telefono.Text:=DataModule1.QBuscar.FieldByName('telefono').AsString;
     jerarquia.Text:=DataModule1.QBuscar.FieldByName('jerarquia').AsString;
     cbu.Text:=DataModule1.QBuscar.FieldByName('cbu').AsString;
     ncertificado.text:=DataModule1.QBuscar.FieldByName('ncertificado').AsString;
     acertificado.text:=DataModule1.QBuscar.FieldByName('acertificado').AsString;
     nlegajo.Text:=DataModule1.QBuscar.FieldByName('nlegajo').AsString;
     beneficio.Text:=DataModule1.QBuscar.FieldByName('beneficio').AsString;
     cuil.Text:=DataModule1.QBuscar.FieldByName('cuil').AsString;
     afiliado.Text:=DataModule1.QBuscar.FieldByName('nafiliado').AsString;
     categoria.Text:=DataModule1.QBuscar.FieldByName('categoria').AsString;
     descuento.Text:=DataModule1.QBuscar.FieldByName('descuento').AsString;
    // ncertificado.Text:=DataModule1.QBuscar.FieldByName('ncertificado').AsString;
     email.Text:=DataModule1.QBuscar.FieldByName('email').AsString;
     sexo.Text:=DataModule1.QBuscar.FieldByName('sexo').AsString;
     estcivil.Text:=DataModule1.QBuscar.FieldByName('estcivil').AsString;
     nacionalidad.Text:=DataModule1.QBuscar.FieldByName('nacionalidad').AsString;
     tipodoc.Text:=DataModule1.QBuscar.FieldByName('tipodoc').AsString;
     nrodoc.Text:=DataModule1.QBuscar.FieldByName('nrodoc').AsString;
     nombre.Text:=DataModule1.QBuscar.FieldByName('nombre').AsString;
     fa:=DataModule1.QBuscar.FieldByName('falta').Asstring;
     fi:=DataModule1.QBuscar.FieldByName('finicio').Asstring;
     fb:=DataModule1.QBuscar.FieldByName('fbaja').Asstring;
     fe:=DataModule1.QBuscar.FieldByName('fegreso').Asstring;
     if length(fa)>0 then
     begin
               FAlta.Date:=strtodate(FormatDateTime('dd/mm/yyyy',DataModule1.QBuscar.FieldByName('falta').AsDateTime));
     end
     else
     begin
               FAlta.Date:=nullDate;
     end;
     if length(fb)>0 then
     begin
               Fbaja.Date:=strtodate(FormatDateTime('dd/mm/yyyy',DataModule1.QBuscar.FieldByName('fbaja').AsDateTime));
     end
     else
     begin
               Fbaja.Date:=nullDate;
     end;
     if length(fi)>0 then
      begin
                Fingreso.Date:=strtodate(FormatDateTime('dd/mm/yyyy',DataModule1.QBuscar.FieldByName('finicio').AsDateTime));
      end
      else
      begin
                FAlta.Date:=nullDate;
      end;
      if length(fe)>0 then
      begin
                Fegreso.Date:=strtodate(FormatDateTime('dd/mm/yyyy',DataModule1.QBuscar.FieldByName('fegreso').AsDateTime));
      end
      else
      begin
                Fegreso.Date:=nullDate;
      end;
end;

procedure Ttitular.cargar_boxes();
begin
     ctrl.set_combo('documentos');
     asignar_boxes(Ftitular.tipodoc);
     asignar_boxes(Ftitular.tipodoc1);
     ctrl.set_combo('estadocivil');
     asignar_boxes(Ftitular.estcivil);
     ctrl.set_combo('nacionalidad');
     asignar_boxes(Ftitular.nacionalidad);
     ctrl.set_combo('categoria');
     asignar_boxes(Ftitular.categoria);
     ctrl.set_combo('formaspago');
     asignar_boxes(Ftitular.descuento);
     ctrl.set_combo('jerarquia');
     asignar_boxes(Ftitular.jerarquia);
     ctrl.set_combo('estado');
//     asignar_boxes(Ftitular.estado);
     ctrl.set_combo('promotores');
     asignar_boxes(Ftitular.promotor);
     ctrl.set_combo('delegacion');
     asignar_boxes(Ftitular.delegacion);

end;

procedure Ttitular.asignar_boxes(Sender:TObject);
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

procedure Ttitular.setear_boxes();
var
  a:integer;
begin
   for a :=0 to tipodoc.Items.Count-1 do
  begin
      if trim(tipodoc1.Items[a])=trim(DataModule1.QBuscar.FieldByName('tipodoc').asstring) then
     begin
         tipodoc.ItemIndex:=a;
     end;
  end;
   for a :=0 to estcivil.Items.Count-1 do
  begin
      if trim(estcivil.Items[a])=trim(DataModule1.QBuscar.FieldByName('estcivil').asstring) then
     begin
         estcivil.ItemIndex:=a;
     end;
  end;
   for a :=0 to nacionalidad.Items.Count-1 do
  begin
     if trim(nacionalidad.Items[a])=trim(DataModule1.QBuscar.FieldByName('nacionalidad').asstring) then
     begin
         nacionalidad.ItemIndex:=a;
     end;
  end;
   for a :=0 to categoria.Items.Count-1 do
  begin
     if trim(categoria.Items[a])=trim(DataModule1.QBuscar.FieldByName('categoria').asstring) then
     begin
         categoria.ItemIndex:=a;
     end;
  end;
  for a :=0 to jerarquia.Items.Count-1 do
  begin
     if trim(jerarquia.Items[a])=trim(DataModule1.QBuscar.FieldByName('jerarquia').asstring) then
     begin
         jerarquia.ItemIndex:=a;
     end;
  end;
  for a :=0 to promotor.Items.Count-1 do
  begin
     if trim(promotor.Items[a])=trim(DataModule1.QBuscar.FieldByName('promotor_1').asstring) then
     begin
         promotor.ItemIndex:=a;
     end;
  end;
  for a :=0 to delegacion.Items.Count-1 do
  begin
    // showmessage(trim(delegacion.Items[a]) + '  aa ' + inttostr(a)+ '   h'+ DataModule1.QBuscar.FieldByName('delegacion_1').asstring);
     if trim(delegacion.Items[a])=trim(DataModule1.QBuscar.FieldByName('delegacion').asstring) then
     begin
         delegacion.ItemIndex:=a;
     end;
  end;

   {for a :=0 to estado.Items.Count-1 do
  begin
     if trim(estado.Items[a])=trim(DataModule1.QBuscar.FieldByName('estado').asstring) then
     begin
         estado.ItemIndex:=a;
     end;
  end;}

   if DataModule1.QBuscar.FieldByName('sexo').asstring ='M' then sexo.ItemIndex:=0;
   if DataModule1.QBuscar.FieldByName('sexo').asstring ='F' then sexo.ItemIndex:=1;
end;

function Ttitular.campos():string; //lista de campos para insert
var
  camp:string;  camp1:string;  camp2:string; camp3:string; camp4:string;
begin
  camp:='(apellido,  calle,  direccion,  partido,  localidad, provincia,  codpostal, piso, depto, fnacimiento,';
  camp2:='edad,Celular,Delegacion,FAlta,Patrocinador,Promotor,Telefono,';
  camp3:='jerarquia,cbu,nlegajo,beneficio,cuil,afiliado,categoria,descuento,ncertificado,email' ;
  camp4:='sexo,estcivil,nacionalidad,tipodoc,nrodoc,nombre)' ;
  camp:=camp+camp1+camp2+camp3+camp4;
  showmessage(camp);
end;

function Ttitular.campos_data():string; //datos de campos para insert
var
  camp:string;  camp2:string; camp3:string; camp4:string; fa:string; fn:string;

begin
fn:= datetostr(fnacimiento.Date);
fa:=datetostr(falta.Date);
camp:=''''+ apellido.Text + ''','''+ calle.Text + ''','''+ direccion.Text + ''','''+ partido.Text + ''','''+ localidad.Text+ ''','''+ provincia.Text + ''','''+ codpostal.Text+ ''','''+ piso.Text+ ''','''+ depto.Text+ ''','''+ fn + ''',''';
camp2:= Celular.Text + ''',''' + promotor.Text + ''',''' + fa + ''','''  + Patrocinador.Text + ''',''' + Promotor.Text + ''',''' + Telefono.Text + ''',''' ;
camp3:=jerarquia.Text + ''',''' + cbu.Text + ''',''' + nlegajo.Text + ''',''' + beneficio.Text + ''',''' + cuil.Text + ''',''' + afiliado.Text + ''',''' + categoria.Text + ''',''' + descuento.Text + ''',''' + ncertificado.Text + ''',''' + email.Text + ''',''' ;
camp4:=sexo.Text + ''',''' + estcivil.Text + ''',''' + nacionalidad.Text + ''',''' + tipodoc.Text + ''',''' + nrodoc.Text + ''',''' + nombre.Text + ''',''' ;
camp:=camp+camp2+camp3+camp4;
showmessage(camp);
end;

function Ttitular.campos_update():string;
var
  camp:string;  camp2:string; camp3:string; camp4:string; fa:string; fi:string; fb:string ; fe:string; fn:string;
begin
  fn:= datetostr(fnacimiento.Date);
  fa:=datetostr(falta.Date);
  fi:=datetostr(fingreso.Date);
  fb:=datetostr(fbaja.Date);
  fe:=datetostr(fegreso.Date);

camp:='apellido='+''''+ apellido.Text + ''',calle='''+ calle.Text + ''',direccion='''+ direccion.Text + ''',partido='''+ partido.Text + ''',localidad='''+ localidad.Text+ ''',provincia='''+ provincia.Text + ''',codpostal='''+ codpostal.Text+ ''',piso='''+ piso.Text+ ''',depto='''+ depto.Text+ ''',fnacimiento='''+ fe;
camp2:=''',celular=''' + Celular.Text + ''',delegacion=''' + promotor.Text + ''',falta=''' + fa + ''',fbaja=''' + fb + ''',fingreso=''' + fi + ''',fegreso=''' + fe + ''',telefono=''' + Telefono.Text ;
camp3:= ''',jerarquia='''+jerarquia.Text + ''',cbu=''' + cbu.Text + ''',nlegajo=''' + nlegajo.Text + ''',beneficio=''' + beneficio.Text + ''',cuil=''' + cuil.Text + ''',afiliado=''' + afiliado.Text + ''',categoria=''' + categoria.Text + ''',descuento=''' + descuento.Text + ''',ncerfificado=''' + ncertificado.Text + ''',email=''' + email.Text  ;
camp3:= ''',sexo='''+sexo.Text + ''',''' + estcivil.Text + ''',''' + nacionalidad.Text + ''',''' + tipodoc.Text + ''',nrodoc=''' + nrodoc.Text + ''',nombre''' + nombre.Text + ''',''' ;
camp:=camp+camp2+camp3;
showmessage(camp);
end;

procedure Ttitular.set_valor_combo(); //valor de codigo de combo
begin
     set_valor_combo_box(tipodoc,'abreviado');
end;

function Ttitular.set_valor_combo_box(Sender:TObject;campo:string):string;
var
   a:integer;
begin
  for a :=0 to tipodoc.Items.Count-1 do
  begin
     if trim(TComboBox(Sender).Items[a])=trim(DataModule1.QBuscar.FieldByName('descripicon').asstring) then
     begin
         result:=DataModule1.QBuscar.FieldByName('codigo').asstring;
     end;
  end;

end;
procedure Ttitular.set_valor_combo_tabla(tabla:string);
var
  sq_combo:string;
begin
  sq_combo:='select * from '+ tabla ;
  DataModule1.QSets.close;
  DataModule1.QSets.SQL.Clear;
  DataModule1.QSets.SQL.Add(sq_combo);
  DataModule1.QSets.open;
end;

end.

