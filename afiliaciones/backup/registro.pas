unit registro;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, ComCtrls, ActnList,  DBGrids, titular, Modulo_datos,Buscar,
  sets ,ficha_familiar
  , Grids;

type

  { Tficha_socio }

  Tficha_socio = class(TForm)
    DBGridACargo: TDBGrid;
    DBGridACargoAntecedentes: TDBGrid;
    DBGridACargoAntecedentes1: TDBGrid;
    DBGridCargosCuotas: TDBGrid;
    DBGridCargosFijos: TDBGrid;
    DBGridAyudas: TDBGrid;
    direccion: TLabeledEdit;
    fpdepto: TLabeledEdit;
    fppiso: TLabeledEdit;
    fplocalidad: TLabeledEdit;
    fppartido: TLabeledEdit;
    fpprovincia: TLabeledEdit;
    fpcodpostal: TLabeledEdit;
    Gparticipantes1: TDBGrid;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    piso: TLabeledEdit;
    depto: TLabeledEdit;
    codpostal: TLabeledEdit;
    origen_pago: TLabeledEdit;
    fz: TLabeledEdit;
    fpago: TLabeledEdit;
    categoria: TLabeledEdit;
    concepto: TLabeledEdit;
    beneficio: TLabeledEdit;
    nlegajo: TLabeledEdit;
    email: TLabeledEdit;
    foto: TImage;
    tipodoc: TLabeledEdit;
    edad: TLabeledEdit;
    cuil: TLabeledEdit;
    estcivil: TLabeledEdit;

    Gparticipantes: TDBGrid;
    estado: TEdit;
    GPatrocinados: TDBGrid;
    Label10: TLabel;
    Label3: TLabel;
    fpnacimiento: TLabeledEdit;
    fpacargo: TLabeledEdit;
    fpincapacidad: TLabeledEdit;
    fpnumeracion: TLabeledEdit;
    fpcalle: TLabeledEdit;
    fpegreso: TLabeledEdit;
    fpecivil: TLabeledEdit;
    fpalta: TLabeledEdit;
    fpbaja: TLabeledEdit;
    fpingreso: TLabeledEdit;
    fpfpago: TLabeledEdit;
    fpdocumento: TLabeledEdit;
    fpedad: TLabeledEdit;

    nombre: TLabeledEdit;
    apellido: TLabeledEdit;
    fnacimiento: TLabeledEdit;
    Vistas_legajo: TPageControl;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    TabACargo: TTabSheet;
    TabCargos: TTabSheet;
    TabSheet3: TTabSheet;
    zona_delegacion: TLabeledEdit;

    socios: TPageControl;
    titular: TTabSheet;
    familiares_patrocinados: TTabSheet;

    alta: TButton;
    modificar: TButton;
    baja: TButton;
    buscar: TButton;
    grabar: TButton;
    cancelar: TButton;

    Label28: TLabel;

    Celular: TLabeledEdit;
    lugar_afiliacion: TLabeledEdit;
    FAlta: TLabeledEdit;
    FBaja: TLabeledEdit;
    FIngreso: TLabeledEdit;
    FEgreso: TLabeledEdit;
    Patrocinador: TLabeledEdit;
    Promotor: TLabeledEdit;
    Telefono: TLabeledEdit;
    sexo1: TEdit;
    nacionalidad1: TEdit;
    nrodoc: TEdit;

    Shape3: TShape;
    Shape4: TShape;
    Shape1: TShape;
    Shape2: TShape;
    calle: TLabeledEdit;
    localidad: TLabeledEdit;
    partido: TLabeledEdit;
    provincia: TLabeledEdit;

    procedure altaClick(Sender: TObject);
    procedure buscarClick(Sender: TObject);
     procedure cancelarClick(Sender: TObject);
     procedure DBGridACargoAntecedentesCellClick(Column: TColumn);
     procedure DBGridACargoAntecedentesPrepareCanvas(sender: TObject;
       DataCol: Integer; Column: TColumn; AState: TGridDrawState);
     procedure DBGridACargoCellClick(Column: TColumn);
     procedure DBGridACargoPrepareCanvas(sender: TObject; DataCol: Integer;
       Column: TColumn; AState: TGridDrawState);
     procedure DBGridAyudasCellClick(Column: TColumn);
     procedure DBGridAyudasPrepareCanvas(sender: TObject; DataCol: Integer;
       Column: TColumn; AState: TGridDrawState);
     procedure DBGridCargosCuotasPrepareCanvas(sender: TObject;
       DataCol: Integer; Column: TColumn; AState: TGridDrawState);
     procedure DBGridCargosFijosCellClick(Column: TColumn);
     procedure DBGridCargosFijosPrepareCanvas(sender: TObject;
       DataCol: Integer; Column: TColumn; AState: TGridDrawState);
     procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure GparticipantesDblClick(Sender: TObject);
    procedure GparticipantesPrepareCanvas(sender: TObject; DataCol: Integer;
      Column: TColumn; AState: TGridDrawState);
    procedure GPatrocinadosPrepareCanvas(sender: TObject; DataCol: Integer;
      Column: TColumn; AState: TGridDrawState);
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
   sets.f_tit.numero:='7491';
     asignar();
