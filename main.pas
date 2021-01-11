unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  ExtCtrls, Login,cargos_afiliados,modulo_datos,deleg,promotores,Usuarios,sets,titular,fuerza;

type

  { TForm1 }

  TForm1 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    urs: TMenuItem;
    MenuItem3: TMenuItem;
    origenes: TMenuItem;
    delegaciones: TMenuItem;
    promot: TMenuItem;
    MenuItem7: TMenuItem;
    Fuerzas: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure ursClick(Sender: TObject);
    procedure origenesClick(Sender: TObject);
    procedure delegacionesClick(Sender: TObject);
    procedure promotClick(Sender: TObject);
    procedure FuerzasClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
 //  Application.CreateForm(TFAutenticar,FAutenticar);
 //  FAutenticar.ShowModal;
  // FAutenticar.Destroy;

end;

procedure TForm1.FormShow(Sender: TObject);
begin

   DataModule1.Set_conector_socios();
   //DataModule1.conector_socios.Connect;
   Form1.Caption:='Gestión de Socios de la Mutual de Suboficiales de Policía Federal Argentina.   -----    USUARIO: ' + sets.Set_flags.usuario;
end;

procedure TForm1.MenuItem1Click(Sender: TObject);
begin
    Application.CreateForm(Ttitular,Ftitular);
   FTitular.ShowModal;
   FTitular.Destroy;
end;

procedure TForm1.ursClick(Sender: TObject);
begin
   Application.CreateForm(TForm2,Users);
   Users.ShowModal;
   Users.Destroy;
end;

procedure TForm1.origenesClick(Sender: TObject);
begin
   //datamodule1.conector_socios.ExecuteDirect('EXECUTE PROCEDURE P_cargos');
   Application.CreateForm(TCargos,Cargos);
   Cargos.ShowModal;
   Cargos.Destroy;
end;

procedure TForm1.delegacionesClick(Sender: TObject);
begin
  Application.CreateForm(TFDelegaciones,FDelegaciones);
   FDelegaciones.ShowModal;
   FDelegaciones.Destroy;
end;

procedure TForm1.promotClick(Sender: TObject);
begin
   Application.CreateForm(TFPromotores,FPromotores);
      FPromotores.ShowModal;
      FPromotores.Destroy;
end;

procedure TForm1.FuerzasClick(Sender: TObject);
begin
      Application.CreateForm(TFFuerzas,FFuerzas);
           FFuerzas.ShowModal;
           FFuerzas.Destroy;
end;

end.

