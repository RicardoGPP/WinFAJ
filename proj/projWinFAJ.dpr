program projWinFAJ;

uses
  Forms,
  PrincipalView in '..\src\br\faj\view\PrincipalView.pas' {formPrincipal},
  Arquivo in '..\src\br\faj\core\Arquivo.pas',
  Conversao in '..\src\br\faj\core\Conversao.pas',
  ASCII in '..\src\br\faj\core\ASCII.pas',
  Compressao in '..\src\br\faj\core\Compressao.pas',
  PrincipalController in '..\src\br\faj\controller\PrincipalController.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'WinFAJ';
  Application.CreateForm(TformPrincipal, formPrincipal);
  Application.Run;
end.
