unit Login;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  StdCtrls, ExtCtrls, Buttons,  ZConnection, ZDataset ,Sets,cryt;

type

  { TFAutenticar }

  TFAutenticar = class(TForm)
    contador1: TStaticText;
    contador2: TStaticText;
    ingreso: TBitBtn;
    salir: TBitBtn;
    logo: TImage;
    contador: TStaticText;
    usr: TComboBox;
    ConectorLogin: TZConnection;
    ConsultaLogin: TZQuery;
    pass: TEdit;

    procedure ConectorLoginBeforeConnect(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ingresoClick(Sender: TObject);
    procedure passKeyPress(Sender: TObject; var Key: char);
    procedure salirClick(Sender: TObject);
    procedure usrChange(Sender: TObject);
     procedure conectar();
  private
    { private declarations }
  public
    { public declarations }
    log :string;
    cadena:string;
    cont: integer;
    tfuet:textfile;
    renglon:string;
    usuario:string;

  end;

var
  FAutenticar: TFAutenticar;

implementation

{$R *.lfm}

{ TFAutenticar }



procedure TFAutenticar.conectar();
begin
     //showmessage (renglon);
    AssignFile(tfuet,'librerias\dbxconfig.ini');
    Reset(tfuet);
       readln(tfuet,renglon);
       ConectorLogin.LibraryLocation:= trim(ExtractFilePath (Application.ExeName)+'librerias\'+renglon);
       readln(tfuet,renglon);
       ConectorLogin.Hostname:=trim(renglon);
       readln(tfuet,renglon);
       ConectorLogin.Port:= strtoint(trim(renglon))+3049;
       readln(tfuet,renglon);
       ConectorLogin.Protocol:= trim(renglon);
       readln(tfuet,renglon);
       ConectorLogin.Database:= trim(renglon);
       ConectorLogin.User:='sysdba';
       ConectorLogin.Password:='masterkey';
       closefile(tfuet);
 try
 ConectorLogin.Connect
 EXCEPT
       application.MessageBox('ERROR DE CONEXION A BASES DE DATOS SOCIOS'#13+''#13+'El servidor local parece no estar funcionando '#13+''#13+'Se finalizará el programa','Error');
       application.Terminate;
  end;

 end;


procedure TFAutenticar.ConectorLoginBeforeConnect(Sender: TObject);
begin
  // ConectorLogin.Properties.Add('codepage=ISO_8859_1');
  // ConectorLogin.Properties.Add('charset=ISO_8859_1');
end;


procedure TFAutenticar.FormShow(Sender: TObject);
begin
conectar();
 cont:=1;

ConectorLogin.Connected:=true;
ConsultaLogin.Close;
ConsultaLogin.SQL.Clear;
ConsultaLogin.SQL.Add('select * from segur_usuarios where activo=''T''');
ConsultaLogin.open;

while not ConsultaLogin.EOF do
begin
  usr.Items.Add(ConsultaLogin.FieldByName('USUARIO').AsString);
  ConsultaLogin.Next;
end;
end;


procedure TFAutenticar.ingresoClick(Sender: TObject);
var
  a:integer;
  b:integer;
  pasw:string;
begin
 ConsultaLogin.First;
 b:=usr.ItemIndex;
 for a := 1 to b do
 begin
      ConsultaLogin.Next;
 end;

cadena :='select * from segur_usuarios where usuario='+''''+ usuario +'''';

ConsultaLogin.Close;
ConsultaLogin.SQL.Clear;
ConsultaLogin.SQL.Add(cadena);
ConsultaLogin.open;

if  pass.Text<>'' then
begin
    if usuario <> '' then
    begin
        pasw:=trim(pass.Text);
        //showmessage(trim(ConsultaLogin.FieldByName('passbuscar').asstring) + ' <--->  ' + trim(crip.encrypt(pass.Text)));
        //showmessage(trim(ConsultaLogin.FieldByName('passbuscar').asstring) + ' <--->  ' + trim(crip.encrypt(pasw)));

          if trim(crip.encrypt(pasw)) = trim(ConsultaLogin.FieldByName('passbuscar').asstring) then
          begin
                Set_flags.idusuario:=ConsultaLogin.FieldByName('id').AsString;
                Set_flags.usuario:=ConsultaLogin.FieldByName('USUARIO').AsString;
                Set_flags.grupodeusuario:=ConsultaLogin.FieldByName('grupo').AsString;
                Sets.conf.color_consulta:=ConsultaLogin.FieldByName('tema_consultas').asstring;
                Sets.conf.color_abm:=ConsultaLogin.FieldByName('tema_abm').asstring;
                sets.conf.colores();
                close;
          end;
    end;
end;
cont:=cont+1;
contador.caption:=inttostr(cont);
if cont = 2 then
begin
   contador.visible:=true;
   contador2.visible:=true;
   contador1.caption:='USUARIO  ' + Set_flags.usuario;
   contador1.visible:=true;
   contador.font.color:=clGreen;
end;
if cont = 3 then
begin
     contador.font.color:=clRed;
end;
if cont = 4 then
begin
  showmessage('Confirmación de contraseña incorrecta. El sistema no permite el acceso.');
  application.terminate;
end;

end;

procedure TFAutenticar.passKeyPress(Sender: TObject; var Key: char);
begin
  if  Key = char(13) then
       begin
          if usr.ItemIndex=-1 then
            begin
                Set_flags.usuario :='';
            end;
          Key :=chr(0);
          self.ingreso.click;
          exit;
       end;
end;

procedure TFAutenticar.salirClick(Sender: TObject);
begin
   application.terminate;
end;

procedure TFAutenticar.usrChange(Sender: TObject);
begin
  usuario :=usr.Text;
  Set_flags.usuario:=usr.Text;
  pass.setfocus ;
end;

end.

