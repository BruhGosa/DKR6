uses GraphABC;

var
  x0, y0, masx, masy, n, x, y: integer;

//Гоша

function KU ( i: integer): integer; forward;
function KD ( i: integer): integer; forward;
function KR ( i: integer): integer; forward;
function KL ( i: integer): integer; forward;

function LineUP: integer;
begin
  line(x0, y0, x0, y0 - masy);
  y0 := y0 - masy;
end;

function LineDOWN: integer;
begin
  Line(x0, y0, x0, y0 + masy);
  y0 := y0 + masy;
end;

function LineRIGHT: integer;
begin
  Line(x0, y0, x0 + masx, y0);
  x0 := x0 + masx;
end;

function LineLEFT: integer;
begin
  Line(x0, y0, x0 - masx, y0);
  x0 := x0 - masx;
end;

function KU( i: integer): integer;
begin
  if i > 0 then
  begin
    KR(i - 1);
    LineUP;
    KU(i - 1);
    LineRIGHT;
    KU(i - 1);
    LineDOWN;
    KL(i - 1);
  end;
end;

function KD( i: integer): integer;
begin
  if i > 0 then
  begin
    KL(i - 1);
    LineDOWN;
    KD(i - 1);
    LineLEFT;
    KD(i - 1);
    LineUP;
    KR(i - 1);
  end;
end;

function KL( i: integer): integer;
begin
  if i > 0 then
  begin
    KD(i - 1);
    LineLEFT;
    KL(i - 1);
    LineDOWN;
    KL(i - 1);
    LineRIGHT;
    KU(i - 1);
  end;
end;

function KR( i: integer): integer;
begin
  if i > 0 then
  begin
    KU(i - 1);
    LineRIGHT;
    KR(i - 1);
    LineUP;
    KR(i - 1);
    LineLEFT;
    KD(i - 1);
  end;
end;

function per: integer;
begin
  MaximizeWindow;
  Writeln('Введите порядок кривой Гильберта');
  readln(n);
  Writeln('Введите масштаб(первая переменая это масштаб по x, вторая переменая масштаб по y)');
  readln(x,y);
  x0 := 20;
  y0 := windowheight-20;
  masx := x;
  masy := y;
  KU(n);
end;

begin
  per
end.