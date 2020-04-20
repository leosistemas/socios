unit fuerza;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, DBGrids, DbCtrls, Modulo_datos ;

type

  { TFFuerzas }

  TFFuerzas = class(TForm)
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
  FFuerzas: TFFuerzas;

implementation

{$R *.lfm}

{ TFDelegaciones }

procedure TFFuerzas.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TFFuerzas.DBGrid1KeyPress(Sender: TObject; var Key: char);
begin
   Key := UpCase(Key);
end;

procedure TFFuerzas.FormShow(Sender: TObject);
begin
     DataModule1.Qdeleg.Close;
     DataModule1.Qdeleg.sql.Clear;
     DataModule1.Qdeleg.sql.add('select * from desc_fuerza');
     DataModule1.Qdeleg.open;
end;

end.

