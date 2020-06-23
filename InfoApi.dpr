program InfoApi;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {Form1},
  uclsAPI in 'uclsAPI.pas',
  uclsClasses in 'uclsClasses.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