end;


procedure Tficha_socio.view_buttons(accion:string);
begin
   if accion='inicio' then
     begin
       alta.visible:=true; baja.visible:=false; modificar.visible:=false; buscar.visible:=true; grabar.visible:=false; cancelar.visible:=false;
     end;
    if accion='mostrar' then
     begin
       alta.visible:=true; baja.visible:=true; modificar.visible:=true; buscar.visible:=true; grabar.visible:=false; cancelar.visible:=false;
     end;

     if accion='ocultar' then
     begin
       alta.visible:=false; baja.visible:=false; modificar.visible:=false;  buscar.visible:=false; grabar.visible:=true; cancelar.visible:=true;
     end;
end;

procedure Tficha_socio.limpiar();
begin

nombre.Text:='';calle.Text:='';direccion.Text:='';partido.Text:='';localidad.Text:='';provincia.Text:='';codpostal.Text:='';piso.Text:='';depto.Text:='';tipodoc.Text:='';
edad.Text:='';Celular.Text:='';lugar_afiliacion.Text:='';FAlta.Text:='';FBaja.Text:='';FIngreso.Text:='';FEgreso.Text:='';Patrocinador.Text:='';Promotor.Text:='';Telefono.Text:='';
fpago.Text:='';zona_delegacion.Text:='';nlegajo.Text:='';beneficio.Text:='';email.Text:='';fz.Text:='';categoria.Text:='';origen_pago.Text:='';concepto.Text:='';email.Text:='';
estado.Text:='';sexo1.Text:='';estcivil.Text:='';nacionalidad1.Text:='';tipodoc.Text:='';nrodoc.Text:='';fnacimiento.Text:='';
memo1.clear;    memo2.Clear;
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

procedure Tficha_socio.DBGridACargoAntecedentesCellClick(Column: TColumn);
begin
  memo1.Clear;
  memo1.Append(DataModule1.QAC_Antecedentes.FieldByName('detalle').AsString);
end;

procedure Tficha_socio.DBGridACargoAntecedentesPrepareCanvas(sender: TObject;
  DataCol: Integer; Column: TColumn; AState: TGridDrawState);
begin
         if (AState = [gdSelected]) then
         begin
           Canvas.Font.Color:= clBlack;
           Canvas.Brush.Color:= clRed;
         end  ;
     //grid_usuarios.canvas.brush.color := clWhite;
  if (DataModule1.QAC_Antecedentes.RecNo mod 2) = 0 then
  begin
    if TDBGrid(Sender).Canvas.Brush.Color = TDBGrid(Sender).Color then
    TDBGrid(Sender).Canvas.Brush.Color := clYellow ;
  end;
  if DataModule1.QAC_Antecedentes.fieldbyname('estado').AsInteger < 0 then
  begin
    TDBGrid(Sender).Canvas.font.Color := clRed ;
  end;
