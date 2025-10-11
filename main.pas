unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls,
  StdCtrls, Spin, priem, Windows, Math;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    btnTeken: TButton;
    mniTurtled: TMenuItem;
    mniTurtlea: TMenuItem;
    mniTurtlek: TMenuItem;
    mniTurtle: TMenuItem;
    mniHoofdstuk8: TMenuItem;
    mniPaasei: TMenuItem;
    mniBlokei: TMenuItem;
    mniEi: TMenuItem;
    mniKlee: TMenuItem;
    mniArtblok: TMenuItem;
    mniMondrian: TMenuItem;
    mniHoofdstuk7: TMenuItem;
    mniVaren: TMenuItem;
    mniBoombt: TMenuItem;
    mniBoommc: TMenuItem;
    mniHoofdstuk6: TMenuItem;
    mniPotveld4: TMenuItem;
    mniPotveld3: TMenuItem;
    mniPotveld2: TMenuItem;
    mniPotveld1: TMenuItem;
    mniHoofdstuk5: TMenuItem;
    mniMoireS4: TMenuItem;
    mniMoireS2: TMenuItem;
    mniMoireS3: TMenuItem;
    mniMoireS1: TMenuItem;
    mniMoireC2: TMenuItem;
    mniMoireC1: TMenuItem;
    mniMoireL2: TMenuItem;
    mniMoireL1: TMenuItem;
    mniHek: TMenuItem;
    mniZweving: TMenuItem;
    mniHoofdstuk4: TMenuItem;
    mniPatroon4: TMenuItem;
    mniPatroon3: TMenuItem;
    mniPatroon2: TMenuItem;
    mniPatroon1: TMenuItem;
    mniLevel: TMenuItem;
    mniHoogte2: TMenuItem;
    mniHoogte1: TMenuItem;
    mniHoofdstuk3: TMenuItem;
    seParameter4: TFloatSpinEdit;
    GroupBox1: TGroupBox;
    lblParameter1: TLabel;
    lblParameter2: TLabel;
    mniLissaf: TMenuItem;
    mniLissa3: TMenuItem;
    mniLissa2: TMenuItem;
    Hoofdminu: TMainMenu;
    mniLissa1: TMenuItem;
    mniGauss: TMenuItem;
    mniPriem: TMenuItem;
    mniHoofdstuk2: TMenuItem;
    mniPythkleed: TMenuItem;
    mniHoofdstuk1: TMenuItem;
    mniHoofdstukken: TMenuItem;
    Panel1: TPanel;
    pbMain: TPaintBox;
    seParameter1: TSpinEdit;
    seParameter2: TFloatSpinEdit;
    seParameter3: TSpinEdit;
    procedure btnTekenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure mniArtblokClick(Sender: TObject);
    procedure mniBlokeiClick(Sender: TObject);
    procedure mniBoombtClick(Sender: TObject);
    procedure mniBoommcClick(Sender: TObject);
    procedure mniEiClick(Sender: TObject);
    procedure mniKleeClick(Sender: TObject);
    procedure mniMoireS2Click(Sender: TObject);
    procedure mniGaussClick(Sender: TObject);
    procedure mniHekClick(Sender: TObject);
    procedure mniHoogte1Click(Sender: TObject);
    procedure mniHoogte2Click(Sender: TObject);
    procedure mniLevelClick(Sender: TObject);
    procedure mniLissa1Click(Sender: TObject);
    procedure mniLissa2Click(Sender: TObject);
    procedure mniLissa3Click(Sender: TObject);
    procedure mniLissafClick(Sender: TObject);
    procedure mniMoireC1Click(Sender: TObject);
    procedure mniMoireC2Click(Sender: TObject);
    procedure mniMoireL1Click(Sender: TObject);
    procedure mniMoireL2Click(Sender: TObject);
    procedure mniMoireS1Click(Sender: TObject);
    procedure mniMoireS3Click(Sender: TObject);
    procedure mniMoireS4Click(Sender: TObject);
    procedure mniMondrianClick(Sender: TObject);
    procedure mniPaaseiClick(Sender: TObject);
    procedure mniPatroon1Click(Sender: TObject);
    procedure mniPatroon2Click(Sender: TObject);
    procedure mniPatroon3Click(Sender: TObject);
    procedure mniPatroon4Click(Sender: TObject);
    procedure mniPotveld1Click(Sender: TObject);
    procedure mniPotveld2Click(Sender: TObject);
    procedure mniPotveld3Click(Sender: TObject);
    procedure mniPotveld4Click(Sender: TObject);
    procedure mniPriemClick(Sender: TObject);
    procedure mniPythkleedClick(Sender: TObject);
    procedure mniTurtleaClick(Sender: TObject);
    procedure mniTurtleClick(Sender: TObject);
    procedure mniTurtledClick(Sender: TObject);
    procedure mniTurtlekClick(Sender: TObject);
    procedure mniVarenClick(Sender: TObject);
    procedure mniZwevingClick(Sender: TObject);
    procedure seParameter1Change(Sender: TObject);
    procedure seParameter2Change(Sender: TObject);
    procedure seParameter3Change(Sender: TObject);
    procedure seParameter4Change(Sender: TObject);
  private
    procedure pbClear;
    procedure Cirkel(x,y: Integer; r:Double);
  public

  end;

var
  frmMain: TfrmMain;
  prog, xOff, yOff: Integer;
  xFac, yFac: Double;
  flag: Boolean;
  turtlekey: Char;
  EgaColor : array[0..15] of TColor =
    (TColor($000000),TColor($AA0000),TColor($00AA00),TColor($AAAA00),
     TColor($0000AA),TColor($AA00AA),TColor($0055AA),TColor($AAAAAA),
     TColor($555555),TColor($FF5555),TColor($55FF55),TColor($FFFF55),
     TColor($5555FF),TColor($FF55FF),TColor($55FFFF),TColor($FFFFFF));

  // EGA palette colors      NB TColor($BB GG RR) !!!
  EGApal : array[0..63] of TColor = (
  TColor($000000),TColor($AA0000),TColor($00AA00),TColor($AAAA00),
  TColor($0000AA),TColor($AA00AA),TColor($00AAAA),TColor($AAAAAA),
  TColor($550000),TColor($FF0000),TColor($55AA00),TColor($FFAA00),
  TColor($5500AA),TColor($FF00AA),TColor($55AAAA),TColor($FFAAAA),
  TColor($005500),TColor($AA5500),TColor($00FF00),TColor($AAFF00),
  TColor($0055AA),TColor($AA55AA),TColor($00FFAA),TColor($AAFFAA),
  TColor($555500),TColor($FF5500),TColor($55FF00),TColor($FFFF00),
  TColor($5555AA),TColor($FF55AA),TColor($55FFAA),TColor($FFFFAA),
  TColor($000055),TColor($AA0055),TColor($00AA55),TColor($AAAA55),
  TColor($0000FF),TColor($AA00FF),TColor($00AAFF),TColor($AAAAFF),
  TColor($550055),TColor($FF0055),TColor($55AA55),TColor($FFAA55),
  TColor($5500FF),TColor($FF00FF),TColor($55AAFF),TColor($FFAAFF),
  TColor($005555),TColor($AA5555),TColor($00FF55),TColor($AAFF55),
  TColor($0055FF),TColor($AA55FF),TColor($00FFFF),TColor($AAFFFF),
  TColor($555555),TColor($FF5555),TColor($55FF55),TColor($FFFF55),
  TColor($5555FF),TColor($FF55FF),TColor($55FFFF),TColor($FFFFFF)
  );


implementation

{$R *.lfm}

{ TfrmMain }

procedure TfrmMain.mniPythkleedClick(Sender: TObject);
var
  m, max, n, x, xm, y, ym: Integer;

  function GCDiter(a,b : integer) : integer;
  var c : integer;
  begin
    while b<>0 do
      begin
        c:=a;
        a:=b;
        b:=c mod b;
      end;
    GCDiter:=abs(a);
  end;

  function even(i : integer) : boolean;
  begin
    even := not odd(i);
    //even:=i mod 2 = 0;
  end;

begin
  Sender := Sender;
  prog := 1;
  pbClear;
  frmMain.Caption := 'Computer simulaties: pythagoraskleed';
  xm := pbMain.Width div 2;
  ym := pbMain.Height div 2;
  max := 300;
  with pbMain.Canvas do
  begin
    Rectangle(xm-max,ym+max,xm+max,ym-max);
    for m := 0 to max do
    begin
      n := 0;
      while n <= m do
      begin
        x := m*m-n*n;
        y := 2*m*n;
        if (x < max) and (y < max) and (GCDiter(M,N)=1) and ((odd(M) and even(N)) or (odd(N) and even(M))) then
        begin
          {Pixels[xm+x,ym-y] := clYellow;
          Pixels[xm+x,ym+y] := clYellow;
          Pixels[xm-x,ym-y] := clYellow;
          Pixels[xm-x,ym+y] := clYellow;
          Pixels[xm+y,ym-x] := clYellow;
          Pixels[xm+y,ym+x] := clYellow;
          Pixels[xm-y,ym-x] := clYellow;
          Pixels[xm-y,ym+x] := clYellow;}
          EllipseC(xm+x,ym-y,2,2);
          EllipseC(xm+x,ym+y,2,2);
          EllipseC(xm-x,ym-y,2,2);
          EllipseC(xm-x,ym+y,2,2);
          EllipseC(xm+y,ym-x,2,2);
          EllipseC(xm+y,ym+x,2,2);
          EllipseC(xm-y,ym-x,2,2);
          EllipseC(xm-y,ym+x,2,2);
        end;
        Inc(n);
      end;
    end;
  end;
end;

procedure TfrmMain.mniTurtleaClick(Sender: TObject);
var
  nmax, n, i: Integer;
  x, y, phi, h: Double;
  axiom, prod1, prod2, weg, w, q, s: string;

