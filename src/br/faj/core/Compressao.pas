//Declara��o da classe "Compressao"
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
//Declara��o de vari�veis
var conteudoOrigem, conteudoDestino: String;
    listaPeriodos: TStringList;
    i: Integer;
    conversao: TConversao;
    ascii: TASCII;
begin
  //Inicializa vari�veis
  conteudoOrigem:= '';
  conteudoDestino:= '';
  listaPeriodos:= Nil;
  conversao:= Nil;
  ascii:= Nil;
  //For�a livramento
  try
    //Trata poss�veis erros
    try
      //Verifica se arquivo est� vazio
      if (arquivo.obterTamanho = 0) then
        begin
          //Lan�a exce��o
          raise Exception.Create('O arquivo est� vazio.');
        end
        else
        begin
          //Obt�m conte�do de origem
          conteudoOrigem:= arquivo.obterConteudo;
          //Verifica se conte�do s� tem 1 d�gito
          if (Length(conteudoOrigem) = 1) then
            begin
              //Lan�a exce��o
              raise Exception.Create('O arquivo n�o pode ser compactado porque seu tamanho n�o pode mais ser diminu�do.');
            end
            else
            begin
              //Instancia convers�o
              conversao:= TConversao.Create;
              //Recupera lista de per�odos
              listaPeriodos:= conversao.recuperarPeriodos(conteudoOrigem);
              //Instancia ascii
              ascii:= TASCII.Create;
              //Percorre lista recuperando os s�mbolos
              for i:= 0 to (listaPeriodos.Count - 1) do
                //Concatena s�mbolo no conte�do de destino
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
    //Livra vari�veis
    listaPeriodos.Free;
    if (conversao <> Nil) then conversao.Free;
    if (ascii <> Nil) then ascii.Free;
  end;
  //Retorna resultado da fun��o
  Result:= conteudoDestino;
end;

//Descompacta arquivo
function TCompressao.descompactar(arquivo: TArquivo): String;
var conteudoOrigem, conteudoDestino, simbolo: String;
    ascii: TASCII;
    tamanho, i: Integer;
begin
  //Inicializa vari�vel
  ascii:= Nil;
  conteudoDestino:= '';
  //For�a livramento
  try
    //Trata poss�veis erros
    try
      //Verifica se arquivo est� vazio
      if (arquivo.obterTamanho = 0) then
        begin
          //Lan�a exce��o
          raise Exception.Create('O arquivo est� vazio.');
        end
        else
        begin
          //Obt�m conte�do de origem
          conteudoOrigem:= arquivo.obterConteudo;
          //Obt�m tamanho do conte�do
          tamanho:= Length(conteudoOrigem);
          //Inicializa contador
          i:= 1;
          //Percorre conte�do de origem
          while (i <= tamanho) do
            begin
              //Verifica valor da posi��o
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
              //Concatena n�mero no conte�do de destino
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
    //Livra vari�vel
    if (ascii <> Nil) then ascii.Free;
  end;
  //Retorna resultado da fun��o
  Result:= conteudoDestino;
end;

end.
 