unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    procedure FormPaint(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

function StartIncrement: Single;
begin
  result := 0.0001;
end;

function Tx(x, maxx: Single): Integer;
begin
  result := Round(((x + maxx) * Form1.Width) / ( 2 * maxx));
end;

function Ty(y, maxy: Single): Integer;
begin
  result := Round(((y - maxy) * Form1.Height) / (2 * maxy));
end;

function SensibilityX(maxx: Single) : Single;
var
  i1, i2 : Integer;
  x, inc : Single;
begin
  x := 0;
  i1:= Tx(x, maxx);
  inc:= StartIncrement;
  while (true) do
  begin
    i2 := Tx(x + inc, maxx);
    if (i2 = (i1 + 1)) then Break;
    inc := 2 * inc;
  end;
  write('X increment = ');
  writeLn(inc);
  result := inc;
end;

function SensibilityY(maxy: Single) : Single;
var
  j1, j2 : Integer;
  y, inc : Single;
begin
  y := 0;
  j1:= Ty(y, maxy);
  inc:= StartIncrement;
  while (true) do
  begin
    j2 := Ty(y + inc, maxy);
    if (j2 = (j1 + 1)) then Break;
    inc := 2 * inc;
  end;
  write('Y increment = ');
  writeLn(inc);
  result := inc;
end;

procedure TForm1.FormPaint(Sender: TObject);
var
  x, y, maxx, maxy, sensx, sensy: Single;
  i, j: Integer;
begin
  maxx := 3.0;
  maxy := 2.5;
  sensx := SensibilityX(maxx);
  sensy := SensibilityY(maxy);
  x:= 0;
  while (true) do
  begin
    i := Tx(x, maxx);
    y := 0;
    while (true) do
    begin
      j := Ty(y, maxy);
      Canvas.Pixels[i,j] := $0000FF;
      y := y + sensy;
      if (y > maxy) then Break;
    end;
    x := x + sensx;
    if (x > maxx) then Break;
  end;
end;

end.

