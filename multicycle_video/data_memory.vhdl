library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity data_memory is
	generic (
		address_width: integer := 12;
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
    0 => "00000000001111110000000000000000",1 => "00000000000000000000000000000000",2 => "00000000000000000000000000000001",3 => "00000000000000000000000000000001",4 => "00000000000000000000000000000001",5 => "00000000000000000000000000000001",6 => "00000000000000000000000000000001",7 => "00000000000000000000000000000001",8 => "00000000000000000000000000000001",9 => "00000000000000000000000000000001",
	10=> "00000000001000010000000000000001",11=> "10101100110001111000110011001010",12=> "10101100110001111000110011001010",13=> "10101100110001111000110011001010",14=> "10101100110001111000110011001010",15=> "10101100110001111000110011001010",16=> "00000000000000000000000000000001",17=> "00000000000000000000000000000001",18=> "00000000000000000000000000000001",19=> "00000000000000000000000000000001",
	20=> "00000000001111110000000000000001",21=> "10101100110001111000110011001010",22=> "10101100110001111000110011001010",23=> "10101100110001111000110011001010",24=> "10101100110001111000110011001010",25=> "10101100110001111000110011001010",26=> "00000000000000000000000000000001",27=> "00000000000000000000000000000001",28=> "00000000000000000000000000000001",29=> "00000000000000000000000000000001",	
    30=> "00000000001000010000000000000001",31=> "10101100110001111000110011001010",32=> "10101100110001111000110011001010",33=> "10101100110001111000110011001010",34=> "10101100110001111000110011001010",35=> "10101100110001111000110011001010",36=> "00000000000000000000000000000001",37=> "00000000000000000000000000000001",38=> "00000000000000000000000000000001",39=> "00000000000000000000000000000001",	
	40=> "00000000001000010000000000000001",41=> "10101100110001111000110011001010",42=> "10101100110001111000110011001010",43=> "10101100110001111000110011001010",44=> "10101100110001111000110011001010",45=> "10101100110001111000110011001010",46=> "00000000000000000000000000000001",47=> "00000000000000000000000000000001",48=> "00000000000000000000000000000001",49=> "00000000000000000000000000000001",

	others => (others => 'U'));
-- Quartus II
--	signal data: data_sequence;

--PARA LER MEMÓRIA RAM
-- Quartus II
-- ------------------------------------------------------------
-- Synthesis-only
-- ------------------------------------------------------------
--
-- Note: Quartus does not allow comments inside the read
-- comments as HDL block.
--
-- synthesis read_comments_as_HDL on

--  signal data: data_sequence;
--  attribute ram_init_file : string;
--  attribute ram_init_file of data : signal is "../data_memory.mif";

-- synthesis read_comments_as_HDL off

-- ModelSim
--pragma synthesis_off
   signal data: data_sequence := (
   0 => X"00000001",
   1 => X"F0F0AAAA",
   others => (others => '0'));
--pragma synthesis_on


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

