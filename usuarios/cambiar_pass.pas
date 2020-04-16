unit cambiar_pass;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,Sets,cryt,Modulo_datos,
  DbCtrls;

type

  { TForm4 }

  TForm4 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    pass_anterior: TEdit;
    nueva_pass: TEdit;
    confirm_pass: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Fpass: TForm4;

implementation

{$R *.lfm}

{ TForm4 }

procedure TForm4.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TForm4.FormShow(Sender: TObject);
begin
  Fpass.Caption:='Cambio de contrseña usuario: '+US_fields.us+ '  ' + US_fields.nom;
end;

procedure TForm4.Button1Click(Sender: TObject);
var
  new_pass:string;
begin
//  showmessage(US_fields.pass+ ' <--->  ' + crip.encrypt(pass_anterior.Text));
 if US_fields.pass<>crip.encrypt(pass_anterior.Text) then
    begin
          showmessage('La contraseña actual es incorrecta!!!');
          exit;
    end;
 if trim(nueva_pass.text)<>trim(confirm_pass.Text) then
   begin
          showmessage('La contraseña nueva no coincide con la confirmación de la nueva contraseña!!!');
          exit;
    end;
 if length(trim(nueva_pass.text))=0 then
   begin
          showmessage('Complete la nueva contraseña!!!');
          exit;
   end;
 if length(trim(confirm_pass.text))=0 then
   begin
          showmessage('Complete la confirmación de la nueva contraseña!!!');
          exit;
   end;
  new_pass:= crip.encrypt(nueva_pass.text);
  S_sql.cadena1:='update segur_usuarios set passbuscar='''+trim(new_pass)+''' where id='+Us_fields.id+';';
  DataModule1.conector_socios.ExecuteDirect(S_sql.cadena1);
  close;
end;

end.

