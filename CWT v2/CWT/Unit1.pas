unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, TeeProcs, TeEngine, Chart, StdCtrls, Series, TeeTools,
  TeeSurfa, Math;

type
  TForm1 = class(TForm)
    Chart1: TChart;
    Series1: TLineSeries;
    OpenDialog1: TOpenDialog;
    Chart2: TChart;
    ChartTool1: TRotateTool;
    ListBox1: TListBox;
    ListBox2: TListBox;
    Chart3: TChart;
    Series2: TIsoSurfaceSeries;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Label4: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Series3: TIsoSurfaceSeries;
    Chart4: TChart;
    Edit3: TEdit;
    Label5: TLabel;
    Series4: TBarSeries;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Edit4: TEdit;
    lbl1: TLabel;
    Threshold: TLabel;
    lbl2: TLabel;
    Chart5: TChart;
    Series5: TIsoSurfaceSeries;
    Chart7: TChart;
    Series7: TLineSeries;
    Series8: TLineSeries;
    ListBox3: TListBox;
    Edit5: TEdit;
    Edit6: TEdit;
    Series9: TLineSeries;
    Button9: TButton;
    Series10: TLineSeries;
    Chart6: TChart;
    Series6: TLineSeries;
    Series11: TLineSeries;
    Series12: TLineSeries;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    //procedure Button7Click(Sender: TObject);
    //procedure Button9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
    filename: TextFile;
    s1, s2, s     : String;
    Ndata, rowcount, colcount, fs : integer;
    freq_at : array [0..2001] of real;
    time_at : array [0..2001] of extended;
    waktu, input : array [0..2001] of Extended;
    cwt, cwt_real, cwt_im      : array [0..2001, 0..2001] of real;
    XRealDFT, XImajDFT, MagDFT : array [0..2001] of Extended;
    AvgVal, ShanAvg, Square, ShanEnergy, NormSignal: array[0..2001] of Extended;
    MaxInput, MinInput, MaxAbs, TempInput : Real; //Variable Normalize
    MaxShanAvg, SumAvgVal, DevVal, NormShanAvg, th_val, Var1: Extended; //tadinya real
    tot_frame, frame : Integer;
    th_coef, max_norm, min_norm : Real;
    temp, a, a_awal, f0, w0 : Extended;
    b, t, reall, imj  : Extended;
    s_real, s_imaj    : Real;
    dt, db, da  : Extended;

implementation

{$R *.dfm}

// --- Open Dialog---
procedure TForm1.Button1Click(Sender: TObject);
var
  i : integer;
begin
  Series1.Clear;
  ListBox1.Clear;
  ListBox2.Clear;
  i:=0;

  if OpenDialog1.Execute then
  begin
    AssignFile(filename, OpenDialog1.FileName);
    Reset(filename);

    while not Eof(filename) do
    begin
      Readln(filename, waktu[i], input[i]);

      Inc(i);
    end;
    Ndata := i-1;
    CloseFile(filename);
  end;
  Label2.Caption:= IntToStr(i);

  for i := 0 to Ndata do
  begin
    Series1.AddXY(waktu[i], input[i]);
  end;
end;

// ---- CWT ---
procedure TForm1.Button2Click(Sender: TObject);
var
  i, j, k     : integer;
begin
  rowcount := 100;
  colcount := 100;

  a   := StrToFloat(Edit1.Text);  // skala awal
  da  := StrToFloat(Edit2.Text);  // delta skala
  dt  := 1/1750;
  f0  := 0.849;
  w0  := 2*pi*f0;

  db  := (Ndata - 1)*dt/colcount;   // delta pergeseran (time shift)
  for i:=1 to rowcount do         // scale
  begin
    b := 0.0;
    for j:=1 to colcount do       // translation
    begin
      t := 0.0;
      for k:=1 to Ndata do        // integration
      begin
        reall    := 1/sqrt(a)*1/power(pi,0.25)*Exp(-(t-b)/a*(t-b)/a/2.0)*cos(w0*(t-b)/a);
        //1/sqrt(a)*1/power(pi,0.25)*Exp(-(t-b)/a*(t-b)/a/2.0)*cos(w0*(t-b)/a);
        imj      := 1/sqrt(a)*-1/power(pi,0.25)*Exp(-(t-b)/a*(t-b)/a/2.0)*sin(w0*(t-b)/a);
        //1/sqrt(a)*-1/power(pi,0.25)*Exp(-(t-b)/a*(t-b)/a/2.0)*sin(w0*(t-b)/a);

        cwt_real[j,i] := cwt_real[j,i] + input[k] * reall;
        cwt_im[j,i]   := cwt_im[j,i] + input[k] * imj;

        t        := t+dt;
      end;
      cwt[j,i] := sqrt(sqr(cwt_real[j,i]) + sqr(cwt_im[j,i]));
      b        := b + db;
    end;
    a := a + da;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  i, j : integer;
