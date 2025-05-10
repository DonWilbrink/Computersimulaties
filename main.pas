unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls,
  StdCtrls, Windows;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    edtInvoer: TEdit;
    Hoofdminu: TMainMenu;
    lblInvoer: TLabel;
    memUitvoer: TMemo;
    mniGauss: TMenuItem;
    mniPriem: TMenuItem;
    mniHoofdstuk2: TMenuItem;
    mniPythkleed: TMenuItem;
    mniHoofdstuk1: TMenuItem;
    mniHoofdstukken: TMenuItem;
    Panel1: TPanel;
    pbMain: TPaintBox;
    procedure FormCreate(Sender: TObject);
    procedure mniGaussClick(Sender: TObject);
    procedure mniPriemClick(Sender: TObject);
    procedure mniPythkleedClick(Sender: TObject);
  private
    procedure pbClear;
  public

  end;

var
  frmMain: TfrmMain;
  prog, xOff, yOff: Integer;
  xFac, yFac: Double;
  EgaColor : array[0..15] of TColor =
    (TColor($000000),TColor($AA0000),TColor($00AA00),TColor($AAAA00),
     TColor($0000AA),TColor($AA00AA),TColor($0055AA),TColor($AAAAAA),
     TColor($555555),TColor($FF5555),TColor($55FF55),TColor($FFFF55),
     TColor($5555FF),TColor($FF55FF),TColor($55FFFF),TColor($FFFFFF));



implementation

{$R *.lfm}

{ TfrmMain }

procedure TfrmMain.mniPythkleedClick(Sender: TObject);
var
  m, max, n, x, xm, y, ym: Integer;
begin
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
        if (x < max) and (y < max) then
        begin
          Pixels[xm+x,ym-y] := clYellow;
          Pixels[xm+x,ym+y] := clYellow;
          Pixels[xm-x,ym-y] := clYellow;
          Pixels[xm-x,ym+y] := clYellow;
          Pixels[xm+y,ym-x] := clYellow;
          Pixels[xm+y,ym+x] := clYellow;
          Pixels[xm-y,ym-x] := clYellow;
          Pixels[xm-y,ym+x] := clYellow;
        end;
        Inc(n);
      end;
    end;
  end;
end;

procedure TfrmMain.mniPriemClick(Sender: TObject);
var
  T1, T2, FProc: Int64;
  f, j, n : Integer;
begin
  prog := 2;
  pbClear;
  frmMain.Caption := 'Computer simulaties: Factorisatie getal < 2147483648';
  Panel1.Visible := True;
  QueryPerformanceFrequency(Fproc);     // Get processor frequency
  lblInvoer.Caption := 'Geef getal < 2147483648';
  n := StrToInt(edtInvoer.Text);
  j := 1;
  memUitvoer.Clear;
  QueryPerformanceCounter(T1);          // Start
  While n mod 2 = 0 do
  begin
    memUitvoer.Lines.Add(j.ToString + '  2');
    Inc(j);
    n := n div 2;
  end;
  f := 3;
  while n mod 3 = 0 do
  begin
    memUitvoer.Lines.Add(j.ToString + '  3');
    Inc(j);
    n := n div 3;
  end;
  while f < Sqrt(n) do
  begin
    Inc(f,2);
    while n mod f = 0 do
    begin
      memUitvoer.Lines.Add(j.ToString + '  ' + f.ToString);
      Inc(j);
      n := n div f;
    end;
  end;
  QueryPerformanceCounter(T2);
  if n > 1 then
  begin
    memUitvoer.Lines.Add(j.ToString + '  ' + n.ToString);
    memUitvoer.Lines.Add('');
    memUitvoer.Lines.Add('Het factoriseren duurde: ' + (1000*(T2-T1)/FProc).ToString + ' milliseconden');
  end;
end;

procedure TfrmMain.mniGaussClick(Sender: TObject);
var
  n, n1, n2: Integer;
  a, b, f, f1, f2, s: Double;
  label nextpoint;
begin
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
        f2 := 0;
        repeat
          f1 := 0;
          repeat
            f := f1*f1+f2*f2;
            if (f <> 0) and (f <> 1) then
            begin
              a := (n1*f1+n2*f2)/f;
              b := Abs(n1*f2-n2*f1)/f;
              if (a - Trunc(a) = 0) and (b - Trunc(b) = 0) then Goto nextpoint;
            end;
            f1 := f1 + 1;
          until (f1 * f1 + f2 * f2 > s);
          f2 := f2 + 1;
        until (f2 * f2 > s);
        EllipseC(Round(xOff+xFac*n1),Round(yOff+yFac*n2),3,3);
        EllipseC(Round(xOff+xFac*n2),Round(yOff+yFac*n1),3,3);
        EllipseC(Round(xOff+xFac*-n1),Round(yOff+yFac*n2),3,3);
        EllipseC(Round(xOff+xFac*-n2),Round(yOff+yFac*n1),3,3);
        EllipseC(Round(xOff+xFac*-n1),Round(yOff+yFac*-n2),3,3);
        EllipseC(Round(xOff+xFac*-n2),Round(yOff+yFac*-n1),3,3);
        EllipseC(Round(xOff+xFac*n1),Round(yOff+yFac*-n2),3,3);
        EllipseC(Round(xOff+xFac*n2),Round(yOff+yFac*-n1),3,3);
        nextpoint:
      end;
    end;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  pbClear;
end;

procedure TfrmMain.pbClear;
begin
  with pbMain.Canvas do
  begin
    Clear;
    Brush.Color := clBlack;
    Pen.Color := clYellow;
    Panel1.Visible := False;
  end;

end;

end.