begin
  Sender := Sender;
  prog := 40;
  pbClear;
  frmMain.Caption := 'Computer simulaties: ' + mniTurtlea.Caption;
  xFac := pbMain.Width / 7;
  yFac := -pbMain.Height / 7;
  xOff := pbMain.Width div 2;
  yOff := pbMain.Height div 2;
  //xOff := 100;
  //yOff := 0;
  nmax := 2;

  // beginpositie en staplengte
  x := -1;
  y := 1;
  phi := 0;
  h := 0.06;

  // axioma en productieregel
  axiom := 'F-F-F-F';
  prod1 := 'F-f+FF-F-FF-Ff-FF+f-FF+F+FF+Ff+FFF';
  prod2 := 'ffffff';

  // vorming van woord
  weg := axiom;
  for n := 1 to nmax do
  begin
    w := '';
    for i := 1 to weg.Length do
    begin
      s := Copy(weg, i, 1);
      if s = 'F' then q := prod1;
      if s = 'f' then q := prod2;
      if (s = '+') or (s = '-') then q := s;
      w := w + q;
    end;
    weg := w;
  end;

  // graphics
  with pbMain.Canvas do
  begin
    MoveTo(Round(xOff+xFac*x), Round(yOff+yFac*y));
    for i := 1 to weg.Length do
    begin
      s := Copy(weg,i,1);
      case s of
        '+':
          phi := phi + pi / 2;
        '-':
          phi := phi - pi / 2;
        'F':
        begin
          x := x + h * Cos(phi);
          y := y + h * Sin(phi);
          LineTo(Round(xOff+xFac*x), Round(yOff+yFac*y));
        end;
        'f':
        begin
          x := x + h * Cos(phi);
          y := y + h * Sin(phi);
          MoveTo(Round(xOff+xFac*x), Round(yOff+yFac*y));
        end;
      end;
    end;
  end;
end;

procedure TfrmMain.mniTurtleClick(Sender: TObject);
var
  h, p, p1, q, q1, x, xm, y, ym: Integer;
begin
  Sender := Sender;
  prog := 38;
  pbClear;
  //btnTeken.Visible := True;
  frmMain.Caption := 'Computer simulaties: ' + mniTurtle.Caption;
  xm := pbMain.Width div 2;
  ym := pbMain.Height div 2;
  h := 10;
  x := xm;
  y := ym;
  p := 1;
  q := 0;
  pbMain.Canvas.MoveTo(x,y);
  Repeat
    Application.ProcessMessages;
    case turtlekey of
    'F', 'f':
      begin
        x := x + h * p;
        y := y + h * q;
        pbMain.Canvas.LineTo(x,y);
        turtlekey := #0;
      end;
    '+':
      begin
        p1 := q;
        q1 := -p;
        p := p1;
        q := q1;
        turtlekey := #0;
      end;
    '-':
      begin
        p1 := -q;
        q1 := p;
        p := p1;
        q := q1;
        turtlekey := #0;
      end;
    end;
  until (turtlekey = 'X') or (turtlekey = 'x');
end;

procedure TfrmMain.mniTurtledClick(Sender: TObject);
var
  nmax, n, i, p, p1, qq, q1: Integer;
  x, y, h: Double;
  axiom, prod1, prod2, weg, w, q, s: string;
begin
  Sender := Sender;
  prog := 41;
  pbClear;
  frmMain.Caption := 'Computer simulaties: ' + mniTurtled.Caption;
  xFac := pbMain.Width / 7;
  yFac := -pbMain.Height / 7;
  xOff := pbMain.Width div 2;
  yOff := pbMain.Height div 2;
  //xOff := 100;
  //yOff := 0;
  nmax := 12;

  // beginpositie en staplengte
  x := 1.5;
  y := 0.5;
  h := 0.06;

  // axioma en productieregels
  axiom := 'F';
  prod1 := 'F-G';
  prod2 := 'F+G';

  // vorming van woord
  weg := axiom;
  for n := 1 to nmax do
  begin
    w := '';
    for i := 1 to weg.Length do
    begin
      s := Copy(weg,i,1);
      if s = 'F' then q := prod1;
      if s = 'G' then q := prod2;
      if (s = '+') or (s = '-') then q := s;
      w := w + q;
    end;
    weg := w;
  end;

  // graphics
  p := 1;
  qq := 0;
  with pbMain.Canvas do
  begin
    Moveto(Round(xOff+xFac*x),Round(yOff+yFac*y));
    for i := 1 to weg.Length do
    begin
      s := Copy(weg,i,1);
      case s of
        '+':
          begin
            p1 := -qq;
            q1 := p;
            p := p1;
            qq := q1;
          end;
        '-':
          begin
            p1 := qq;
            q1 := -p;
            p := p1;
            qq := q1;
          end;
        'F', 'G':
          begin
            x := x + h * p;
            y := y + h * qq;
            LineTo(Round(xOff+xFac*x),Round(yOff+yFac*y));
          end;
      end;
    end;
  end;
end;

procedure TfrmMain.mniTurtlekClick(Sender: TObject);
var
  nmax, i, n: Integer;
  x, y, h, a, b, p, qq, p1, q1: Double;
  axiom, prod, weg, w, s, q: string;
begin
  Sender := Sender;
  prog := 39;
  pbClear;
  frmMain.Caption := 'Computer simulaties: ' + mniTurtlek.Caption;
  xFac := pbMain.Width / 7;
  yFac := -pbMain.Height / 7;
  xOff := pbMain.Width div 2;
  yOff := pbMain.Height div 2;
  //xOff := 100;
  //yOff := 0;
  nmax := 4;
  // beginpositie en staplengte
  x := -3;
  y := -0.5;
  h := 0.075;
  // axioma en productieregel
  axiom := 'F';
  prod := 'F+F--F+F';
  // vorming van woord
  weg := axiom;
  for n := 1 to nmax do
  begin
    w := '';
    for i := 1 to weg.Length do
    begin
      s := Copy(weg,i,1);
      if s = 'F' then q := prod else q := s;
      w := w + q;
    end;
    weg := w;
  end;
  // graphics
  a := Cos(pi/3);
  b := Sin(pi/3);
  p := 1;
  qq := 0;
  pbMain.Canvas.MoveTo(Round(xOff+xFac*x),Round(yOff+yFac*y));
  for i := 1 to weg.Length do
  begin
    s := Copy(weg,i,1);
    case s of
    '+':
      begin
        p1 := a * p - b * qq;
        q1 := b * p + a * qq;
        p := p1;
        qq := q1;
      end;
    '-':
      begin
        p1 := a * p + b * qq;
        q1 := -b * p + a * qq;
        p := p1;
        qq := q1;
      end;
    'F':
      begin
        x := x + h * p;
        y := y + h * qq;
        pbMain.Canvas.LineTo(Round(xOff+xFac*x),Round(yOff+yFac*y));
      end;
    end;
  end;
end;

procedure TfrmMain.mniVarenClick(Sender: TObject);
var
  a2, a3, a4, b2, b3, b4, c2, c3, c4, d1, d2, d3, d4, f2, f3, f4, q1, q2, q3, r, x, y, z: Double;
  n, nmax: Integer;
begin
  Sender := Sender;
  prog := 31;
  pbClear;
  frmMain.Caption := 'Computer simulaties: ' + mniVaren.Caption;
  xFac := -pbMain.Width / 11;
  yFac := pbMain.Height / 11;
  xOff := pbMain.Width div 2;
  //xOff := 100;
  yOff := 0;
  nmax := 40000;
  d1 := 0.16;
  a2 := 0.85; b2 := 0.04; c2 := -0.04; d2 := 0.85; f2 := 1.6;
  a3 := 0.2; b3 := -0.26; c3 := 0.23; d3 := 0.22; f3 := 1.6;
  a4 := -0.15; b4 := 0.28; c4 := 0.26; d4 := 0.24; f4 := 0.44;
  // waarschijnlijkheidsverdeling
  q1 := 0.01; q2 := 0.86; q3 := 0.93;
  x := 0;
  y := 0;
  n := 0; //start
  while n < nmax do
  begin
    r := Random;
    if r < q1 then
    begin
      x := 0;
      y := d1 * y
    end
    else
    if r <= q2 then
    begin
      z := x;
      x := a2 * x + b2 * y;
      y := c2 * z + d2 * y + f2;
    end
    else
    if r <= q3 then
    begin
      z := x;
      x := a3 * x + b3 * y;
      y := c3 * z + d3 * y + f3;
    end
    else
    begin
      z := x;
      x := a4 * x + b4 * y;
      y := c4 * z + d4 * y + f4;
    end;
    pbMain.Canvas.Pixels[Round(yOff+yFac*y),Round(xOff+xFac*x)] := clLime;
    n := n + 1;
  end;
end;

procedure TfrmMain.mniZwevingClick(Sender: TObject);
var
  s1, s2: Integer;
  t, y1, y2: Double;
begin
  Sender := Sender;
  prog := 15;
  pbClear;
  frmMain.Caption := 'Computer simulaties: Zwevingen van golven';
  xOff := 0;
  yOff := pbMain.Height div 2;
  xFac := pbMain.Width;
  yFac := -pbMain.Height/6;
  t := 0;
  s1 := 30;
  s2 := 33;
  with pbMain.Canvas do
  begin
    Line(xOff,yOff,pbMain.Width,yOff);
    while t < 1 do
    begin
      y1 := Sin(2 * s1 * pi * t);
      y2 := Sin(2 * s2 * pi * t);
      Pixels[Round(xOff+xFac*t), Round(yOff+yFac*(y1 + y2))] := clYellow;
      t := t + 0.0001;
    end;
  end;
end;

procedure TfrmMain.seParameter1Change(Sender: TObject);
begin
  Sender := Sender;
  case prog of
  4:
    begin
      mniLissa1Click(Sender);
    end;
  5:
    begin
      mniLissa2Click(Sender);
    end;
  6:
    begin
      mniLissa3Click(Sender);
    end;
  11:
    begin
      mniPatroon1Click(Sender);
    end;
  end;
