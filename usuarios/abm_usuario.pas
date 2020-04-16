unit ABM_usuario;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, ZDataset, Forms, Controls,
  Graphics, Dialogs, StdCtrls, DbCtrls, Sets, cambiar_pass,Modulo_datos,cryt,titular
  ;



type

  { TForm3 }

  TForm3 = class(TForm)
    paleta_consulta: TButton;
    cambiar_pas: TButton;
    grabar: TButton;
    cerrar: TButton;
    ComboGrupo: TComboBox;
    activo: TComboBox;
    label_act: TLabel;
    paleta_abm: TButton;
    pass: TEdit;
    confir_pass: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label_pass: TLabel;
    Label4: TLabel;
    Label_confir_pass: TLabel;
    user: TEdit;
    nomb: TEdit;
    qGrupo: TZReadOnlyQuery;
    procedure cambiar_pasClick(Sender: TObject);
    procedure cerrarClick(Sender: TObject);
    procedure confir_passEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grabarClick(Sender: TObject);
    procedure actualizar();
    procedure agregar();
    procedure paleta_abmClick(Sender: TObject);
    procedure paleta_consultaClick(Sender: TObject);
    procedure userExit(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  ABMusuario: TForm3;

implementation

{$R *.lfm}

{ TForm3 }



procedure TForm3.FormShow(Sender: TObject);
var
  cont:integer;
  item:integer;
begin
  qGrupo.close;
  qGrupo.SQL.Clear;
  qGrupo.SQL.add('select * from segur_grupos');
  qGrupo.Open;
  qGrupo.First;
  ComboGrupo.Clear;
  item:=0;
  cont:=0;

  while not qGrupo.EOF do
  begin
       ComboGrupo.Items.Add(qGrupo.FieldByName('GRUPO').AsString);
       if trim(qGrupo.FieldByName('GRUPO').AsString) = trim(US_fields.grp) then item:=cont;
       cont:=cont + 1;
       qGrupo.Next;
  end;

  combogrupo.ItemIndex:=item;
  if  (Set_flags.tipo_form_usr='edit') and (Set_flags.grupodeusuario='TODOS') then
  begin
    pass.Visible:=false;
    confir_pass.Visible:=false;
    Label_confir_pass.Visible:=false;
    Label_pass.Visible:=false;
    cambiar_pas.Visible:=true;
    user.text:=US_fields.us;
    nomb.text:=US_fields.nom;
    activo.ItemIndex:=1;
    paleta_consulta.Visible:=true;
    paleta_abm.Visible:=true;
    nomb.Enabled:=true;
    user.Enabled:=true;
    ComboGrupo.Enabled:=true;
    activo.Enabled:=true;
    if US_fields.act='SI' then activo.ItemIndex:=0;
  end;
  if  (Set_flags.tipo_form_usr='edit') and (Set_flags.grupodeusuario<>'TODOS') then
  begin
    pass.Visible:=false;
    confir_pass.Visible:=false;
    Label_confir_pass.Visible:=false;
    Label_pass.Visible:=false;
    cambiar_pas.Visible:=true;
    user.text:=US_fields.us;
    nomb.text:=US_fields.nom;
    nomb.Enabled:=false;
    user.Enabled:=false;
    activo.ItemIndex:=1;
    if US_fields.act='SI' then activo.ItemIndex:=0;
    paleta_consulta.Visible:=true;
    paleta_abm.Visible:=true;
    ComboGrupo.Enabled:=false;
    activo.Enabled:=false;

  end;
  if  Set_flags.tipo_form_usr='insert' then
  begin
    pass.Visible:=true;
    confir_pass.Visible:=true;
    Label_confir_pass.Visible:=true;
    Label_pass.Visible:=true;
    cambiar_pas.Visible:=false;
    user.text:='';
    nomb.text:='';
    activo.ItemIndex:=0;
    combogrupo.ItemIndex:=-1;
    paleta_consulta.Visible:=false;
    paleta_abm.Visible:=false;
  end;
end;

procedure TForm3.grabarClick(Sender: TObject);
begin
  if  Set_flags.tipo_form_usr='edit' then  actualizar();
  if  Set_flags.tipo_form_usr='insert' then  agregar();
end;

procedure TForm3.cerrarClick(Sender: TObject);
begin
  close  ;
end;

procedure TForm3.confir_passEnter(Sender: TObject);
begin

end;

procedure TForm3.cambiar_pasClick(Sender: TObject);
begin

  Application.CreateForm(TForm4,Fpass) ;
  Fpass.ShowModal;
  Fpass.Destroy;
end;

function buscar_usuario(us:string):string;
var
  act:string;
begin
      DataModule1.QRead.Close;
      DataModule1.QRead.SQL.Clear;
      DataModule1.QRead.SQL.Add('select * from segur_usuarios where usuario= '''+ trim(us) + '''');
      DataModule1.QRead.Open;
      if DataModule1.Qread.RecordCount=1 then
      begin
        result:='T';
        exit;
      end;
     result:='F';
end;

procedure TForm3.userExit(Sender: TObject);
begin
  if  Set_flags.tipo_form_usr='insert' then
  begin
      if buscar_usuario(trim(user.Text))='T' then
        begin
          showmessage ('El usuario ' + user.Text  + ' ya se encuentra registrado');
          user.Text:='';
          user.SetFocus;
          exit;
        end;
  end;
end;

procedure TForm3.actualizar();
var
  act:string;
begin
  if activo.ItemIndex=0 then act:='T';
  if activo.ItemIndex=1 then act:='X';
  if  Set_flags.tipo_form_usr='edit' then
  begin
       S_sql.cadena1:='update segur_usuarios set nombre='''+trim(nomb.text)+''',usuario='''+trim(user.Text)+''',activo='''+act+''',grupo='''+combogrupo.Text+'''';
       S_sql.cadena2:=' where id='+US_fields.id +';';
       //showmessage(S_sql.cadena1+S_sql.cadena2);
        DataModule1.conector_socios.ExecuteDirect(S_sql.cadena1+S_sql.cadena2);
        DataModule1.select_usuario();
      close;
  end;
end;

procedure TForm3.agregar();
var
  pasw:string;
  act:string;
begin

    if length(trim(pass.Text))=0 then
    begin
          showmessage ('Debe ingresar una contrseña');
          exit;
    end;
    if trim(pass.text)<>trim(confir_pass.text) then
    begin
         showmessage ('La confirmación de la contraseña no coincide con la contraseña');
         exit;
    end;
    pasw:=trim(pass.Text);
    act:=trim(crip.encrypt(pasw));
    S_SQL.cadena1:='insert into segur_usuarios (nombre,usuario,grupo,passbuscar) values (''';
    S_SQL.cadena2:=trim(nomb.Text)+''','''+trim(user.Text)+''','''+trim(combogrupo.text)+''','''+act+''');';
    DataModule1.conector_socios.ExecuteDirect(S_sql.cadena1+S_sql.cadena2);
    DataModule1.select_usuario();
    close;
end;

procedure TForm3.paleta_abmClick(Sender: TObject);
begin
      sets.Set_flags.tipo_ficha:='paleta_abm'     ;
     Application.CreateForm(Ttitular,Ftitular);
     Ftitular.ShowModal;
     Ftitular.Destroy;
end;

procedure TForm3.paleta_consultaClick(Sender: TObject);
begin
     sets.Set_flags.tipo_ficha:='paleta_consulta'     ;
     Application.CreateForm(Ttitular,Ftitular);
     Ftitular.ShowModal;
     Ftitular.Destroy;
end;

end.

