unit Cargos_afiliados;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, HtmlView, ZDataset, Forms, Controls, Graphics,
  Dialogs, StdCtrls, DBGrids, ComCtrls, ExtCtrls, Grids, DbCtrls, LazHelpHTML,
  Modulo_datos, db, Sets;

type

  { TCargos }

  TCargos = class(TForm)
    Button1: TButton;
    Button2: TButton;
    DServicios: TDataSource;
    DBNavigatorImp: TDBNavigator;
    DS_Categorias: TDataSource;
    DS_Fpago: TDataSource;
    DS_Importes: TDataSource;
    DS_OrigenesPago: TDataSource;
    GridOrigenesPago: TDBGrid;
    GridCategoria: TDBGrid;
    DBNavigatorServ: TDBNavigator;
    DBNavigatorCat: TDBNavigator;
    DBNavigatorOrigenes: TDBNavigator;
    DBNavigatorFP: TDBNavigator;
    GridImportes: TDBGrid;
    GridServicios: TDBGrid;
    GridFPago: TDBGrid;
    html: THtmlViewer;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    PageTablaAfiliaciones: TPageControl;
    QCat: TZQuery;
    QFpago: TZQuery;
    QImportes: TZQuery;
    QOrigenesPago: TZQuery;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    TabCat: TTabSheet;
    TabSheet1: TTabSheet;
    TabVia: TTabSheet;
    Qservicios: TZQuery;


    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure GridFPagoCellClick(Column: TColumn);
    procedure GridFPagoEnter(Sender: TObject);
    procedure GridFPagoKeyPress(Sender: TObject; var Key: char);
    procedure GridImportesKeyPress(Sender: TObject; var Key: char);

    procedure GridServiciosEnter(Sender: TObject);
    procedure GridServiciosKeyPress(Sender: TObject; var Key: char);
    procedure GridOrigenesPagoKeyPress(Sender: TObject; var Key: char);
    procedure GridCategoriaKeyPress(Sender: TObject; var Key: char);

    procedure FormShow(Sender: TObject);

    procedure g_cat();
    procedure g_org();
    procedure g_concept();
    procedure g_imp();
    procedure g_servicios();
    procedure dbnavDialogError(campo: string);
    procedure QCatAfterPost(DataSet: TDataSet);
    procedure QCatBeforePost(DataSet: TDataSet);
    procedure QFpagoAfterPost(DataSet: TDataSet);
    procedure QFpagoBeforePost(DataSet: TDataSet);
    procedure QImportesAfterPost(DataSet: TDataSet);
    procedure QImportesBeforePost(DataSet: TDataSet);
    procedure QOrigenesPagoAfterPost(DataSet: TDataSet);
    procedure QOrigenesPagoBeforePost(DataSet: TDataSet);
    procedure QserviciosAfterPost(DataSet: TDataSet);
    procedure QserviciosBeforePost(DataSet: TDataSet);



  private
    { private declarations }
  public
    { public declarations }
    flag_imp:string;
  end;

var
  Cargos: TCargos;

implementation



{$R *.lfm}

{ TCargos }

procedure TCargos.FormShow(Sender: TObject);
begin
      g_cat();
      g_org();
      g_concept();
      g_servicios();
      g_imp();
      TabVia.TabVisible:=true;
end;

procedure TCargos.FormCreate(Sender: TObject);
begin
   DataModule1.conector_socios.Connect;
end;

procedure TCargos.GridFPagoCellClick(Column: TColumn);
begin

end;

procedure TCargos.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  DataModule1.conector_socios.Disconnect;
end;

procedure TCargos.Button1Click(Sender: TObject);
begin
  //html.Load('C:\Users\adminmutual\Desktop\socios\help\config_cargos.html');
                  html.Load('C:\pdftotext\Hremu.html')
end;

procedure TCargos.Button2Click(Sender: TObject);
begin
  HTML.Print(1,10)  ;
end;



//****************************************
 // ******** FORMA DE PAGOS ************
 //****************************************
procedure TCargos.g_org;
begin
     QFpago.Close;
     QFpago.sql.Clear;
     QFpago.sql.add('select * from desc_fpago order by descripcion');
     QFpago.open;

end;


procedure TCargos.GridFPagoEnter(Sender: TObject);
begin
    sets.cambios.cadenaOldValue:=trim(QFpago.FieldByName('DESCRIPCION').asstring);
   sets.cambios.indiceOldValue:=trim(QFpago.FieldByName('codigo').asstring);
end;

procedure TCargos.GridFPagoKeyPress(Sender: TObject; var Key: char);
begin
    Key := UpCase(Key);
end;