end;

procedure TfrmMain.seParameter2Change(Sender: TObject);
begin
  Sender := Sender;
  case prog of
  4: mniLissa1Click(Sender);
  5: mniLissa2Click(Sender);
  6: mniLissa3Click(Sender);
  7: mniLissafClick(Sender);
  end;
end;

procedure TfrmMain.seParameter3Change(Sender: TObject);
begin
  Sender := Sender;
  case prog of
  5: mniLissa2Click(Sender);
  end;
end;

procedure TfrmMain.seParameter4Change(Sender: TObject);
begin
  Sender := Sender;
  case prog of
  7: mniLissafClick(Sender);
  end;
end;

procedure TfrmMain.mniPriemClick(Sender: TObject);
begin
  Sender := Sender;
  prog := 2;
  pbClear;
  frmPriem.ShowModal;
end;

procedure TfrmMain.mniGaussClick(Sender: TObject);
var
  n, n1, n2: Integer;
  a, b, f, f1, f2, s: Double;
  WrongNumber: Boolean;
begin
  Sender := Sender;
  prog := 3;
  pbClear;
  frmMain.Caption := 'Computer simulaties: Priemgetallenkleedje van Gauss';
  xOff := pbMain.Width div 2;
  yOff := pbMain.Height div 2;
  xFac := pbMain.Width/80;
  yFac := pbMain.Height/80;
  n := 40;
  with pbMain.Canvas do
  begin
    Rectangle(Round(xOff+xFac*(-n-2)),Round(yOff+yFac*(-n-2)),Round(xOff+xFac*(n+2)),Round(yOff+yFac*(n+2)));
    for n2 := 0 to n do
    begin
      for n1 := n2 to n do
      begin
        s := Sqrt(n1*n1+n2*n2);
        WrongNumber := s <= 1;
        f2 := 0;
        repeat
          f1 := 0;
          repeat
            f := f1*f1+f2*f2;
            if (f <> 0) and (f <> 1) then
            begin
              a := (n1*f1+n2*f2)/f;
              b := Abs(n1*f2-n2*f1)/f;
              //if (a - Trunc(a) = 0) and (b - Trunc(b) = 0) then Goto nextpoint;
              WrongNumber := (a - Trunc(a) = 0) and (b - Trunc(b) = 0);
            end;
            f1 := f1 + 1;
          until (f1 * f1 + f2 * f2 > s) or WrongNumber;
          f2 := f2 + 1;
        until (f2 * f2 > s) or WrongNumber;
        if not WrongNumber then
        begin
          EllipseC(Round(xOff+xFac*n1),Round(yOff+yFac*n2),3,3);
          EllipseC(Round(xOff+xFac*n2),Round(yOff+yFac*n1),3,3);
          EllipseC(Round(xOff+xFac*-n1),Round(yOff+yFac*n2),3,3);
          EllipseC(Round(xOff+xFac*-n2),Round(yOff+yFac*n1),3,3);
          EllipseC(Round(xOff+xFac*-n1),Round(yOff+yFac*-n2),3,3);
          EllipseC(Round(xOff+xFac*-n2),Round(yOff+yFac*-n1),3,3);
          EllipseC(Round(xOff+xFac*n1),Round(yOff+yFac*-n2),3,3);
          EllipseC(Round(xOff+xFac*n2),Round(yOff+yFac*-n1),3,3);
        end;
      end;
    end;
  end;
end;

procedure TfrmMain.mniHekClick(Sender: TObject);
var
  a1, a2, b, h1, h2, i, k, hdiv2: Integer;
begin
  Sender := Sender;
  prog := 16;
  pbClear;
  frmMain.Caption := 'Computer simulaties: Zwevingen bij hekken';
  a1 := 19;
  a2 := 22;
  h1 := 5;
  h2 := 5;
  k := 0;
  b := 150;
  hdiv2 := pbMain.Height Div 2 - 75;
  while k*a1+h1 < pbMain.Width - 20 do
  begin
    pbMain.Canvas.Pen.Color := clYellow;
    for i := 0 to h1 do
    begin
      pbMain.Canvas.Line(20+i+k*a1,hdiv2-10,20+i+k*a1,hdiv2+b);
    end;
    Inc(k);
  end;
  k := 0;
  while k*a2+h2 < pbMain.Width - 20 do
  begin
    pbMain.Canvas.Pen.Color := clRed;
    for i := 0 to h2 do
    begin
      pbMain.Canvas.Line(20+i+k*a2,hdiv2,20+i+k*a2,hdiv2+10+b);
    end;
    Inc(k);
  end;
end;

procedure TfrmMain.mniHoogte1Click(Sender: TObject);
var
  i, j, m, n, xm, ym: Integer;
  x, y, z: Double;
begin
  Sender := Sender;
  prog := 8;
  pbClear;
  frmMain.Caption := 'Computer simulaties: Hoogte 1';
  xm := pbMain.Width div 2;
  ym := pbMain.Height div 2;
  n := xm;
  m := 12; // aantal niveau's
  with pbmain.Canvas do
  begin
    //Rectangle(160, 80, 480, 400);
    for i := -n to n do
    begin
      for j := -n to n do
      begin
        x := i / n;
        y := j / n;
        z := x * x - y * y; // oppervlak
        if Floor(m * z) mod 2 = 0 then
          Pixels[xm + i, ym - j] := clYellow;
      end;
    end;
  end;
end;

procedure TfrmMain.mniHoogte2Click(Sender: TObject);
var
  i, j, l, m, n, xm, ym: Integer;
  x, y, z: Double;
begin
  Sender := Sender;
  prog := 9;
  pbClear;
  frmMain.Caption := 'Computer simulaties: Hoogte 2';
  xm := pbMain.Width div 2;
  ym := pbMain.Height div 2;
  n := xm;
  m := 12; // aantal niveau's
  with pbmain.Canvas do
  begin
    //Rectangle(160, 80, 480, 400);
    for i := -n to n do
    begin
      for j := -n to n do
      begin
        x := i / n;
        y := j / n;
        z := x * x - y * y; // oppervlak
        l := 1 + Floor(m * (1 + z)) mod 10;
//        if Round(m * z) mod 2 = 0 then
        Pixels[xm + i, ym - j] := EgaColor[l];
      end;
    end;
  end;
end;

procedure TfrmMain.mniLevelClick(Sender: TObject);
var
  d1, d2, d3, d4, p, q, u1, u2, v1, v2, x, xa, xb, xc, xs1, xs2, y, ya, yb, yc, ys1, ys2, za, zb, zc: Double;
  z: Array [0..8] of Double;
  i, i1, i2, i3, imax, j, jmax, k, kmax, sa, sb, sc, t: Integer;
  table : Array [0..2,0..2,0..2] of Integer;
  data: Array of Integer = (1,7,4,6,11,9,3,10,2,5,12,8,13,14,
                            13,8,12,5,2,10,3,9,11,6,4,7,1);

  function fna(x, y: Double): Double;
  begin
    Result := SIN(X * X + Y * Y - 2 * X + 1) * SIN(X * X + Y * Y + 2 * X + 1);
  end;

  procedure Multiswitch;
  begin
    za := fna(xa,ya)-z[k];
    zb := fna(xb,yb)-z[k];
    sa := 1+Sign(za);
    sb := 1+Sign(zb);
    t := Table[sa,sb,sc];
    Case t of
    1: ;
    2:
      begin
        u1 := xa-za*(xb-xa)/(zb-za);
        v1 := ya-za*(yb-ya)/(zb-za);
        u2 := xa-za*(xc-xa)/(zc-za);
        v2 := ya-za*(yc-ya)/(zc-za);
        pbMain.Canvas.Line(Round(xOff+xFac*u1),Round(yOff+yFac*v1),Round(xOff+xFac*u2),Round(yOff+yFac*v2));
      end;
    3:
      begin
        u1 := xb-zb*(xc-xb)/(zc-zb);
        v1 := yb-zb*(yc-yb)/(zc-zb);
        u2 := xb-zb*(xa-xb)/(za-zb);
        v2 := yb-zb*(ya-yb)/(za-zb);
        pbMain.Canvas.Line(Round(xOff+xFac*u1),Round(yOff+yFac*v1),Round(xOff+xFac*u2),Round(yOff+yFac*v2));
      end;
    4:
      begin
        u1 := xc-zc*(xa-xc)/(za-zc);
        v1 := yc-zc*(ya-yc)/(za-zc);
        u2 := xc-zc*(xb-xc)/(zb-zc);
        v2 := yc-zc*(yb-yc)/(zb-zc);
        pbMain.Canvas.Line(Round(xOff+xFac*u1),Round(yOff+yFac*v1),Round(xOff+xFac*u2),Round(yOff+yFac*v2));
      end;
    5:
      pbMain.Canvas.Pixels[Round(xOff+xFac*xa),Round(yOff+yFac*ya)] := clYellow;
    6:
      pbMain.Canvas.Pixels[Round(xOff+xFac*xb),Round(yOff+yFac*yb)] := clYellow;
    7:
      pbMain.Canvas.Pixels[Round(xOff+xFac*xc),Round(yOff+yFac*yc)] := clYellow;
    8:
      begin
        u1 := xa;
        v1 := ya;
        u2 := xc-zc*(xb-xc)/(zb-zc);
        v2 := yc-zc*(yb-yc)/(zb-zc);
        pbMain.Canvas.Line(Round(xOff+xFac*u1),Round(yOff+yFac*v1),Round(xOff+xFac*u2),Round(yOff+yFac*v2));
      end;
    9:
      begin
        u1 := xb;
        v1 := yb;
        u2 := xa-za*(xc-xa)/(zc-za);
        v2 := ya-za*(yc-ya)/(zc-za);
        pbMain.Canvas.Line(Round(xOff+xFac*u1),Round(yOff+yFac*v1),Round(xOff+xFac*u2),Round(yOff+yFac*v2));
      end;
    10:
      begin
        u1 := xc;
        v1 := yc;
        u2 := xb-zb*(xa-xb)/(za-zb);
        v2 := yb-zb*(ya-yb)/(za-zb);
        pbMain.Canvas.Line(Round(xOff+xFac*u1),Round(yOff+yFac*v1),Round(xOff+xFac*u2),Round(yOff+yFac*v2));
      end;
    11:
      pbMain.Canvas.Line(Round(xOff+xFac*xb),Round(yOff+yFac*yb),Round(xOff+xFac*xc),Round(yOff+yFac*yc));
    12:
      pbMain.Canvas.Line(Round(xOff+xFac*xc),Round(yOff+yFac*yc),Round(xOff+xFac*xa),Round(yOff+yFac*ya));
    13:
      pbMain.Canvas.Line(Round(xOff+xFac*xa),Round(yOff+yFac*ya),Round(xOff+xFac*xb),Round(yOff+yFac*yb));
    14:
      begin
        pbMain.Canvas.Line(Round(xOff+xFac*xb),Round(yOff+yFac*yb),Round(xOff+xFac*xc),Round(yOff+yFac*yc));
        pbMain.Canvas.Line(Round(xOff+xFac*xc),Round(yOff+yFac*yc),Round(xOff+xFac*xa),Round(yOff+yFac*ya));
        pbMain.Canvas.Line(Round(xOff+xFac*xa),Round(yOff+yFac*ya),Round(xOff+xFac*xb),Round(yOff+yFac*yb));
      end;
    end;
  end;

