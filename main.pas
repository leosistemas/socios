unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  ExtCtrls, Login,cargos_afiliados,modulo_datos,deleg,promotores,Usuarios,sets,titular;

type

  { TForm1 }

  TForm1 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
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
   Application.CreateForm(TFAutenticar,FAutenticar);
   FAutenticar.ShowModal;
   FAutenticar.Destroy;
end;

procedure TForm1.FormShow(Sender: TObject);
begin

   DataModule1.Set_conector_socios();
   DataModule1.conector_socios.Connect;
   Form1.Caption:='Gestión de Socios de la Mutual de Suboficiales de Policía Federal Argentina.   -----    USUARIO: ' + sets.Set_flags.usuario;
end;

procedure TForm1.MenuItem1Click(Sender: TObject);
begin
    Application.CreateForm(Ttitular,Ftitular);
   FTitular.ShowModal;
   FTitular.Destroy;
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
     Application.CreateForm(TForm2,Users);
   Users.ShowModal;

   Users.Destroy;
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin
   Application.CreateForm(TCargos,Cargos);
   Cargos.ShowModal;
   Cargos.Destroy;
end;

procedure TForm1.MenuItem5Click(Sender: TObject);
begin
  Application.CreateForm(TFDelegaciones,FDelegaciones);
   FDelegaciones.ShowModal;
   FDelegaciones.Destroy;
end;

procedure TForm1.MenuItem6Click(Sender: TObject);
begin
   Application.CreateForm(TFPromotores,FPromotores);
      FPromotores.ShowModal;
      FPromotores.Destroy;
end;

end.

