//Declaração da classe "ASCII"
unit ASCII;

interface
  uses SysUtils;

type TASCII = class
  public
    function converterParaSimbolo(numero: String): String;
    function converterParaNumero(simbolo: String): String;
end;

implementation

//Converte número em símbolo
function TASCII.converterParaSimbolo(numero: String): String;
//Declaração de variáveis
var valor: String;
    tamanho, numeroConvertido: Integer;
begin
  //Inicializa variável
  valor:= '';
  //Trata possíveis erros
  try
    //Recupera valores das variáveis
    tamanho:= Length(numero);
    numeroConvertido:= StrToInt(numero) + 100;
    //Verifica se tamanho é igual a 1
    if (tamanho = 1) then
      //Inicializa valor com 1
      valor:= '1';
    //Recupera símbolo do número convertido
    valor:= valor + CHR(numeroConvertido);
  except on e: Exception do
    begin
      //Posterga tratamento de erro
      raise Exception.Create(e.Message);
    end;
  end;
  //Retorna resultado da função
  Result:= valor;
end;

//Converte símbolo em número
function TASCII.converterParaNumero(simbolo: String): String;
//Declaração de variávei
var valor: String;
    tamanho, numero: Integer;
begin
  //Inicializa variável
  valor:= '';
  //Trata possíveis erros
  try
    //Recupera tamanho do símbolo
    tamanho:= Length(simbolo);
    //Verifica se tamanho é 2
    if (tamanho = 2) then
      begin
        //Recupera número do símbolo
        numero:= ORD(simbolo[2]) - 100;
        //Converte número
        valor:= IntToStr(numero);
      end
      else
      begin
        //Recupera número do símbolo
        numero:= ORD(simbolo[1]) - 100;
        //Verifica se número é menor do que 10
        if (numero < 10) then
          //Concatena 0 ao valor
          valor:= valor + '0';
        //Converte número
        valor:= valor + IntToStr(numero);
      end;
  except on e: Exception do
    begin
      //Posterga tratamento de erro
      raise Exception.Create(e.Message);
    end;
  end;
  //Retorna resultado da função
  Result:= valor;
end;


end.
 