begin
  Sender := Sender;
  prog := 10;
  pbClear;
  frmMain.Caption := 'Computer simulaties: Level lines of z=(x,y) for -1<z<1';
  xOff := pbMain.Width div 2;
  yOff := pbMain.Height div 2;
  xFac := pbMain.Width / 9.6;
  yFac := pbMain.Height / 7.2;
  xs1 := -pi;
  xs2 := pi;
  ys1 := -pi;
  ys2 := pi;
  with pbMain.Canvas do
  begin
    Rectangle(Round(xOff+xFac*xs1),Round(yOff+yFac*ys1),Round(xOff+xFac*xs2),Round(yOff+yFac*ys2));
    imax := 128;
    jmax := 128;
    p := (xs2-xs1)/imax;
    q := (ys2-ys1)/imax;
    kmax := 8;
    for k := 0 to kmax do
    begin
      z[k] := -1+2*k/kmax;
    end;
    i := 0;
    for i1 := 0 to 2 do
    begin
      for i2 := 0 to 2 do
      begin
        for i3 := 0 to 2 do
        begin
          table[i1,i2,i3] := data[i];
          Inc(i);
        end;
      end;
    end;
    for i := 0 to imax - 1 do
    begin
      for j := 0 to jmax - 1 do
      begin
        x := xs1 + p * i;
        y := ys1 + q * j;
        d1 := fna(x,y);
        d2 := fna(x+p,y);
        d3 := fna(x,y+q);
        d4 := fna(x+p,y+q);
        for k := 0 to kmax do
        begin
          if (z[k] < d1) and (z[k] < d2) and (z[k] < d3) and (z[k] < d4) then Continue;
          if (z[k] > d1) and (z[k] > d2) and (z[k] > d3) and (z[k] > d4) then Continue;
          xc := x+p/2;
          yc := y+q/2;
          zc := (d1+d2+d3+d4)/4-z[k];
          sc := 1+Sign(zc);
          xa := x;
          ya := y;
          xb := x+p;
          yb := y;
          Multiswitch;
          xa := x+p;
          ya := y;
          xb := x+p;
          yb := y+q;
          Multiswitch;
          xa := x+p;
          ya := y+q;
          xb := x;
          yb := y+q;
          Multiswitch;
          xa := x+p;
          ya := y+q;
          xb := x;
          yb := y;
          Multiswitch;
        end;
      end;
    end;
  end;
end;

procedure TfrmMain.mniLissa1Click(Sender: TObject);
var
  a, s: Integer;
  f, h, t, x, y: Double;
begin
  Sender := Sender;
  prog := 4;
  pbClear;
  frmMain.Caption := 'Computer simulaties: Lissajous krommen';
  xOff := pbMain.Width div 2;
  yOff := pbMain.Height div 2;
  xFac := pbMain.Width / 2;
  yFac := pbMain.Height / 2;
  Panel1.Visible := True;
  GroupBox1.Visible := True;
  lblParameter1.Visible := True;
  lblParameter1.Caption := 'Frequentieverhouding';
  seParameter1.Visible := True;
  seParameter1.Increment := 1;
  seParameter1.MinValue := 1;
  seParameter1.MaxValue := 10;
  lblParameter2.Visible := True;
  lblParameter2.Caption := 'Faseverschuiving tussen 0 en 1';
  seParameter2.Visible := True;
  seParameter2.Increment := 0.01;
  seParameter2.MinValue := 0.01;
  seParameter2.MaxValue := 1.00;
  flag := False;
  s := seParameter1.Value;
  f := seParameter2.Value;
  a := 1; // amplitude
  f := 2 * pi * f;
  t := 0;
  h := 0.01; // initialisatie
  //for i := 1 to 20000 do
  while t < 2*Pi do
  begin
    //Application.ProcessMessages;
    x := a * Cos(s * t);
    y := Cos(t * f);
    if t = 0 then
      pbMain.Canvas.MoveTo(Round(xOff+xFac*x),Round(yOff+yFac*y))
    else
      pbMain.Canvas.LineTo(Round(xOff+xFac*x),Round(yOff+yFac*y));
    //pbMain.Canvas.Pixels[Round(xOff+xFac*x),Round(yOff+yFac*y)] := clYellow;
    t := t + h;
  end;
end;

procedure TfrmMain.mniLissa2Click(Sender: TObject);
var
  Ampl1, Ampl2, Fase, Freq, h, t, x, y: Double;
  k, m, n: Integer;
begin
  Sender := Sender;
  prog := 5;
  pbClear;
  frmMain.Caption := 'Computer simulaties: Figuur van Lissajous';
  xOff := pbMain.Width div 2;
  yOff := pbMain.Height div 2;
  xFac := pbMain.Width / 4;
  yFac := pbMain.Height / 4;
  Panel1.Visible := True;
  GroupBox1.Visible := True;
  lblParameter1.Caption := 'Frequentieverhouding';
  seParameter1.Visible := True;
  seParameter1.Increment := 1;
  seParameter1.MinValue := 1;
  seParameter1.MaxValue := 100;
  lblParameter2.Visible := True;
  lblParameter2.Caption := 'Faseverschuiving tussen 0 en 1';
  seParameter2.Visible := True;
  seParameter2.Increment := 0.01;
  seParameter2.MinValue := 0;
  seParameter2.MaxValue := 1.00;
  seParameter3.Visible := True;
  seParameter3.Increment := 1;
  seParameter3.MinValue := 1;
  seParameter3.MaxValue := 100;
  h := Pi / 100;
  Ampl1 := 1.6;
  Ampl2 := 1.2;
  m := seParameter1.Value;
  n := seParameter3.Value;
  //m := 8;
  //n := 13;
  Fase := seParameter2.Value;
  Freq := m / n;
  Fase := Fase * 2 * Pi;
  With pbMain.Canvas do
  begin
    Rectangle(Round(xOff+xFac*-1.1*Ampl1),Round(yOff+yFac*-1.1*Ampl2),
      Round(xOff+xFac*1.1*Ampl1),Round(yOff+yFac*1.1*Ampl2));
    MoveTo(Round(xOff+xFac*0),Round(yOff+yFac*Ampl2*Cos(Fase)));
    for k := 0 to 200*n do
    begin
      t := k * h;
      x := Ampl1 * Sin(Freq*t);
      y := Ampl2 * Cos(t+Fase);
      LineTo(Round(xOff+xFac*x),Round(yOff+yFac*y));
    end;
  end;
end;

procedure TfrmMain.mniLissa3Click(Sender: TObject);
var
  a: Integer;
  b, h, s, t, x, y: Double;
begin
  Sender := Sender;
  prog := 6;
  pbClear;
  frmMain.Caption := 'Computer simulaties: Lissajousachtige krommen';
  Panel1.Visible := True;
  GroupBox1.Visible := True;
  lblParameter1.Visible := True;
  lblParameter1.Caption := 'a';
  seParameter1.Visible := True;
  seParameter1.Increment := 1;
  seParameter1.MinValue := 1;
  seParameter1.MaxValue := 10;
  lblParameter2.Visible := True;
  lblParameter2.Caption := 'b';
  seParameter2.Visible := True;
  seParameter2.Increment := 0.1;
  seParameter2.MinValue := 0;
  seParameter2.MaxValue := 10.00;
  xOff := pbMain.Width div 2;
  yOff := pbMain.Height div 2;
  xFac := pbMain.Width / 4;
  yFac := pbMain.Height / 4;
  a := seParameter1.Value;
  b := seParameter2.Value;
  s := 2.45; //parameters
  t := 0;
  h := 0.01; //initialisatie
  with pbMain.Canvas do
  begin
    Rectangle(Round(xOff+xFac*(-a-b-0.1)),Round(yOff+yFac*-1.1),
       Round(xOff+xFac*(a+b+0.1)),Round(yOff+yFac*1.1));
    while t < 50*Pi do
    begin
      x := a*Cos(t)+b*Cos(s*t);
      y := Sin(t);
      if t = 0 then
        MoveTo(Round(xOff+xFac*x),Round(yOff+yFac*y))
      else
        LineTo(Round(xOff+xFac*x),Round(yOff+yFac*y));
      t := t + h;
    end;
  end;
end;

procedure TfrmMain.mniLissafClick(Sender: TObject);
var
  s1, s2: Integer;
  a1, a2, h, phi, r, t, x, y: Double;
