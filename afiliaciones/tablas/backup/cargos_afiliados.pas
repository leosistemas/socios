unit Cargos_afiliados;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, ZDataset,  Forms, Controls, Graphics,
  Dialogs, StdCtrls, DBGrids, ComCtrls, ExtCtrls, Grids, DbCtrls, Modulo_datos
  , db;

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

    procedure GridFPagoKeyPress(Sender: TObject; var Key: char);
    procedure GridServiciosKeyPress(Sender: TObject; var Key: char);
    procedure GridOrigenesPagoKeyPress(Sender: TObject; var Key: char);

    procedure GridCategoriaKeyPress(Sender: TObject; var Key: char);



    procedure FormShow(Sender: TObject);
    procedure g_cat();
    procedure g_org();
    procedure g_concept();
    procedure g_imp();
    procedure g_servicios();
    procedure QCatAfterPost(DataSet: TDataSet);
    procedure QFpagoAfterPost(DataSet: TDataSet);
    procedure QImportesAfterPost(DataSet: TDataSet);
    procedure QOrigenesPagoAfterPost(DataSet: TDataSet);

    procedure QserviciosAfterPost(DataSet: TDataSet);



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


procedure Tcargos.g_cat();
begin
     QCat.Close;
     QCat.sql.Clear;
     QCat.sql.add('select * from desc_categoria');
     QCat.open;
end;

procedure TCargos.g_org;

begin
     QFpago.Close;
     QFpago.sql.Clear;
     QFpago.sql.add('select * from desc_fpago order by descripcion');
     QFpago.open;

end;



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


procedure TCargos.g_imp();
var
  i: Integer;
begin
     QImportes.Close;
     QImportes.sql.Clear;
     QImportes.sql.add('select * from desc_importes');
     QImportes.open;
          for i:= 1 to QServicios.RecordCount do
     begin
          GridImportes.Columns[1].picklist.Add(QServicios.fieldbyname('descripcion').AsString );
          QServicios.next;
     end;

end;

procedure TCargos.g_servicios();
begin
     Qservicios.Close;
     Qservicios.sql.Clear;
     Qservicios.sql.add('select * from desc_servicios');
     Qservicios.open;

end;

procedure TCargos.QCatAfterPost(DataSet: TDataSet);
begin
     DBNavigatorCat.BtnClick(nbRefresh);
end;

procedure TCargos.QFpagoAfterPost(DataSet: TDataSet);
begin
     DBNavigatorFP.BtnClick(nbRefresh);
end;

procedure TCargos.QImportesAfterPost(DataSet: TDataSet);
begin
    DBNavigatorImp.BtnClick(nbRefresh);
end;

procedure TCargos.QOrigenesPagoAfterPost(DataSet: TDataSet);
begin
     DBNavigatorOrigenes.BtnClick(nbRefresh);;
end;


procedure TCargos.QserviciosAfterPost(DataSet: TDataSet);
begin
    DBNavigatorServ.BtnClick(nbRefresh);
end;



procedure TCargos.GridFPagoKeyPress(Sender: TObject; var Key: char);
begin
    Key := UpCase(Key);
end;

procedure TCargos.GridServiciosKeyPress(Sender: TObject; var Key: char);
begin
   Key := UpCase(Key);
end;

procedure TCargos.GridOrigenesPagoKeyPress(Sender: TObject; var Key: char);
begin
   Key := UpCase(Key);
   SHOWMESSAGE(QOrigenesPago.FieldByName('concepto').asstring);
end;


procedure TCargos.GridCategoriaKeyPress(Sender: TObject; var Key: char);
begin
   Key := UpCase(Key);
end;






end.

