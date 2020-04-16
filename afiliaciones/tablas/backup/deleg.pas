unit deleg;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, DBGrids, DbCtrls, Modulo_datos ;

type

  { TFDelegaciones }

  TFDelegaciones = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    Shape1: TShape;
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: char);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FDelegaciones: TFDelegaciones;

implementation

{$R *.lfm}

{ TFDelegaciones }

procedure TFDelegaciones.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TFDelegaciones.DBGrid1KeyPress(Sender: TObject; var Key: char);
begin
   Key := UpCase(Key);
end;

procedure TFDelegaciones.FormShow(Sender: TObject);
begin
     DataModule1.Qdeleg.Close;
     DataModule1.Qdeleg.sql.Clear;
     DataModule1.Qdeleg.sql.add('select * from delegacion');
     DataModule1.Qdeleg.open;
end;

end.

