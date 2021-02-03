unit llaves;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, mooncomp, ZDataset, Forms, Controls, Graphics,
  Dialogs, ExtCtrls, StdCtrls, DbCtrls, DBGrids, sets, Modulo_datos, db;

type

  { Tllaves }

  Tllaves = class(TForm)
    DBGrid2: TDBGrid;
    DBNavigator2: TDBNavigator;
    DSEmisores: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    DSEstado_llave: TDataSource;
    Label3: TLabel;
    Label4: TLabel;
    QEstado_llave: TZQuery;
    Shape3: TShape;
    QEmisores: TZQuery;
    Shape4: TShape;
    procedure FormShow(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Fllaves: Tllaves;

implementation

{$R *.lfm}

{ Tllaves }

procedure Tllaves.FormShow(Sender: TObject);
begin
  Qemisores.Close;
  QEmisores.sql.clear;
  QEmisores.sql.add('select * from desc_llaves_emisores');
  QEmisores.Open;

  QEstado_llave.Close;
  QEstado_llave.sql.clear;
  QEstado_llave.sql.add('select * from desc_llaves_emisores');
  QEstado_llave.Open;

end;

end.

