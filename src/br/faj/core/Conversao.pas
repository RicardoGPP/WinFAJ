//Declara��o da classe "Conversao"
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

//Valida conte�do para compacta��o
function TConversao.validarConteudo(conteudo: String): Boolean;
//Declara��o de vari�veis
var valido: Boolean;
    i: Integer;
begin
  //Inicializa vari�vel
  valido:= True;
  //Percorre conte�do
  for i:= 1 to (Length(conteudo)) do
    begin
      //Verifica se n�o � n�mero
      if not (conteudo[i] in ['0'..'9']) then
        begin
          //Altera vari�vel
          valido:= False;
          //Sai do la�o
          Break;
        end;
    end;
  //Retorna resultado da fun��o
  Result:= valido;
end;

//Recupera per�odos de convers�o
function TConversao.recuperarPeriodos(conteudo: String): TStringList;
//Declara��o de vari�veis
var lista: TStringList;
    tamanho, i: Integer;
    valor: String;
begin
  //Inicializa vari�veis
  lista:= Nil;
  tamanho:= Length(conteudo);
  //Trata poss�veis erros
  try
    //Verifica se per�odo � v�lido
    if not (Self.validarConteudo(conteudo)) then
      begin
        //Lan�a exce��o
        raise Exception.Create('O conte�do do arquivo � inv�lido.');
      end
      else
      begin
        //Verifica se tem mais de 1 d�gito
        if (tamanho > 1) then
          begin
            //Instancia lista
            lista:= TStringList.Create;
            //Inicializa contador
            i:= 1;
            //Percorre conte�do
            while (i <= tamanho) do
              begin
                //Verifica se chegou ao final do conte�do
                if (i = tamanho) then
                  begin
                    //Recupera valor na posi��o atual
                    valor:= conteudo[i];
                    //Adiciona valor na lista
                    lista.Add(valor);
                    //Sai do la�o
                    Break;
                  end
                  else
                  begin
                    //Recupera valor de duas posi��es
                    valor:= copy(conteudo, i, 2);
                    //Adiciona valor na lista
                    lista.Add(valor);
                    //Incrementa i em duas posi��es
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
  //Retorna resultado da fun��o
  Result:= lista;
end;

end.
 