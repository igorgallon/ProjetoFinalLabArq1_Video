LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE ieee.numeric_std.all;

ENTITY address_video IS
	PORT(
    column       : IN  INTEGER;
    row          : IN  INTEGER;
    disp_ena     : IN  STD_LOGIC;
    video_out    : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
    video_address: OUT STD_LOGIC_VECTOR(11 downto 0);
		VGA_R 		   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		VGA_G 	     : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		VGA_B 		   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END address_video;

ARCHITECTURE behavior OF address_video IS

SIGNAL column_std: std_LOGIC_VECTOR(9 downto 0);
signal pixel: std_logic;
signal row_div16 : unsigned(11 downto 0);

BEGIN
  -- formula pro endereco =TRUNCAR(A2/8)*10+TRUNCAR(B2/64)
  column_std <= std_logic_vector(to_unsigned(column, 10)); -- como nao cabe na memoria da fpga todos os pixels, fazemos uma gambiarra
  row_div16 <= shift_right(to_unsigned(row, 12), 4); -- divide linha por 2, depois por 8, prenche um quadrado 2x2 para cada pixel
  video_address <= std_logic_vector(
              (shift_left(row_div16, 3)) -- como cada 10 palavras pintam uma linha (10palavras* 2colunas * 32bits)= 640,  fazemos row_div*8 + row_div*2
            + (shift_left(row_div16, 1)) 
            + (shift_right(to_unsigned(column, 12), 6)));--como uma palavra pinta 64 colunas, fazemos divisao por 64
  
  pixel <= video_out(31-to_integer(unsigned(column_std(5 downto 1)))); -- pintana tela 0x0 a mposicao mais significativa da word
  
  VGA_R <= (others => pixel) when disp_ena='1' else (others => '0');
  VGA_G <= (others => pixel) when disp_ena='1' else (others => '0');
  VGA_B <= (others => not pixel) when disp_ena='1' else (others => '0');
  
END behavior;