end;

procedure Tficha_socio.DBGridACargoCellClick(Column: TColumn);
var
  cl:string;
begin
  memo1.Clear;
  memo2.Clear;
  cl:=DataModule1.sql_buscar('vista_antecedentes_acargo.sql',DataModule1.QAcargo.FieldByName('ID').AsString +' AND ant.FAMILIAR=' + DataModule1.QAcargo.FieldByName('familiar').AsString,'','socio');
     DataModule1.QAC_Antecedentes.sql.clear;
     DataModule1.QAC_Antecedentes.sql.add(cl);
     DataModule1.QAC_Antecedentes.Open;

     DataModule1.QMicroficha.sql.clear;
     DataModule1.QMicroficha.sql.add('select * from v_familiares_y_patrocinados where nrodoc='+ trim(DataModule1.QAcargo.FieldByName('nrodoc').AsString));
     DataModule1.QMicroficha.Open;
                                     memo2.Append('');
     memo2.Append(trim(DataModule1.QMicroficha.FieldByName('nombre').AsString)+ '  ' + trim(DataModule1.QMicroficha.FieldByName('tipodoc').AsString) + ' ' +trim(DataModule1.QMicroficha.FieldByName('nrodoc').AsString));
     memo2.Append('');
     memo2.Append(' Nacimiento:' + trim(DataModule1.QMicroficha.FieldByName('fnacimiento').AsString) + '   Edad:' +trim(DataModule1.QMicroficha.FieldByName('edad').AsString));
     memo2.Append('Fecha Alta: '+trim(DataModule1.QMicroficha.FieldByName('falta').AsString)+ '     Fecha Baja: '+trim(DataModule1.QMicroficha.FieldByName('falta').AsString) );
     memo2.Append('A Cargo:' + trim(DataModule1.QMicroficha.FieldByName('acargo').AsString) + '   Incapacidad:' +trim(DataModule1.QMicroficha.FieldByName('incapacidad').AsString));

end;

procedure Tficha_socio.DBGridACargoPrepareCanvas(sender: TObject;
  DataCol: Integer; Column: TColumn; AState: TGridDrawState);
begin
     if (AState = [gdSelected]) then
         begin
           Canvas.Font.Color:= clBlack;
           Canvas.Brush.Color:= clRed;
         end  ;
     //grid_usuarios.canvas.brush.color := clWhite;
  if (DataModule1.QAcargo.RecNo mod 2) = 0 then
  begin
    if TDBGrid(Sender).Canvas.Brush.Color = TDBGrid(Sender).Color then
    TDBGrid(Sender).Canvas.Brush.Color := $00CCFFFF ;
  end;
  if DataModule1.QAcargo.fieldbyname('codigo_estado').AsInteger < 0 then
  begin
    TDBGrid(Sender).Canvas.font.Color := clRed ;
  end;
end;

procedure Tficha_socio.DBGridAyudasCellClick(Column: TColumn);
var
  cl:string;
begin
    memo3.Visible:=false;
  DBGridCargosCuotas.Visible:=true;
  cl:='';
   if trim(DataModule1.QAyudas.fieldbyname('tipo').asstring)='cuotas' then cl:='V_Cuotas_Ctas.sql';
   if trim(DataModule1.QAyudas.fieldbyname('tipo').asstring)='ay' then cl:='V_Cuotas_Ay.sql';

     cl:= DataModule1.sql_buscar(cl,DataModule1.QAyudas.FieldByName('orden').asstring,'','socio');
     DataModule1.QAyudasCtas.close;
     DataModule1.QAyudasCtas.sql.clear;
     DataModule1.QAyudasCtas.sql.add(cl);
     DataModule1.QAyudasCtas.Open;
end;

procedure Tficha_socio.DBGridAyudasPrepareCanvas(sender: TObject;
  DataCol: Integer; Column: TColumn; AState: TGridDrawState);
