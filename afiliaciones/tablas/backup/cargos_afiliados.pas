unit Cargos_afiliados;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, ZDataset, Forms, Controls, Graphics, Dialogs,
  StdCtrls, DBGrids, ComCtrls, ExtCtrls, Grids, DbCtrls, LazHelpHTML, types,
  Modulo_datos, db, ZAbstractDataset,Sets;

type

  { TCargos }

  TCargos = class(TForm)
    DServicios: TDataSource;
    DBNavigatorImp: TDBNavigator;
    DS_Categorias: TDataSource;
    DS_Fpago: TDataSource;
    DS_Importes: TDataSource;
    DS_OrigenesPago: TDataSource;
    GridOrigenesPago: TDBGrid;
    GridCategoria: TDBGrid;
    DBMemo1: TDBMemo;
    DBNavigatorServ: TDBNavigator;
    DBNavigatorCat: TDBNavigator;
    DBNavigatorOrigenes: TDBNavigator;
    DBNavigatorFP: TDBNavigator;
    GridImportes: TDBGrid;
    GridServicios: TDBGrid;
    GridFPago: TDBGrid;
    HTMLBrowserHelpViewer1: THTMLBrowserHelpViewer;
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

    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure GridFPagoKeyPress(Sender: TObject; var Key: char);
    procedure GridServiciosCellClick(Column: TColumn);
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



procedure Tcargos.dbnavDialogError(campo: string);
begin
      showmessage('Falta completar los datos del campo [' + campo + ']' );
end;









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
begin
   Key := UpCase(Key);
end;

procedure TCargos.QOrigenesPagoBeforePost(DataSet: TDataSet);
begin
    IF length (trim(QOrigenesPago.FieldByName('DESCRIPCION').asstring))=0  then
     begin
          dbnavDialogError('DESCRIPCION');
          QOrigenesPago.Cancel;
     end;
     IF length (trim(QOrigenesPago.FieldByName('concepto').asstring))=0  then
     begin
          dbnavDialogError('CONCEPTO');
          QOrigenesPago.Cancel;
     end;
    IF length(trim(QOrigenesPago.FieldByName('fpago').asstring))=0 then
    begin
         dbnavDialogError('FORMA DE PAGO');
         QOrigenesPago.Cancel;
    end;
end;

procedure TCargos.QOrigenesPagoAfterPost(DataSet: TDataSet);
begin
     DBNavigatorOrigenes.BtnClick(nbRefresh);;
end;
//**********************************************************************
//**********************************************************************




// ******** FORMA DE PAGOS ************
procedure TCargos.g_org;
begin
     QFpago.Close;
     QFpago.sql.Clear;
     QFpago.sql.add('select * from desc_fpago order by descripcion');
     QFpago.open;

end;

procedure TCargos.GridFPagoKeyPress(Sender: TObject; var Key: char);
begin
    Key := UpCase(Key);
end;

procedure TCargos.FormCreate(Sender: TObject);
begin
   DataModule1.conector_socios.Connect;
end;

procedure TCargos.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  DataModule1.conector_socios.Disconnect;
end;






procedure TCargos.QFpagoBeforePost(DataSet: TDataSet);
begin
     IF length (trim(QFpago.FieldByName('DESCRIPCION').asstring))=0  then
     begin
          dbnavDialogError('DESCRIPCION');
          QFpago.Cancel;
     end;
end;

procedure TCargos.QFpagoAfterPost(DataSet: TDataSet);
begin
     DBNavigatorFP.BtnClick(nbRefresh);
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

procedure TCargos.GridServiciosCellClick(Column: TColumn); // obtiene el valor descripcion y valor de campo clave para conocer si se hicieron canbios
begin
   cambios.cadenaOldValue:=trim(Qservicios.FieldByName('descripcion').asstring);
   cambios.indiceOldValue:=trim(Qservicios.FieldByName('codigo').asstring);
//   showmessage (cambios.cadenaOldValue + '  ' +cambios.indiceOldValue);
end;

procedure TCargos.GridServiciosKeyPress(Sender: TObject; var Key: char);
begin
   Key := UpCase(Key);
end;

procedure TCargos.QserviciosBeforePost(DataSet: TDataSet);
begin
    IF length (trim(Qservicios.FieldByName('DESCRIPCION').asstring))=0  then
        begin
             dbnavDialogError('DESCRIPCION');
             Qservicios.Cancel;
             exit();
        end;

   IF trim(Qservicios.FieldByName('DESCRIPCION').asstring) <> trim(cambios.cadenaOldValue)  then
       begin
            if (length(trim(cambios.cadenaOldValue))>0) and (Sets.dialogos ('Confirme la modificación','Está seguro que desea modificar el Servicio: ' +
                     trim(cambios.cadenaOldValue) + ''#13+''#13 + 'Por: ' + trim(Qservicios.FieldByName('DESCRIPCION').asstring)+ ''#13+''#13) = false)   then
                                                  BEGIN
                                                    Qservicios.Cancel;
                                                    exit();
                                                  end;
                 end;

end;

procedure TCargos.QserviciosAfterPost(DataSet: TDataSet);
begin
   // DBNavigatorServ.BtnClick(nbRefresh);
    g_servicios();
    g_imp();
end;
//**********************************************************************
//**********************************************************************

  //  *********** IMPORTES **********

procedure TCargos.g_imp();
var
  i: Integer;
begin
     QImportes.Close;
     Gridimportes.Clear;
     GridImportes.Columns[1].picklist.Clear;
     QImportes.sql.Clear;
     QImportes.sql.add('select codigo,SERVICIO,DESCRIPCION ,IMPORTE from desc_importes order by codigo');
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
begin
     IF length (trim(QImportes.FieldByName('descripcion').asstring))=0  then
        begin
             dbnavDialogError('DESCRIPCION');
             QImportes.Cancel;
        end;
       IF length(trim(QImportes.FieldByName('importe').asstring))=0 then
       begin
            dbnavDialogError('IMPORTE');
            QImportes.Cancel;
       end;
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
     end;
end;


end.

