unit control_abm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,dialogs,Forms ,StdCtrls,Modulo_datos
  ;

type

    { Tctrl_datos }
  Tctrl_datos=class(TObject)
  procedure datos_personales (Sender:TObject);
  procedure set_combo(tabla:string);
  end;
var
   ctrl:Tctrl_datos;

implementation
procedure Tctrl_datos.datos_personales(Sender:TObject);
begin
  if length(TEdit(Sender).text)=0 then showmessage ('Faltan datos  ' + uppercase((TEdit(Sender).Name)));
end;

procedure Tctrl_datos.set_combo(tabla:string);
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

