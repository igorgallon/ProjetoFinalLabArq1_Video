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
    clock: std_logic;
		video_out: in std_logic_vector (data_width - 1 downto 0);
		modified_video_out: out std_logic_vector(data_width-1 downto 0));
end video_decoder;

architecture behavioral of video_decoder is

type data_sequence is array (0 to address_width-1) of std_logic_vector (rom_width - 1 downto 0);

-- Quartus II
--	signal data: data_sequence;

-- Quartus II
-- ------------------------------------------------------------
-- Synthesis-only
-- ------------------------------------------------------------
--
-- Note: Quartus does not allow comments inside the read
-- comments as HDL block.
--
--synthesis read_comments_as_HDL on


  -- signal data: data_sequence;
  -- attribute ram_init_file : string;
  -- attribute ram_init_file of data : signal is "chars.mif";

 --synthesis read_comments_as_HDL off

--8*valor
--valor de retorno joga pro video_out_modificado



-- ModelSim
--pragma synthesis_off
--   signal data: data_sequence := (
--   0 => X"00000001",
--   1 => X"F0F0AAAA",
--   others => (others => '0'));
--pragma synthesis_on

--signal contador: std_logic_vector(3 downto 0);
--signal std_logic_vector (data_width - 1 downto 0);
constant zeroes: std_logic_vector(data_width - 1 downto 0) := (others => '0');


begin
   
 	read_video: process (clock)
		variable index: integer;
		variable coluna: integer:=9;
		variable linha: integer:=0;
	begin
   if(rising_edge(clock)) then 
			if(coluna = 9) then
				index := to_integer(unsigned(video_out));
				modified_video_out <= ( zeroes(31 downto 8)	& data(index + linha)(7 downto 0)) ;
				linha := linha+1;
				coluna :=0;
			else
				coluna := coluna + 1 ;
			end if;
   end if;
	end process;


end behavioral;

