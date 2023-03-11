unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs;

type

  { TForm1 }

  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.FormPaint(Sender: TObject);
var
  xmin, xmax, ymin, ymax: Single;
  i: Integer;
  j: Integer;
begin
  for i:=0 to 500 do
  begin
    for j:=0 to 500 do
    begin
      Canvas.Pixels[i,j] := $FFFF00 + i + j;
    end
  end;
end;

end.