begin
  Sender := Sender;
  prog := 7;
  pbClear;
  frmMain.Caption :=  'Computer simulaties: Lissajousachtige kromme in de vorm van een bloem';
  Panel1.Visible := True;
  GroupBox1.Visible := True;

  lblParameter2.Visible := True;
  lblParameter2.Caption := 'a1 en a2';
  seParameter2.Visible := True;
  seParameter2.Increment := 0.1;
  seParameter2.MinValue := 0.1;
  seParameter2.MaxValue := 10;
  seParameter4.Visible := True;
  seParameter4.Increment := 0.1;
  seParameter4.MinValue := 0.1;
  seParameter4.MaxValue := 5;
  xOff := pbMain.Width div 2;
  yOff := pbMain.Height div 2;
  xFac := pbMain.Width / 5.5;
  yFac := pbMain.Height / 5.5;
  t := 0;
  h := 0.01;
  a1 := seParameter2.Value;
  a2 := seParameter4.Value; //te varieren parameters
  s1 := 6;
  s2 := 36; //parameters
  with pbMain.Canvas do
  begin
    while t < 2 * pi do
    begin
      r := 1 + a1 * Cos(s1 * t) + a2 * Cos(s2 * t);
      phi := t;
      x := r * Cos(phi);
      y := r * Sin(phi);
      if t = 0 then
        MoveTo(Round(xOff+xFac*x),Round(yOff+yFac*y))
      else
        LineTo(Round(xOff+xFac*x),Round(yOff+yFac*y));
      t := t + h;
    end;
  end;
end;

procedure TfrmMain.mniMoireC1Click(Sender: TObject);
var
  i, m, r, x, xm, y, ym: Integer;
  h, s: Double;
begin
  Sender := Sender;
  prog := 19;
  pbClear;
  frmMain.Caption := 'Computer simulaties: Interferentie evenwijdige lijnen';
  ym := pbMain.Height div 2;
  h  := 0.3;
  for m := 1 to 2 do
  begin
    if m = 1 then
      xm := pbMain.Width div 2 - 40
    else
      xm := pbMain.Width div 2;
    for i := 0 to 60 do
    begin
      r := 1 + 4 * i;
      s := 0;
      x := xm + r;
      y := ym;
      pbMain.Canvas.MoveTo(x,y);
      repeat
        s := s + h / r;
        pbMain.Canvas.LineTo(Round(xm + r * Cos(s)),Round(ym + r * Sin(s)));
      until s > 2 * pi;
    end;
  end;
end;

procedure TfrmMain.mniMoireC2Click(Sender: TObject);
var
  i, m, xm, ym: Integer;
  h, r, s, x, y: Double;
begin
  Sender := Sender;
  prog := 20;
  pbClear;
  frmMain.Caption := 'Computer simulaties: Interferentie van cirkelbundels';
  ym := pbMain.Height div 2;
  h := 0.3;
  for m := 1 to 2 do
  begin
    if m = 1 then xm := pbMain.Width div 2 - 20 else xm := pbMain.Width div 2;
    for i := 5 to 80 do
    begin
      r := 24 * Sqrt(i);
      s := 0;
      x := xm + r;
      y := ym;
      pbMain.Canvas.MoveTo(Round(x),Round(y));
      repeat
        s := s + h / r;
        pbMain.Canvas.LineTo(Round(xm + r * Cos(s)),Round(ym + r * Sin(s)));
      until s > 2 * pi;
    end;
  end;
end;

procedure TfrmMain.mniMoireL1Click(Sender: TObject);
var
  a, b, x1, x2, y1, y2: Double;
  i, j: Integer;
begin
  Sender := Sender;
  prog := 17;
  pbClear;
  frmMain.Caption := 'Computer simulaties: Interferentie evenwijdige lijnen';
  a := 0.3;
  b := 0.32;
  i := 0;
  pbMain.Canvas.Pen.Color := clBlue;
  repeat
    x1 := 100;
    y1 := 80+i/a;
    x2 := pbMain.Width - 100;
    y2 := y1;
    pbMain.Canvas.Line(Round(x1),Round(y1),Round(x2),Round(y2));
    Inc(i);
  until y1 > pbMain.Height - 80;
  j := 0;
  pbMain.Canvas.Pen.Color := clRed;
  repeat
    x1 := 100;
    y1 := 80+j/b;
    x2 := pbMain.Width - 100;
    y2 := y1;
    pbMain.Canvas.Line(Round(x1),Round(y1),Round(x2),Round(y2));
    Inc(j);
  until y1 > pbMain.Height - 80;
end;

procedure TfrmMain.mniMoireL2Click(Sender: TObject);
var
  i: Integer;
  Alfa, c, s, u1, u2, v1, v2, x1, x2, y1, y2: Double;
begin
  Sender := Sender;
  prog := 18;
  pbClear;
  frmMain.Caption := 'Computer simulaties: Interferentie evenwijdige lijnen, tweede bundel iets gedraaid';
  i := 0;
  Alfa := 0.02;
  c := Cos(Alfa);
  s := Sin(Alfa);
  repeat
    x1 := 100;
    y1 := 80 + 4 * i;
    x2 := pbMain.Width - 100;
    y2 := y1;
    pbMain.Canvas.Line(Round(x1),Round(y1),Round(x2),Round(y2));
    u1 := c * x1 - s * y1;
    v1 := s * x1 + c * y1;
    u2 := c * x2 - s * y2;
    v2 := s * x2 + c * y2;
    pbMain.Canvas.Line(Round(u1),Round(v1),Round(u2),Round(v2));
    Inc(i);
  until y1 = pbMain.Height - 80;
end;

procedure TfrmMain.mniMoireS1Click(Sender: TObject);
var
  a, i, x1, x2, y1, y2: Integer;
begin
  Sender := Sender;
  prog := 21;
  pbClear;
  frmMain.Caption := 'Computer simulaties: Interferentie evenwijdige lijnen met pixelrooster van beeldscherm';
  a := 7; // verticale verplaatsing
  for i := 1 to 250 do
  begin
    x1 := 100;
    y1 := 50 + 2 * i;
    x2 := pbMain.Width - 100;
    y2 := a + y1;
    pbMain.Canvas.Line(x1,y1,x2,y2);
  end;
end;

procedure TfrmMain.mniMoireS3Click(Sender: TObject);
var
  i, r, x, xm, y, ym: Integer;
  h, s: Double;
begin
  Sender := Sender;
  prog := 23;
  pbClear;
  frmMain.Caption := 'Computer simulaties: Interferentie van cirkels met pixelrooster van beeldscherm stralen in lineare progressie';
  xm := pbMain.Width div 2;
  ym := pbMain.Height div 2;
  h := 0.2;
  for i := 10 to 120 do
  begin
    r := 1 + 2 * i;
    s := 0;
    x := xm + r;
    y := ym;
    pbMain.Canvas.MoveTo(x, y);
    repeat
      s := s + h / r;
      pbMain.Canvas.LineTo(Round(xm + r * Cos(s)),Round(ym + r * Sin(s)));
    until s > 2 * pi;
  end;
end;

procedure TfrmMain.mniMoireS4Click(Sender: TObject);
var
  i, max, xm, ym: Integer;
  f, h, r, r1, r2, x, y: Double;
begin
  Sender := Sender;
  prog := 24;
  pbClear;
  frmMain.Caption := 'Computer simulaties: ' + mniMoireS4.Caption;
  xFac := pbMain.Width div 4;
  yFac := pbMain.Height div 3;
  max := 400;
  h := 0.0015;
  xm := -4;
  ym := -1; // middelpunt cirkelbundel
  r1 := Sqrt(xm * xm + ym * ym);
  r2 := Sqrt((xm -4) * (xm - 4) + (ym - 3) * (ym - 3));
  for i := 0 to max do
  begin
    r := r1 + (r2 - r1) * i / max;
    f := -Arctan(ym / Sqrt(r * r - ym * ym));
    repeat
      x := xm + r * Cos(f);
      y := ym + r * Sin(f);
      pbMain.Canvas.Pixels[Round(xFac * x), Round(yFac * y)] := clYellow;
      f := f + h;
    until (y > 4) or (x < -0.1) or (f > 1.6);
  end;
end;

procedure TfrmMain.mniMondrianClick(Sender: TObject);
var
  h, k, n: Integer;
  u1, u2, u3, u4, v, v1, v2, v3, v4, x, y: Double;
begin
  Sender := Sender;
  prog := 32;
  pbClear;
  btnTeken.Visible := True;
  frmMain.Caption := 'Computer simulaties: ' + mniMondrian.Caption;
  xFac := pbMain.Width / 1.3;
  yFac := pbMain.Height / 1.3;
  xOff := pbMain.Width div 7;
  //xOff := 250;
  yOff := pbMain.Height div 7;
  n := 100;
  h := 8; // aantal lijntjes en lengte
  for k := 1 to n do
  begin
    v := h * (1 - Sqrt(Random)) / 50;
    x := Random;
    y := Random;
    u1 := x - v;
    v1 := y;
    u2 := x + v;
    v2 := y;
    u3 := x;
    v3 := y - v;
    u4 := x;
    v4 := y + v;
    if Random < 0.5 then
      pbMain.Canvas.Line(Round(xOff+xFac*u1),Round(yOff+yFac*v1),Round(xOff+xFac*u2),Round(yOff+yFac*v2))
    else
      pbMain.Canvas.Line(Round(xOff+xFac*u3),Round(yOff+yFac*v3),Round(xOff+xFac*u4),Round(yOff+yFac*v4));
  end; // for k
end;

procedure TfrmMain.mniPaaseiClick(Sender: TObject);
var
  k, n, numcol: Integer;
  a, b, p, q, s, x, x1, y, y1: Double;
