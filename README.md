# WinFAJ
Projeto desenvolvido para compactação e descompactação de dados com base na proposta da disciplina de sistemas multimídia.

--

  Este pequeno software foi desenvolvido para simular a compactação e a descompactação de arquivos de texto do Windows. Ele se baseia na tabela ASCII para gerar a simbologia correspondente aos pares de dígitos contidos na primeira linha do arquivo selecionado e permite salvar a sequência em outro documento, simulando a compactação. Posteriormente, o mesmo arquivo "compactado" pode ser "descompactado", e o resultado esperado é que, no fim, haja exatidão entre as informações originais e as informações descompactadas.
Segue abaixo um pequeno exemplo do funcionamento do software:

 • Informamos ao sistema um arquivo de texto que contém em sua primeira linha a sequência "123456789" de dígitos;
 • Solicitamos a compactação do arquivo;
 • O sistema selecionará os pares de dígitos da sequência ("12", "34" e assim por diante) e gerará um novo termo com os símbolos correspondentes a eles. Neste exemplo, recebemos de volta a sequência "p†œ²1m";
 • O sistema solicitará o nome e o local de salvamento do arquivo;
 • Fornecemos os dados;
 • O sistema salva o arquivo compactado.
 
  Para a descompactação, o processo é exatamente o mesmo. A única diferença é que as verificações serão feitas símbolo a símbolo, e o retorno será o código correspondente a ele na tabela ASCII. Em caso de sequências ímpares, onde o número de pares não conterão exatamente dois elementos (ou seja, teremos um momento onde haverá apenas um elemento no perído), o sistema controla isto adicionando o número "1" antes do símbolo na compactação e, na descompactação, garante que o retorno do dígito seja ele em sua forma exata, com realmente apenas um elemento no período.
  
  A meta desta forma de compactação é reduzir o tamanho do arquivo em, no máximo, 50% (sim, "no máximo", visto que são gerados valores individuais a pares de dígitos, impossibilitando que haja menos da metade da quantidade de símbolos para a quantidade total de dígitos da sequência original).

  Vale ressaltar que esta não é, nem de longe, a melhor forma de compactar dados. Este software foi desenvolvido sem base teórica alguma acerca dos algoritmos de compactação existentes na área de desenvolvimento. A solução empregada foi baseada em pura suposição.
  
PS:. Este projeto foi desenvolvido na linguagem Object Pascal por meio da IDE Delphi na versão 7.

--

Ricardo Giovani Piantavinha Perandré
Apaixonado por desenvolvimento e motivado por desafios
Formado em Processamento de Dados pelo Colégio Técnico de Limeira
Graduando em Ciência da Computação pela Faculdade de Jaguariúna
