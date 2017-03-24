//Declara��o da classe "Arquivo"
unit Arquivo;

interface
  uses SysUtils, Classes;

type TArquivo = class
  private
    pCaminho: String;
  public
    property caminho: String read pCaminho write pCaminho;
    constructor Create; overload;
    constructor Create(caminho: String); overload;
    function obterNome: String;
    function obterDiretorio: String;
    function obterConteudo: String;
    function obterTamanho: Integer;
    procedure salvar(conteudo: String);
end;

implementation

//Construtor da classe
constructor TArquivo.Create;
begin
  //Inicializa atributo
  Self.pCaminho:= '';
end;

//Construtor da classe com argumento
constructor TArquivo.Create(caminho: String);
begin
  //Inicializa atributo
  Self.pCaminho:= caminho;
end;

//Obt�m nome do arquivo
function TArquivo.obterNome: String;
//Declara��o de vari�veis
var nome: String;
begin
  //Inicializa vari�vel
  nome:= '';
  //Trata poss�veis erros
  try
    //Verifica se caminho foi informado
    if (Trim(Self.pCaminho) <> '') then
      begin
        //Define nome do arquivo
        nome:= ExtractFileName(Trim(Self.pCaminho));
      end;
  except on e: Exception do
    begin
      //Posterga tratamento de erro
      raise Exception.Create(e.Message);
    end;
  end;
  //Retorna resultado da fun��o
  Result:= nome;
end;

//Obt�m diret�rio do arquivo
function TArquivo.obterDiretorio: String;
//Declara��o de vari�veis
var diretorio: String;
begin
  //Inicializa vari�vel
  diretorio:= '';
  //Trata poss�veis erros
  try
    //Verifica se caminho foi informado
    if (Trim(Self.pCaminho) <> '') then
      begin
        //Define diretorio do arquivo
        diretorio:= ExtractFileDir(Trim(Self.pCaminho));
      end;
  except on e: Exception do
    begin
      //Posterga tratamento de erro
      raise Exception.Create(e.Message);
    end;
  end;
  //Retorna resultado da fun��o
  Result:= diretorio;
end;

//Obt�m conte�do do arquivo
function TArquivo.obterConteudo: String;
//Declara��o de vari�veis
var conteudo: String;
    arquivo: TextFile;
begin
  //Inicializa vari�veis
  conteudo:= '';
  //For�a livramento
  try
    //Trata poss�veis erros
    try
      //Verifica se caminho foi informado e se arquivo existe
      if ((Trim(Self.pCaminho) <> '') and (FileExists(Self.pCaminho))) then
        begin
          //Assimila arquivo � vari�vel
          AssignFile(arquivo, Self.pCaminho);
          //Abre arquivo para leitura
          Reset(arquivo);
          //L� linha do arquivo
          Readln(arquivo, conteudo);
        end;
    except on e: Exception do
      begin
        //Posterga tratamento de erro
        raise Exception.Create(e.Message);
      end;
    end;
  finally
    //Fecha arquivo
    CloseFile(arquivo);
  end;
  //Retorna resultado da fun��o
  Result:= conteudo;
end;

//Obt�m tamanho do arquivo
function TArquivo.obterTamanho: Integer;
//Declara��o de vari�veis
var tamanho: Integer;
    conteudo: String;
begin
  //Inicializa vari�vel
  tamanho:= 0;
  conteudo:= '';
  //Trata poss�veis erros
  try
    //Verifica se caminho foi informado
    if (Trim(Self.pCaminho) <> '') then
      begin
        //Recupera conte�do
        conteudo:= Self.obterConteudo;
        //Define tamanho
        tamanho:= Length(conteudo);
      end;
  except on e: Exception do
    begin
      //Posterga tratamento de erro
      raise Exception.Create(e.Message);
    end;
  end;
  //Retorna resultado da fun��o
  Result:= tamanho;
end;

//Salva arquivo
procedure TArquivo.salvar(conteudo: String);
//Declara��o de vari�veis
var arquivo: TextFile;
begin
  //For�a livramento
  try
    //Trata poss�veis erros
    try
      //Verifica se caminho foi informado
      if (Trim(Self.pCaminho) = '') then
        begin
          //Lan�a exce��o
          raise Exception.Create('O caminho do arquivo de destino n�o foi informado.');
        end
        else
        begin
          //Verifica se arquivo tem extens�o
          if (ExtractFileExt(Self.pCaminho) = '') then
            //Concatena extens�o
            Self.pCaminho:= Self.pCaminho + '.txt';
          //Assimila arquivo � vari�vel
          AssignFile(arquivo, Self.pCaminho);
          //Escreve arquivo no disco
          Rewrite(arquivo);
          //Abre arquivo para escrita
          Append(arquivo);
          //Escreve em sequ�ncia �nica
          Write(arquivo, conteudo);
        end;
    except on e: Exception do
      begin
        //Posterga tratamento de erro
        raise Exception.Create(e.Message);
      end;
    end;
  finally
    //Fecha arquivo
    CloseFile(arquivo);
  end;
end;

end.
 