begin
  Sender := Sender;
  prog := 37;
  pbClear;
  btnTeken.Visible := True;
  frmMain.Caption := 'Computer simulaties: ' + mniPaasei.Caption;
  xFac := pbMain.Width / 0.6;
  yFac := pbMain.Height / 0.6;
  xOff := pbMain.Width div 2;
  //xOff := 0;
  //yOff := 0;
  yOff := pbMain.Height div 2;
  numcol := 63;
  a := 0.996;
  b := 0.102;
  p := 0.05;
  q := 0.2;
  x := 0.04;
  y := 0;
  for n := 0 to 3000 do
  begin
    k := 1 + Random(n mod numcol);
    pbMain.Canvas.Pen.Color := EGAPal[k];
    pbMain.Canvas.Brush.Color := EGAPal[k];
    pbMain.Canvas.EllipseC(Round(xOff+xFac*x),Round(yOff+yFac*y),2,2);
    s := 1 + p * x * x - q * y;
    x1 := (a * x - b * y / 0.7) / s;
    y1 := b * x * 0.7 + a * y;
    x := x1;
    y := y1;
  end;
end;

procedure TfrmMain.mniPatroon1Click(Sender: TObject);
var
  c, i, j, n, xm, ym: Integer;
  x, y, z: Double;
begin
  Sender := Sender;
  prog := 11;
  pbClear;
  frmMain.Caption := 'Computer simulaties: Vierkant patroon';
  Panel1.Visible := True;
  GroupBox1.Visible := True;
  lblParameter1.Visible := True;
  lblParameter1.Caption := 'Geef een getal van drie cijfers';
  seParameter1.Visible := True;
  seParameter1.Increment := 1;
  seParameter1.MinValue := 100;
  seParameter1.MaxValue := 999;
  {xOff := pbMain.Width div 2;
  yOff := pbMain.Height div 2;}
  xFac := pbMain.Width / 2;
  yFac := pbMain.Height / 2;
  xm := pbMain.Width div 2;
  ym := pbMain.Height div 2;
  n := 50;
  c := seParameter1.Value;
  pbMain.Canvas.Rectangle(Round(xm+(-5*n-10)),Round(ym+(-5*n-10)),
    Round(xm+(5*n+10)),Round(ym+(5*n+10)));
  for i := -n to n do
  begin
    for j := -n to n do
    begin
      x := i / n;
      y := j / n;
      z := (1-x*x)*(1-y*y); //functiekeuze
      if Trunc(c*z) mod 2 = 0 then
        pbMain.Canvas.EllipseC(Round(xm+(5*i)),Round(ym+(-5*j)),2,2);
    end;
  end;
end;

procedure TfrmMain.mniPatroon2Click(Sender: TObject);
var
  c, d, h, i, j, m, n1, n2, xm, ym: Integer;
  x, y, z: Single;

  procedure Kruis;
  begin
    with pbMain.Canvas do
    begin
      MoveTo(Round(x-h),Round(y-h));
      LineTo(Round(x+h),Round(y+h));
      MoveTo(Round(x-h),Round(y+h));
      LineTo(Round(x+h),Round(y-h));
    end;
  end;

begin
  Sender := Sender;
  prog := 12;
  pbClear;
  frmMain.Caption := 'Computer simulaties: Rechthoekig kruissteekjespatroon';
  xm := pbMain.Width div 2;
  ym := pbMain.Height div 2;
  n1 := 40;
  n2 := 30;
  m := 5;
  d := 6;
  h := 3;
  c := 500;
  for i := 0 to n1 do
  begin
    for j := 0 to n2 do
    begin
      x := i / n1;
      y := j / n2;
      z := (1-x*x)*(1-y*y); //functiekeuze
      if Trunc(c*z) mod m = 0 then
      begin
        x := xm + d * i;
        y := ym - d * j;
        Kruis;
        x := xm + d * i;
        y := ym + d * j;
        Kruis;
        x := xm - d * i;
        y := ym - d * j;
        Kruis;
        x := xm - d * i;
        y := ym + d * j;
        Kruis;
      end;
    end;
  end;
end;

procedure TfrmMain.mniPatroon3Click(Sender: TObject);
var
  c, i, j, n1, n2, xm, ym: Integer;
  x, y, z, z1, z2, z3: Double;

  function FNA(x,y,a,b: Double): Double;
  begin
    Result := Exp(-a*x*x-b*y*y);
  end;

begin
  Sender := Sender;
  prog := 13;
  pbClear;
  frmMain.Caption := 'Computer simulaties: Patroon met bergen';
  xm := pbMain.Width div 2;
  ym := pbMain.Height div 2;
  n1 :=  49 * pbMain.Width div 100;
  n2 := n1;
  c := 30;
  for i := -n1 to n1 do
  begin
    for j := -n2 to n2 do
    begin
      x := 1.5 * i / n1;
      y := 1.5 * j / n2;
      z1 := FNA(x-0.6,y-0.3,5,5);
      z2 := FNA(x+0.6,y-0.3,5,5);
      z3 := FNA(x,y+0.6,2.5,10);
      z := z1 + z2 + z3 + 0.1 * (x * x + 4 * y * y); //functiekeuze
      if Floor(c * z) mod 2 = 0 then
        pbMain.Canvas.EllipseC(xm + i, ym - j, 2, 2);
    end;
  end;
end;

procedure TfrmMain.mniPatroon4Click(Sender: TObject);
var
  c, i, j, n1, n2, xm, ym: Integer;
  x, y, z: Double;
  Col: Array of Integer = (0,1,9,2,10,4,12,6,14); //kleurentabel
  l: TColor;
begin
  Sender := Sender;
  prog := 14;
  pbClear;
  frmMain.Caption := 'Computer simulaties: Een rechthoekig patroon';
  xm := pbMain.Width div 2;
  ym := pbMain.Height div 2;
  n1 :=  49 * pbMain.Width div 100;
  n2 := 49 * pbMain.Height div 100;
  c := 1000;
  for i := 0 to n1 do
  begin
    for j := 0 to n2 do
    begin
      x := i / n1;
      y := j / n2;
      z := (1 - x * x) * (1 - y * y); //functiekeuze
      l := EgaColor[Col[1 + Floor(c * z) mod 8]];
      with pbMain.Canvas do
      begin
        Pixels[xm + i, ym - j] := l;
        Pixels[xm + i, ym + j] := l;
        Pixels[xm - i, ym - j] := l;
        Pixels[xm - i, ym + j] := l;
      end;
    end;
  end;
  {x1 := xm - n1 - 10;
  y1 := ym - n2 - 10;
  x2 := xm + n1 + 10;
  y2 := ym + n2 + 10;
  pbMain.Canvas.Rectangle(x1,y1,x2,y2); }
end;

procedure TfrmMain.mniPotveld1Click(Sender: TObject);
var
  h, r, phi: Double;
  k: Integer;
begin
  Sender := Sender;
  prog := 25;
  pbClear;
  frmMain.Caption := 'Computer simulaties: ' + mniPotveld1.Caption;
  xFac := pbMain.Width / 5;
  xOff := pbMain.Width div 2;
  yOff := pbMain.Height div 2;
  h := 0.2;
  k := -4;
  pbMain.Canvas.Brush.Style := bsClear;
  repeat
    r := Exp(-k * h);
    //Cirkel(xOff, yOff, Round(xFac * r));
    pbMain.Canvas.EllipseC(xOff, yOff, Round(xFac * r),Round(xFac * r));
    k := k + 1;
  until r < 0.2;
  r := 2.5;
  for k := 0 to 7 do
  begin
    phi := k * Pi / 4;
    pbMain.Canvas.Line(xOff, yOff, Round(xOff + xFac * r * Cos(Phi)), Round(yOff + xFac * r * Sin(Phi)));
  end;
  pbMain.Canvas.Brush.Style := bsSolid;
end;

procedure TfrmMain.mniPotveld2Click(Sender: TObject);
var
  k, l: Integer;
  a, b, c, f, h, r: Double;
begin
  Sender := Sender;
  prog := 26;
  pbClear;
  frmMain.Caption := 'Computer simulaties: ' + mniPotveld2.Caption;
  xFac := pbMain.Width / 6;
  yFac := pbMain.Height / 6;
  xOff := pbMain.Width div 2;
  yOff := pbMain.Height div 2;
  with pbMain.Canvas do
  begin
    Brush.Style := bsClear;
    Pixels[Round(xOff - xFac),Round(yOff)] := clYellow;
    Pixels[Round(xOff + xFac),Round(yOff)] := clYellow;
    h := 0.5;
    for k := -8 to 7 do
    begin
      c := Exp(k * h + h / 2);
      a := (1 + c) / (1 - c);
      r := 2 * Sqrt(c) / Abs(1 - c);
      //Cirkel(Round(xOff + xFac * a),yOff,Round(xFac * r));
      EllipseC(Round(xOff + xFac * a),yOff,Round(xFac * r),Round(xFac * r));
    end; //for
    for l := -4 to 4 do
    begin
      f := l * Pi / 10;
      if l <> 0 then
      begin
        b := 1 / Tan(f);
        //Cirkel(xOff,Round(yOff + yFac * b), Round(xFac * Sqrt(1 + b * b)));
        EllipseC(xOff,Round(yOff + yFac * b), Round(xFac * Sqrt(1 + b * b)),Round(xFac * Sqrt(1 + b * b)));
      end; //if
    end; //for
    Brush.Style := bsSolid;
  end; //with
end;

procedure TfrmMain.mniPotveld3Click(Sender: TObject);
var
  c, e, h, r, t, x, y: Double;
  i, k, l: Integer;
