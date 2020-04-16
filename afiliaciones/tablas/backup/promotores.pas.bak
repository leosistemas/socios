unit promotores;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  DBGrids, ExtCtrls, DbCtrls, Modulo_datos;

type

  { TFPromotores }

  TFPromotores = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    Shape1: TShape;
    procedure DBGrid1KeyPress(Sender: TObject; var Key: char);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FPromotores: TFPromotores;

implementation

{$R *.lfm}

{ TFPromotores }

procedure TFPromotores.FormShow(Sender: TObject);
begin
     DataModule1.Qpromotores.Close;
     DataModule1.Qpromotores.sql.Clear;
     DataModule1.Qpromotores.sql.add('select * from promotores');
     DataModule1.Qpromotores.open;
end;

procedure TFPromotores.DBGrid1KeyPress(Sender: TObject; var Key: char);
begin
  Key := UpCase(Key);
end;

end.

