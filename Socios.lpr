program Socios;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, pl_zeosdbo, lz_datetimectrls, pl_htmlviewer, main, unit1, Modulo_datos
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Initialize;

  Application.CreateForm(TDataModule1, DataModule1);

  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

