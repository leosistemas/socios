unit cryt;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,BlowFish,Dialogs;

type  crip = Object
    function encrypt(s: string): string;
    function decrypt(aString: string): string;
 end;

implementation

function crip.encrypt(s: string): string;
var
  s1, s2: TStringStream;
  bf: TBlowFishEncryptStream;
  clave:string;
begin
  if (s<>'') then begin
    s1:=TStringStream.Create(s); //used as your source string
       s2:=TStringStream.Create('');  //make sure destination stream is blank
       bf:=TBlowfishEncryptStream.Create('seba', s2);  //writes to destination stream
       bf.WriteAnsiString(s);
      // bf.copyfrom(s1, s1.size);
       bf.free;
       clave:=copy(s2.datastring,1,s2.datastring.Length);
       result:=UTF8Decode(trim(clave));
       s2.free;
       s1.free;
  end;
end;

function crip.decrypt(aString: string): string;
var
  Key:string;
      DecrytpStream:TBlowFishDeCryptStream;
      StringStream:TStringStream;
      DecryptedString:string;
  begin
    Key := 'seba';
    showmessage(aString);
    StringStream := TStringStream.Create(aString);
    DecrytpStream := TBlowFishDeCryptStream.Create(Key,StringStream);
    DecryptedString := DecrytpStream.ReadAnsiString;
    result := UTF8Decode(trim(DecryptedString));
    DecrytpStream.Free;
    StringStream.Free;
    showmessage(result);
end;

end.