begin
  Sender := Sender;
  prog := 27;
  pbClear;
  frmMain.Caption := 'Computer simulaties: ' + mniPotveld3.Caption;
  xFac := pbMain.Width / 4;
  yFac := pbMain.Height / 4;
  xOff := pbMain.Width div 2;
  yOff := pbMain.Height div 2;
  h := 0.2;
  e := 0.00001;
  for k := 0 to 8 do
  begin
    c := Exp(h * k) + e;
    for i := 0 to 800 do
    begin
      t := 2 * i * Pi / 800;
      r := Sqrt(Cos(2 * t) + Sqrt(c - Power(Sin(2 * t),2)));
      pbMain.Canvas.Pixels[Round(xOff + xFac * (r * Cos(t))),Round(yOff + yFac * (r * Sin(t)))] := clYellow;
    end; // for i
  end; //for k
  for l := 1 to 8 do
  begin
    c := Exp(-h * l);
    for i := 0 to 200 do
    begin
      t := i * Pi / 200;
      x := Sqrt(1 + c * Cos(t));
      y := Sqrt(-2 - c * Cos(t) + Sqrt(4 + 4 * c * Cos(t) + c * c) + e);
      pbMain.Canvas.Pixels[Round(xOff + xFac * x),Round(yOff + yFac * y)] := clYellow;
      pbMain.Canvas.Pixels[Round(xOff + xFac * x),Round(yOff + yFac * -y)] := clYellow;
      pbMain.Canvas.Pixels[Round(xOff + xFac * -x),Round(yOff + yFac * y)] := clYellow;
      pbMain.Canvas.Pixels[Round(xOff + xFac * -x),Round(yOff + yFac * -y)] := clYellow;
    end; // for i
  end; //for l
end;

procedure TfrmMain.mniPotveld4Click(Sender: TObject);
var
  k, m: Integer;
  c, f, h, r, s, t: Double;

  procedure Pot1;
  Var
    i: Integer;
  begin
    for i := 0 to 1000 do
    begin
      t := i * m * Pi / 500;
      s := 1 + 2 * c * Cos(t) + c * c;
      r := Power(s,(1 / (2 * m)));
      f := (t - ArcTan(Sin(t) / (c + Cos(t)))) / m;
      pbMain.Canvas.Pixels[Round(xOff + xFac * (r * Cos(f))),Round(yOff + yFac * (r * Sin(f)))] := clYellow;
    end; //for i
  end;

  procedure Pot2;
  var
    i, j: Integer;
  begin
    for i := 0 to m - 1 do
    begin
      for j := 0 to 200 do
      begin
        t := j * Pi / 100;
        s := 1 + 2 * c * Cos(t) + c * c;
        r := Power(s,(1 / (2 * m)));
        f := (ArcTan(c * Sin(t) / (1 + c * Cos(t))) + 2 * i * Pi) / m;
        pbMain.Canvas.Pixels[Round(xOff + xFac * (r * Cos(f))),Round(yOff + yFac * (r * Sin(f)))] := clYellow;
      end; // for j
    end; //for i
  end;

begin
  Sender := Sender;
  prog := 28;
  pbClear;
  frmMain.Caption := 'Computer simulaties: ' + mniPotveld4.Caption;
  xFac := pbMain.Width / 3;
  yFac := pbMain.Height / 3;
  xOff := pbMain.Width div 2;
  yOff := pbMain.Height div 2;
  m := 5;
  h := 0.2;
  for k := -4 to 8 do
  begin
    c := Exp(0.001 + h * k);
    if k > 0 then Pot1 else Pot2;
  end; //for k
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Sender := Sender;
  pbClear;
  Randomize;
end;

procedure TfrmMain.btnTekenClick(Sender: TObject);
begin
  Sender := Sender;
  case Prog of
  32: mniMondrianClick(Sender);
  33: mniArtblokClick(Sender);
  34: mniKleeClick(Sender);
  36: mniBlokeiClick(Sender);
  37: mniPaaseiClick(Sender);
  end;
end;

procedure TfrmMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Sender := Sender;
  flag := Key = VK_ESCAPE;
end;

procedure TfrmMain.FormKeyPress(Sender: TObject; var Key: char);
begin
  Sender := Sender;
  turtlekey := Key;
end;

procedure TfrmMain.mniArtblokClick(Sender: TObject);
var
  i, j, k, l, m, nmax, Numcol: Integer;
  a, p, q, x1, x2, y1, y2: Double;
  Col: Array [0..63] of Integer;
begin
  Sender := Sender;
  prog := 33;
  pbClear;
  btnTeken.Visible := True;
  frmMain.Caption := 'Computer simulaties: ' + mniArtblok.Caption;
  xFac := pbMain.Width / 1.3;
  yFac := pbMain.Height / 1.3;
  xOff := pbMain.Width div 11;
  //xOff := 0;
  //yOff := 0;
  yOff := pbMain.Height div 11;
  m := 16; // m*m blokken
  q := 0.9; // vullingsgraad
  a := 1.3;
  p := a / (2 * m); // grootte blokken
  Numcol := 63;
  for i := 0 to Numcol do
    Col[i] := i;
  nmax := Round(m * m * Abs(Ln(1 - q)));
  pbMain.Canvas.Rectangle(Round(xOff+xFac*(1/m-2*p)),Round(yOff+yFac*(1/m-2*p)),Round(xOff+xFac*(1+2*p)),Round(yOff+yFac*(1+2*p)));
  for k := 0 to nmax do
  begin
    i := 1 + Round(m * Random);
    j := 1 + Round(m * Random);
    l := 1 + Round(100 * Random) mod Numcol;
    x1 := i / m - p;
    y1 := j / m - p;
    x2 := i / m + p;
    y2 := j / m + p;
    pbMain.Canvas.Brush.Color := EgaPal[Col[l]];
    pbMain.Canvas.Pen.Color := EgaPal[Col[l]];
    pbMain.Canvas.Rectangle(Round(xOff+xFac*x1-13),Round(yOff+yFac*y1-13),Round(xOff+xFac*x2-13),Round(yOff+yFac*y2-13));
  end; // for k

end;

procedure TfrmMain.mniBlokeiClick(Sender: TObject);
var
  c, i, j, nh, nhor, nv, nver, numcol, p: Integer;
  a, x0, y0: Double;

  procedure Trafo;
  var
    k: Integer;
    x, y, z: Double;
  begin
    for k := 0 to 200 do
    begin
      x := x0 - 1 / nh;
      y := y0 - 1 / nv + k / (nv * 100);
      z := a * Sqrt(1 - x * x) * Sin(Pi * y / 2);
      if k = 0 then
        pbMain.Canvas.MoveTo(Round(xOff+xFac*x),Round(yOff+yFac*z))
      else
        pbMain.Canvas.LineTo(Round(xOff+xFac*x),Round(yOff+yFac*z));
    end; // for k
    for k := 0 to 200 do
    begin
      y := y0 + 1 / nv;
      x := x0 - 1 / nh + k / (nh * 100);
      pbMain.Canvas.LineTo(Round(xOff+xFac*x),Round(yOff+yFac*(a*Sqrt(1-x*x)*Sin(Pi*y/2))));
    end; // for k
    for k := 0 to 200 do
    begin
      x := x0 + 1 / nh;
      y := y0 + 1 / nv - k / (nv * 100);
      pbMain.Canvas.LineTo(Round(xOff+xFac*x),Round(yOff+yFac*(a*Sqrt(1-x*x)*Sin(Pi*y/2))));
    end; // for k
    for k := 0 to 200 do
    begin
      y := y0 - 1 / nv;
      x := x0 + 1 / nh - k / (nh * 100);
      pbMain.Canvas.LineTo(Round(xOff+xFac*x),Round(yOff+yFac*(a*Sqrt(1-x*x)*Sin(Pi*y/2))));
    end; // for k
  end;

begin
  Sender := Sender;
  prog := 36;
  pbClear;
  btnTeken.Visible := True;
  frmMain.Caption := 'Computer simulaties: ' + mniBlokei.Caption;
  xFac := pbMain.Width / 2;
  yFac := pbMain.Height / 2;
  xOff := pbMain.Width div 2;
  //xOff := 0;
  //yOff := 0;
  yOff := pbMain.Height div 2;
  numcol := 12; // aantal kleuren
  p := 100; // kleurparameter
  a := 0.8; // verticale verkorting
  nhor := 4;
  nver := 3;
  nh := 2 * nhor + 1;
  nv := 2 * nver + 1;
  for i := -nhor to nhor do
  begin
    for j := -nver to nver do
    begin
      x0 := 2 * i / nh;
      y0 := 2 * j / nv;
      c := 1 + Round(p*Random) mod numcol;
      pbMain.Canvas.Pen.Color := EgaColor[c];
      Trafo;
      pbMain.Canvas.Brush.Color := EgaColor[c];
      //pbMain.Canvas.FloodFill(Round(xOff+xFac*x0),Round(yOff+yFac*(a*Sqrt(1-x0*x0)*Sin(Pi*y0/2))),EgaColor[c],fsBorder);
      pbMain.Canvas.FloodFill(Round(xOff+xFac*x0),Round(yOff+yFac*(a*Sqrt(1-x0*x0)*Sin(Pi*y0/2))),clBlack,fsSurface);
      //pbMain.Canvas.Pixels[Round(xOff+xFac*x0),Round(yOff+yFac*(a*Sqrt(1-x0*x0)*Sin(Pi*y0/2)))] := EgaColor[c];
    end; // for j
  end; // for i
end;

procedure TfrmMain.mniBoombtClick(Sender: TObject);
var
  a1, a2, alfa, b1, b2, beta, ca, cb, diff, eps, g, u, v, xan, xbn, yan, ybn, xxa, xxb, yya, yyb: Double;
  m, p: Integer;
  xa, xb, ya, yb, s: Array [0..32] of Double;
