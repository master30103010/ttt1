program ttt;

uses
  Forms,
  ttc in 'ttc.pas' {tcc},
  Cubc in 'Cubc.pas' {Cube};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Ttcc, tcc);
  Application.CreateForm(TCube, Cube);
  Application.Run;
end.
