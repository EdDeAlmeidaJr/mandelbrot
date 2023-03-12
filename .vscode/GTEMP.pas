
Unit Unit1;

{$mode objfpc}{$H+}

Interface

Uses 
Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

Type 

  { TForm1 }

  TForm1 = Class(TForm)
    Procedure FormPaint(Sender: TObject);
    Private 

    Public 

  End;

Var 
  Form1: TForm1;

Implementation

{$R *.lfm}

{ TForm1 }

Function Ti(i: integer; maxx: Double): Double;
Begin
  Result := maxx * (((2 * i) - Form1.Width) / Form1.Width);
End;

Function Tj(j: integer; maxy: Double): Double;
Begin
  Result := maxy * ((Form1.Height - (2 * j)) / Form1.Height);
End;

Function dist(x, y: Double): Double;
Begin
  Result := Sqrt((x * x) + (y * y));
End;

Function mandel(x, y: Double): TColor;

Var 
  cont, k: integer;
  nx, ny, d1, d2: Double;
Begin
  d1 := dist(x, y);
  d2 := d1;
  cont := 0;
  While (True) Do
    Begin
      d1 := dist(x, y);
      nx := (x * (x + 1)) - (y * y);
      ny := ((2 * x) + 1) * y;
      d2 := dist(nx,ny);
      If (d2 > 2) Then Break;
      x := nx;
      y := ny;
      cont := cont + 1;
      If (Abs(d2 - d1) < 0.001) Then Break;
      d2 := d1;
    End;
  Result := RGBToColor(254 - cont, 254 - (5 * cont), 254 - (9 * cont));
End;

Procedure TForm1.FormPaint(Sender: TObject);

Var 
  x, y, maxx, maxy: Double;
  i, j: integer;
Begin
  maxx := 2.0;
  maxy := 1.1;
  For i := 0 To Form1.Width Do
    Begin
      x := Ti(i, maxx);
      For j := 0 To Form1.Height Do
        Begin
          y := Tj(j, maxy);
          Canvas.Pixels[i, j] := mandel(x, y);
        End;
    End;
End;

End.