begin
  Sender := Sender;
  prog := 30;
  pbClear;
  frmMain.Caption := 'Computer simulaties: ' + mniBoommc.Caption;
  xFac := pbMain.Width / 6;
  yFac := -pbMain.Height / 4.5;
  xOff := pbMain.Width div 2;
  //xOff := 100;
  yOff := pbMain.Height div 2;
  eps := 0.01; // drempelwaarde
  p := 32;
  // initialisatie
  alfa := pi / 3;
  beta := pi / 4; // hoek links en rechts
  ca := 0.7;
  cb := 0.7; // contractie links en rechts
  a1 := Cos(alfa);
  b1 := Sin(alfa);
  a2 := Cos(beta);
  b2 := Sin(beta);
  xxa := 0;
  yya := -1;
  xxb := 0;
  yyb := 0;
  g := 0;
  m := 0;
  with pbMain.Canvas do
  begin
    Line(xOff,Round(yOff-yFac),xOff,yOff);
    while m >= 0 do
    begin
      diff := Abs(xxb - xxa) + Abs(yyb - yya);
      if (g < p) and (diff > eps) then
      begin
        m := m + 1;
        g := g + 1;
        s[m] := g; // opstapel
        u := xxb - xxa;
        v := yyb - yya;
        xan := xxb;
        yan := yyb;
        xbn := xxb + ca * (a2 * u - b1 * v);
        ybn := yyb + ca * (b1 * u + a1 * v);
        xa[m] := xxb;
        ya[m] := yyb;
        xb[m] := xxb + cb * (a2 * u + b2 * v);
        yb[m] := yyb + cb * (-b2 * u + a2 * v);
        Line(Round(xOff+xFac*xxa),Round(yOff+yFac*yya),Round(xOff+xFac*xxb),Round(yOff+yFac*yyb));
        xxa := xan;
        yya := yan;
        xxb := xbn;
        yyb := ybn;
      end
      else
      begin
        xxa := xa[m];
        yya := ya[m];
        xxb := xb[m];
        yyb := yb[m];
        g := s[m];
        m := m - 1; // van stapel
      end; //if
    end; //while
  end; //with
end;

procedure TfrmMain.mniBoommcClick(Sender: TObject);
var
  a, b, c, d, det1, det2, q, r, x, x1, y, y1: Double;
  n, nmax: Integer;
begin
  Sender := Sender;
  prog := 29;
  pbClear;
  frmMain.Caption := 'Computer simulaties: ' + mniBoommc.Caption;
  xFac := pbMain.Width / 6;
  yFac := -pbMain.Height / 6;
  xOff := pbMain.Width div 2;
  //xOff := 100;
  yOff := pbMain.Height div 2;
  // coefficienten
  a := 0.5;
  b := 0.5;
  c := 0.5;
  d := -0.5;
  nmax := 60000;
  det1 := a * a + b * b;
  det2 := c * c + d * d;
  q := det1 / (det1 + det2);
  x := 1;
  y := 0;
  n := 0; // start
  while n < nmax do
  begin
    r := Random;
    if r < q then
    begin
      x1 := a * x - b * y - 1;
      y1 := b * x + a * y + b;
    end
    else
    begin
      x1 := c * x - d * y + 1;
      y1 := d * x + c * y - d;
    end; // if
    x := x1;
    y := y1;
    pbMain.Canvas.Pixels[Round(xOff+xFac*x),Round(yOff+yFac*y)] := clLime;
    n := n + 1;
  end; // while
end;

procedure TfrmMain.mniEiClick(Sender: TObject);
var
  a, b, c, x, y, z: Double;
  i, k: Integer;
begin
  Sender := Sender;
  prog := 35;
  pbClear;
  frmMain.Caption := 'Computer simulaties: ' + mniEi.Caption;
  xFac := pbMain.Width / 2;
  yFac := pbMain.Height / 2;
  xOff := pbMain.Width div 2;
  //xOff := 0;
  //yOff := 0;
  yOff := pbMain.Height div 2;
  a := 0.7;
  b := 0.2; // ei parameters
  for k := 0 to 10 do
  begin
    c := 1 - k / 12;
    pbMain.Canvas.MoveTo(Round(xOff+xFac*-c),yOff);
    for i := -200 to 200 do
    begin
      x := i / 200;
      z := (1 - x * x) * (1 + b * x);
      y := a * Sqrt(z);
      pbMain.Canvas.LineTo(Round(xOff+xFac*(c*x)),Round(yOff+yFac*(c*y)));
    end; // for i
    pbMain.Canvas.MoveTo(Round(xOff+xFac*-c),yOff);
    for i := -200 to 200 do
    begin
      x := i / 200;
      z := (1 - x * x) * (1 + b * x);
      y := a * Sqrt(z);
      pbMain.Canvas.LineTo(Round(xOff+xFac*(c*x)),Round(yOff+yFac*(-c*y)));
    end; // for i
  end; // for k
end;

procedure TfrmMain.mniKleeClick(Sender: TObject);
var
  c, k, n: Integer;
  Alfa, a, a1, a2, a3, b, b1, b2, b3, h, u1, u2, u3, v, v1, v2, v3, x , y: Double;

  procedure Lijn;
  begin
    Alfa := Random * Pi;
    a := Cos(Alfa);
    b := Sin(Alfa);
    c := 9 + Round(4 * Random);
    u1 := x - a * v;
    v1 := y - b * v;
    u2 := x + a * v;
    v2 := y + b * v;
    pbMain.Canvas.Pen.Color := EgaColor[c];
    pbMain.Canvas.Line(Round(xOff+xFac*u1),Round(yOff+yFac*v1),Round(xOff+xFac*u2),Round(yOff+yFac*v2));
  end;

  procedure Driehoek;
  begin
    Alfa := 2 * Random * Pi;
    c := 1 + Round(4 * Random);
    a1 := Cos(Alfa);
    a2 := Cos(Alfa + 2 * Pi / 3);
    a3 := Cos(Alfa - 2 * Pi / 3);
    b1 := Sin(Alfa);
    b2 := Sin(Alfa + 2 * Pi / 3);
    b3 := Sin(Alfa - 2 * Pi / 3);
    u1 := x + a1 * v;
    u2 := x + a2 * v;
    u3 := x + a3 * v;
    v1 := y + b1 * v;
    v2 := y + b2 * v;
    v3 := y + b3 * v;
    pbMain.Canvas.Pen.Color := EgaColor[c];
    pbMain.Canvas.Line(Round(xOff+xFac*u1),Round(yOff+yFac*v1),Round(xOff+xFac*u2),Round(yOff+yFac*v2));
    pbMain.Canvas.LineTo(Round(xOff+xFac*u3),Round(yOff+yFac*v3));
    pbMain.Canvas.LineTo(Round(xOff+xFac*u1),Round(yOff+yFac*v1));
    u1 := x + 0.8 * a1 * v;
    u2 := x + 0.8 * a2 * v;
    u3 := x + 0.8 * a3 * v;
    v1 := y + 0.8 * b1 * v;
    v2 := y + 0.8 * b2 * v;
    v3 := y + 0.8 * b3 * v;
    pbMain.Canvas.Brush.Color := EgaColor[c];
    pbMain.Canvas.FloodFill(Round(xOff+xFac*u1),Round(yOff+yFac*v1),EgaColor[c],fsBorder);
    pbMain.Canvas.FloodFill(Round(xOff+xFac*u2),Round(yOff+yFac*v2),EgaColor[c],fsBorder);
    pbMain.Canvas.FloodFill(Round(xOff+xFac*u3),Round(yOff+yFac*v3),EgaColor[c],fsBorder);
  end;

begin
  Sender := Sender;
  prog := 34;
  pbClear;
  btnTeken.Visible := True;
  frmMain.Caption := 'Computer simulaties: ' + mniKlee.Caption;
  xFac := pbMain.Width / 1.3;
  yFac := pbMain.Height / 1.3;
  xOff := pbMain.Width div 9;
  //xOff := 0;
  //yOff := 0;
  yOff := pbMain.Height div 9;
  n := 40;  // aantal figuurtjes
  h := 0.05;
  pbMain.Canvas.Rectangle(Round(xOff+xFac*(-2*h)),Round(yOff+yFac*(-2*h)),Round(xOff+xFac*(1+2*h)),Round(yOff+yFac*(1+2*h)));
  for k := 1 to n do
  begin
    v := h * (0.5 + Random); // random grootte
    x := Random;
    y := Random;
    if Random < 0.5 then Lijn else Driehoek;
  end; // for k
end;

procedure TfrmMain.mniMoireS2Click(Sender: TObject);
var
  i, x, x0, y, y0: Integer;
begin
  Sender := Sender;
  prog := 22;
  pbClear;
  frmMain.Caption := 'Computer simulaties: Interferentie van stralenbundel met pixelrooster van beeldscherm';
  x0 := pbMain.Width div 2;
  y0 := 0; // centrum bundel
  for i := 1 to 160 do
  begin
    x := 4 * i;
    y := pbMain.Height;
    pbMain.Canvas.Line(x0,y0,x,y);
  end;
end;

procedure TfrmMain.pbClear;
begin
  with pbMain.Canvas do
  begin
    Clear;
    //Invalidate;
    Brush.Color := clBlack;
    FillRect(0,0,Width,Height);
    Pen.Color := clYellow;
  end;
  Panel1.Visible := False;
  GroupBox1.Visible := False;
  lblParameter1.Visible := False;
  lblParameter2.Visible := False;
  seParameter1.Visible := False;
  seParameter2.Visible := False;
  seParameter3.Visible := False;
  seParameter4.Visible := False;
  btnTeken.Visible := False;
end;

procedure TfrmMain.Cirkel(x, y: Integer; r: Double);
var
  w1, x1, x2, y1, y2: Integer;
  rd, w: Double;
begin
  rd := pi/180;
  for w1 := 0 to 360 do
  begin
    w := w1 * rd;
    if w = 0 then
    begin
      x1 := Round(x + r * Cos(w));
      y1 := Round(y - r * Sin(w));
    end
    else
    begin
      x2 := Round(x + r * Cos(w));
      y2 := Round(y - r * Sin(w));
      pbMain.Canvas.MoveTo(x1,y1);
      pbMain.Canvas.LineTo(x2,y2);
      x1 := x2;
      y1 := y2;
    end;
  end;
end;

end.

