//Declaração da classe "Conversao"
unit Conversao;

interface
  uses SysUtils, Classes;

type TConversao = class
  private
    function validarConteudo(conteudo: String): Boolean;
  public
    function recuperarPeriodos(conteudo: String): TStringList;
end;

implementation

//Valida conteúdo para compactação
function TConversao.validarConteudo(conteudo: String): Boolean;
//Declaração de variáveis
var valido: Boolean;
    i: Integer;
begin
  //Inicializa variável
  valido:= True;
  //Percorre conteúdo
  for i:= 1 to (Length(conteudo)) do
    begin
      //Verifica se não é número
      if not (conteudo[i] in ['0'..'9']) then
        begin
          //Altera variável
          valido:= False;
          //Sai do laço
          Break;
        end;
    end;
  //Retorna resultado da função
  Result:= valido;
end;

//Recupera períodos de conversão
function TConversao.recuperarPeriodos(conteudo: String): TStringList;
//Declaração de variáveis
var lista: TStringList;
    tamanho, i: Integer;
    valor: String;
begin
  //Inicializa variáveis
  lista:= Nil;
  tamanho:= Length(conteudo);
  //Trata possíveis erros
  try
    //Verifica se período é válido
    if not (Self.validarConteudo(conteudo)) then
      begin
        //Lança exceção
        raise Exception.Create('O conteúdo do arquivo é inválido.');
      end
      else
      begin
        //Verifica se tem mais de 1 dígito
        if (tamanho > 1) then
          begin
            //Instancia lista
            lista:= TStringList.Create;
            //Inicializa contador
            i:= 1;
            //Percorre conteúdo
            while (i <= tamanho) do
              begin
                //Verifica se chegou ao final do conteúdo
                if (i = tamanho) then
                  begin
                    //Recupera valor na posição atual
                    valor:= conteudo[i];
                    //Adiciona valor na lista
                    lista.Add(valor);
                    //Sai do laço
                    Break;
                  end
                  else
                  begin
                    //Recupera valor de duas posições
                    valor:= copy(conteudo, i, 2);
                    //Adiciona valor na lista
                    lista.Add(valor);
                    //Incrementa i em duas posições
                    i:= i + 2;
                  end;
              end;
          end;
      end;
  except on e: Exception do
    begin
      //Posterga tratamento de erro
      raise Exception.Create(e.Message);
    end;
  end;
  //Retorna resultado da função
  Result:= lista;
end;

end.
 