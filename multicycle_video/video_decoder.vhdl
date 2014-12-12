library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity video_decoder is
	generic (
		address_width: integer := 9;
		data_width: integer := 32;
		rom_width: integer := 8);

	port (
	 column, row          : IN  INTEGER;
		video_out: in std_logic_vector (data_width - 1 downto 0 );
		modified_video_out: out std_logic_vector(data_width - 1 downto 0);
		rom_in: in std_logic_vector(rom_width-1 downto 0);
		rom_address: out std_logic_vector (address_width - 1 downto 0));
end video_decoder;

architecture behavioral of video_decoder is

constant zeroes: std_logic_vector(data_width - 1 downto 0) := (others => '0');
signal video: std_logic_vector(address_width-1 downto 0);
signal row_div2 : unsigned(2 downto 0);
signal column_div16 : unsigned(1 downto 0);
signal char0_std: std_logic_vector (rom_width - 1 downto 0);
signal char1_std: std_logic_vector (rom_width - 1 downto 0);
signal char2_std: std_logic_vector (rom_width - 1 downto 0);
signal char3_std: std_logic_vector (rom_width - 1 downto 0);


begin
   --(row mod 2) div 8
	row_div2 <= shift_right(to_unsigned(row, 4), 1)(2 downto 0);
											--QUAL CARACTER???? 0..3
	column_div16<=shift_right(to_unsigned(column, 6), 4)(1 downto 0);
	video<= ('0' & video_out(31 downto 24)) when column_div16 = "00" else
				('0' & video_out(23 downto 16)) when column_div16 = "01" else
				('0' & video_out(15 downto 8)) when column_div16 = "10" else
				('0' & video_out(7 downto 0));
					
											-- VEZES 8 PRA CHEGAR NO LUGAR DA ROM(   
	rom_address<= std_logic_vector( shift_left(	unsigned(video)-- joga o numero do carACTER para os 8 bits menos sginificativos
																--shift_right(	
																					--unsigned(video_out),-- 24 - CARACTER * 8 (esse e o numero de shifts)
																												--(24 - to_integer(shift_left(column_div16,3)))
																																					--)  --soma com a linha e limita pra 8 bits
																																					,3) + row_div2)(address_width-1 downto 0);	
												
	modified_video_out <= rom_in
								& rom_in
								& rom_in 
								& rom_in;
	
end behavioral;

