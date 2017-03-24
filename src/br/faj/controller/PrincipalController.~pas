//Declaração da classe "PrincipalController"
unit PrincipalController;

interface
  uses SysUtils, Arquivo, Compressao, Dialogs;

type TPrincipalController = class
  private
    pArquivo: TArquivo;
  public
    property arquivo: TArquivo read pArquivo write pArquivo;
    constructor Create;
    destructor Free;

    procedure buscarArquivo;
    procedure removerArquivo;

    function salvarArquivo(conteudo: String): Boolean;
    function compactar: Boolean;
    function descompactar: Boolean;




end;

implementation

//Construtor da classe
constructor TPrincipalController.Create;
begin
  //Inicializa atributo
  Self.pArquivo:= Nil;
end;

//Destrutor da classe
destructor TPrincipalController.Free;
begin
  //Livra variável
  if (Self.pArquivo <> Nil) then Self.pArquivo.Free;
end;

//Busca arquivo
procedure TPrincipalController.buscarArquivo;
//Declaração de variáveis
var busca: TOpenDialog;
begin
  //Inicializa variável
  busca:= Nil;
  //Força livramento
  try
    //Trata possíveis erros
    try
      //Instancia busca
      busca:= TOpenDialog.Create(Nil);
      //Define características da busca
      busca.Title:= 'Selecione um arquivo';
      busca.Filter:= 'Arquivos de texto (*.txt)|*.txt';
      //Realiza busca
      if (busca.Execute) then
        begin
          //Verifica se arquivo está instanciado
          if (arquivo = Nil) then arquivo:= TArquivo.Create;
          //Define caminho
          arquivo.caminho:= busca.FileName;
        end;
    except on e: Exception do
      begin
        //Posterga tratamento de erro
        raise Exception.Create(e.Message);
      end;
    end;
  finally
    //Livra variável
    busca.Free;
  end;
end;

//Remove arquivo
procedure TPrincipalController.removerArquivo;
begin
  //Trata possíveis erros
  try
    //Livra arquivo
    if (arquivo <> Nil) then arquivo.Free;
    //Define nil
    arquivo:= Nil;
  except on e: Exception do
    begin
      //Posterga tratamento de erro
      raise Exception.Create(e.Message);
    end;
  end;
end;

//Salva arquivo
function TPrincipalController.salvarArquivo(conteudo: String): Boolean;
//Declaração de variáveis
var salvamento: TSaveDialog;
    arquivo: TArquivo;
    salvo: Boolean;
begin
  //Inicializa variáveis
  salvamento:= Nil;
  arquivo:= Nil;
  salvo:= False;
  //Força livramento
  try
    //Trata possíveis erros
    try
      //Instancia salvamento
      salvamento:= TSaveDialog.Create(Nil);
      //Define características do salvamento
      salvamento.Title:= 'Selecione o local para o salvar o arquivo';
      salvamento.Filter:= 'Arquivos de texto (*.txt)|*.txt';
      //Executa salvamento
      if (salvamento.Execute) then
        begin
          //Instancia arquivo
          arquivo:= TArquivo.Create(salvamento.FileName);
          //Salva arquivo
          arquivo.salvar(conteudo);
          //Altera variável de controle
          salvo:= True;
        end;
    except on e: Exception do
      begin
        //Lança exceção
        raise Exception.Create(e.Message);
      end;
    end;
  finally
    //Livra variáveis
    salvamento.Free;
    if (arquivo <> Nil) then arquivo.Free;
  end;
  //Retorna resultado da função
  Result:= salvo;
end;

//Compacta arquivo
function TPrincipalController.compactar: Boolean;
//Declaração de variáveis
var conteudo: String;
    compressao: TCompressao;
    sucesso: Boolean;
begin
  //Inicializa variáveis
  compressao:= Nil;
  sucesso:= False;
  //Força livramento
  try
    //Trata possíveis erros
    try
      //Verifica se há arquivo informado
      if (arquivo = Nil) then
        begin
          //Lança exceção
          raise Exception.Create('O arquivo não foi informado.');
        end
        else
        begin
          //Instancia compressão
          compressao:= TCompressao.Create;
          //Compacta
          conteudo:= compressao.compactar(Self.pArquivo);
          //Salva arquivo
          sucesso:= salvarArquivo(conteudo);
        end;
    except on e: Exception do
      begin
        //Posterga tratamento de erro
        raise Exception.Create(e.Message);
      end;
    end;
  finally
    //Livra variável
    if (compressao <> Nil) then compressao.Free;
  end;
  //Retorna resultado da função
  Result:= sucesso;
end;

//Descompacta arquivo
function TPrincipalController.descompactar: Boolean;
//Declaração de variáveis
var conteudo: String;
    compressao: TCompressao;
    sucesso: Boolean;
begin
  //Inicializa variável
  compressao:= Nil;
  sucesso:= False;
  //Força livramento
  try
    //Trata possíveis erros
    try
      //Verifica se há arquivo informado
      if (arquivo = Nil) then
        begin
          //Lança exceção
          raise Exception.Create('O arquivo não foi informado.');
        end
        else
        begin
          //Instancia compressão
          compressao:= TCompressao.Create;
          //Descompacta
          conteudo:= compressao.descompactar(Self.pArquivo);
          //Salva arquivo
          sucesso:= salvarArquivo(conteudo);
        end;
    except on e: Exception do
      begin
        //Posterga tratamento de erro
        raise Exception.Create(e.Message);
      end;
    end;
  finally
    //Livra variável
    if (compressao <> Nil) then compressao.Free;
  end;
  //Retorna resultado da função
  Result:= sucesso;
end;

end.
