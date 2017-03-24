//Declaração da classe "Compressao"
unit Compressao;

interface
  uses SysUtils, Classes, Arquivo, Conversao, ASCII;

type TCompressao = class
  public
    function compactar(arquivo: TArquivo): String;
    function descompactar(arquivo: TArquivo): String;
end;

implementation

//Compacta arquivo
function TCompressao.compactar(arquivo: TArquivo): String;
//Declaração de variáveis
var conteudoOrigem, conteudoDestino: String;
    listaPeriodos: TStringList;
    i: Integer;
    conversao: TConversao;
    ascii: TASCII;
begin
  //Inicializa variáveis
  conteudoOrigem:= '';
  conteudoDestino:= '';
  listaPeriodos:= Nil;
  conversao:= Nil;
  ascii:= Nil;
  //Força livramento
  try
    //Trata possíveis erros
    try
      //Verifica se arquivo está vazio
      if (arquivo.obterTamanho = 0) then
        begin
          //Lança exceção
          raise Exception.Create('O arquivo está vazio.');
        end
        else
        begin
          //Obtém conteúdo de origem
          conteudoOrigem:= arquivo.obterConteudo;
          //Verifica se conteúdo só tem 1 dígito
          if (Length(conteudoOrigem) = 1) then
            begin
              //Lança exceção
              raise Exception.Create('O arquivo não pode ser compactado porque seu tamanho não pode mais ser diminuído.');
            end
            else
            begin
              //Instancia conversão
              conversao:= TConversao.Create;
              //Recupera lista de períodos
              listaPeriodos:= conversao.recuperarPeriodos(conteudoOrigem);
              //Instancia ascii
              ascii:= TASCII.Create;
              //Percorre lista recuperando os símbolos
              for i:= 0 to (listaPeriodos.Count - 1) do
                //Concatena símbolo no conteúdo de destino
                conteudoDestino:= conteudoDestino + ascii.converterParaSimbolo(listaPeriodos[i]);
            end;
        end;
    except on e: Exception do
      begin
        //Posterga tratamento de erro
        raise Exception.Create(e.Message);
      end;
    end;
  finally
    //Livra variáveis
    listaPeriodos.Free;
    if (conversao <> Nil) then conversao.Free;
    if (ascii <> Nil) then ascii.Free;
  end;
  //Retorna resultado da função
  Result:= conteudoDestino;
end;

//Descompacta arquivo
function TCompressao.descompactar(arquivo: TArquivo): String;
var conteudoOrigem, conteudoDestino, simbolo: String;
    ascii: TASCII;
    tamanho, i: Integer;
begin
  //Inicializa variável
  ascii:= Nil;
  conteudoDestino:= '';
  //Força livramento
  try
    //Trata possíveis erros
    try
      //Verifica se arquivo está vazio
      if (arquivo.obterTamanho = 0) then
        begin
          //Lança exceção
          raise Exception.Create('O arquivo está vazio.');
        end
        else
        begin
          //Obtém conteúdo de origem
          conteudoOrigem:= arquivo.obterConteudo;
          //Obtém tamanho do conteúdo
          tamanho:= Length(conteudoOrigem);
          //Inicializa contador
          i:= 1;
          //Percorre conteúdo de origem
          while (i <= tamanho) do
            begin
              //Verifica valor da posição
              if (conteudoOrigem[i] = '1') then
                begin
                  //Define simbolo com 1
                  simbolo:= '1' + conteudoOrigem[i + 1];
                  //Incrementa contador
                  i:= i + 2;
                end
                else
                begin
                  //Define simbolo
                  simbolo:= conteudoOrigem[i];
                  //Incrementa contador
                  i:= i + 1;
                end;
              //Concatena número no conteúdo de destino
              conteudoDestino:= conteudoDestino + ascii.converterParaNumero(simbolo);
            end;
        end;
    except on e: Exception do
      begin
        //Posterga tratamento de erro
        raise Exception.Create(e.Message);
      end;
    end;
  finally
    //Livra variável
    if (ascii <> Nil) then ascii.Free;
  end;
  //Retorna resultado da função
  Result:= conteudoDestino;
end;

end.
 