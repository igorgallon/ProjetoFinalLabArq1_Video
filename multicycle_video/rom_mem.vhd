library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity rom_mem is
	generic (
		address_width: integer := 9;
		rom_width: integer := 8);

	port (
    clock: std_logic;
		rom_address: in std_logic_vector (address_width - 1 downto 0);
		--read, write: in std_logic;
		rom_out: out std_logic_vector (rom_width - 1 downto 0));
end rom_mem;

architecture behavioral of rom_mem is

	type data_sequence is array (0 to 2**address_width - 1) of std_logic_vector (rom_width - 1 downto 0);  
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




begin
   
   
 	read_video: process (clock)
		variable index: integer;
	begin
   if(rising_edge(clock)) then -- Port B
			index := to_integer(unsigned(rom_address));
			rom_out <= data(index);
   end if;
	end process;


end behavioral;

