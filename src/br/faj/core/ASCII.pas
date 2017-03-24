//Declara��o da classe "ASCII"
unit ASCII;

interface
  uses SysUtils;

type TASCII = class
  public
    function converterParaSimbolo(numero: String): String;
    function converterParaNumero(simbolo: String): String;
end;

implementation

//Converte n�mero em s�mbolo
function TASCII.converterParaSimbolo(numero: String): String;
//Declara��o de vari�veis
var valor: String;
    tamanho, numeroConvertido: Integer;
begin
  //Inicializa vari�vel
  valor:= '';
  //Trata poss�veis erros
  try
    //Recupera valores das vari�veis
    tamanho:= Length(numero);
    numeroConvertido:= StrToInt(numero) + 100;
    //Verifica se tamanho � igual a 1
    if (tamanho = 1) then
      //Inicializa valor com 1
      valor:= '1';
    //Recupera s�mbolo do n�mero convertido
    valor:= valor + CHR(numeroConvertido);
  except on e: Exception do
    begin
      //Posterga tratamento de erro
      raise Exception.Create(e.Message);
    end;
  end;
  //Retorna resultado da fun��o
  Result:= valor;
end;

//Converte s�mbolo em n�mero
function TASCII.converterParaNumero(simbolo: String): String;
//Declara��o de vari�vei
var valor: String;
    tamanho, numero: Integer;
begin
  //Inicializa vari�vel
  valor:= '';
  //Trata poss�veis erros
  try
    //Recupera tamanho do s�mbolo
    tamanho:= Length(simbolo);
    //Verifica se tamanho � 2
    if (tamanho = 2) then
      begin
        //Recupera n�mero do s�mbolo
        numero:= ORD(simbolo[2]) - 100;
        //Converte n�mero
        valor:= IntToStr(numero);
      end
      else
      begin
        //Recupera n�mero do s�mbolo
        numero:= ORD(simbolo[1]) - 100;
        //Verifica se n�mero � menor do que 10
        if (numero < 10) then
          //Concatena 0 ao valor
          valor:= valor + '0';
        //Converte n�mero
        valor:= valor + IntToStr(numero);
      end;
  except on e: Exception do
    begin
      //Posterga tratamento de erro
      raise Exception.Create(e.Message);
    end;
  end;
  //Retorna resultado da fun��o
  Result:= valor;
end;


end.
 