begin
      if (AState = [gdSelected]) then
         begin
           Canvas.Font.Color:= clBlack;
           Canvas.Brush.Color:= clRed;
         end  ;
     //grid_usuarios.canvas.brush.color := clWhite;
  if (DataModule1.QAyudas.RecNo mod 2) = 0 then
  begin
    if TDBGrid(Sender).Canvas.Brush.Color = TDBGrid(Sender).Color then
    TDBGrid(Sender).Canvas.Brush.Color := $00CCFFFF ;
  end;
end;

procedure Tficha_socio.DBGridCargosCuotasPrepareCanvas(sender: TObject;
  DataCol: Integer; Column: TColumn; AState: TGridDrawState);
begin
      if (AState = [gdSelected]) then
           begin
             Canvas.Font.Color:= clBlack;
             Canvas.Brush.Color:= clRed;
           end  ;

    if (DataModule1.QAyudasCtas.RecNo mod 2) = 0 then
    begin
      if TDBGrid(Sender).Canvas.Brush.Color = TDBGrid(Sender).Color then
      TDBGrid(Sender).Canvas.Brush.Color := $00CCFFFF ;
    end;
     if DataModule1.QAyudasCtas.fieldbyname('IMPPAGO').AsInteger = 0 then
  begin
    TDBGrid(Sender).Canvas.font.Color := clRed ;
  end;
          if DataModule1.QAyudasCtas.fieldbyname('IMPPAGO').AsInteger > 0 then
  begin
    TDBGrid(Sender).Canvas.font.Style:=[fsBold];
  end;


end;

procedure Tficha_socio.DBGridCargosFijosCellClick(Column: TColumn);
begin
  memo3.Visible:=true;
  memo3.clear;
  DBGridCargosCuotas.Visible:=false;
  memo3.Append(DataModule1.QCargosFijos.FieldByName('descripcion').asstring);
  memo3.Append('Importe: ' + DataModule1.QCargosFijos.FieldByName('importe').asstring);
end;

procedure Tficha_socio.DBGridCargosFijosPrepareCanvas(sender: TObject;
  DataCol: Integer; Column: TColumn; AState: TGridDrawState);
