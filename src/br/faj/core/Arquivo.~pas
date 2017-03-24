//Declaração da classe "Arquivo"
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

//Obtém nome do arquivo
function TArquivo.obterNome: String;
//Declaração de variáveis
var nome: String;
begin
  //Inicializa variável
  nome:= '';
  //Trata possíveis erros
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
  //Retorna resultado da função
  Result:= nome;
end;

//Obtém diretório do arquivo
function TArquivo.obterDiretorio: String;
//Declaração de variáveis
var diretorio: String;
begin
  //Inicializa variável
  diretorio:= '';
  //Trata possíveis erros
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
  //Retorna resultado da função
  Result:= diretorio;
end;

//Obtém conteúdo do arquivo
function TArquivo.obterConteudo: String;
//Declaração de variáveis
var conteudo: String;
    arquivo: TextFile;
begin
  //Inicializa variáveis
  conteudo:= '';
  //Força livramento
  try
    //Trata possíveis erros
    try
      //Verifica se caminho foi informado e se arquivo existe
      if ((Trim(Self.pCaminho) <> '') and (FileExists(Self.pCaminho))) then
        begin
          //Assimila arquivo à variável
          AssignFile(arquivo, Self.pCaminho);
          //Abre arquivo para leitura
          Reset(arquivo);
          //Lê linha do arquivo
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
  //Retorna resultado da função
  Result:= conteudo;
end;

//Obtém tamanho do arquivo
function TArquivo.obterTamanho: Integer;
//Declaração de variáveis
var tamanho: Integer;
    conteudo: String;
begin
  //Inicializa variável
  tamanho:= 0;
  conteudo:= '';
  //Trata possíveis erros
  try
    //Verifica se caminho foi informado
    if (Trim(Self.pCaminho) <> '') then
      begin
        //Recupera conteúdo
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
  //Retorna resultado da função
  Result:= tamanho;
end;

//Salva arquivo
procedure TArquivo.salvar(conteudo: String);
//Declaração de variáveis
var arquivo: TextFile;
begin
  //Força livramento
  try
    //Trata possíveis erros
    try
      //Verifica se caminho foi informado
      if (Trim(Self.pCaminho) = '') then
        begin
          //Lança exceção
          raise Exception.Create('O caminho do arquivo de destino não foi informado.');
        end
        else
        begin
          //Verifica se arquivo tem extensão
          if (ExtractFileExt(Self.pCaminho) = '') then
            //Concatena extensão
            Self.pCaminho:= Self.pCaminho + '.txt';
          //Assimila arquivo à variável
          AssignFile(arquivo, Self.pCaminho);
          //Escreve arquivo no disco
          Rewrite(arquivo);
          //Abre arquivo para escrita
          Append(arquivo);
          //Escreve em sequência única
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
 