procedure TCargos.QFpagoBeforePost(DataSet: TDataSet);
begin
     IF length (trim(QFpago.FieldByName('DESCRIPCION').asstring))=0  then
     begin
          dbnavDialogError('DESCRIPCION');
          QFpago.Cancel;
     end;
     if   trim(QFpago.FieldByName('DESCRIPCION').asstring) <>  sets.cambios.cadenaOldValue     then
     begin
      begin
            if (length(trim(cambios.cadenaOldValue))>0) and (Sets.dialogos.YesNo ('Confirme la modificación','Está seguro que desea modificar ' + ''#13+''#13 + 'Forma de Pago: ' +
                     trim(cambios.cadenaOldValue) + ''#13+''#13 + 'Por: ' + trim(QFpago.FieldByName('DESCRIPCION').asstring)+ ''#13+''#13) = false)   then
                                                  BEGIN
                                                    QFpago.Cancel;
                                                    exit();
                                                  end
            else
                begin
                   datamodule1.conector_socios.ExecuteDirect ('update desc_origenes  set fpago='''+ trim(QFPago.FieldByName('DESCRIPCION').asstring) + ''' where codigo_fpago='+
                   QFPago.FieldByName('codigo').asstring);
                end;
       end;
     end;
end;

procedure TCargos.QFpagoAfterPost(DataSet: TDataSet);
begin
     g_org();
     g_concept();
end;
//**********************************************************************
//**********************************************************************



//  *********** ORIGENES DE PAGO **********
procedure TCargos.g_concept;
var
  i:integer;
begin
     QOrigenesPago.close;
     QOrigenesPago.sql.Clear;
     QOrigenesPago.sql.add('select * from desc_origenes');
     QOrigenesPago.open;
     QFpago.First;
          for i:= 1 to QFpago.RecordCount do
     begin
          GridOrigenesPago.Columns[3].picklist.Add(QFpago.fieldbyname('descripcion').AsString );
          QFpago.next;
     end;
end;


procedure TCargos.GridOrigenesPagoKeyPress(Sender: TObject; var Key: char);
var
  columna:string;
begin
          Key := UpCase(Key);
     columna:=trim(GridOrigenesPago.SelectedColumn.FieldName);
     if (columna='FPAGO') or (columna='TIPO') or (columna='TIENECERTIFICADO') or (columna='TIENEBENEFICIO') then
     begin
        showmessage ('Edición manual no permitida. ' + ''#13 + 'Seleccione un valor de la lista desplegable, activéla desde la flecha descendente en el borde derecho de este control');
        Key := chr(27);
     end;

end;

procedure TCargos.QOrigenesPagoBeforePost(DataSet: TDataSet);
begin
    IF length (trim(QOrigenesPago.FieldByName('DESCRIPCION').asstring))=0  then
     begin
          dbnavDialogError('DESCRIPCION');
          QOrigenesPago.Cancel;
          exit();
     end;
     IF length (trim(QOrigenesPago.FieldByName('concepto').asstring))=0  then
     begin
          dbnavDialogError('CONCEPTO');
          QOrigenesPago.Cancel;
          exit();
     end;
    IF length(trim(QOrigenesPago.FieldByName('fpago').asstring))=0 then
    begin
         dbnavDialogError('FORMA DE PAGO');
         QOrigenesPago.Cancel;
         exit();
    end;

       QServicios.Close;
       QServicios.SQL.Clear;
       QServicios.SQL.add('select codigo from desc_fpago where descripcion =''' + trim(GridOrigenesPago.Columns[3].Field.AsString) + '''');
       QServicios.Open;
       QOrigenesPago.FieldByName('CODIGO_fpago').Text:=trim(QServicios.FieldByName('codigo').asstring);
       g_servicios();

end;

procedure TCargos.QOrigenesPagoAfterPost(DataSet: TDataSet);
begin
     DBNavigatorOrigenes.BtnClick(nbRefresh);;
end;
//**********************************************************************
//**********************************************************************







// ******** SERVICIOS ************

procedure TCargos.g_servicios();
begin
     Qservicios.Close;
     Qservicios.sql.Clear;
     Qservicios.sql.add('select * from desc_servicios');
     Qservicios.open;

end;

procedure TCargos.GridServiciosEnter(Sender: TObject);
begin
       cambios.cadenaOldValue:=trim(Qservicios.FieldByName('descripcion').asstring);
   cambios.indiceOldValue:=trim(Qservicios.FieldByName('codigo').asstring);
end;

procedure TCargos.GridServiciosKeyPress(Sender: TObject; var Key: char);
begin
   Key := UpCase(Key);
end;

procedure TCargos.QserviciosBeforePost(DataSet: TDataSet);
var
  updateimportes:string;
begin
    IF length (trim(Qservicios.FieldByName('DESCRIPCION').asstring))=0  then
        begin
             dbnavDialogError('DESCRIPCION');
             Qservicios.Cancel;
             exit();
        end;

   IF trim(Qservicios.FieldByName('DESCRIPCION').asstring) <> trim(cambios.cadenaOldValue)  then
       begin
            if (length(trim(cambios.cadenaOldValue))>0) and (Sets.dialogos.YesNo ('Confirme la modificación','Está seguro que desea modificar el Servicio: ' +
                     trim(cambios.cadenaOldValue) + ''#13+''#13 + 'Por: ' + trim(Qservicios.FieldByName('DESCRIPCION').asstring)+ ''#13+''#13) = false)   then
                                                  BEGIN
                                                    Qservicios.Cancel;
                                                    exit();
                                                  end
            else
                begin
                   updateimportes :='update desc_importes  set servicio='''+ trim(Qservicios.FieldByName('DESCRIPCION').asstring) + ''' where codigo_servicio='+
                   Qservicios.FieldByName('codigo').asstring;
                   datamodule1.conector_socios.ExecuteDirect (updateimportes);
                end;
       end;

end;

procedure TCargos.QserviciosAfterPost(DataSet: TDataSet);
begin

    g_servicios();
    g_imp();
end;
//**********************************************************************
//**********************************************************************

  //  *********** IMPORTES **********

  procedure TCargos.GridImportesKeyPress(Sender: TObject; var Key: char);
begin
            Key := UpCase(Key);
     if trim(GridImportes.SelectedColumn.FieldName)='SERVICIO' then
     begin
        showmessage ('Edición manual no permitida. ' + ''#13 + 'Seleccione un valor de la lista desplegable, activéla desde la flecha descendente en el borde derecho de este control');
        Key := chr(27);
     end;

end;

procedure TCargos.g_imp();
var
  i: Integer;
begin
     QImportes.Close;
     Gridimportes.Clear;
     GridImportes.Columns[1].picklist.Clear;
     QImportes.sql.Clear;
     QImportes.sql.add('select * from desc_importes order by codigo');
     QImportes.open;
     QImportes.First;
     i:=1;
          for i:= 1 to QServicios.RecordCount do
     begin
          GridImportes.Columns[1].picklist.Add(trim(QServicios.fieldbyname('descripcion').AsString ));
          QServicios.next;
     end;

end;

procedure TCargos.QImportesAfterPost(DataSet: TDataSet);
begin
    DBNavigatorImp.BtnClick(nbRefresh);
 end;

procedure TCargos.QImportesBeforePost(DataSet: TDataSet);
var
  indiceservicio:string;
begin
      IF length(trim(GridImportes.Columns[1].Field.AsString))=0 then
       begin
           dbnavDialogError('DESCRIPCION DE SERVICIO');
            QImportes.Cancel;
            exit();
       end;
     IF length (trim(QImportes.FieldByName('descripcion').asstring))=0  then
        begin
             dbnavDialogError('DESCRIPCION DE IMPORTE');
             QImportes.Cancel;
              exit();
        end;
       IF length(trim(QImportes.FieldByName('importe').asstring))=0 then
       begin
            dbnavDialogError('IMPORTE');
            QImportes.Cancel;
            exit();
       end;
       QServicios.Close;
       QServicios.SQL.Clear;
       QServicios.SQL.add('select codigo from desc_servicios where descripcion =''' + trim(GridImportes.Columns[1].Field.AsString) + '''');
       QServicios.Open;
       indiceservicio:=trim(QServicios.FieldByName('codigo').asstring);
       QImportes.FieldByName('CODIGO_SERVICIO').Text:=trim(indiceservicio);
       g_servicios();

end;
//**********************************************************************
//**********************************************************************




// ******** CATEGORIAS  ************

procedure Tcargos.g_cat();
begin
     QCat.Close;
     QCat.sql.Clear;
     QCat.sql.add('select * from desc_categoria');
     QCat.open;
end;

procedure TCargos.GridCategoriaKeyPress(Sender: TObject; var Key: char);
begin
   Key := UpCase(Key);
end;

procedure TCargos.QCatAfterPost(DataSet: TDataSet);
begin
     DBNavigatorCat.BtnClick(nbRefresh);
end;

procedure TCargos.QCatBeforePost(DataSet: TDataSet);
begin
     IF length (trim(QCat.FieldByName('DESCRIPCION').asstring))=0  then
     begin
          dbnavDialogError('DESCRIPCION');
          QCat.Cancel;
          exit();
     end;
     sets.cambios.cadenaOldValue:=trim(QCat.FieldByName('DESCRIPCION').asstring);

end;

procedure Tcargos.dbnavDialogError(campo: string);
begin
      showmessage('Falta completar los datos del campo [' + campo + ']' );
end;


end.

