unit priem;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Windows;

type

  { TfrmPriem }

  TfrmPriem = class(TForm)
    btnBereken: TButton;
    edtInvoer: TEdit;
    lblInvoer: TLabel;
    memUitvoer: TMemo;
    procedure btnBerekenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  frmPriem: TfrmPriem;

implementation

{$R *.lfm}

{ TfrmPriem }

procedure TfrmPriem.FormCreate(Sender: TObject);
begin
  frmPriem.Caption := 'Factorisatie getal < 9223372036854775807';
  lblInvoer.Caption := 'Geef getal < 9223372036854775807';
end;

procedure TfrmPriem.btnBerekenClick(Sender: TObject);
var
  n, T1, T2, FProc: Int64;
  f, j: Integer;
begin
  QueryPerformanceFrequency(Fproc);     // Get processor frequency
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
  edtInvoer.SetFocus;
end;

end.

