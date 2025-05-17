unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls,
  StdCtrls, Spin, Windows;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    edtInvoer: TEdit;
    seParameter2: TFloatSpinEdit;
    GroupBox1: TGroupBox;
    Hoofdminu: TMainMenu;
    lblParameter1: TLabel;
    lblParameter2: TLabel;
    lblInvoer: TLabel;
    memUitvoer: TMemo;
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
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure mniGaussClick(Sender: TObject);
    procedure mniLissa1Click(Sender: TObject);
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
  flag: Boolean;
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
  n, T1, T2, FProc: Int64;
  f, j: Integer;
begin
  prog := 2;
  pbClear;
  frmMain.Caption := 'Computer simulaties: Factorisatie getal < 9223372036854775807';
  Panel1.Visible := True;
  QueryPerformanceFrequency(Fproc);     // Get processor frequency
  lblInvoer.Caption := 'Geef getal < 9223372036854775807';
  n := StrToInt64(edtInvoer.Text);
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

procedure TfrmMain.mniLissa1Click(Sender: TObject);
var
  a, i, s: Integer;
  f, h, t, x, y: Double;
begin
  prog := 4;
  pbClear;
  xOff := pbMain.Width div 2;
  yOff := pbMain.Height div 2;
  xFac := pbMain.Width / 2;
  yFac := pbMain.Height / 2;
  Panel1.Visible := True;
  GroupBox1.Visible := True;
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
  for i := 1 to 20000 do
  begin
    //Application.ProcessMessages;
    x := a * Cos(s * t);
    y := Cos(t * f);
    pbMain.Canvas.Pixels[Round(xOff+xFac*x),Round(yOff+yFac*y)] := clYellow;
    t := t + h;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  pbClear;
end;

procedure TfrmMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  flag := Key = VK_ESCAPE;
end;

procedure TfrmMain.pbClear;
begin
  with pbMain.Canvas do
  begin
    Clear;
    Brush.Color := clBlack;
    FillRect(0,0,Width,Height);

    Pen.Color := clYellow;

  end;
  Panel1.Visible := False;
  //GroupBox1.Visible := False;
  //lblParameter1.Visible := False;
  //lblParameter2.Visible := False;
  //seParameter1.Visible := False;
 // seParameter2.Visible := False;
end;

end.

