ProjetoFinalLabArq1_Video
=========================
Sobre o Projeto

  Este projeto tem como finalidade a implementação de um sistema de vídeo em modo texto para um processador multiciclo. Para isso, precisaremos de duas memórias: a memória que contém o texto a ser gerado no vídeo (memória de dados) e uma memória ROM que armazena os padrões de pixel para cada caractere. A memória de dados conterá, para cada caractere a ser gerado no vídeo, o endereço correspondente ao padrão de pixels na memória ROM.
  Se a largura dos elementos da memória de dados é de 32 bits e usa-se 8 bits para especificar o endereço na memória ROM então os dados armazenados em cada elemento da memória de dados remetem a 4 caracteres. A memória ROM armazena um mapa de 48 caracteres sendo que cada um ocupa espaço de 8x8 bits. Para imprimir corretamente um caracter na tela, a cada linha de vídeo, deve se acessar as mesmas posições na memória ROM, sendo que a cada 8 linhas de vídeo, representa-se um caractere inteiro. A tela possui tamanho 640x480 pixels e a cada 4 pixels (2 pixels de altura e 2 pixels de largura) é associado a um bit no decodificador de vídeo ("Big pixel"). Sendo assim, necessita-se de 320 bits de largura e 240 bits de altura para fazer a varredura completa da tela e portanto cabem exatamente 1200 caracteres na tela. O byte mais significativo da palavra armazenada na memória de dados representa o caractere mais a esquerda na tela e assim por diante.

A memória ROM utilizada foi criada por Graeme Fricke, 2000.

Grupo: Guilherme Ramos, Igor Gallon, Raphael Adamski.

===============================

Repositório do projeto Processador MIPS Multiciclo com Vídeo - LabArq1 2014/2
