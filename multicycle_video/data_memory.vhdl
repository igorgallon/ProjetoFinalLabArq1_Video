library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity data_memory is
	generic (
		address_width: integer := 9;
		data_width: integer := 32);

	port (
    clock: std_logic;
		address_to_read, address_to_write, video_address: in std_logic_vector (address_width - 1 downto 0);
		data_to_write: in std_logic_vector (data_width - 1 downto 0);
		read, write: in std_logic;
		data_out, video_out: out std_logic_vector (data_width - 1 downto 0));
end data_memory;

architecture behavioral of data_memory is

	type data_sequence is array (0 to 2**address_width - 1) of std_logic_vector (data_width - 1 downto 0);  
-- ModelSim
	signal data: data_sequence := (
     0 => X"00010203",
	  1 => X"04050607",
	  2 => X"08090A0B",
	  3 => X"0C0D0E0F",
	  4 => X"10111213",
	  5 => X"14151617",
	  6 => X"18191A1B",
	  7 => X"1C1D1E1F",
	  8 => X"20212223",
	  9 => X"24252627",
	  10 => X"28292A2B",
	  11 => X"2C2D2E24",
	others => X"24242424");

begin

 
  
  
   process(clock)
		variable index: integer;
   begin
   if(rising_edge(clock)) then -- Port A
    			index := to_integer(unsigned(address_to_write));
       if(write = '1') then
   	    		data(index) <= data_to_write;
          -- Read-during-write on the same port returns NEW data
          data_out <= data_to_write;
       else
          -- Read-during-write on the mixed port returns OLD data
          data_out <= data(index);
       end if;
   end if;
   end process;
   
   
 	read_video: process (clock)
		variable index: integer;
	begin
   if(rising_edge(clock)) then -- Port B
			index := to_integer(unsigned(video_address));
			video_out <= data(index);
   end if;
	end process;


end behavioral;

