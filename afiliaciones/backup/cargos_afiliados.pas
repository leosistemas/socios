unit Cargos_afiliados;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil,  Forms, Controls, Graphics,
  Dialogs, StdCtrls, DBGrids, ComCtrls, ExtCtrls, Grids, DbCtrls, Modulo_datos
  , db;

type

  { TCargos }

  TCargos = class(TForm)
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    DBMemo1: TDBMemo;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    DBNavigator3: TDBNavigator;
    DBNavigatorCategorias: TDBNavigator;
    DBGrid2: TDBGrid;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    PageTablaAfiliaciones: TPageControl;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    TabCat: TTabSheet;
    TabSheet1: TTabSheet;
    TabVia: TTabSheet;

    procedure DBGrid1KeyPress(Sender: TObject; var Key: char);
    procedure DBGrid2KeyPress(Sender: TObject; var Key: char);
    procedure DBGrid3KeyPress(Sender: TObject; var Key: char);
    procedure DBGrid4EditButtonClick(Sender: TObject);
    procedure DBGrid4KeyPress(Sender: TObject; var Key: char);



    procedure FormShow(Sender: TObject);
    procedure g_cat();
    procedure g_org();
    procedure g_concept();
    procedure g_imp();

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
      g_imp();
      TabVia.TabVisible:=true;
end;


procedure Tcargos.g_cat();
begin
     DataModule1.QCat.Close;
     DataModule1.QCat.sql.Clear;
     DataModule1.QCat.sql.add('select * from categoria');
     DataModule1.QCat.open;
end;

procedure TCargos.g_org;
var
  i: Integer;
begin
     DataModule1.QOrg.Close;
     DataModule1.QOrg.sql.Clear;
     DataModule1.QOrg.sql.add('select * from formaspago');
     DataModule1.QOrg.open;
end;



procedure TCargos.g_concept;
begin
     DataModule1.QConcept.Close;
     DataModule1.QConcept.sql.Clear;
     DataModule1.QConcept.sql.add('select * from servicioFORMAPAGO');
     DataModule1.QConcept.open;

end;


procedure TCargos.g_imp();
var
  i:integer;
begin
     DataModule1.QImp.Close;
     DataModule1.QImp.sql.Clear;
     DataModule1.QImp.sql.add('select * from SERVICIO ORDER BY CODIGO');
     DataModule1.QImp.open;
     DataModule1.QImp.First;
     for i:= 1 to DataModule1.QImp.RecordCount do
     begin
          DBgrid1.Columns[6].picklist.Add(DataModule1.QImp.fieldbyname('codigo').AsString );
          DataModule1.QImp.next;
     end;

end;
procedure TCargos.DBGrid1KeyPress(Sender: TObject; var Key: char);
begin
    Key := UpCase(Key);
end;

procedure TCargos.DBGrid2KeyPress(Sender: TObject; var Key: char);
begin
   Key := UpCase(Key);
end;

procedure TCargos.DBGrid3KeyPress(Sender: TObject; var Key: char);
begin
   Key := UpCase(Key);
end;

procedure TCargos.DBGrid4EditButtonClick(Sender: TObject);
begin
  SHOWMESSAGE('ED');
end;

procedure TCargos.DBGrid4KeyPress(Sender: TObject; var Key: char);
begin
   Key := UpCase(Key);
end;






end.

