unit Buscar;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, DBGrids,Modulo_datos ,sets
  , Grids;

type

  { TForm5 }

  TForm5 = class(TForm)
    bp: TComboBox;
    clave: TEdit;
    clave1: TEdit;
    DBGrid1: TDBGrid;
    procedure bpChange(Sender: TObject);
    procedure bpEnter(Sender: TObject);

    procedure clave1KeyPress(Sender: TObject; var Key: char);
    procedure claveEnter(Sender: TObject);
    procedure claveExit(Sender: TObject);
    procedure claveKeyPress(Sender: TObject; var Key: char);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1PrepareCanvas(sender: TObject; DataCol: Integer;
      Column: TColumn; AState: TGridDrawState);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure busqueda();
  private
    { private declarations }
  public
    { public declarations }
    dato:string;
    nomb:string;
  end;

var
  FBuscar: TForm5;

implementation

{$R *.lfm}

{ TForm5 }

procedure TForm5.bpEnter(Sender: TObject);
begin
   clave.Text:='';
   clave1.Text:='';
   DataModule1.Qusuarios.Close;
end;



procedure TForm5.clave1KeyPress(Sender: TObject; var Key: char);
begin
    nomb:=clave1.Text;
  if Key=char(13) then
       begin
          Key:=char(Key);
          clave1.Text:=nomb;
           busqueda();
          //showmessage(dato + ' ' + nomb);
          exit;
       end
  else
      begin
        Key:=char(Key);
        clave1.Text:=nomb;
        exit;
      end;
end;

procedure TForm5.bpChange(Sender: TObject);
begin
  clave.NumbersOnly:=true;
  if bp.text='NOMBRE' then
       begin
          clave.NumbersOnly:=false;
          clave1.visible:=true;
       end;
  if bp.text<>'NOMBRE' then
       begin
          clave1.visible:=false;
       end;
  clave.SetFocus;
end;

procedure TForm5.claveEnter(Sender: TObject);
begin
  clave.Color:=clYellow;
  clave1.Color:=clYellow;
end;

procedure TForm5.claveExit(Sender: TObject);
begin
    clave.Color:=clDefault;
    clave1.Color:=clDefault;
end;

procedure TForm5.claveKeyPress(Sender: TObject; var Key: char);
begin
  dato:=clave.Text;
  if Key=char(13) then
       begin
          Key:=char(Key);
          clave.Text:=dato;
          if clave1.Visible then
               begin
                  clave1.SetFocus;
                  exit;
               end;
          busqueda();

          exit;
       end
  else
      begin
        Key:=char(Key);
        clave.Text:=dato;
        exit;
      end;
end;

procedure TForm5.DBGrid1DblClick(Sender: TObject);
begin
  if DataModule1.QBuscar.IsEmpty then exit;
  f_tit.numero:= DataModule1.QBuscar.fieldbyname('numero').AsString;
  close;
end;

procedure TForm5.DBGrid1PrepareCanvas(sender: TObject; DataCol: Integer;
  Column: TColumn; AState: TGridDrawState);
begin
  if (AState = [gdSelected]) then
         begin
           Canvas.Font.Color:= clBlack;
           Canvas.Brush.Color:= clRed;
         end  ;
     //grid_usuarios.canvas.brush.color := clWhite;
  if (DataModule1.QBuscar.RecNo mod 2) = 0 then
  begin
    if TDBGrid(Sender).Canvas.Brush.Color = TDBGrid(Sender).Color then
    TDBGrid(Sender).Canvas.Brush.Color := clYellow ;
  end;
  if DataModule1.QBuscar.fieldbyname('est').AsInteger < 0 then
  begin
    TDBGrid(Sender).Canvas.font.Color := clRed ;
  end;

end;

procedure TForm5.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  try
    if DataModule1.QBuscar.IsEmpty=true then sets.f_tit.numero:='0';
    exit;
  except
    sets.f_tit.numero:='0';
    exit;
  end;
    sets.f_tit.numero:=DataModule1.QBuscar.FieldByName('numero').AsString;
end;


procedure TForm5.FormShow(Sender: TObject);
begin
  DataModule1.QBuscar.close;
  DataModule1.conector_socios.Reconnect;
end;

procedure TForm5.busqueda();
var
  c1:string;
  c2:string;
begin
  datamodule1.conector_socios.Reconnect;
  if length(trim(bp.text))=0 then exit;
  if bp.text<>'NOMBRE' then
       begin
          c1:=DataModule1.sql_buscar('buscar_socio.sql',trim(clave.text),'',trim(bp.text)+'=');
     //      showmessage(c1);
          DataModule1.QBuscar.close;
          DataModule1.QBuscar.SQL.clear;
          DataModule1.QBuscar.SQL.add(c1);
          DataModule1.QBuscar.Open;
       end;
  if bp.text='NOMBRE' then
       begin
          c1:=DataModule1.sql_buscar('buscar_nombre.sql',trim(clave.text),trim(clave1.text),'nombre');
          DataModule1.QBuscar.close;
          DataModule1.QBuscar.SQL.clear;
          DataModule1.QBuscar.SQL.add(c1);
          DataModule1.QBuscar.Open;
       end;

end;

end.