begin
    if (AState = [gdSelected]) then
         begin
           Canvas.Font.Color:= clBlack;
           Canvas.Brush.Color:= clRed;
         end  ;
     //grid_usuarios.canvas.brush.color := clWhite;
  if (DataModule1.QCargosFijos.RecNo mod 2) = 0 then
  begin
    if TDBGrid(Sender).Canvas.Brush.Color = TDBGrid(Sender).Color then
    TDBGrid(Sender).Canvas.Brush.Color := $00CCFFFF ;
  end;
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
    // showmessage('asig' + sets.f_tit.numero);
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
     apellido.Text:=DataModule1.QBuscar.FieldByName('apellido').AsString;
     nombre.Text:=DataModule1.QBuscar.FieldByName('nombre').AsString;
     tipodoc.Text:=DataModule1.QBuscar.FieldByName('tipodoc').AsString;
     nrodoc.Text:=DataModule1.QBuscar.FieldByName('nrodoc').AsString;
     email.Text:=DataModule1.QBuscar.FieldByName('cuil').AsString;
     sexo1.Text:=DataModule1.QBuscar.FieldByName('sexo').AsString;
     fnacimiento.Text:=DataModule1.QBuscar.FieldByName('fnacimiento').AsString;
     estcivil.Text:=DataModule1.QBuscar.FieldByName('estcivil').AsString;
     nacionalidad1.Text:=DataModule1.QBuscar.FieldByName('nacionalidad').AsString;
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


      ficha_socio.Caption:='[' + trim(nombre.text)+ ', ' + trim(apellido.text) + ']    [' + trim(tipodoc.text) + trim(nrodoc.text) +  ']    [' +  trim('LEGAJO '+ nlegajo.text)
                      +  ']    [' +    trim(categoria.text) +  ']    [' +   trim(origen_pago.text) +  ']    [' +  trim(fz.text) +  ']    [' +  trim(concepto.text)
                      +  ']    [' +  trim(fpago.text) +   ']    [' +  trim(beneficio.text) ;
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
     familiares_patrocinados.Caption:='Familiares ('+ DataModule1.Qparticipantes.RecordCount.ToString() + ')    + Patrocinados ('+  DataModule1.Qpatrocinados.RecordCount.ToString()+')';

    cl:= 'EXECUTE PROCEDURE P_CREAR_FICHA_FAMLIARES_Y_PATRO('+sets.f_tit.numero+')' ;
     DataModule1.conector_socios.ExecuteDirect(cl);
     DataModule1.QAcargo.close;
     DataModule1.QAcargo.sql.clear;
     DataModule1.QAcargo.sql.add('select * from VISTA_FICHA_FAMILIARES_Y_PATROC');
     DataModule1.QAcargo.Open;
     tabAcargo.Caption:='A Cargo ('+ trim(DataModule1.QAcargo.RecordCount.ToString()) + ')';

     cl:=DataModule1.sql_buscar('V_SERV_OTORGADOS.sql',sets.f_tit.numero,'','socio');
     DataModule1.QCargosFijos.close;
     DataModule1.QCargosFijos.sql.clear;
     DataModule1.QCargosFijos.sql.add(cl);
     DataModule1.QCargosFijos.Open;

      cl:=DataModule1.sql_buscar('V_AY.sql',sets.f_tit.numero +' and codigo_estado<=0 UNION ALL ','','socio');
      cl:= cl+DataModule1.sql_buscar('V_CARGOS_EN_CUOTAS.sql',sets.f_tit.numero + ' and codigo_estado<=0','','socio');
     DataModule1.QAyudas.close;
     DataModule1.QAyudas.sql.clear;
     DataModule1.QAyudas.sql.add(cl);
     DataModule1.QAyudas.Open;





     tabCargos.Caption:='Cargos Fijos ('+ trim(DataModule1.QCargosFijos.RecordCount.ToString()) + ')';
     tabCargos.Caption:=tabCargos.Caption+ ' Ayudas Económicas ('+ trim(DataModule1.QAyudas.RecordCount.ToString()) + ')';

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

procedure Tficha_socio.GparticipantesPrepareCanvas(sender: TObject;
  DataCol: Integer; Column: TColumn; AState: TGridDrawState);
begin
  if (AState = [gdSelected]) then
         begin
           Canvas.Font.Color:= clBlack;
           Canvas.Brush.Color:= clRed;
         end  ;
     //grid_usuarios.canvas.brush.color := clWhite;
  if (DataModule1.Qparticipantes.RecNo mod 2) = 0 then
  begin
    if TDBGrid(Sender).Canvas.Brush.Color = TDBGrid(Sender).Color then
    TDBGrid(Sender).Canvas.Brush.Color := clYellow ;
  end;
  if DataModule1.Qparticipantes.fieldbyname('codigo_estado').AsInteger < 0 then
  begin
    TDBGrid(Sender).Canvas.font.Color := clRed ;
  end;


end;

procedure Tficha_socio.GPatrocinadosPrepareCanvas(sender: TObject;
  DataCol: Integer; Column: TColumn; AState: TGridDrawState);
begin
     if (AState = [gdSelected]) then
         begin
           Canvas.Font.Color:= clBlack;
           Canvas.Brush.Color:= clRed;
         end  ;
     //grid_usuarios.canvas.brush.color := clWhite;
  if (DataModule1.Qpatrocinados.RecNo mod 2) = 0 then
  begin
    if TDBGrid(Sender).Canvas.Brush.Color = TDBGrid(Sender).Color then
    TDBGrid(Sender).Canvas.Brush.Color := clYellow ;
  end;
  if DataModule1.Qpatrocinados.fieldbyname('codigo_estado').AsInteger < 0 then
  begin
    TDBGrid(Sender).Canvas.font.Color := clRed ;
  end;
end;

end.

