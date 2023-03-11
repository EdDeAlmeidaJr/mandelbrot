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

function Ti(i: Integer; maxx: Single): Integer;
begin
  result := Round(((2.0 * i * maxx) / Form1.Height) - maxx);
end;

function Tj(j: Integer; maxy: Single): Integer;
begin
  result := Round( (((-2.0) * j * maxy) / Form1.Height) - maxy );
end;

function dist(x, y : Single): Single;
begin
  result := Sqrt((x*x) + (y*y));
end;

function mandel(x, y : Single) : Integer;
var
  cont : Integer;
  nx, ny : Single;
begin
  nx := x;
  ny := y;
  cont := 0;
  while (true) do
  begin
    nx := (x*x) - (y*y) + 1;
    ny := 2 * x * y;
    cont := cont + 1;
    if (dist(nx, ny) > 2) then Break;
    if (cont > 100) then Break;
  end;
  result := cont
end;

procedure TForm1.FormPaint(Sender: TObject);
var
  x, y, maxx, maxy: Single;
  i, j: Integer;
begin
  maxx := 3.0;
  maxy := 1.6875;
  for i := 0 to Form1.Width do
  begin
    x := Ti(i, maxx);
    for j := 0 to Form1.Height do
    begin
      y := Tj(j, maxy);
      Canvas.Pixels[i,j] := $0000FF - mandel(x,y);
    end;
  end;
end;

end.

