unit Usuarios;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls,
  DBGrids, StdCtrls, DbCtrls, Modulo_datos,ABM_usuario,Sets, Grids,Login
  ;

type

  { TForm2 }

  TForm2 = class(TForm)
    agregar: TButton;
    modificar: TButton;
    grid_usuarios: TDBGrid;
    cambiar: TButton;
    PageControl1: TPageControl;
    Lista_usuarios: TTabSheet;
    Ficha_usuario: TTabSheet;

    procedure agregarClick(Sender: TObject);
    procedure cambiarClick(Sender: TObject);
    procedure grid_usuariosCellClick(Column: TColumn);

    procedure grid_usuariosPrepareCanvas(sender: TObject; DataCol: Integer;
      Column: TColumn; AState: TGridDrawState);
    procedure modificarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
    cadena:string;
  end;

var
  Users: TForm2;

implementation

{$R *.lfm}

{ TForm2 }



procedure TForm2.FormShow(Sender: TObject);

begin
   DataModule1.conector_socios.Reconnect;
   DataModule1.select_usuario();
   Users.Caption:='Configuración de Usuarios       USUARIO ACTUAL: ' + set_flags.usuario   ;
end;


procedure TForm2.agregarClick(Sender: TObject);
begin
     if sets.Set_flags.grupodeusuario='TODOS' then
     begin
     Set_flags.tipo_form_usr:='insert';
     Application.CreateForm(TForm3,ABMusuario);
     ABMusuario.ShowModal;
     ABMusuario.Destroy;
     end;
     if sets.Set_flags.grupodeusuario<>'TODOS' then showmessage('No posee permisos para agregar usuarios');
end;

procedure TForm2.cambiarClick(Sender: TObject);
begin
   Application.CreateForm(TFAutenticar,FAutenticar);
   FAutenticar.ShowModal;
   FAutenticar.Destroy;
   Users.Caption:='Configuración de Usuarios       USUARIO ACTUAL: ' + set_flags.usuario   ;
end;

procedure TForm2.grid_usuariosCellClick(Column: TColumn);
begin
  modificar.Caption:= 'Modificar Usuario '+ DataModule1.Qusuarios.FieldByName('usuario').asstring;
end;


procedure TForm2.grid_usuariosPrepareCanvas(sender: TObject; DataCol: Integer;
  Column: TColumn; AState: TGridDrawState);
begin
  if (AState = [gdSelected]) then
         begin
           Canvas.Font.Color:= clWhite;
           Canvas.Brush.Color:= clRed;
         end  ;
     //grid_usuarios.canvas.brush.color := clWhite;
  if (DataModule1.Qusuarios.RecNo mod 2) = 0 then
  begin
    TDBGrid(Sender).Canvas.Brush.Color := clSkyBlue ;
  end;

end;


procedure TForm2.modificarClick(Sender: TObject);
begin
     if (sets.Set_flags.usuario<>DataModule1.Qusuarios.FieldByName('usuario').asstring) and (sets.Set_flags.grupodeusuario<>'TODOS') then
     begin
       showmessage('No posee permisos para modificar al usuario ' + DataModule1.Qusuarios.FieldByName('usuario').asstring);
       exit;
     end;
         Set_flags.tipo_form_usr:='edit';
         US_fields.nom:=DataModule1.Qusuarios.FieldByName('nombre').asstring;
         US_fields.us:=DataModule1.Qusuarios.FieldByName('usuario').asstring;
         US_fields.act:=DataModule1.Qusuarios.FieldByName('activo').asstring;
         US_fields.grp:=DataModule1.Qusuarios.FieldByName('grupo').asstring;
         US_fields.id:=DataModule1.Qusuarios.FieldByName('id').asstring;
         US_fields.pass:=DataModule1.Qusuarios.FieldByName('passbuscar').asstring;
         Application.CreateForm(TForm3,ABMusuario);
         ABMusuario.ShowModal;
         ABMusuario.Destroy;
     end;

end.

