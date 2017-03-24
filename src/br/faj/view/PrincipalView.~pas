unit PrincipalView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Buttons, ComCtrls, PrincipalController;

type
  TformPrincipal = class(TForm)
    groupboxOpcaoExecucao: TGroupBox;
    statusbarPrincipal: TStatusBar;
    radiobuttonCompactar: TRadioButton;
    radiobuttonDescompactar: TRadioButton;
    groupboxExecucao: TGroupBox;
    buttonExecutar: TBitBtn;
    groupboxArquivo: TGroupBox;
    labelCaminhoArquivo: TLabel;
    editCaminhoArquivo: TEdit;
    buttonBuscarArquivo: TBitBtn;
    groupboxDadosArquivo: TGroupBox;
    labelIndiceNomeArquivo: TLabel;
    labelIndiceDiretorioArquivo: TLabel;
    labelIndiceTamanhoArquivo: TLabel;
    labelNomeArquivo: TLabel;
    labelDiretorioArquivo: TLabel;
    labelTamanhoArquivo: TLabel;
    buttonLimparCaminhoArquivo: TBitBtn;
    procedure iniciar(Sender: TObject);
    procedure finalizar(Sender: TObject; var Action: TCloseAction);
    procedure atualizarDadosArquivo;
    procedure buscarArquivo(Sender: TObject);
    procedure removerArquivo(Sender: TObject);
    function estaPreenchido: Boolean;
    procedure executar(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formPrincipal: TformPrincipal;
  controller: TPrincipalController;

implementation

{$R *.dfm}


//Inicializa ambiente
procedure TformPrincipal.iniciar(Sender: TObject);
begin
  //Instancia controller
  controller:= TPrincipalController.Create;
end;

//Finaliza ambiente
procedure TformPrincipal.finalizar(Sender: TObject; var Action: TCloseAction);
begin
  //Livra controller
  if (controller <> Nil) then controller.Free;
end;

//Atualiza dados do arquivo
procedure TformPrincipal.atualizarDadosArquivo;
begin
  //Verifica se arquivo é nulo
  if (controller.arquivo = Nil) then
    begin
      //Limpa os campos
      editCaminhoArquivo.Clear;
      labelNomeArquivo.Caption:= '-';
      labelDiretorioArquivo.Caption:= '-';
      labelTamanhoArquivo.Caption:= '-';
    end
    else
    begin
      //Adiciona valores nos campos
      editCaminhoArquivo.Text:= controller.arquivo.caminho;
      labelNomeArquivo.Caption:= controller.arquivo.obterNome;
      labelDiretorioArquivo.Caption:= controller.arquivo.obterDiretorio;
      labelTamanhoArquivo.Caption:= IntToStr(controller.arquivo.obterTamanho) + ' byte(s)';
    end;
end;

//Busca arquivo
procedure TformPrincipal.buscarArquivo(Sender: TObject);
begin
  //Trata possíveis erros
  try
    //Busca arquivo
    controller.buscarArquivo;
    //Atualiza dados do arquivo
    atualizarDadosArquivo;
  except on e: Exception do
    begin
      //Mostra mensagem de erro
      MessageDlg('Ocorreu um erro ao buscar o arquivo.' + #13 + 'Erro: ' + e.Message, mtError, [mbOK], 0);
    end;
  end;
end;

//Remove arquivo
procedure TformPrincipal.removerArquivo(Sender: TObject);
begin
  //Trata possíveis erros
  try
    //Remove arquivo
    controller.removerArquivo;
    //Atualiza dados do arquivo
    atualizarDadosArquivo;
  except on e: Exception do
    begin
      //Mostra mensagem de erro
      MessageDlg('Ocorreu um erro ao remover o arquivo.' + #13 + 'Erro: ' + e.Message, mtError, [mbOK], 0);
    end;
  end;
end;

//Verifica se os campos foram preenchidos
function TformPrincipal.estaPreenchido: Boolean;
//Declaração de variáveis
var preenchido: Boolean;
begin
  //Inicializa variável
  preenchido:= False;
  //Verifica campos
  if (Trim(editCaminhoArquivo.Text) = '') then
    begin
      //Mostra mensagem
      MessageDlg('O arquivo não foi informado.', mtInformation, [mbOK], 0);
      //Seta o foco no botão de busca
      buttonBuscarArquivo.SetFocus;
    end
    else
    begin
      //Altera variável de controle
      preenchido:= True;
    end;
  //Retorna resultado da função
  Result:= preenchido;
end;

//Executa compactação ou descompactação
procedure TformPrincipal.executar(Sender: TObject);
begin
  //Trata possíveis erros
  try
    //Verifica preenchimento dos campos
    if (estaPreenchido) then
      begin
        //Verifica opção selecionada no radio
        if (radiobuttonCompactar.Checked) then
          begin
            //Compacta
            if (controller.compactar) then
              //Mostra mensagem
              MessageDlg('O arquivo foi compactado com sucesso!', mtInformation, [mbOK], 0);
          end
          else
          begin
            //Descompacta
            if (controller.descompactar) then
              //Mostra mensagem
              MessageDlg('O arquivo foi descompactado com sucesso!', mtInformation, [mbOK], 0);
          end;
      end;
  except on e: Exception do
    begin
      //Mostra mensagem de erro
      MessageDlg('Ocorreu um erro ao executar.' + #13 + 'Erro: ' + e.Message, mtError, [mbOK], 0);
    end;
  end;
end;

end.
