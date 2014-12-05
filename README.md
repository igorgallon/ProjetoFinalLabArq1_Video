ProjetoFinalLabArq1_Video
=========================
Sobre o Projeto

Este projeto tem como finalidade a implementação de um sistema de vídeo em modo texto para um processador multiciclo. Para isso, precisaremos de duas memórias: a memória que contém o texto a ser gerado no vídeo e uma memória ROM que armazena os padrões de pixel para cada caractere. A memória de caracteres conterá, para cada caractere a ser gerado no vídeo, o endereço correspondente ao padrão de pixels na memória ROM. O papel do processador é decodificar o endereço do caractere no padrão de pixels correspondente e gerá-lo na tela por meio do processador de vídeo.
Cada padrão de pixels na memória ROM é definido por uma matriz de 8x8 bits, cada linha de 8 bits do mapa é decodificado para o processador de vídeo com tamanho 32 bits. Como a resolução da tela é de 640x480 e cada bit no processador de vídeo é associado a 2 pixels de largura e 2 de altura, então cabem na tela 10 caracteres de largura.
A varredura na memória de dados é feita linearmente, ou seja, o processador de vídeo gera na tela a primeira linha de 32 bits de cada um dos dez caracteres. Feito isso, a segunda linha de vídeo recebe todas as segundas linhas de 32 bits de cada um dos dez caracteres e assim sucessivamente até a oitava linha de vídeo. Para que este processo mostre corretamente na tela os caracteres desejados, a memória de texto deverá ser montada de tal forma que seja decodificado linearmente pelo processador todas as primeiras linhas dos caracteres da memória ROM, depois todas as segundas linhas de caracteres da memória ROM até a oitava linha.


Grupo: Guilherme Ramos, Igor Gallon, Raphael Adamski.

===============================

Repositório do projeto Processador MIPS Multiciclo com Vídeo - LabArq1 2014/2