begin
  for i:=1 to rowcount do
  begin
    for j:=1 to colcount do
    begin
      Series3.AddXYZ(j, cwt[j,i], i);
    end;
    freq_at[i]  := (0.849 / (a + (i*da)));
    Str(freq_at[i], s1);
    Listbox1.Items.Add('skala['+inttostr(i)+']= '+s1+' Hz' );
  end;

  for j:=1 to colcount do
  begin
    time_at[j]  := (waktu[Ndata] / colcount) * j;
    Str(time_at[j], s);
    Listbox2.Items.Add('time['+inttostr(j)+']= '+s+' s' );
  end;

  for i:=1 to rowcount do
  begin
    for j:=1 to colcount do
    begin
      Series2.AddXYZ(j, cwt[j,i], i);
    end;
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  k, n : Integer;
begin
  fs := StrToInt(Edit3.Text);

  // --- DFT ---
  for k:=0 to Ndata-1 do
  begin
    s_real := 0;
    s_imaj := 0;
    for n:=0 to Ndata-1 do
    begin
      s_real := s_real + Cos(2*pi*k*n/Ndata)*input[n];
      s_imaj := s_imaj - Sin(2*pi*k*n/Ndata)*input[n];
    end;
    XRealDFT[k]:= s_real;
    XImajDFT[k]:= s_imaj;
  end;

  //Magnitude Spektrum
  for k:= 0 to Ndata-1 do
  begin
    MagDFT[k]:= Sqrt(Sqr(XRealDFT[k]) + Sqr(XImajDFT[k]));
  end;

  for k:=0 to Round(Ndata/2) do
  begin
    Series4.AddXY(k*fs/Ndata, MagDFT[k]);
  end;
end;

procedure TForm1.Button6Click(Sender: TObject);
var
 i, x : Integer;
 j, k: Integer;
 temp: real;
 sum,sum2 : Real;

begin
  frame:= StrToInt(Edit6.Text);
  th_coef := StrToFloat(Edit5.Text);

  MaxInput := input[0];
  MinInput := input[0];

  for i:=0 to frame-1 do
  begin
    input[-i]:= input[0];
  end;
  for i := 0 to Ndata-1 do
  begin
    if input[i] > MaxInput then
      MaxInput := input[i];
    if input[i] < MinInput then
      MinInput := input[i];
  end;

  MaxAbs := Abs(MaxInput);//Max(Abs(MaxInput), Abs(MinInput));

  // Normalize input signal
  for i := 0 to Ndata-1 do
  begin
    NormSignal[i] := input[i] / MaxAbs;
    Series9.AddXY(waktu[i],NormSignal[i]);
  end;

  //Shannon Energy
  for x:=0 to Ndata-1 do
  begin
    temp:= 0.0;
    for j:=0 to frame-1 do    //rumus paper
    begin
      temp:=temp+sqr(NormSignal[x])*Log10(sqr(NormSignal[x]));
    end;

    ShanEnergy[x]:=(-1)*(1/frame)*temp;
    Series6.AddXY(waktu[x],ShanEnergy[x]);
    //SumAvgVal:=SumAvgVal+ShanEnergy[x];
  end;

  //Rata - Rata
  temp:=0.0;
  for i:=0 to Ndata-1 do
  begin
    temp:=temp+ShanEnergy[i];
  end;
  SumAvgVal := (1/Ndata) * (temp);
  sum :=0;
  sum2 :=0 ;
  for i :=0 to Ndata-1 do
  begin
    sum := sum + ShanEnergy[i];
    sum2:= sum2 + ShanEnergy[i];
  end;

  Var1 := (Ndata*sum2 - sqr(sum))/(Ndata*(Ndata-1));
  NormShanAvg := sqrt(Var1);


  //Standar Deviasi
 { DevVal:=0;
  for k:=0 to Ndata-1 do
  begin
    DevVal := DevVal + sqr(ShanEnergy[k]-SumAvgVal);
  end;
  NormShanAvg := sqrt(DevVal/Ndata);  }



  //Average Shannon Energy
  for j:= 0 to Ndata-1 do
  begin
    ShanAvg[j] := (ShanEnergy[j] - SumAvgVal)*(1/NormShanAvg);
    Series7.AddXY(j/fs,ShanAvg[j]);
  end;

  {//Threshold
  //mencari max dan min Normasilasi Average Shannon Energy
    max_norm:=0;
  min_norm:=0;
  for x:=0 to Ndata-1 do
  begin
    if ShanAvg[x]>max_norm then
    begin
      max_norm:= ShanAvg[x];
    end;
    if ShanAvg[x]<min_norm then
    begin
    min_norm:= ShanAvg[x];
    end;
  end;
  //Menentukan nilai Threshold
  th_val:= min_norm + th_coef*max_norm;
  for x:=0 to Ndata-1 do
  begin
    Series10.AddXY(x/fs, th_val);
  end;}
end;



procedure TForm1.Button5Click(Sender: TObject);
begin
  Series1.Clear;
  Series2.Clear;
  Series3.Clear;
  Series4.Clear;
  ListBox1.Clear;
  ListBox2.Clear;
end;

end.





